# $Id$
.PHONY: all
all: miunart.pdf

miunart.pdf: 		miunart.tex miunart.bib automata.eps miunmisc

PKG_NAME=			miunart
PKG_INSTALL_FILES=	miunart.cls miunart-English.dict miunart-Swedish.dict

PKG_PREFIX= 		${HOME}
PKG_INSTALL_DIR= 	/texmf/tex/latex/miuntex/miunart


INCLUDE_MIUNTEX=../
INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/pkg.mk
include ${INCLUDE_MAKEFILES}/miun.depend.mk

clean-miunart:
	true # don't clean these files

