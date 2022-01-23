require "./spec_helper"

describe "GTK4 Bindings smoke tests" do
  {% for example in `ls -1 examples/*.cr`.strip.split("\n") %}
  it "compiles #{{{ example }}}" do
    example_bin = File.basename({{ example }}, ".cr")
    `crystal build #{{{example}}} -o ./bin/test_example`
    $?.success?.should eq(true)
  end
  {% end %}
end
