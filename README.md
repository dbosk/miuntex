MIUN TeX
===============================================================================

Table of contents
-------------------------------------------------------------------------------

0. Prerequisites
1. MIUN Document Classes for LaTeX
2. Instructions for UNIX-like Systems
3. Instructions for Windows
4. Documentation


PREREQUISITES
-------------------------------------------------------------------------------

It is assumed that you already have a (La)TeX installation.  If not, go to URL

    https://www.tug.org/texlive/.



MIUN DOCUMENT CLASSES FOR LATEX
-------------------------------------------------------------------------------

To install the MiUn LaTeX classes and packages please download all the relevant 
tarballs from packages/.  The packages and classes available are listed here:

    Makefile:    Used to install a set of classes or packages.
    miunmisc:    Contains the logotypes and other basic files used by the
                 classes and packages.  You will always need this one!
    miunexam:    Contains the document class for typesetting exams.
    miunprot:    Contains the document class for typesetting meeting
                 protocols.
    miunart:     A document class for typesetting all kinds of things, like
                 the article class in LaTeX base.
    miunasgn:    A document class for typesetting assignments, e.g. labs.
    miunthes:    A document class to typeset various theses according to
                 university regulation.

The classes depends on the Ubuntu packages texlive-science, 
texlive-lang-swedish, and texlive-latex-extra.


INSTRUCTIONS FOR UNIX-LIKE SYSTEMS
-------------------------------------------------------------------------------

To install all of the packages, download all relevant tarballs from the 
packages/ subdirectory to a directory of your chosing.  Then extract all 
tarballs and run ``make install`` from each directory:

	$ wget http://ver.miun.se/latex/packages/miunmisc.tar.gz
	[...]
	$ wget [...]
	[...]
    $ tar -zxf miunmisc.tar.gz
	$ cd miunmisc && make install; cd ..
	[...]
    $ tar -zxf miunthes.tar.gz
	$ cd miunthes && make install; cd ..
	[...]

To install all of them, download the packages-all.tar.gz tarball.  Extract this 
one, enter the directory, and finally run ``make install''.


INSTRUCTIONS FOR WINDOWS
-------------------------------------------------------------------------------

If you are running Windows, install 7-Zip from

    http://www.7-zip.org/

to extract the tarballs, unless you already have a program which handles
gzipped tar archives.  You can then extract them directly into

    texmf\tex\latex\miun

in your user's home directory.


DOCUMENTATION
-------------------------------------------------------------------------------

Currently, most packages and classes are "documented" using examples.  The only 
documented package is ``miunmisc``.  You can read its documentation as all 
other TeX documentation, i.e. by issuing the command ``texdoc miunmisc`` (if 
using TeX Live).  This kind of documentation is slowly on its way for the rest 
of the packages as well.
