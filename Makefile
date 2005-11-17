DOC = amsldoc-vi
VERSION = `gawk -F '=' '{print $$2}' $(DOC).ktvnum`

default: doc

finalflag:
	@echo '' > finalized

doc: finalflag
	@pdflatex $(DOC)
	@pdflatex $(DOC)-print
	@rm -f finalized
	
clean:
	@rm -fv finalized *.out *.log *.idx *.aux *.dvi *.bbl *.blg *.toc *.idx *.tps *.ps *.ilg *.tcp *~ *.ind
	
cleanall: clean
	@rm -frv *.pdf *~ ./amsldoc-vi/

distro:
	@mkdir -p ./amsldoc-vi/src
	@mkdir -p archive
	@rm -f archive/$(DOC)-$(VERSION).tgz
	@cp README TODO THANKS *.pdf ./amsldoc-vi
	@cp amsldoc-*.tex Makefile ./amsldoc-vi/src/
	@tar cfvz ./archive/$(DOC)-$(VERSION).tgz ./amsldoc-vi
