header       := header.tex
md           := book.md
pdf          := book.pdf

pandoc_options := --verbose
pandoc_options += -s
pandoc_options += -f markdown+raw_tex
pandoc_options += --toc
pandoc_options += --filter pandoc-latex-unlisted

# Error when -H is given
pandoc_options += -H $(header)

# UNCOMMENT BELOW TO FIX
# pandoc_options += -M --header-includes:'%'

### make all
.PHONY: all
all: $(pdf)

$(pdf): $(md) $(header)
	pandoc $(pandoc_options) $(meta) $(md) -o $@

.PHONY: clean
clean:
	rm -f $(pdf)
