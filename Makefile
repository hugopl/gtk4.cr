VERSION := $(shell shards version)
.PHONY: doc

doc: bin/gi-crystal
	@echo "Generating documentation for Gtk4.cr version $(VERSION)..."
	./bin/gi-crystal
	# We do this to avoid crystal doc generate links to generated files
	echo " " >> LICENSE
	crystal doc -s -p --project-name="GTK4.cr" --project-version="$(VERSION)" \
	  lib/gi-crystal/src/gi-crystal.cr \
	  lib/gi-crystal/src/auto/gtk-4.0/gtk.cr
	# Put LICENSE file back
	git checkout LICENSE

bin/gi-crystal:
	shards install
