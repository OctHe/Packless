#!/bin/bash
#
# Effective applications for graphicless. This is a bash script, 
# it does not compatible with zsh or other shells

# bash is the default shell for most Linux distributions
# ash is the shell from busybox
# csh is the default shell for FreeBSD
# zsh is the default shell for part of the Linux distributions and macOS
# fish is a ready-out-of-box shell
gl_shell=(
    bash csh ash zsh fish \\n
    ipython ipython3 \\n
)

gl_pkg=(
    flatpak snap apt zypper pacman yay \\n
    pip pip3 \\n
    cargo \\n
)

# bc: A command-line calculator
gl_tool=(
    bc \\n
    zoxide eza htop \\n
    neofetch \\n
)

# screen and tmux need to set true color
gl_win=(
    terminator konsole \\n
    screen tmux \\n
)

gl_mail=(thunderbird kmail evolution mutt \\n)

# trans is a network tools that uses translate.google.com (and other online translators).
# It may require http_proxy and https_proxy
gl_net=(
    iw iwctl wpa_cli hostapd_cli nmcli \\n
    ip iptables \\n
    ssh scp sftp rsync \\n
    curl trans   \\n
)

gl_editor=(
    vim nvim emacs kakoune helix micro \\n
    kate gnome-text-editor \\n 
)

gl_searcher=(
    fd fzf \\n
    ack ag rg \\n
)

# Help manual, PDF viewver, file explorer, and web browser
gl_viewer=(
    man info cheat cppman \\n
    evince zathura okular \\n
    chromium firefox lynx nyxt vimb \\n
    nnn ranger vifm \\n
)

gl_analyzer=(ctags cscope cppcheck \\n)

# xmllint is in the libxml2-utils package, to install it in Debian
#   sudo apt install libxml2-utils
gl_formatter=(astyle xmllint \\n)

# rpmbuild is the buildtool in for rpm.
# As an example, download and build the source code with
#     sudo zypper source-install hostapd
#     cd /usr/src/packages
#     sudo rpmbuild -ba SPECS/hostapd.spec
# A simple discription about Tex:
#     Tex is a language, but is difficult to understand for human. LaTex is the macro language of Tex.
#     It also can be called a 'format' of Tex. LaTex is easier to use in practice.
#     pdftex and xetex are two compilers that can compile Tex to readable document, such as pdf.
#     xetex includes Unicode but pdftex does not.
#     pdflatex and xelatex are two compiles for latex. Since latex is more useful, in most of time, 
#     pdftex and xetex are the same as pdflatex and xelatex.
gl_build=(
    cmake xmake make rpmbuild bear ccache \\n
    gcc g++ clang python3 rust go octave\\n
    doxygen makeinfo pandoc pdflatex xelatex bibtex latexmk groff \\n
)

# ddd is the GUI of gdb
gl_debugger=(gdb ddd lldb \\n)

gl_langsrv=(
    clangd ccls \\n
    shellcheck \\n
    lua-language-server \\n
)

# osc: openSUSE Commander. The commandline tool for packaging openSUSE packages
gl_vcs=(svn git osc \\n)

# Graphicless desktop environment
function gl_desktop_env() {
  for arg in $@
  do
    echo ${arg}
    app_name=gl_${arg}[@]
    apps=${!app_name}

    for app in ${apps[@]}; do
        if [ ${app} = "\n" ]; then
            echo
            continue
        fi
        if which ${app} > /dev/null 2>&1; then
            echo -en "  [y] ${app}\t"
        else
            echo -en "  [ ] ${app}\t"
        fi
    done
  done
}

function gl_bash_env() {
    if [[ ! -f ~/.xmodmap-`uname -n` ]]; then
        echo "~/.xmodmap-`uname -n` is not find"
    fi

    echo "[bash-completion]"
    if [[ ! -f /usr/share/bash-completion/bash_completion ]]; then
        echo "  bash-completion is not installed"
        echo "  Please use packet manager to install it"
        echo "  In openSUSE, run: "
        echo "      sudo zypper install bash-completion"
    else
        echo "bash-completion is installed"
    fi

    if [[ `uname -a` =~ "arch" ]]; then
        echo "Arch Linux"
        echo "Download and config font to enable CJK："
        echo "    https://wiki.archlinuxcn.org/wiki/字体配置/中文"
    fi
}

gl_desktop_env shell pkg tool win mail net viewer
gl_desktop_env editor searcher formatter analyzer build debugger langsrv vcs

gl_bash_env