# Installation needs for using pandoc

You can use pandoc to convert any `.md` file to LaTex or beamer based `.pdf` and `.html`

These are (the simplest, Haskell platform / GHC independent) instructions that work on Linux Ubuntu and should easily be transferable to Mac. For Windows most of it will probably be done outside the command line. If you run into trouble, the main things to make sure are

- matching versions of the different packages with pandoc
- paths contain the packages

## For simple notes in latex

Relevant files are all in `latex` folder

**For Linux**

1. Install the newest `pandoc` and `pandoc-citeproc` version  [here](https://pandoc.org/installing.html#linux). Note: For Linux absolutely use the debian package, do not `sudo apt-get install`, it's outdated!
2. Copy pre-built executable `pandoc-crossref` release corresponding to your pandoc version [available here](https://github.com/lierdakil/pandoc-crossref/releases) to one of the folders in your `path` (determine those folders using: `echo $PATH`)
3. Install `python-pandocfilters` using `pip install` or `apt-get install`
4. For labeling and crossreferencing, use the Python pandoc filters by [Michael Faerber](https://github.com/01mf02/pandocfilters)
with syntax [here](http://gedenkt.at/blog/scientific-pandoc/)  
  - The only thing you need is to download and copy all python files into a folder which you then refer to in the make file
  - For our example the files are already in the `pandoc` subfolder in this repo so you can skip this step
  - If you want to define new environments, you can do so in `macros.sty` - it includes the header too
5. To convert the `.md` file into `.pdf`, go to the console and run
```
make example.pdf
```
in the console. Alternatively if you have multiple files you can also run  
```
make all
```

And voila you can use macros and amsmath environments like you're used to.

**For Mac**, the following has been reported to work:

Optional: `conda create -n your_env python=3.6` and `source activate your_env`

Then in the command line, type

1. `conda install pandoc=2.9.1`
2. `conda install pandoc-crossref`
3. `conda install pandocfilters`

To replace steps 1-3, follow steps 4, 5 in the Linux instructions.

## For beamer

I'm still working on lua filters to make beamer presentations fast. Current samples are rudimentary.

Relevant files are in `beamer` folder.

1. For slides with animations run `make sample-slides.pdf`
2. For handout without animations run `make sample-handout.pdf`

Caveat: Currently handouts cannot include links...


## For websites

Relevant files are all in `html` folder. Run `make all`.

This readme can be converted to html using the makefile in that subfolder.  

# Pandoc syntax tricks

## Frequent "mistakes"

When writing formulas in markdown like $x=3$, don't leave a space between formula and last `$`, else it might give a compile error.
