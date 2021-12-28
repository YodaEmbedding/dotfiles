$out_dir = "out";
$pdf_mode = 1;
$recorder = 1;

$pdflatex_opts = "--shell-escape --halt-on-error";
$pdflatex = "pdflatex $pdflatex_opts %O %S";
