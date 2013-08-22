# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

path_push() {
  for arg in $*
  do
    if [ -d $arg ]
    then
      PATH=$arg:$PATH
    fi
  done
}

UL=/usr/local
ULB=$UL/bin
ULS=$UL/sbin

path_push $HOME/bin $ULB $ULS

export PATH path_push

# If we have a terminal allocated, disable messaging
if `tty -s`
then
  mesg n
fi
