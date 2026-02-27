.PHONY: examples jc-resume athina-resume jc-coverletter athina-coverletter all clean

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

# --- Personal CVs ---
JC_RESUME_SRCS = $(shell find resume/jc -name '*.tex')
ATHINA_RESUME_SRCS = $(shell find resume/athina -name '*.tex')

all: jc-resume athina-resume jc-coverletter athina-coverletter

jc-resume: jc-resume.tex $(JC_RESUME_SRCS)
	$(CC) jc-resume.tex

athina-resume: athina-resume.tex $(ATHINA_RESUME_SRCS)
	$(CC) athina-resume.tex

jc-coverletter: jc-coverletter.tex
	$(CC) jc-coverletter.tex

athina-coverletter: athina-coverletter.tex
	$(CC) athina-coverletter.tex

# --- Examples (upstream) ---
examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf *.pdf
