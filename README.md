# Vim Up & Running
VimUR is a way to simplify a configuration of your Vim.

## What does it do
VimUR will install Vim plugins using [vim-plug](https://github.com/junegunn/vim-plug) and set some sensible defaults in `.vimrc`. Simple as that. VimUR comes with a quite rich set of options so if you're looking for a minimalistic Vim configuration try something like [sensible.vim](https://github.com/tpope/vim-sensible) or use VimUR [customized](#customization).

## How does it work
VimUR doesn't use any external tools (except for `curl`) and is basically a `.vimrc` written in a way that during the first run of Vim everything is installed and configured automatically.

First, `vimur.list` file is downloaded. This file contains a list of URLs from which other configuration files (VimL sources) are downloaded, saved in `~/.vim/vimur/` directory and sourced. Filenames are prefixed with a number, so they are loaded in the correct order:
* 01 - plugins installation
* 10 to 29 - basic Vim configuration
* 30 to 50 - plugin specific configuration
* 50 and up - language specific configuration

This may look like an unnecessary complicated mechanism but it allows for simple [customization](#customization) and it doesn't degrade the simplicity of [usage](#usage).

## Usage
Easy!
```bash
curl -Lso ~/.vimrc https://raw.githubusercontent.com/Misenko/vimur/master/vimrc && vim
```

## Customization
I know (hope at least) that many of you would want to use VimUR but use a slightly different configuration or different set of plugins and so on. One possibility is to fork my repository, change whatever you want and use it from your fork. This may feel a bit like an overkill especially if you want to make only a small change and don't really follow and integrate my changes into your forked repository.

There is another way. Since first step of VimUR is to dowload a `vimur.list` file you just need to provide your own list file (somewhere on the web) which contains links to the VimL scripts which will be used. Nice thing about this is that you can modify `vimur.list` in a way that you will use some of my VimL scripts and some of yours without copying and maintaining the whole repository.

For example let's say that you just want to get rid of some plugins. You can create a repository on GitHub with modified `vimur.list` and call
```bash
curl -Ls https://raw.githubusercontent.com/Misenko/vimur/master/vimrc | sed "s/Misenko/UserName/g" > ~/.vimrc && vim
```

## Contributions
Creating this was only a fun project to kill some time so any contributions (especially improvements of my VimL since this is the first time I'm trying it) are welcome.

1. Fork it ( https://github.com/Misenko/vimur/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits
Many thanks goes to [Vim Bootstrap](https://github.com/avelino/vim-bootstrap) project from which I got the initial idea and copied almost all the Vim configuration and also to [tomsik68](https://github.com/tomsik68) from who I got the idea of dividing Vim configuration into multiple files.
