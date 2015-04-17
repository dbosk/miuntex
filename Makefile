# $Id$

SUBDIR=		miunmisc
SUBDIR+= 	miunexam
SUBDIR+= 	miunprot
SUBDIR+= 	miunasgn
SUBDIR+= 	miunart
SUBDIR+= 	miunbeam
SUBDIR+= 	miunthes
SUBDIR+= 	miunlett
#SUBDIR+= 	miunsyll

#export no

Makefile.export: Makefile

PACKAGE=		packages-all
PACKAGE_FILES=	${SUBDIR} README Makefile.export
INSTALL_FILES=

TEXMF?=			${HOME}/texmf/
PREFIX?=		${TEXMF}
INSTALLDIR?=	tex/latex/miun

PUB_FILES?=		README ${PACKAGE}.tar.gz ${SUBDIR} Makefile
CATEGORY?=		latex

include miun.pub.mk
include miun.package.mk
include miun.export.mk

#endexport

miun.depend.mk:
	wget http://ver.miun.se/build/$@

include miun.depend.mk
include miun.subdir.mk
