# $Id$
# Author:	Daniel Bosk <daniel.bosk@miun.se>

miunmisc.pdf: miunmisc.dtx
miunmisc.pdf: miunmisc.sty

miunmisc.sty miunmisc-Swedish.dict miunmisc-English.dict: miunmisc.ins
miunmisc.sty miunmisc-Swedish.dict miunmisc-English.dict: miunmisc.dtx

.PHONY: clean
clean:
	${RM} miunmisc.pdf miunmisc.ps miunmisc.sty
	${RM} miunmisc-Swedish.dict miunmisc-English.dict


INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
