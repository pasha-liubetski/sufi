unexport QT_QPA_PLATFORMTHEME

MD_FILES := sufi.md
PDF_FILES := sufi.pdf

all: pdf

pdf: $(PDF_FILES)

clean:
	$(RM) *pdf

%.pdf: %.md
	$(RM) $@

	pandoc "$<" -o "$@" --pdf-engine=xelatex
