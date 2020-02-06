# $Id$
.PHONY: all
all: miunasgn.pdf

miunasgn.pdf: miunasgn.tex literature.tex examination.tex literature.bib
miunasgn.pdf: miunmisc

PKG_NAME=			miunasgn
PKG_INSTALL_FILES=	miunasgn.cls miunasgn-English.dict miunasgn-Swedish.dict

PKG_PREFIX= 		${HOME}
PKG_INSTALL_DIR= 	/texmf/latex/miuntex/miunasgn


INCLUDE_MIUNTEX=../
INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/pkg.mk
include ${INCLUDE_MAKEFILES}/miun.depend.mk

clean-miunasgn:
	true # don't clean these files
