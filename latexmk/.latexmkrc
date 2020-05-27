$out_dir = "out";
$pdf_mode = 1;
$recorder = 1;

$pdflatex_opts = "--shell-escape --halt-on-error";
$post = "cp $out_dir/%R.pdf $out_dir/%R_preview.pdf";

$pdflatex = "pdflatex $pdflatex_opts %O %S; $post";
