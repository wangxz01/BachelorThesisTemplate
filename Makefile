# BachelorThesisTemplate —— 一键编译
# 使用：make / make clean / make distclean
ENGINE  := xelatex
FLAGS   := -interaction=nonstopmode -halt-on-error
SOURCES := taskbook.tex proposal.tex
PDFS    := $(SOURCES:.tex=.pdf)
STY     := whu-form.sty

.PHONY: all clean distclean

all: $(PDFS)

%.pdf: %.tex $(STY)
	$(ENGINE) $(FLAGS) $<

clean:
	rm -f *.aux *.log *.out *.xdv *.fls *.fdb_latexmk *.synctex.gz missfont.log

distclean: clean
	rm -f $(PDFS)
