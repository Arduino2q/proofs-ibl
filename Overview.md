# Introduction #

This is a textbook for a Proofs course that is appropriate for
US sophmores.

The approach is Inquiry Based, sometimes called the Moore Method
or the Discovery Method, in which students
directly grapple with the mathematics.
The text is a sequence of about 180 exercises
with a few definitions and remarks.
Most exercises ask for proofs
although a few ask for examples or counterexamples.
The class works through the
material together, talking through what they are learning, sometimes
stumbling around in the dark,
and sometimes triumphantly emerging with an answer.

In addition to being a lot of fun, for these students this is the best way to
develop mathematical maturity.

The material is basic for later classes:
elementary number theory through the Fundamental Theorem
of Arithmetic, sets through De Morgan's Laws, functions through inverse
functions, and relations through the connection between equivalence
relations and partitions.

This repository contains the book's source but
you can get an already made .pdf from the book's home page so you don't have to muck with my LaTeX.
That home page
also has beamer slides that I cover in the first couple of weeks that point out some aspects of basic logic for mathematics, mostly having to do with the definition of implication.


# License #

This material is Free, including the LaTeX source.
See the home page address below for details but
basically you can use it in any way that you like.


# LaTeX #

The book is in standard LaTeX.
Under Linux or Mac, from the directory with the files, compile it with
this command.
```
make_ibl.sh
```
If you are using Windows then you can try running Asymptote on the files in the
asy directory
```
cd asy
asy -fpdf *.asy
cd ..
```
and then running `pdflatex ibl` twice followed by `pdflatex answers` twice, but I am not sure what will happen because I am not a Windows person.

Make the in-class slides with this.
```
cd slides
pdflatex logic
```

## Options ##

You can print the book in a form compact enough (seven sheets) to copy and distribute to students on the first day of class.
See the home page or the first few lines of the source.

In the number theory chapter you can compile the book to do
either Bezout's Lemma or to do an alternative approach from Euclid that is more
natural but less slick.
See the boolean in the preamble of ibl.tex .

The book comes in a long version, a medium version, and a short version.
The canonical version is the long one, and the others come from omitting
questions.
The long version suits my class, four credits for fifteen weeks of four questions
per class, three times a week.
The shorter versions give an instructor with, say, a three credit class, some
guidance on what can go.
See the home page for pre-compiled versions.


# Home page #

The book has a
[home page](http://joshua.smcvt.edu/proofs).
There you can get more information and already-made .pdf copies.

I appreciate bug reports, from students or instructors.
I typically save them and do them in
a batch but I welcome them any time.
The home page has my contact information.