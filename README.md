Goal of reproresearch
================================
The goal of this project is to provide a sample RStudio project that integrates R with Latex using make.

This project was inspired by Rob Hyndman's blog post that can be found here: http://robjhyndman.com/hyndsight/makefiles/.

Why use make instead of Sweave?
-------------------------------
I prefer to keep R and Latex as separate as possible. It seems like if you use Sweave, you have one of two options:

* Do your analysis in .R files, then copy and paste into Sweave. You now have to maintain the code in two places.
* Endure the overhead of doing your analysis directly in Sweave the first time.

Neither workflow appeals to me. Your mileage may vary.

Make is a standard tool that works well. The Makefile for this project has been created so that only a few lines at most would need to be updated for a new project.

Requirements
------------
I have only tested this on Windows. However, all of the tools should be available for Linux and OSX. You will need:

* R
* RStudio
* Miktex
* Ghostscript
* make (comes with the devtools package or many other sources)

Any fairly recent version of the software should work.

Ensure that the Miktex and Ghostscript bin folders and make.exe are in your PATH in Windows.

RStudio Project Conventions
---------------------------
The main folder stores the .R files. There are 3 subfolders:

* data. All data for the analysis goes here.
* figures. PDFs of plots go here.
* tex. The main paper.tex file is here, along with other .tex files generated by the .R scripts.

The following .R files are recommended:

* load.R. Loads the data. Should be very short.
* clean.R. Performs any transformations needed on the data, such as factoring strings.
* functions.R. Functions used throughout the analysis should be stored here.
* main.R. This will NOT be compiled by the Makefile. Use this for running the analysis independent of make.

In addition, as many other .R files can be added to perform the analysis.

Getting Started
---------------

* Open RLatexSampleProj.Rproj in RStudio
* On the menu, click Build > Configure Build Tools...
* In the "Project build tools:" dropdown, select "Makefile".
* The Makefile directory should be "(Project Root)".
* Click OK
* To build the project, from the menu click Build > Build All. The report will be generated in tex/paper.pdf.

Known Issues
------------

* Currently, you have to manually delete the paper.pdf file before re-running the build.
* There is a make warning about a circular dependency. It seems to work fine, though.

Contact
-------
If you have any questions or feedback, feel free to contact me through github or email jim dot marquardson at gmail.
