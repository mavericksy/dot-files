#!/usr/bin/env bash

# A fresh install.

ehcho(){
    echo;echo "$1";echo
}

_do_install(){
    SUDO="${1}"
    CMD="${2}"

    if [[ "${SUDO}" -eq "sudo" ]];then
        eval "echo ${PASS} |" "sudo -S ${CMD}"
    else
        eval "${CMD}"
    fi
}

do_apt_get_install(){
    echo "Checking ${1}"
    PROG="${1:-}"
    CHK="${2:-}"
    which "${CHK:-${PROG}}" 2>&1 > /dev/null
    if [[ "${?}" -eq 0 ]];then
        ehcho "${PROG} Installed. Skipping."
        return
    elif [[ "${?}" -eq 1 ]];then
        ehcho "Installing ${PROG}..."
        echo "${PASS}" | _do_install sudo "apt-get install ${1} -y"
        return
    fi

}

do_pip_install(){
    PROG="$1"
    CHK="${2:-null}"
    echo "Checking ${PROG}"
    which "${CHK:-${PROG}}" 2>&1 > /dev/null
    if [[ "${?}" -eq 0 ]];then
        ehcho "${PROG} Installed. Skipping."
        return
    elif [[ "${?}" -eq 1 ]];then
        ehcho "Installing ${PROG}..."
        echo "${PASS}" | _do_install "pip install ${PROG} -y"
        return
    fi
}

echo "[sudo] ${USER} password please:"
stty -echo
read PASS
stty echo

do_apt_get_install build-essential
do_apt_get_install libtool
do_apt_get_install cmake
do_apt_get_install automake
do_apt_get_install autoconf
do_apt_get_install iotop
do_apt_get_install htop
do_apt_get_install nmap
do_apt_get_install exuberant-ctags

do_apt_get_install zsh
do_apt_get_install git
do_apt_get_install nvim
do_apt_get_install tmux
do_apt_get_install php
do_apt_get_install python2.7
do_apt_get_install python3.6
do_apt_get_install python-pip
do_apt_get_install python-venv
do_apt_get_install python3-pip
do_apt_get_install python3-venv
do_apt_get_install graphviz

if [[  $(composer -v;echo "${?}") -gt 0 ]];then
    EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_SIGNATURE="$(php -r "echo hash_file('SHA384', 'composer-setup.php');")"
    if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
    then
        ehcho 'ERROR: Invalid installer signature'
        rm composer-setup.php
    else
        ehcho "Installing Composer..."
        mkdir -p /home/"${USER}"/.local/bin
        php composer-setup.php --quiet --install-dir=/home/"${USER}"/.local/bin filename=composer
        RESULT=$?
        php -r "unlink('composer-setup.php');"
    fi
fi

ehcho "Checking Oh My ZSH..."
if [[ -d "/home/${USER}/.oh-my-zsh" ]];then
    ehcho "Oh My ZSH Good To Go..."
else
    ehcho "Installing Oh My ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ ! -d "/home/${USER}/Projects" ]];then
    ehcho "Creating Projects Folder"
    mkdir ~/Projects
    cd ~/Projects
fi

if [[ ! -d "/home/${USER}/Projects/dot-files" ]];then
    ehcho "Installing Dot Files"
    git clone git@160.119.250.21:/srv/git/dot-files
    ln -s -T /home/"${USER}"/Projects/dot-files/nvim/init.vim /home/"${USER}"/.config/nvim/init.vim
    ln -s -T /home/"${USER}"/Projects/dot-files/zshrc /home/"${USER}"/.zshrc
    ln -s -T /home/"${USER}"/Projects/dot-files/tmux.conf /home/"${USER}"/.tmux.conf

fi
