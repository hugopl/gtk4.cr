require "./spec_helper"

describe "GTK4 Bindings smoke tests" do
  {% for example in `ls -1 examples/*.cr`.strip.split("\n") %}
  pending "compiles #{{{ example }}}" do
    example_name = File.basename({{ example }}, ".cr")
    Dir.cd("examples") do
      `crystal build #{example_name}.cr -o ../bin/#{example_name}`
      $?.success?.should eq(true)
    end
  end
  {% end %}
end
