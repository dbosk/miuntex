# $Id$
# Author:	Daniel Bosk <daniel.bosk@miun.se>

PACKAGE=		miunmisc
PACKAGE_FILES=	MU_logotyp_int_CMYK.eps MU_logotyp_int_sv.eps \
				MU_logotyp_int_CMYK.pdf MU_logotyp_int_sv.pdf \
				miunmisc.ins miunmisc.dtx Makefile
INSTALL_FILES=	MU_logotyp_int_CMYK.eps MU_logotyp_int_sv.eps \
				MU_logotyp_int_CMYK.pdf MU_logotyp_int_sv.pdf \
				miunmisc.sty miunmisc-Swedish.dict miunmisc-English.dict
DOCS_FILES=		miunmisc.pdf miunmisc.ps
TEXMF?=			${HOME}/texmf
PREFIX?=		${TEXMF}
INSTALLDIR=		/tex/latex/miun/${PACKAGE}
DOCSDIR=		/doc/latex/miun/${PACKAGE}
PUB_FILES=		${PACKAGE}.tar.gz miunmisc.pdf
CATEGORY=		latex/packages

.PHONY: clean

miunmisc.pdf miunmisc.ps: miunmisc.dtx
miunmisc.sty miunmisc-Swedish.dict miunmisc-English.dict: \
	miunmisc.ins miunmisc.dtx

clean:
	-${RM} miunmisc.pdf miunmisc.ps miunmisc.sty \
		miunmisc-Swedish.dict miunmisc-English.dict

miun.tex.mk miun.package.mk miun.pub.mk:
	wget http://ver.miun.se/build/$@

include miun.tex.mk
include miun.package.mk
include miun.pub.mk
