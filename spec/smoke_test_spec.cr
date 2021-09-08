require "./spec_helper"

describe "GTK4 Bindings smoke tests" do
  before_all do
    system("./bin/generate_bindings")
  end

  {% for example in `ls -1 examples/*.cr`.strip.split("\n") %}
  it "compiles #{{{ example }}}" do
    example_bin = File.basename({{ example }}, ".cr")
    `crystal build #{{{example}}} -o ./bin/#{example_bin}`
    $?.success?.should eq(true)
  end
  {% end %}
end
