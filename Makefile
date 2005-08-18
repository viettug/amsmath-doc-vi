amsldoc:
	@latex amsldoc && latex amsldoc && pdflatex amsldoc && pdflatex amsldoc
clean:
	@rm -fv *.log *.idx *.aux *.dvi *.bbl *.blg *.toc *.idx *.tps *.ps *.ilg *.tcp *~ *.ind
cleanall:
	@rm -fv *.pdf *~
