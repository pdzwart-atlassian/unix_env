# vi mode
set -o vi

# Load in secrets
SECRETS=~/.bash_secrets
if [ -f $SECRETS ]
then
  source $SECRETS
fi

BASETITLE="\[\e]0;\u@\H `uname -m -r -s`\007\]"
SCREEN_TITLE='\[\ek\h\e\\\]'
ST=''

case $TERM in
  *rxvt*)
    TITLEBAR=$BASETITLE
    ;;
  xterm*)
    TITLEBAR=$BASETITLE
    ;;
  screen*)
    TITLEBAR=$BASETITLE
    ST=$SCREEN_TITLE
    ;;
  *)
    TITLEBAR=''
    ;;
esac

# If running interactively, then:
if [ "$PS1" ]; then
  C_RESET='\[\e[0m\]'
  C_BLACK='\[\e[30m\]'
  C_RED='\[\e[31m\]'
  C_GREEN='\[\e[32m\]'
  C_YELLOW='\[\e[33m\]'
  C_BLUE='\[\e[34m\]'
  C_PURPLE='\[\e[35m\]'
  C_CYAN='\[\e[36m\]'
  C_LIGHT_GRAY='\[\e[37m\]'
  # These appear to be bold version of the normal colours
  C_DARK_GRAY='\[\e[90m\]'
  C_LIGHT_RED='\[\e[91m\]'
  C_LIGHT_GREEN='\[\e[92m\]'
  C_LIGHT_YELLOW='\[\e[93m\]'
  C_LIGHT_BLUE='\[\e[94m\]'
  C_LIGHT_MAGENTA='\[\e[95m\]'
  C_LIGHT_CYAN='\[\e[96m\]'

  PS1="${ST}${TITLEBAR}${C_GREEN}\u${C_RESET}@${C_YELLOW}\h${C_RESET}:${C_CYAN}\w${C_RESET}[${C_LIGHT_GRAY}\D{%Y-%m-%d %T %z}${C_RESET}](${C_RED}\j${C_RESET},${C_PURPLE}\$?${C_RESET})${C_YELLOW}\$${C_RESET} "

  alias ls='ls -F'
fi

export EDITOR=vi
export EMAIL=dezwart@gmail.com
export LESS="--LONG-PROMPT"
#export MAVEN_OPTS="-XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+DisableExplicitGC -XX:+UseParallelOldGC"
export GIT_PAGER=""
export GOPATH="$HOME/Documents/Workspace/Go"
export GOBIN="$GOPATH/bin"
export PATH+=":$GOBIN"
export QUOTING_STYLE=literal
export GPG_TTY=$(tty)

# Set up /opt specifics
if [ -d /opt ]
then
    if [ -d /opt/lib ]
    then
        export LD_LIBRARY_PATH="/opt/lib"
    fi

    if [ -d /opt/bin ]
    then
        export PATH+=":/opt/bin"
    fi
fi

git_recapitate () {
  local branch=`git_get_default_branch`

  git checkout -b recapitate && git checkout $branch && git merge recapitate && git push && git branch -d recapitate
}

d () {
  local raw=$((($RANDOM % $1) + 1))
  local modifier=${2:-0}
  local modified=$(($raw + $modifier))

  echo -e "$modified ($raw, $modifier)"
}

cvs_up () {
  cvs update
}

svn_up () {
  svn upgrade
  svn update
}

git_get_default_branch () {
  git symbolic-ref refs/remotes/origin/HEAD | sed -e 's,^refs/remotes/origin/,,'
}

git_up () {
  git stash && git checkout `git_get_default_branch` && git pull --all && git submodule init && git submodule update
}

hg_up () {
  hg pull && hg update
}

# Source Update
supdate () {
  local src_home="$HOME/Documents/Source"

  if [ -z "$YE_OLDE_DIR" ]
  then
    export YE_OLDE_DIR=$PWD
  fi

  if [ ${#DIRSTACK[*]} -eq 1 ]
  then
    for thing in $src_home/*/*/*
    do
      if [ ! -d "$thing" ]
      then
        echo "$thing is not a directory, skipping."
      else
        pushd -n $thing > /dev/null
      fi
    done
  fi

  while [ ${#DIRSTACK[*]} -gt 1 ]
  do
    if [ ! -z "${DIRSTACK[1]##$src_home*}" ]
    then
      echo "Next dir: ${DIRSTACK[1]} not under $src_home. Meat to fix."
      return
    fi

    if [ ! -e "${DIRSTACK[1]}" ]
    then
      echo "Next dir: ${DIRSTACK[1]} no longer exists. Skipping."
      popd +1 -n > /dev/null
      continue
    fi

    popd > /dev/null
    echo -e "\nUPDATING $PWD\n"

    # Could extract the vcs type from the path but CBFd
    case $PWD in
      */git/*)
        git_up
        ;;
      */hg/*)
        hg_up
        ;;
      */svn/*)
        svn_up
        ;;
      *)
        echo "Unknown VCS. Meat to fix."
        return
    esac

    if [ $? -ne 0 ]
    then
      # Have to push the dir back on the stack for continuation
      pushd -n $PWD > /dev/null
      echo "Error updating $PWD: Escalating to meatspace."
      return
    fi
  done

  cd "$YE_OLDE_DIR"
  unset YE_OLDE_DIR
}

gv2png () {
  local gv=$1
  shift
  local png=$1
  shift

  dot -Tpng -o$png $gv
}

gv2open () {
  local filename=$1
  shift

  local png=`echo $filename | cut -d \. -f 1-1`.png

  gv2png $filename $png

  open $png
}

nuke_docker_from_orbit () {
  echo -e "It's the only way to be sure...\n"

  # Docker lacks a cascading delete, and occasionally throws a SEGV
  let max=10
  let count=0

  clean=1

  while [ $count -lt $max ]
  do
    unset i
    unset j
    let count++

    echo "Forcibly removed docker containers:"
    for i in `docker ps -aq`
    do
      docker rm -vf $i
    done

    echo "Forcibly removed docker images:"
    for j in `docker images -qa`
    do
      docker rmi -f $j
    done

    if [ -z "$i" -a -z "$j" ]
    then
      clean=0
      break
    fi
  done

  if [ $clean ]
  then
    echo "Light is green, trap is clean."
    true
  else
    echo "Docker still dirty, escalated to meat space."
    false
  fi
}

# Source local environment specific script
LOCAL_ENV=~/.bash_local
if [ -f $LOCAL_ENV ]
then
  source $LOCAL_ENV
fi
