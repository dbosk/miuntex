# $Id$
.PHONY: all
all: miunprot.pdf

miunprot.pdf: miunprot.tex miunmisc

PKG_NAME=			miunprot
PKG_INSTALL_FILES=	miunprot.sty miunprot-English.dict miunprot-Swedish.dict

PKG_PREFIX= 		${HOME}
PKG_INSTALL_DIR= 	/texmf/tex/latex/miuntex/miunprot


INCLUDE_MIUNTEX=../
INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/miun.depend.mk

clean-miunprot:
	true # don't clean these files
