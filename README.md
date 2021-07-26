# GTK4 Crystal Bindings

See [examples](https://github.com/hugopl/gtk4.cr/tree/master/examples) folder and have fun.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     gtk4:
       github: hugopl/gtk4.cr
   ```

2. Run `shards install`

## Usage

See the [hello world tutorial](./tutorial/hello_world.md).

For more info on how to use signals, properties, etc... see https://github.com/hugopl/gi-crystal.

## Running examples

For some examples see https://github.com/hugopl/gtk4.cr/tree/master/examples, to run them you first need to generate the
bindings:

```
./bin/generate_bindings
crystal run examples/hello_world.cr
```

## Contributing

1. Fork it (<https://github.com/hugopl/gtk4.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Hugo Parente Lima](https://github.com/hugopl) - creator and maintainer
