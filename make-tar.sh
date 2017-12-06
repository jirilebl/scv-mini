#!/bin/sh
FILES=`git ls-files | grep -v '.gitignore'`
#FILES='scv-mini.tex diag10.pdf locallyredcurve.xp diag9.pdf license.pdf modulispace.eepic diag8.sk license.eps modulispace.xp gendiags.sh diag10.sk diag9.sk sketch2pdf.sh diag8.pdf locallyredcurve.eepic mathdots.sty'

rm -fR scv-mini
mkdir scv-mini
cp $FILES scv-mini

rm -f scv-mini.tar.gz
tar cvf scv-mini.tar scv-mini/
gzip -9 scv-mini.tar

rm -fR scv-mini
