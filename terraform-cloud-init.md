# Cloud-init with terraform from a vm template
First we need to set the vapp enabled on the template and install the cloud-init package on the template:
```bash
sudo apt-get install cloud-init
```
We then add this configurations to the cloud-init config file:
```
#/etc/cloud/cloud.cfg

disable_vmware_customization: false
datasource:
  VMware:
    allow_raw_data: true
manage_etc_hosts: true

...

cloud_init_modules:
  ...
  - fs_setup
```
We make a terraform template files for the cloud-init configuration to pass it to the vm's:
```
# metadata

#cloud-config
local-hostname: ${hostname}
instance-id: ${hostname}
network:
  version: 2
  ethernets:
    ens192:
      addresses:
        - ${address}/${netmask}
      gateway4: ${gateway}
      nameservers:
%{ for ns in nameservers ~}
        - ${ns}
%{ endfor ~}

# userdata

#cloud-config
disk_setup:
  /dev/sdb:
    table_type: gpt
    layout:
      - [100, 83]
    overwrite: false
fs_setup:
  - label: data
    device: /dev/sdb1
    filesystem: ext4
    overwrite: false
mounts:
  - [/dev/sdb1, /data, ext4, 'defaults,discard,nofail', '0', '2']
```
And we use those templates in the terraform module like below:
```
# main.tf

resource "vsphere_virtual_machine" "vm" {

...

  extra_config = {
    "guestinfo.metadata" = base64encode(templatefile("templates/metadata.yaml.tftpl", {
      hostname    = each.key,
      username    = var.vm_username
      nameservers = var.net_nameservers,
      address     = each.value.address,
      gateway     = var.net_gateway,
      netmask     = var.net_netmask
    }))
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata" = base64encode(file("templates/userdata.yaml"))
    "guestinfo.userdata.encoding" = "base64"
  }
}
```
and then apply the terraform module.



