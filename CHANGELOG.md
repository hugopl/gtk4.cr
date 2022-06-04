# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
