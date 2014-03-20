#!/bin/bash 
# make_ibl.sh
# Linux command file to LaTeX the proofs book and answer files
#  2014-Mar-13 Jim Hefferon

usage()
{
cat << EOF
usage: $0 options

Generate ibl.pdf and answers.pdf (and associated files).  If you 
just got the source material then run this command without any options.

OPTIONS:
   -h      Show this message
   -0      Generate minimim length book (used to speed development)
   -1      Generate medium length book (used to speed development)
   -2      Generate maximal length book (used to speed development)
   -r      Regenerating; don't run asymptote (used to speed development)
   -v      Verbose
If no digit is chosen then all three lengths are generated.
EOF
}


REGENERATING=0
LENGTH=3
VERBOSE=
while getopts “hr012v?” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         0)
             LENGTH=0
             ;;
         1)
             LENGTH=1
             ;;
         2)
             LENGTH=2
             ;;
         r)
             REGENERATING=1
             ;;
         v)
             VERBOSE=1
             ;;
         ?)
             usage
             exit
             ;;
     esac
done


generate_maxlength () {
  rm -r ibl.pdf
  pdflatex "\def\defaultbooklength{2}\input{ibl}"
  pdflatex "\def\defaultbooklength{2}\input{ibl}"
  cp ibl.pdf output/ibl-maxlength.pdf
  pdflatex answers
  pdflatex answers
  cp answers.pdf output/answers-maxlength.pdf
  pdflatex otherproblems
  pdflatex otherproblems
  cp otherproblems.pdf output/otherproblems-maxlength.pdf
  pdflatex "\def\compactflag{}\def\defaultbooklength{2}\input{ibl}"
  pdflatex "\def\compactflag{}\def\defaultbooklength{2}\input{ibl}"
  cp ibl.pdf output/ibl-compact-maxlength.pdf
}

generate_midlength () {
  rm -r ibl.pdf
  pdflatex "\def\defaultbooklength{1}\input{ibl}"
  pdflatex "\def\defaultbooklength{1}\input{ibl}"
  cp ibl.pdf output/ibl-midlength.pdf
  pdflatex answers
  pdflatex answers
  cp answers.pdf output/answers-midlength.pdf
  pdflatex otherproblems
  pdflatex otherproblems
  cp otherproblems.pdf output/otherproblems-midlength.pdf
  pdflatex "\def\compactflag{}\def\defaultbooklength{1}\input{ibl}"
  pdflatex "\def\compactflag{}\def\defaultbooklength{1}\input{ibl}"
  cp ibl.pdf output/ibl-compact-midlength.pdf
}

generate_minlength () {
  rm -r ibl.pdf
  pdflatex "\def\defaultbooklength{0}\input{ibl}"
  pdflatex "\def\defaultbooklength{0}\input{ibl}"
  cp ibl.pdf output/ibl-minlength.pdf
  pdflatex answers
  pdflatex answers
  cp answers.pdf output/answers-minlength.pdf
  pdflatex otherproblems
  pdflatex otherproblems
  cp otherproblems.pdf output/otherproblems-minlength.pdf
  pdflatex "\def\compactflag{}\def\defaultbooklength{2}\input{ibl}"
  pdflatex "\def\compactflag{}\def\defaultbooklength{2}\input{ibl}"
  cp ibl.pdf output/ibl-compact-minlength.pdf
}


# Generate the figures if fresh start
if [[ "$REGENERATING" -eq 0 ]]
then
  # ------- graphics ------------ 
  # asy files
  cd asy
  asy -fpdf bean_fcn.asy
  asy -fpdf bean_fcn_comp.asy
  asy -fpdf bean_fcn_elets.asy
  asy -fpdf bean_partition.asy
  asy -fpdf bean_set.asy
  asy -fpdf venn_comp.asy
  asy -fpdf venn_comp_comp.asy
  asy -fpdf venn_diff.asy
  asy -fpdf venn_int.asy
  asy -fpdf venn_int_emptyset.asy
  asy -fpdf venn_self.asy
  asy -fpdf venn_symdiff.asy
  asy -fpdf venn_three.asy
  asy -fpdf venn_two.asy
  asy -fpdf venn_union.asy
  asy -fpdf venn_union_emptyset.asy
  cd ..
fi

# Generate the book, answer, and otheranswers
if [[ "$LENGTH" -eq 0 ]]
then
  generate_maxlength
  rm -f ibl.pdf
  ln -s output/ibl-maxlength.pdf ibl.pdf
  rm -f answers.pdf
  ln -s output/answers-maxlength.pdf answers.pdf
  rm -f otherproblems.pdf
  ln -s output/otherproblems-maxlength.pdf otherproblems.pdf
fi
if [[ "$LENGTH" -eq 1 ]]
then
  generate_midlength
  rm -f ibl.pdf
  ln -s output/ibl-midlength.pdf ibl.pdf
  rm -f answers.pdf
  ln -s output/answers-midlength.pdf answers.pdf
  rm -f otherproblems.pdf
  ln -s output/otherproblems-midlength.pdf otherproblems.pdf
fi
if [[ "$LENGTH" -eq 2 ]]
then
  generate_minlength
  rm -f ibl.pdf
  ln -s output/ibl-minlength.pdf ibl.pdf
  rm -f answers.pdf
  ln -s output/answers-minlength.pdf answers.pdf
  rm -f otherproblems.pdf
  ln -s output/otherproblems-minlength.pdf otherproblems.pdf
fi
if [[ "$LENGTH" -eq 3 ]]
then
  generate_maxlength
  generate_midlength
  generate_minlength
  rm -f ibl.pdf
  ln -s output/ibl-maxlength.pdf ibl.pdf
  rm -f answers.pdf
  ln -s output/answers-maxlength.pdf answers.pdf
  rm -f otherproblems.pdf
  ln -s output/otherproblems-maxlength.pdf otherproblems.pdf
fi
