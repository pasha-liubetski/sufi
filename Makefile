unexport QT_QPA_PLATFORMTHEME

MD := sufi.md
EPUB := sufi.epub
HTML := sufi.html
MOBI := sufi.mobi
PDF := sufi.pdf

all: epub html mobi pdf
epub: $(EPUB)
html: $(HTML)
mobi: $(MOBI)
pdf: $(PDF)

clean:
	$(RM) *epub *html *mobi *pdf

%.epub: %.md
	$(RM) $@

	pandoc "$<" -o "$@"

%.mobi: %.md
	$(RM) $@

	kindlegen $(EPUB) || true

%.html: %.md
	$(RM) $@

	pandoc "$<" -o "$@"

%.pdf: %.md
	$(RM) $@

	pandoc "$<" -o "$@" --pdf-engine=xelatex
