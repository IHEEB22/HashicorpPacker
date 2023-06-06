source "virtualbox-iso" "basic-example" {
  guest_os_type    = "Ubuntu_64"
  iso_url          = "http://releases.ubuntu.com/12.04/ubuntu-12.04.5-server-amd64.iso"
  iso_checksum     = "md5:769474248a3897f4865817446f9a4a53"
  ssh_username     = "packer"
  ssh_password     = "packer"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  http_directory= "http"
  http_port_max= 9001
  http_port_min= 9001
  boot_command = [
        "<esc><esc><enter><wait>",
        "/install/vmlinuz noapic ",
        "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu_64_preseed.cfg",
        "debian-installer=en_US auto locale=en_US kbd-chooser/method=us ",
        "fb=false debconf/frontend=noninteractive ",
        "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA ",
        "keyboard-configuration/variant=USA console-setup/ask_detect=false ",
        "initrd=/install/initrd.gz -- <enter>"
  ]

      vboxmanage=[["modifyvm", "{{.Name}}", "--vram", "32"]]
}

build {
  sources = ["sources.virtualbox-iso.basic-example"]
}
