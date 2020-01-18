# Installation needs for using pandoc

These are instructions that work on Linux Ubuntu and should easily be transferable to Mac.

You can use pandoc to convert any `.md` file to LaTex or beamer based `.pdf` and `.html`

## For simple notes in latex

Relevant files are all in `latex` folder

1. Install the newest `pandoc` and `pandoc-citeproc` version  [here](https://pandoc.org/installing.html#linux). Note: For Linux absolutely use the debian package, do not `sudo apt-get install`
2. Install `python-pandocfilters` using `pip install` or
3. For labeling and crossreferencing, use the Python pandoc filters by [Michael Faerber](https://github.com/01mf02/pandocfilters)
with syntax [here](http://gedenkt.at/blog/scientific-pandoc/)  
  - The only thing you need is to download and copy all python files into a folder which you then refer to in the make file
  - For our example the files are already in the `pandoc` subfolder in this repo so you can skip this step
  - If you want to define new environments, you can do so in `macros.sty` - it includes the header too
4. To convert the `.md` file into `.pdf`, go to the console and run
```
make example.pdf
```
in the console. Alternatively if you have multiple files you can also run  
```
make all
```

And voila you can use macros and amsmath environments like you're used to. For members of the group: Feel free to complete this readme.

## For beamer

I'm still working on lua filters to make beamer presentations fast. Will upload samples once I have actually made some lecture notes.

## For websites

Relevant files are all in `html` folder.
This readme can be converted to html using the makefile in that subfolder.  

# Pandoc syntax tricks