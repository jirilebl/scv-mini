#!/bin/zsh
FBASE="$1"
echo sketch "$FBASE.sk" -o "${FBASE}.tikz"
if sketch "$FBASE.sk" -o "${FBASE}.tikz" ; then
	echo "SKETCH succesful"
else
	echo "SKETCH error"
	exit 1
fi

echo '\\documentclass{article}
\\usepackage[x11names,rgb]{xcolor}
\\usepackage{tikz}
\\usetikzlibrary{snakes}
\\usetikzlibrary{arrows}
\\usetikzlibrary{shapes}
\\usetikzlibrary{backgrounds}
\\usepackage[active,tightpage]{preview}
\\PreviewEnvironment{tikzpicture}
\\usepackage{amsmath}
\\begin{document}
\\pagestyle{empty}
\\noindent' > "${FBASE}.tex"
echo '\\'"input ${FBASE}.tikz" >> "${FBASE}.tex"
echo '\\end{document}' >> "${FBASE}.tex"

echo pdflatex "${FBASE}"
if pdflatex "${FBASE}" ; then
	echo "latex succesful"
else
	echo "latex error"
	exit 1
fi
