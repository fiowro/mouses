all: 00.pdf

-include $(shell mkdir -p .dep/source 2>/dev/null) $(wildcard .dep/*.d)

ifeq ($(wildcard .progress),.progress)
.DEFAULT_GOAL := progress
endif

progress: .progress
	@$(MAKE) all | ./.progress

clean:
	rm -f $(shell tail -n +3 .hgignore | grep -v pdf)

.progress:
	@[ -x .progress ] || ( echo '#!/usr/bin/awk -f$$$$BEGIN {$$a[0] = "/"$$a[1] = "-"$$a[2] = "\\"$$a[3] = "|"$$pass = 0$$}$$$${$$if (!pass) printf "" a[(FNR - 1) % 4]$$else print$$}$$$$/pdflatex/ {$$if (!pass) printf "o "$$}$$$$/ONEXIT/ {$$if (!pass) printf ". "$$}$$$$/^!/ {$$pass = 1$$print ""$$print$$}$$$$END {$$if (!pass) print "Done."$$}$$$$' | tr $$ \\n > .progress ; chmod +x .progress )

.dep/%.tex.d: source/%.tex
	echo $(<:.tex=.pdf): $< $$(sed -n '/^\\input/s/.*{\([^.]*\).*}.*/\1.tex/p' $<) > $@
	echo $@: $< >> $@

%.pdf: source/%.tex
	@echo $(<:.tex=.pdf): $< $$(sed -n '/^\\input/s/.*{\([^.]*\).*}.*/\1.tex/p' $<) > .dep/$<.d
	cd source; pdflatex -output-directory=.. $< 
ifneq ($(QUICK),yes)
	cd source; pdflatex -output-directory=.. $<
	cd source; pdflatex -output-directory=.. $<
endif



.PHONY: all progress clean
