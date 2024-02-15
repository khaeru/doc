# Compile PDF
$pdf_mode = 1;

$silent = 1;

# For local use, silent=1 isn't sufficient to quiet console output; explicitly
# give -interaction=batchmode

$lualatex = "lualatex -file-line-error -shell-escape -interaction=batchmode %O %S";
$pdflatex = "pdflatex -file-line-error -shell-escape -interaction=batchmode %O %S";
$xelatex = "xelatex -file-line-error -shell-escape -interaction=batchmode %O %S";

# On an upgrade of 'biber', the .bcf file format changes, causing compilation
# to fail unless existing files in the tree are deleted or overwritten. Force
# overwrite:
# $force_mode = 1;

# Custom rules for glossaries
add_cus_dep('glo', 'gls', 0, 'makegls');
add_cus_dep('acn', 'acr', 0, 'makeacr');

sub makegls {
  my ($base) = $_[0];
  # Use the latexmk internal function. The command ends up being called with
  # two -s options, but gglo.ist comes last and is used.
  Run_subst($makeindex, 1, "-s $base.ist", "$base.glo", "$base.gls");
}

sub makeacr {
  my ($base) = $_[0];
  Run_subst($makeindex, 1, "-s $base.ist", "$base.acn", "$base.acr");
}

push @generated_exts, 'glo', 'gls', 'glg', 'acn', 'acr';
$clean_ext .= ' %R.ist';

# For 'beamer', 'biblatex', 'fixme'
push @generated_exts,
  'nav', 'snm',
  'bbl', 'run.xml',
  'lox';
