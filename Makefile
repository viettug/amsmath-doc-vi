DOC=amsldoc-doc-vi
VERION=`gawk -F '=' '{print $$2}' $(DOC).ktvnum`

doc:
	@latex $(DOC)
	@latex $(DOC)
	
clean:
	@rm -fv *.log *.idx *.aux *.dvi *.bbl *.blg *.toc *.idx *.tps *.ps *.ilg *.tcp *~ *.ind
	
cleanall:
	@rm -fv *.pdf *~

distro:
	@echo $(VERSION)
