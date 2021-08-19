# GTK4 Hello World from scratch

First create the crystal app skeleaton by:

```
crystal init app helloworld
```

This will create a helloworld directory with some files.

Then add the gtk4 shard to shard.yml:

```YAML
name: helloworld
version: 0.1.0

targets:
  helloworld:
    main: src/helloworld.cr

dependencies:
  gtk4:
    github: hugopl/gtk4.cr

crystal: 1.1.1

license: MIT
```

Run `shards install` to download the dependencies and generate the bindings. Be sure to have the GTK adn GObject Introspection
packages installed beforehand.

Now is time to write the infamous hello world, edit the sile `src/helloworld.cr`:

```Crystal
require "gtk4"

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
count = 0

app.activate_signal.connect do
  window = Gtk::ApplicationWindow.new(app)
  window.title = "Hello World!"
  window.set_default_size(200, 200)

  button = Gtk::Button.new_with_label("Hello!!")
  button.clicked_signal.connect do
    count += 1
    button.label = "You clicked #{count} times!"
  end
  window.child = button
  window.present
end

exit(app.run(ARGV))
```

Now compile it normally, i.e. `shards build`, then run the program `./bin/helloworld`.

And here the fastest tutorial ever finishes. Good luck!
