#!/usr/bin/env bash

# install EPEL repo
# wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# rpm -ivh epel-release-6-8.noarch.rpm

# Install ESL repo
# wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
# rpm -Uvh erlang-solutions-1.0-1.noarch.rpm

sudo yum update

sudo yum -y install git readline-devel libyaml-devel libffi-devel unixODBC-devel ncurses-devel curl openssl-devel libxslt-devel libtool

# Install asdf
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
(cd $HOME/.asdf; git checkout v0.4.0)
echo -e '\n. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> $HOME/.bashrc # Make asdf available in this script
set +u
source "$HOME/.asdf/asdf.sh"
set -u

# Install all the necessary asdf plugins
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add rebar https://github.com/Stratus3D/asdf-rebar.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
# Navigate to the directory containing the project (/vagrant is the dire # that is synced with the project dir on the host)
cd /vagrant
# Make the versions defined .tool-versions file the versions used by the # user in any directory
cp .tool-versions $HOME
# Install all correct versions of these packages for the project asdf install
echo "Completed setup of Erlang environment!"
