# Book Management Makefile

.PHONY: help list build publish

# List all book directories
BOOKS := $(patsubst books/%/,%,$(dir $(wildcard books/*/)))

help:
	@echo "Usage: make [target] [BOOK=<book_name>]"
	@echo ""
	@echo "Targets:"
	@echo "  list      List all available books"
	@echo "  build     Compile the specified book (or all if BOOK not specified)"
	@echo "  publish   Publish the specified book (or all if BOOK not specified)"
	@echo ""
	@echo "Available books:"
	@echo "  $(BOOKS)"

list:
	@echo "Books found in books/ directory:"
	@for book in $(BOOKS); do echo " - $$book"; done

build:
ifeq ($(BOOK),)
	@for book in $(BOOKS); do $(MAKE) build BOOK=$$book; done
else
	@echo "--- Building book: $(BOOK) ---"
	@if [ -f "books/$(BOOK)/package.json" ]; then \
		echo "Detected package.json, running npm build..."; \
		npm run build --prefix books/$(BOOK); \
	elif [ -f "books/$(BOOK)/scripts/publish.py" ]; then \
		echo "Detected scripts/publish.py, running python3..."; \
		cd books/$(BOOK) && python3 scripts/publish.py; \
	elif [ -f "books/$(BOOK)/scripts/export_book.py" ]; then \
		echo "Detected scripts/export_book.py, running python3..."; \
		cd books/$(BOOK) && python3 scripts/export_book.py; \
	else \
		echo "Error: No build system detected for $(BOOK)"; \
		exit 1; \
	fi
endif

publish:
ifeq ($(BOOK),)
	@for book in $(BOOKS); do $(MAKE) publish BOOK=$$book; done
else
	@echo "--- Publishing book: $(BOOK) ---"
	@if [ -f "books/$(BOOK)/package.json" ]; then \
		echo "Detected package.json, running npm release..."; \
		npm run release --prefix books/$(BOOK); \
	elif [ -f "books/$(BOOK)/scripts/publish_github.sh" ]; then \
		echo "Detected scripts/publish_github.sh, running bash..."; \
		bash books/$(BOOK)/scripts/publish_github.sh; \
	else \
		echo "Error: No publication system detected for $(BOOK)"; \
		exit 1; \
	fi
endif
