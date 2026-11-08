# BachelorThesisTemplate —— 一键编译
# make / make forms / make thesis / make clean / make distclean
ENGINE     := xelatex
FLAGS      := -interaction=nonstopmode -halt-on-error
FORM_TEX   := taskbook.tex proposal.tex
FORM_PDF   := $(FORM_TEX:.tex=.pdf)
FORM_STY   := whu-form.sty
THESIS_DIR := thesis

.PHONY: all forms thesis clean distclean

all: forms thesis

forms: $(FORM_PDF)

%.pdf: %.tex $(FORM_STY)
	$(ENGINE) $(FLAGS) $<

# 论文正文：latexmk 自动完成 xelatex → bibtex → xelatex 多轮编译
thesis:
	cd $(THESIS_DIR) && latexmk -xelatex $(FLAGS) main.tex

clean:
	rm -f *.aux *.log *.out *.xdv *.fls *.fdb_latexmk *.synctex.gz missfont.log
	cd $(THESIS_DIR) && latexmk -c main.tex >/dev/null 2>&1 || true

distclean: clean
	rm -f $(FORM_PDF)
	cd $(THESIS_DIR) && latexmk -C main.tex >/dev/null 2>&1 || true
