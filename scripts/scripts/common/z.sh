mkdir -p $HOME/local/bin

z_path=$HOME/local/bin

git clone https://github.com/rupa/z.git $z_path

echo ". $z_path/z.sh" >> $HOME/.zshrc

