# GTK4 Crystal Bindings

See [examples](https://github.com/hugopl/gtk4.cr/tree/master/examples) folder and have fun.

## Is it ready?

Not yet, I'm porting [Tijolo](https://github.com/hugopl/tijolo) from GTK3/[crystal-gobject](https://github.com/jhass/crystal-gobject) to GTK4 using this binding, so I should release the first version of this only when the port finishes. However bug reports about things not working still welcome, so I can keep track of them.

## Compile time dependencies

You need the GTK libraries and their GObjectIntrospection files.

- Archlinux: `pacman -S gtk4 gobject-introspection`
- Ubuntu: `apt-get install libgtk-4-0 gobject-introspection gir1.2-gtk-4.0`
- macOS: `brew install gobject-introspection gtk4`

Be welcome to create a PR updating this readme once you know what packages are needed by your distro to run the
examples.

## Runtime dependencies

Just the GTK libraries are needed at runtime.

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

For more info on how to use signals, properties, etc see the [GI-Crystal](https://github.com/hugopl/gi-crystal)
project page, it's the binding generator used to create this binding.

## Contributing

1. Fork it (<https://github.com/hugopl/gtk4.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Hugo Parente Lima](https://github.com/hugopl) - creator and maintainer
