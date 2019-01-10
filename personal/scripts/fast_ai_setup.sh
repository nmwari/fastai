#!/usr/bin/env bash
set -e

# TODO: Put ~/src/anaconda3/bin on path
export conda=/home/ubuntu/src/anaconda3/bin/conda
export activate=/home/ubuntu/src/anaconda3/bin/activate

$conda update -y conda
cd /home/ubuntu && git clone https://github.com/fastai/fastai.git
chown -R ubuntu /home/ubuntu/fastai
cd /home/ubuntu/fastai && $conda env create -f environment.yml && source $activate fastai
jupyter notebook --generate-config -y

# TODO: Use systemd to start jupyter notebook server
# cat >/etc/myconfig.conf <<EOL
# [Unit]
# Description=Jupyter Notebook

# [Service]
# Type=simple
# PIDFile=/run/jupyter.pid
# ExecStart=~/src/anaconda3/bin/jupyter notebook --config=~/.jupyter/jupyter_notebook_config.py --no-browser
# User=ubuntu
# Restart=always
# RestartSec=10
# #KillMode=mixed

# [Install]
# WantedBy=multi-user.target
# EOL
