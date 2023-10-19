$out_dir = "out";
$pdf_mode = 1;  # 1 == generate pdf via pdflatex; equivalent to latexmk -pdf
$recorder = 1;  #  .fls file containing list of files that are R/W.  # Already true by default?

$pdflatex_opts = "--shell-escape --halt-on-error";
# $pdflatex_opts = "--shell-escape --halt-on-error --verbose --file-line-error --synctex=1 --interaction=nonstopmode";
$pdflatex = "pdflatex $pdflatex_opts %O %S";
