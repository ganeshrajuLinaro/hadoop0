# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
	fi

# User specific environment and startup programs

export JAVA_HOME=/usr/lib/jvm/java-1.7.0
export PATH=~/nutch-0.8-dev/bin:$PATH:$HOME/.local/bin:$HOME/bin