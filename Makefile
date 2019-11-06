#
# Makefile
# Shlomi Fish, 2019-11-06 17:49
#

all: euler.webp

euler.webp: Leonhard_Euler.jpg
	gm convert $< -resize 200x $@

# vim:ft=make
#
