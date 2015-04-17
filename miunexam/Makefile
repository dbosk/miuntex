# $Id$

PACKAGE=		miunexam
PACKAGE_FILES=	miunexam.cls miunexam-Swedish.dict miunexam-English.dict
TARBALL_FILES=	${PACKAGE_FILES} miunexam.tex
TEXMF?=			${HOME}/texmf
PREFIX?=		${TEXMF}
INSTALLDIR=		/tex/latex/miun/${PACKAGE}
EXAMPLES=		miunexam.pdf miunexam.ps
PUB_FILES=		${PACKAGE}.tar.gz ${EXAMPLES}
CATEGORY=		latex/packages

miunexam.pdf miunexam.ps: miunexam.tex

clean:
	${RM} ${EXAMPLES}

miun.package.mk miun.pub.mk miun.tex.mk:
	wget http://ver.miun.se/build/$@

include miun.package.mk
include miun.pub.mk
include miun.tex.mk
