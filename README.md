# Packer ubuntu template 
this code, creates a vm ubuntu and deploys using kvm, kvm is equal to virtaul box, but only works on linux os,
you can deploy using virtual box as well but you need to change some things,

# How to run 
clone this repo

## Requirements : to run this code you need packer installed
you can find the installation tutorial in this link [packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)
and you are good to go :) 
With packer installed, to build the template e deploy the vm you need to do some command using packer
ˋˋˋ
packer init .
ˋˋˋ

ˋˋˋ
packer build ukvmhteste.pkr.hcl
ˋˋˋ
*this process may take a while*

## Code explain 
the block "source" basicly is a machine configuration such as memory etc.
the boot_command is when the vm starts and we need to configure the installation, this command beggins the process of auto installation.
The http_directory    = "http-server" points to a folder, in this folder there is 2 files, meta-data is empety on porpuse, in the user-data is where the maggic happens,
in that file we can install anything we want like nginx etc.

the build block bascily tell packer we are using kvm as a "cloud". If you want to use another "cloud" or virtual box, some lines of code is crucial, like the http_directory,
ssh_username, ssh_password, boot_command, iso_url, iso_checksum, vm_name, memory etc
