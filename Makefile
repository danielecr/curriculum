.PHONY: danielecruciani

CC = xelatex
EXAMPLES_DIR = danielecruciani
RESUME_DIR = danielecruciani/resume
CV_DIR = danielecruciani/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

danielecruciani: cv.pdf

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<
	cp danielecruciani/cv.pdf cv_daniele.cruciani_en.pdf

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf

upload:
	scp danielecruciani/cv.pdf smartango@cp.server313.com:/home/smartango/www/www/sites/default/files/cv_daniele.cruciani_en.pdf
