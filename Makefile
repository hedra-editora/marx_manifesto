all:
	pdflatex MARX.tex
	evince MARX.pdf
dub:
	svn propset svn:keywords "Date Id Rev" *.tex
	pdflatex MARX.tex	
	pdflatex MARX.tex
	evince MARX.pdf

dic:
	@echo "personal_ws-1.1 pt_BR `cat *.tex | aspell -l pt_BR -t list | sort | uniq | wc -l` utf-8" > dic.pws
	@cat *.tex | aspell -l pt_BR -t list | sort | uniq >> dic.pws
	sh dic.sh
erros:
	@cat *.tex | aspell --extra-dicts=./dic.pws -t list | sort | uniq
corrige:
	clear 
	sh dic.sh
clean:
	rm *.aux *.dvi *.log MARX.pdf *.ps *.toc *.out *.ent
