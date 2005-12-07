# Makefile for generating PDF files (final version)

DOC = amsldoc-vn
VERSION = `gawk -F '=' '{print $$2}' $(DOC).ktvnum`

default: doc

finalflag:
	@echo '' > finalized

doc: clean finalflag
	@pdflatex $(DOC)
	@pdflatex $(DOC)
# Thanks to Reinhard Kotucha	
	@thumbpdf $(DOC).pdf
	@pdflatex $(DOC)
	@pdflatex $(DOC)-print
	@pdflatex $(DOC)-print
	@rm -f finalized
	
clean:
	@rm -fv finalized *.{tpt,out,log,idx,aux,dvi,bbl,blg,toc,idx,tps,ps,ilg,tcp,ind,thm} *~
	
cleanall: clean
	@rm -frv *.pdf *~ ./amsldoc-vi/

distro:
	@mkdir -p ./amsldoc-vn/src
	@mkdir -p archive
	@rm -f archive/$(DOC)-$(VERSION).tgz
	@cp README TODO THANKS *.pdf ./amsldoc-vn
	@cp header.tex amsldoc-*.tex Makefile ./amsldoc-vn/src/
	@tar cfvz ./archive/$(DOC)-$(VERSION).tgz ./amsldoc-vn
