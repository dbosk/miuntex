# $Id$

PACKAGE=		miunprot
PACKAGE_FILES=	miunprot.cls miunprot-Swedish.dict miunprot-English.dict
TARBALL_FILES=	${PACKCAGE_FILES} miunprot.tex
TEXMF?=			${HOME}/texmf
PREFIX?=		${TEXMF}
INSTALLDIR=		/tex/latex/miun/${PACKAGE}
EXAMPLES=		miunprot.pdf
PUB_FILES=		${PACKAGE}.tar.gz ${EXAMPLES}
CATEGORY=		latex/packages

clean:
	${RM} ${EXAMPLES}

miun.package.mk miun.pub.mk miun.tex.mk:
	wget http://ver.miun.se/build/$@

include miun.package.mk
include miun.pub.mk
include miun.tex.mk
