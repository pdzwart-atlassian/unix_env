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

OL=/opt/local
OLB=$OL/bin
OLS=$OL/sbin

path_push $HOME/bin $OLB $OLS

export PATH path_push

mesg n
