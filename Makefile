pdf:
	pdflatex -interaction=nonstopmode faif.tex
	makeindex faif.idx
	bibtex faif.aux
	pdflatex -interaction=nonstopmode faif.tex
	@echo "\nRun multiple times for correct citations."
tar: faif.pdf
	tar -cf faif.tar Makefile *.tex faif.bib *.jpg

cover: faif.pdf
	pdftk faif.pdf cat 1 output - | convert -density 60 - cover.jpg

clean:
	rm -f *.aux *.idx *.log *.ilg *.ind *.blg *.bbl *.url *.toc *.out *\~
	
