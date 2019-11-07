#
# Makefile
# Shlomi Fish, 2019-11-06 17:49
#

all: aynrand2grimmie.webp emma_watson_capt_img.webp euler.webp jk_rowling.webp taylor_swift.webp Talk_Like_a_Pirate_Day.webp

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

# vim:ft=make
#
