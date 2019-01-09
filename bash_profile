# Usage: compresspdf [input file]
compresspdf() {
  tmpfile=$(mktemp /tmp/compresspdf.XXXXXX)
  cp -p "$1" $tmpfile
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -sOutputFile="$tmpfile" "$1"
  mv -f $tmpfile "$1"
}

export PATH=$PATH:/Users/dirk/bin

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
