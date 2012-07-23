# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

path_munge() {
    for arg in $*
    do
        if [ -d $arg ]
        then
            PATH=$PATH:$arg
        fi
    done
}

OL=/opt/local
OLB=$OL/bin
OLS=$OL/sbin

path_munge $HOME/bin $OLB $OLS

export PATH path_munge

mesg n
