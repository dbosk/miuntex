# $Id$

PACKAGE=		miunasgn
PACKAGE_FILES=	miunasgn.cls miunasgn-Swedish.dict miunasgn-English.dict
TARBALL_FILES=	${PACAKGE_FILES} \
				miunasgn.tex literature.tex examination.tex literature.bib
TEXMF?=			${HOME}/texmf
PREFIX?=		${TEXMF}
INSTALLDIR=		/tex/latex/miun/${PACKAGE}
EXAMPLES=		miunasgn.pdf miunasgn.ps
PUB_FILES=		${PACKAGE}.tar.gz miunasgn.pdf miunasgn.ps
CATEGORY=		latex/packages

miunasgn.pdf miunasgn.ps: miunasgn.tex literature.tex examination.tex \
	literature.bib

clean:
	${RM} miunasgn.pdf miunasgn.ps

miun.package.mk miun.pub.mk miun.tex.mk:
	wget http://ver.miun.se/build/$@

include miun.package.mk
include miun.pub.mk
include miun.tex.mk
