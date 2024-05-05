![Build Status](https://github.com/hugopl/gtk4.cr/actions/workflows/ci.yml/badge.svg?branch=main)

# GTK4 Crystal Bindings

See [examples](https://github.com/hugopl/gtk4.cr/tree/master/examples) folder and have fun.

If you feel this repository too silent is because most of the development happens in the
[binding generator repository](https://github.com/hugopl/gi-crystal), not here.

## API docs

Current documentation is far from being good, but is better (not much) than nothing.

API docs can be found at https://hugopl.github.io/gtk4.cr/

To generate the documentation clone this repository then do:

```
$ make doc
```

The documentation will be found at `docs/index.html`.


## Compile time dependencies

You need the GTK libraries and their GObjectIntrospection files.

- Archlinux: `pacman -S gtk4 gobject-introspection`
- Ubuntu: `apt-get install libgtk-4-1 libgtk-4-dev libgirepository1.0-dev gobject-introspection gir1.2-gtk-4.0`
- macOS: `brew install gobject-introspection gtk4`

Be welcome to create a PR updating this readme once you know what packages are needed by your distro to run the
examples.

## Runtime dependencies

Just the GTK libraries are needed at runtime, i.e. not the `gobject-introspection` library and files.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     gtk4:
       github: hugopl/gtk4.cr
   ```

2. Run `shards install`

## Usage

See the [hello world tutorial](https://github.com/hugopl/gtk4.cr/tree/master/tutorial/hello_world.md).

For more info on how to use signals, properties, etc see the [GI-Crystal](https://github.com/hugopl/gi-crystal)
project page, it's the binding generator used to create this binding.

## Projects using these bindings

- [Collision](https://github.com/GeopJr/Collision) - A GUI tool to generate, compare and verify MD5, SHA-1, SHA-256 & SHA-512 hashes.
- [RTFM](https://github.com/hugopl/rtfm) - Gnome dash docset documentation reader.
- [Tijolo](https://github.com/hugopl/tijolo) - Simple, fast and incomplete keyboard focused IDE.

## Contributing

1. Fork it (<https://github.com/hugopl/gtk4.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Hugo Parente Lima](https://github.com/hugopl) - creator and maintainer
