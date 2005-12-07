# Makefile for generating PDF files (final version)

DOC = amsldoc-vn
VERSION = `gawk -F '=' '{print $$2}' $(DOC).ktvnum`
TESTA = subeqn-vn

default: latex

finalflag:
	@echo '' > finalized

latex:
	@latex $(DOC)

doc: clean finalflag
	@pdflatex $(DOC)
	@pdflatex $(DOC)
	@thumbpdf $(DOC).pdf
	@pdflatex $(DOC)
	@pdflatex $(DOC)-print
	@pdflatex $(DOC)-print
	@pdflatex $(TESTA)
	@pdflatex $(TESTA)
	@rm -f finalized

clean:
	@rm -fv finalized *.{tpt,out,log,idx,aux,dvi,bbl,blg,toc,idx,tps,ps,ilg,tcp,ind,thm} *~

cleanall: clean
	@rm -frv *.pdf *~ ./src/*

dist:
	@mkdir -p ./src
	@mkdir -p distro
	@rm -f distro/$(DOC)-$(VERSION).tgz
	@cp TODO README.src $(DOC).ktvnum amsldoc-*.tex $(TESTA).tex header.tex Makefile ./src
	@tar cfvz ./distro/$(DOC)-$(VERSION).tgz \
		./src/* \
		THANKS README COPYING \
		$(TESTA).pdf $(DOC).pdf $(DOC)-print.pdf
