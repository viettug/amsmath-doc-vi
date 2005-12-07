# Makefile for generating PDF files (final version)

DOC = amsldoc-vn
VERSION = `gawk -F '=' '{print $$2}' $(DOC).ktvnum`
TESTA = subeqn-vn

default: latex

finalflag:
	@echo '' > finalized

latex:
	@latex $(DOC)
	@latex -src-specials $(DOC)

pdf:
	@pdflatex -src-specials $(DOC)

doc: clean finalflag latex index
# 	@pdflatex $(DOC)
# 	@pdflatex $(DOC)
# 	@thumbpdf $(DOC).pdf
# 	@pdflatex $(DOC)
# 	@pdflatex $(DOC)-print
# 	@pdflatex $(DOC)-print
	@latex $(DOC)
	@latex $(DOC)
	@dvips $(DOC).dvi
	@ps2pdf $(DOC).ps
	@latex $(TESTA)
	@latex $(TESTA)
	@pdflatex $(TESTA)
	@rm -f finalized

clean:
	@rm -fv finalized *.{tpt,log,idx,aux,dvi,bbl,blg,toc,idx,tps,ps,ilg,tcp,ind,thm} *~

cleanall: clean
	@rm -frv *.pdf *~ ./src/*

dist:
	@mkdir -p ./src
	@mkdir -p distro
	@rm -f distro/$(DOC)-$(VERSION).tgz
	@cp TODO $(DOC).ktvnum amsldoc-*.tex $(TESTA).tex header.tex Makefile ./src
	@tar cfvz ./distro/$(DOC)-$(VERSION).tgz \
		./src/* \
		THANKS README COPYING \
		$(TESTA).pdf $(DOC).pdf $(DOC)-print.pdf

index:
	@if [ -r $(DOC).idx ]; then \
		 sed \
			-e 's/|hyperpage//g' \
			-e 's/package/(gói)/g' \
			-e 's/option/(tuỳ chọn)/g' \
			-e 's/environment/(môi trường)/g' \
			$(DOC).idx \
		> $(DOC).jdx ; \
	fi
	@makeindex -o $(DOC).ind $(DOC).jdx
