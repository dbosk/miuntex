# $Id$
# Author:	Daniel Bosk <daniel.bosk@miun.se>

LATEX= 	latex

.PHONY: all
all: miunmisc.pdf miunmisc.sty

miunmisc.pdf: miunmisc.dtx
miunmisc.pdf: miunmisc.sty

miunmisc.sty miunmisc-Swedish.dict miunmisc-English.dict: miunmisc.ins
miunmisc.sty miunmisc-Swedish.dict miunmisc-English.dict: miunmisc.dtx

PKG_NAME=			miunmisc
PKG_INSTALL_FILES=	miunmisc.sty miunmisc-English.dict miunmisc-Swedish.dict
PKG_INSTALL_FILES+= MU_logotyp_int_CMYK.eps MU_logotyp_int_CMYK.pdf
PKG_INSTALL_FILES+= MU_logotyp_int_sv.eps MU_logotyp_int_sv.pdf

PKG_PREFIX= 		${HOME}
PKG_INSTALL_DIR= 	/texmf/tex/latex/miuntex/miunmisc


.PHONY: clean
clean:
	${RM} miunmisc.pdf miunmisc.ps miunmisc.sty
	${RM} miunmisc-Swedish.dict miunmisc-English.dict
	${RM} miunmisc.aux miunmisc.fdb_latexmk miunmisc.fls miunmisc.log


INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/pkg.mk
