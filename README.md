# .dotfiles

My aliases repo.

## Installation

### Install with script

1. Clone the repository into `~/.dotfiles` folder:

    ```console
    cd ~ && git clone https://github.com/tdharris/.dotfiles.git .dotfiles
    ```

2. Enable aliases in the shell by adding to the `~/.zshrc` file:

    ```bash
    cd .dotfiles && ./install.sh
    ```

### Install manually

1. Clone the repository into `~/.dotfiles` folder:

    ```console
    cd ~ && git clone https://github.com/tdharris/.dotfiles.git .dotfiles
    ```

2. Enable aliases and zsh configs in the shell by modifying your `~/.zshrc` file:

    First, ensure that the plugins file is sourced **before** Oh My Zsh is loaded:

    ```bash
    # Which plugins would you like to load?
    source "$HOME/.dotfiles/zsh/plugins.zsh"
    
    source $ZSH/oh-my-zsh.sh
    ```

    Then, add the bootstrap script at the **end** of your `~/.zshrc` file to load aliases, keybindings, and history options:

    ```bash
    if [[ -f "$HOME/.dotfiles/bootstrap.sh" ]]; then
        source "$HOME/.dotfiles/bootstrap.sh"
    fi
    ```

3. Enable in the current shell session by running the following command:

    ```console
    source ~/.dotfiles/bootstrap.sh
    ```

4. Symlink the `.dotfiles/.tool-versions` to the `$HOME` folder:

    ```console
    source ~/.dotfiles/util/init.sh
    ```
