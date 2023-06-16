# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.14.0] - 2023-06-16
### Added
- Added simple particles engine example using GSK API (#51).
- Added `Gdk::Display.default!`, same as `Gdk::Display.default.not_nil!` (#53).

### Fixed
- Do not try to unref destroyed windows at `finalize` (#52).

### Changed
- Using GI-Crystal v0.16.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

## [0.13.0] - 2023-04-16
### Added
- Add `Gtk::Widget#children` helper method, thanks @hugopl.

### Fixed
- Fix crash related to order of initialization of widget templates, thanks @BlobCodes (#34)
- Let gh-pages branch be orphan, so the repository doesn't store a ton of useless history for API docs, thanks @GeopJr (#38).
- Update Ubuntu install instructions, thanks @aramvisser (#45).
- Do not always require children parameter on Gtk::UiTemplate annotation, thanks @hugopl (#33).
- Add support for UI templates from resource files, thanks @hugopl (#36).
- Fix compilation with Harfbuzz 0.7, thanks @hugopl (#43)

### Changed
- Harfbuzz, Gio and Pango bindings were moved to different shards, GTK4 shard now depend on them, thanks @hugopl (#46).

## [0.12.0] - 2022-09-06
### Added
- Added overload `Gtk::Snapshot#translate(x : Float32, y : Float32)`.
- Added overload `Gtk::Snapshot#append_color(color : Gdk::RGBA, x : Float32, y : Float32, width : Float32, height : Float32)`.
- Added overload `Gtk::Snapshot#push_repeat(bounds_x : Float32, bounds_y : Float32, bounds_width : Float32, bounds_height : Float32, child_bounds_x : Float32, child_bounds_y : Float32, child_bounds_width : Float32, child_bounds_height : Float32)`
- Added overload `Gtk::Snapshot#save` that receives a block and calls `Gtk::Snapshot#restore` at the end.

### Fixed
- Don't crash when instantiating `Pango::FontMetrics`.
- Make possible to use `Pango::AttrList` and `Pango::Attributes`.

### Changed
- Using GI-Crystal v0.14.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

## [0.11.1] - 2022-07-04
### Fixed
- Fix compilation with HarfBuzz 4.4.1.

## [0.11.0] - 2022-07-01
### Changed
- Using GI-Crystal v0.13.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

### Added
- Added `Gtk::Stack#has_child?(Gtk::Widget)`.
- Added _source_dir_ parameter to `register_resource`, thanks @GeopJr.
- Added `Pango::Layout#set_text(String)`, `Pango::Layout#set_text(Bytes)` and `Pango::Layout#set_text(Bytes, Int32)`.
- API documentation is now auto-updated, thanks @1player.

## [0.10.0] - 2022-06-04
### Changed
- Using GI-Crystal v0.12.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.
- Call `abort` when `Gtk::Widget#template_child` can't find the widget.

### Added
- Added `Gtk::TreeSelection#select_row(Int32)` sugar, to select a row.

## [0.9.0] - 2022-05-15
### Changed
- Using GI-Crystal v0.11.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

### Added
- Allow use of child objects defined in XML widget templates! See `examples/widget_template.cr`.

## [0.8.0] - 2022-05-03
### Changed
- Using GI-Crystal v0.10.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

### Added
- Added initial support for XML widget templates! See `examples/widget_template.cr`.

## [0.7.0] - 2022-04-17
### Changed
- Using GI-Crystal v0.8.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.
- Correctly insert PROGRAM_NAME into args sent to `Gio::Application#run(args : Enumarable?)`.
- Added `Gio::Application#run` with no parameters, equivalent of `run(ARGV)` but more efficient.
- To run a `Gio::Application` that doesn't parse any arguments, use `run(nil)`.

## [0.6.0] - 2022-04-14
### Changed
- Using GI-Crystal v0.8.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

### Fixed
- Gdk::ModifierType don't crash when GTK insert reserved bits on it.

## [0.5.0] - 2022-04-03
### Changed
- Using GI-Crystal v0.7.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

## [0.4.0] - 2022-03-02
### Changed
- Using GI-Crystal v0.6.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

## [0.3.0] - 2022-01-29
### Changed
- Using GI-Crystal v0.4.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

## [0.2.0] - 2022-01-23
### Changed
- Using GI-Crystal v0.3.x, See [GI-Crystal changelog](https://github.com/hugopl/gi-crystal/blob/master/CHANGELOG.md) for more info.

## [0.1.0] - 2022-01-09
### Changed
- First Release.
