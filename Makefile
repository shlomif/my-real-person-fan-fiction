#
# Makefile
# Shlomi Fish, 2019-11-06 17:49
#

all: aynrand2grimmie.webp emma_watson_capt_img.webp euler.webp jk_rowling.webp taylor_swift.webp Talk_Like_a_Pirate_Day.webp

all: epub html pdf

Talk_Like_a_Pirate_Day.webp: Talk_Like_a_Pirate_Day.png
	gm convert $< $@

euler.webp: Leonhard_Euler.jpg
	gm convert $< -resize 200x $@

taylor_swift.webp: TaylorSwiftApr09.jpg
	gm convert $< -resize 200x $@

jk_rowling.webp: J._K._Rowling_2010.jpg
	gm convert $< -resize 200x $@

EMMA_WATSON_GIT = captioned-image--emma-watson-doesnt-need-a-wand
EMMA_WATSON_SRC = $(EMMA_WATSON_GIT)/emma-watson-wandless.svg.webp

RAND2GRIMMIE_GIT = Captioned-Image-Ayn-Rand-to-Christina-Grimmie
RAND2GRIMMIE_SRC = $(RAND2GRIMMIE_GIT)/Ayn_Rand--to--Christina_Grimmie.svg.webp

$(RAND2GRIMMIE_SRC):
	git clone https://github.com/shlomif/Captioned-Image-Ayn-Rand-to-Christina-Grimmie

$(EMMA_WATSON_SRC):
	git clone https://github.com/shlomif/captioned-image--emma-watson-doesnt-need-a-wand

aynrand2grimmie.webp: $(RAND2GRIMMIE_SRC)
	gm convert $< -resize 300x $@

emma_watson_capt_img.webp: $(EMMA_WATSON_SRC)
	gm convert $< -resize 300x $@

SRC = README.asciidoc
OUT_base = my-real-person-fan-fiction

DOCBOOK5_XSL_STYLESHEETS_PATH := /usr/share/sgml/docbook/xsl-ns-stylesheets
EPUB_SCRIPT = $(DOCBOOK5_XSL_STYLESHEETS_PATH)/epub/bin/dbtoepub
DBTOEPUB = ruby $(EPUB_SCRIPT)
EPUB = $(OUT_base).epub
DOCBOOK5 = $(OUT_base).docbook5.xml
PDF = $(OUT_base).pdf
XHTML = $(OUT_base).xhtml

html: $(XHTML)

$(EPUB): $(DOCBOOK5)
	$(DBTOEPUB) -o $@ $<

$(XHTML): $(SRC)
	asciidoctor --backend=xhtml5 -o $@ $<

$(DOCBOOK5): $(SRC)
	asciidoctor --backend=docbook5 -o $@ $<

$(PDF): $(DOCBOOK5)
	docmake -o $@ pdf $<

epub: $(EPUB)

pdf: $(PDF)

clean:
	rm -f $(DOCBOOK5) $(PDF) $(XHTML)

test: all
	prove tests/*.t


# vim:ft=make
#
