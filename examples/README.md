# Examples

To run the examples do:

```Sh
# Clone the repo
git clone https://github.com/hugopl/gtk4.cr.git
cd gtk4.cr

# Install dependencies
shards install

# Generate the bindings
./bin/generate_bindings

# Run the examples
crystal run examples/hello_world.cr
```

If you have trouble generating the binding you probably don't have the gobject introspection files installed on
your system.
