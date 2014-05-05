machine_config
==============

Package to initialize and maintain new computers for running PRG
code

Linux Ubuntu 12.04 Setup
------------------------

Here is what you need to do to get a machine up to spec

- install ubuntu 12.04 
- create an user called prg
- install git (`sudo apt-get install git`)
- check this repository out (`cd ~; git clone https://github.com/personal-robots/machine_config.git`)
- go to `~/machine_config/ubuntu-12.04`
- run initialize (`sudo ./initialize.sh`)
- create an user for yourself
- login as that user
- run `rosdep update`
- enjoy

