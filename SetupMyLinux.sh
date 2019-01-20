#! /usr/bin

sudo apt update
# vim-gnome support system clipboard
# ctags is used to support YCM and taglist in vim
sudo apt install -y make cmake vim-gnome zsh qemu ctags

# install python development tool
sudo apt install -y python-dev python3-dev python-pip python3-pip ipython

# This is the dir for my prjects
mkdir ~/Projects

# install clang and Bear because they are needed for YCM
sudo apt install -y clang
git clone https://github.com/rizsotto/Bear.git ~/Projects/bear

# Install Bear from source
# Bear is used for clang-based programs. https://github.com/rizsotto/Bear
mkdir ~/Projects/bear/build
cd ~/Projects/bear/build
cmake ..
make
sudo make install
sudo make package
cd      # come back to the home dir

# Download deepin-wine for TIM and Wechat
https://github.com/wszqkzqk/deepin-wine-ubuntu.git ~/Projects/DeepinWine

# Install deepin-wine
sudo ~/Projects/DeepinWine/install.sh

# Install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# copy the default config file for vim, the other plugin is not installed
cp ./vim_setup.vim ~/.vimrc

# install tex
sudo apt install -y texlive latexmk

# GNURadio dependences. These dependences are from the gnuradio site
# Xenial Xerus (16.04) https://wiki.gnuradio.org/index.php/UbuntuInstall#Bionic_Beaver_.2818.04.29
# sudo apt-get -y install git-core cmake g++ python-dev swig \
# pkg-config libfftw3-dev libboost-all-dev libcppunit-dev libgsl0-dev \
# libusb-dev libsdl1.2-dev python-wxgtk3.0 python-numpy \
# python-cheetah python-lxml doxygen libxi-dev python-sip \
# libqt4-opengl-dev libqwt-dev libfontconfig1-dev libxrender-dev \
# python-sip python-sip-dev python-qt4 python-sphinx libusb-1.0-0-dev \
# libcomedi-dev libzmq-dev

# install libnl for iw
sudo apt install libnl-3-dev libnl-genl-3-dev

# upgrate installed packages
sudo apt full-upgrade -y

sudo pip install --upgrade pip

# Finally, install oh-my-zsh and change the default shell to zsh
# This is must be the final process
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


