# $Id$
.PHONY: all
all: miunexam.pdf

miunexam.pdf: miunexam.tex

PKG_NAME=			miunexam
PKG_INSTALL_FILES=	miunexam.cls miunexam-English.dict miunexam-Swedish.dict

PKG_PREFIX= 		${HOME}
PKG_INSTALL_DIR= 	/texmf/tex/latex/miuntex/miunexam


INCLUDE_MIUNTEX=../
INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/pkg.mk
include ${INCLUDE_MAKEFILES}/miun.depend.mk

clean-miunexam:
	true # don't clean these files
