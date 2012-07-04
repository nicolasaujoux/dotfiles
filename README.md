# My VIM, Git and .bashrc configurations using Homesick

Install with the following commands:

    gem install homesick
    homesick clone nicolasaujoux/dotfiles
    homesick symlink nicolasaujoux/dotfiles
    cd .homesick/nicolasaujoux/dotfiles
    git submodule update --init
    vim +BundleInstall +qall

To update the plugins, type in vim :

    :BundleInstall!

