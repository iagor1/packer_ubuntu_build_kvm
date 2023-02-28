source "qemu" "ubuntu-2004-amd64-qemu" {
  vm_name           = "ubuntu-2004-amd64-qemu-build"
    iso_url = "http://releases.ubuntu.com/focal/ubuntu-20.04.5-desktop-amd64.iso"
    iso_checksum = "sha256:2980570ea889f3467a04df15c8421ef1dc80ecef7bb37243da97f5714cf3f8ef"
  memory            = 2048
  disk_image        = false
  output_directory  = "output-ubuntu-2004-amd64-qemu"
  accelerator       = "kvm"
  disk_size         = "5000M"
  disk_interface    = "virtio"
  format            = "qcow2"
  net_device        = "virtio-net"
  boot_wait         = "3s"
  boot_command      = [
    # Make the language selector appear...
    " <up><wait>",
    # ...then get rid of it
    " <up><wait><esc><wait>",

    # Go to the other installation options menu and leave it
    "<f6><wait><esc><wait>",

    # Remove the kernel command-line that already exists
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",

    # Add kernel command-line and start install
    "/casper/vmlinuz ",
    "initrd=/casper/initrd ",
    "autoinstall ",
    "ds=nocloud-net;s=http://{{.HTTPIP}}:{{.HTTPPort}}/ubuntu-2004-amd64-qemu/ ",
    "<enter>"
    ]
  http_directory    = "http-server"
  shutdown_command  = "echo 'packer' | sudo -S shutdown -P now"
  ssh_username      = "ubuntu"
  ssh_password      = "ubuntu"
  ssh_timeout       = "60m"
}

build {
  sources = ["source.qemu.ubuntu-2004-amd64-qemu"]
}