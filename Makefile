header       := header.tex
md           := book.md
meta         := metadata.yaml
pdf          := book.pdf
tex          := $(pdf:%.pdf=%.tex)

pandoc_input_format := markdown+smart+raw_tex+east_asian_line_breaks-auto_identifiers

pandoc_options     := -s                           # ヘッダ・フッタを付けた完全な出力にする
pandoc_options     += -f $(pandoc_input_format)    # 入力フォーマット（上記）
pandoc_options     += -t latex                     # 出力フォーマット（LaTeXファイル）
pandoc_options     += --toc                        # 目次を入れる
pandoc_options     += -H $(header)                 # LaTeXのヘッダファイル(.tex)（プリアンブル部分）
pandoc_options     += --filter pandoc-latex-unlisted  # Pandocフィルタ: .unlistedの付いた見出しを目次から除外

### make all
.PHONY: all
all: $(pdf)

$(tex): $(md) $(header) $(copyright) $(bib_dest) $(csl) $(meta)
	pandoc $(pandoc_options) $(pandoc_options_all) $(meta) $(md) -o $@

$(pdf): $(tex)
	latexmk -pdflua $(tex)

.PHONY: clean
clean: 
	latexmk -C
	rm -f $(tex)
