# config-files
You will find a set of config to make a portable dev setup
# (/} < FAKA
install nvim using snap
```
snap install nvim --classic
```

install dependencies
python 3 & 7
ruby
nodejs

create a folder in .config directory
```
cd ./config
mkdir nvim
cd nvim
```

git clone "this repository"
and move at here the init.nvim file

next you will need install Vim plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

For the last once you enter in nvim you need type the next command
```
PlugInstall
```
