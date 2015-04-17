# $Id$

PACKAGE=		miunart
PACKAGE_FILES=	miunart.cls miunart-Swedish.dict miunart-English.dict
TARBALL_FILES=	${PACKAGE_FILES} miunart.tex miunart.bib automata.eps
TEXMF?=			${HOME}/texmf
PREFIX?=		${TEXMF}
INSTALLDIR=		/tex/latex/miun/${PACKAGE}
PUB_FILES=		${PACKAGE}.tar.gz miunart.ps miunart.pdf
CATEGORY=		latex/packages

miunart.pdf miunart.ps: miunart.tex miunart.bib automata.eps

clean:
	${RM} miunart.pdf miunart.ps

miun.pub.mk miun.package.mk miun.tex.mk:
	wget http://ver.miun.se/build/$@

include miun.package.mk
include miun.pub.mk
include miun.tex.mk
