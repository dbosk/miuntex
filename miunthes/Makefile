# $Id$
.PHONY: all
all: miunthes.cls miunthes-English.dict miunthes-Swedish.dict

PKG_NAME=			miunthes
PKG_INSTALL_FILES=	miunthes.cls miunthes-English.dict miunthes-Swedish.dict

PKG_PREFIX= 		${HOME}
PKG_INSTALL_DIR= 	/texmf/tex/latex/miuntex/miunthes


INCLUDE_MIUNTEX=../
INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/pkg.mk

clean-miunthes:
	true # don't clean these files

