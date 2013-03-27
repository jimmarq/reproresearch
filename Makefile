# modified slightly from http://robjhyndman.com/hyndsight/makefiles/
# Usually, only these lines need changing
TEXFILE= paper
TEXDIR= ./tex
RDIR= .
FIGDIR= ./figures

#CONVENTIONS:
# load.R - loads the data from disk
# clean.R - cleans data, transforms, etc.
# functions.R - custom functions relied on by analysis
# main.R - will not be run.

# list R files, them exclude "main.R"
RFILES := $(wildcard $(RDIR)/*.R)
RFILES := $(filter-out $(RDIR)/main.R, $(RFILES))

# pdf figures created by R
PDFFIGS := $(wildcard $(FIGDIR)/*.pdf)

# Indicator files to show R file has run
OUT_FILES:= $(RFILES:.R=.Rout)

# Indicator files to show pdfcrop has run
CROP_FILES:= $(PDFFIGS:.pdf=.pdfcrop)

all: $(TEXDIR)/$(TEXFILE).pdf $(OUT_FILES) $(CROP_FILES)

$(RDIR)/clean.Rout: $(RDIR)/clean.R $(RDIR)/load.Rout 
	R CMD BATCH $< 

$(RDIR)/functions.Rout: $(RDIR)/functions.R $(RDIR)/clean.Rout 
	R CMD BATCH $< 

# RUN EVERY R FILE dependent on functions.R
$(RDIR)/%.Rout: $(RDIR)/%.R $(RDIR)/functions.Rout 
	R CMD BATCH $< 

# CROP EVERY PDF FIG FILE
$(FIGDIR)/%.pdfcrop: $(FIGDIR)/%.pdf
	pdfcrop $< $< && touch $@

# Compile main tex file
$(TEXDIR)/$(TEXFILE).pdf: $(TEXDIR)/$(TEXFILE).tex $(OUT_FILES) $(CROP_FILES)
#	latexmk -pdf -quiet $(TEXDIR)/$(TEXFILE)
	cd $(TEXDIR); latexmk -pdf -quiet $(TEXFILE)
#	rubber --pdf $(TEXFILE)
#	rubber-info $(TEXFILE)
	
# Run R files
R: $(OUT_FILES)

# View the resulting PDF file
view: $(TEXDIR)/$(TEXFILE).pdf
	"c:\Program Files\RStudio\bin\sumatra\sumatrapdf" $(TEXFILE).pdf &
#	evince $(TEXFILE).pdf &

# Clean up stray files
clean:
	rm -fv $(OUT_FILES) 
	rm -fv $(CROP_FILES)
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz *.out *.bcf *blx.bib *.run.xml
	rm -fv *.fdb_latexmk *.fls
	rm -fv $(TEXFILE).pdf

.PHONY: all clean
