SRC := $(wildcard *.md)
HTML = $(patsubst %.md,%.html,$(SRC))
PDF = $(patsubst %.md,%.pdf,$(SRC))

all: $(HTML) $(PDF)

%.pdf: %.md
	pandoc -s -o $@ $<

%.html: %.md ckblack_org.css
	pandoc -s --embed-resources -c ckblack_org.css -o $@ $<

publish: ckblack-cv.html
	scp ckblack-cv.html ckblack.org:~/ckblackorg/cv.html

.PHONY: clean
clean:
	rm $(HTML) $(PDF)
