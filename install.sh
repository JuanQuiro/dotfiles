#!/usr/bin/env bash

echo "Hello dragon By Juan Quiroz"

# Load nix shell env
source $HOME/.nix-profile/etc/profile.d/nix.sh

(
    # Install packages/tools with nix
    nix-env -iA nixpkgs.gh \
            nixpkgs.google-cloud-sdk \
            nixpkgs.fzf \
            nixpkgs.bat \
            nixpkgs.deno \
            nixpkgs.fd > /tmp/plog 2>&1
    
    # non-interactive login into gh CLI
    # echo "$MY_TOKEN" | gh auth login --with-token --> METHOD ALTERNATIVE
    # echo $DOCKER_TOKEN_DOTFILES | docker login --with-token

) & disown

(
    # Install packages with apt
    sudo apt update
    sudo apt install -yq tmux exa
    pnpm i -g vercel
    pnpm i -g npm-check-updates

    # Auth Vercel
    echo vercel --token $VERCEL_TOKEN_DOTFILES
) > /tmp/plog 2>&1 & disown

# Restore docker login
# mkdir -p $HOME/.docker
# echo "$DOCKER_ENCODED_CONFIG" | base64 -d > $HOME/.docker/config.json # ???

# Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# No need for the below command as the `home_files/.zshrc` already has the line.
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Symlink dotfiles
current_dir="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
dotfiles_source="${current_dir}/home_files"

while read -r file; do

    relative_file_path="${file#"${dotfiles_source}"/}"
    target_file="${HOME}/${relative_file_path}"
    target_dir="${target_file%/*}"

    if test ! -d "${target_dir}"; then
        mkdir -p "${target_dir}"
    fi

    printf 'Installing dotfiles symlink %s\n' "${target_file}"
    ln -sf "${file}" "${target_file}"

done < <(find "${dotfiles_source}" -type f)

# Load bash environment in zsh
# Taken from https://github.com/axonasif/bashenv.zsh
echo "set +m; source <(bash -lic 'declare -px'); set -m" >> "$HOME/.zshrc"
echo "HAPPY CODING"
