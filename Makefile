VERSION := $(shell shards version)
.PHONY: doc

doc: bin/gi-crystal
	@echo "Generating documentation for Gtk4.cr version $(VERSION)..."
	./bin/gi-crystal --doc
	# We remove the current docs so we can see if some file was removed from the docs
	# on gh-pages branch that have the docs files checked in.
	rm -rf docs
	crystal doc -s -p --project-name="GTK4.cr" --project-version="$(VERSION)" \
	  lib/gi-crystal/src/gi-crystal.cr \
	  lib/gi-crystal/src/auto/gtk-4.0/gtk.cr

bin/gi-crystal:
	shards install
