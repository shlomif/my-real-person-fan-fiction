#
# Makefile
# Shlomi Fish, 2019-11-06 17:49
#

all: emma_watson_capt_img.webp euler.webp taylor_swift.webp

euler.webp: Leonhard_Euler.jpg
	gm convert $< -resize 200x $@

taylor_swift.webp: TaylorSwiftApr09.jpg
	gm convert $< -resize 200x $@

EMMA_WATSON_GIT =captioned-image--emma-watson-doesnt-need-a-wand
EMMA_WATSON_SRC = $(EMMA_WATSON_GIT)/emma-watson-wandless.svg.webp

$(EMMA_WATSON_SRC):
	git clone https://github.com/shlomif/captioned-image--emma-watson-doesnt-need-a-wand

emma_watson_capt_img.webp: $(EMMA_WATSON_SRC)
	gm convert $< -resize 300x $@

# vim:ft=make
#
