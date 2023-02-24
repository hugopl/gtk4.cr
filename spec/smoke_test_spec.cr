require "./spec_helper"

describe "GTK4 Bindings smoke tests" do
  {% for example in `ls -1 examples/*.cr`.strip.split("\n") %}
  it "compiles #{{{ example }}}" do
    example_name = File.basename({{ example }}, ".cr")
    `crystal build examples/#{example_name}.cr -o bin/#{example_name}`
    $?.success?.should eq(true)
  end
  {% end %}
end
