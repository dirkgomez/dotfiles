function cheat() {
  curl cht.sh/$1
}

function compresspdf() {
  tmpfile=$(mktemp /tmp/compresspdf.XXXXXX)
  cp -p "$1" $tmpfile
  gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/printer -dCompatibilityLevel=1.4 -sOutputFile="$tmpfile" "$1"
  mv -f $tmpfile "$1"
}

function ConvertToIphone() {
  infile=$1
  extension="${infile##*.}"
  outfile="${infile%.*}.mp4"

  ffmpeg -i "$infile" -strict -2 -vcodec libx264 -profile:v main -level 3.1 -preset medium -crf 23 -x264-params ref=4 -acodec copy -movflags +faststart "$outfile" && rm "$infile"
}

export EDITOR=vim

# activate python venv
alias Venv='source ./venv/bin/activate'

# git stuff
alias gitpretty="git log --graph --oneline --decorate --all"
alias gitprettyall="git log --oneline --decorate --all --  graph --stat"
alias gfiles="git show --pretty='' --name-only $1"
alias gitstat="git log --stat"
alias gitchangelog="git log --oneline --no-merges ${1}..HEAD"
alias gittopcontrib="git shortlog -ns"
alias gitdiff="git difftool $1"

# homebrew clean update
alias brewupdate="brew update && brew upgrade && brew cleanup; brew doctor; brew cask upgrade"

export PATH="$PATH:/usr/local/sbin:$HOME/.gem/ruby/2.6.0/bin"

