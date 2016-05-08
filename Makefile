
ALL=ckblack-cv.md ckblack_org.css

all: $(ALL)
	pandoc -s -S --self-contained -c ckblack_org.css -o ckblack-cv.html ckblack-cv.md 
	pandoc -s -S --self-contained -c ckblack_org.css --latex-engine /Library/TeX/texbin/pdflatex -o ckblack-cv.pdf ckblack-cv.md 

publish: ckblack-cv.html
	scp ckblack-cv.html ckblack.org:~/ckblackorg/cv.html
	
clean:
	rm $(ALL)