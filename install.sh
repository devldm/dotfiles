#!/bin/bash

log_file=~/install_progress_log.txt
sudo apt-get -y install zsh

if type -p zsh >/dev/null; then
  echo "zsh Installed" >>$log_file
else
  echo "zsh failed to install" >>$log_file
fi

# Install fast node manager
cd ~/
curl -fsSL https://fnm.vercel.app/install | bash
echo "fnm installed" >>$log_file

# Install Starship
curl -sS https://starship.rs/install.sh | sh
echo "starship installed" >>$log_file

# Install exa
sudo apt -y install exa
echo "Exa installed" >>$log_file

# Insall zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo "zoxide installed" >>$log_file

# Install TMUX
sudo apt-get -y install tmux
echo "tmux installed" >>$log_file

# Install TPM
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
echo "tpm installed" >>$log_file

# Install JetBrainsMono nerdfont
font_url='https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip'
font_name=${font_url##*/}
wget ${font_url} && unzip ${font_name} -d ~/.fonts && fc-cache -fv
echo "JetBrainsMono installed" >>$log_file

# Install Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
echo "Lazygit installed" >>$log_file

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim

echo -e "\n====== Summary ======\n"
cat $log_file
echo
rm $log_file
