require "../src/gtk4"

class Particle
  PARTICLE_VELOCITY_RANGE_X = {-1_f32, 1_f32}
  PARTICLE_VELOCITY_RANGE_Y = {-3.5_f32, -1.5_f32}
  PARTICLE_GRAVITY          = 0.075_f32
  PARTICLE_ALPHA_FADEOUT    =  0.96_f32

  property velocity_x : Float32
  property velocity_y : Float32
  property x = 0.0_f32
  property y = 0.0_f32
  property color : Gdk::RGBA

  def initialize(@x, @y)
    @velocity_x = PARTICLE_VELOCITY_RANGE_X[0] + Random.rand * (PARTICLE_VELOCITY_RANGE_X[1] - PARTICLE_VELOCITY_RANGE_X[0])
    @velocity_y = PARTICLE_VELOCITY_RANGE_Y[0] + Random.rand * (PARTICLE_VELOCITY_RANGE_Y[1] - PARTICLE_VELOCITY_RANGE_Y[0])
    @color = Gdk::RGBA.new(Random.rand.to_f32, Random.rand.to_f32, Random.rand.to_f32, 1_f32)
  end

  # Step the animation and returns false if the particle must be destroyed.
  def step : Bool
    new_alpha = color.alpha * PARTICLE_ALPHA_FADEOUT
    return false if new_alpha < 0.05

    @color.alpha = new_alpha
    @velocity_y += PARTICLE_GRAVITY
    @x += @velocity_x
    @y += @velocity_y
    true
  end
end

module ParticleEngine
  @particles = [] of Particle
  @particle_size = 6_f32
  @tick_callback : UInt32 = 0_u32

  def create_particles(x : Float32, y : Float32, n : Int32)
    n.times { @particles << Particle.new(x, y) }
    @tick_callback = add_tick_callback(->tick_callback(Gtk::Widget, Gdk::FrameClock)) if @tick_callback.zero?
  end

  private def tick_callback(_widget : Gtk::Widget, clock : Gdk::FrameClock) : Bool
    queue_draw
    @particles.select!(&.step)
    if @particles.empty?
      @tick_callback = 0_u32
      return false
    end
    true
  end

  def draw_particles(snapshot : Gtk::Snapshot)
    @particles.each do |particle|
      snapshot.append_color(particle.color, particle.x, particle.y, @particle_size, @particle_size)
    end
  end
end

class ParticleWidget < Gtk::Widget
  include ParticleEngine

  N_PARTICLES = 20

  def initialize
    super

    gesture_controller = Gtk::GestureClick.new
    gesture_controller.pressed_signal.connect do |n_press, x, y|
      create_particles(x.to_f32, y.to_f32, N_PARTICLES)
      queue_draw
      true
    end
    add_controller(gesture_controller)
  end

  @[GObject::Virtual]
  def snapshot(snapshot : Gtk::Snapshot)
    draw_particles(snapshot)
  end
end

class ParticlesApp < Gtk::Application
  @click_count = 0

  def initialize
    super(application_id: "particles.example.com", flags: Gio::ApplicationFlags::None)
  end

  @[GObject::Virtual]
  def activate
    window = Gtk::ApplicationWindow.new(self)
    window.title = "Hello Particles, click somewhere!"
    window.set_default_size(640, 480)
    window.child = ParticleWidget.new
    window.present
  end
end

exit(ParticlesApp.new.run)
