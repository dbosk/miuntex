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

You should also have Git installed, see URL

    https://git-scm.com/



MIUN DOCUMENT CLASSES FOR LATEX
-------------------------------------------------------------------------------

The following packages and document classes are available:

    miunart:     A document class for typesetting all kinds of things, it's
                 very much like the article class in LaTeX base.
    miunasgn:    A document class for typesetting assignment instructions,
                 e.g. labs.  It can also be used to typeset the hand-ins as
                 the solution environment is pretty good for solutions.
    miunexam:    Contains the document class for typesetting exams.
    miunmisc:    Contains the logotypes and other basic files used by the
                 classes and packages.
    miunprot:    Contains the document class for typesetting meeting
                 protocols.
    miunthes:    A document class to typeset various theses according to
                 university regulation.

The classes depends on the Ubuntu packages texlive-science, 
texlive-lang-swedish, and texlive-latex-extra.


INSTRUCTIONS FOR UNIX-LIKE SYSTEMS
-------------------------------------------------------------------------------

To install the MiUn LaTeX classes and packages please clone the git repo into 
the texmf tree in your home directory.  I.e. do the following:

    $ mkdir -p ~/texmf/tex/latex
    $ cd ~/texmf/tex/latex
    $ git clone https://github.com/dbosk/miuntex.git

Now all the document classes and packages should be available to you.


INSTRUCTIONS FOR WINDOWS
-------------------------------------------------------------------------------

The instructions for Windows are similar to those for UNIX-like systems.  If 
you use Git Bash, then they're exactly the same.  Otherwise, the main 
difference is the slashes in the path ``texmf\tex\latex``.  Make sure those 
directories exist in your home directory.  Then go into that directory and 
clone the git repo in there.


DOCUMENTATION
-------------------------------------------------------------------------------

Currently, most packages and classes are "documented" using examples.  The only 
documented package is ``miunmisc``.  You can read its documentation as all 
other TeX documentation, i.e. by issuing the command ``texdoc miunmisc`` (if 
using TeX Live).  This kind of documentation is slowly on its way for the rest 
of the packages as well.
