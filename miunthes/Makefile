# $Id$

PACKAGE=		miunthes
PACKAGE_FILES=	miunthes.cls miunthes-Swedish.dict miunthes-English.dict
TARBALL_FILES=	${PACKAGE_FILES} thesis/ Makefile
TEXMF?=			${HOME}/texmf
PREFIX?=		${TEXMF}
INSTALLDIR=		/tex/latex/miun/${PACKAGE}

#export no

Makefile.export: Makefile

TARBALL_FILES= 	${PACKAGE_FILES} thesis/ Makefile.export
PUB_FILES=		${PACKAGE}.tar.gz
CATEGORY=		latex/packages

include miun.pub.mk

#endexport

miun.depend.mk:
	wget http://ver.miun.se/build/$@

include miun.depend.mk
include miun.package.mk
