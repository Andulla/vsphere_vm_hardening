# Class: vsphere_vm_hardening
# ===========================
#
# Puppet VMware vSphere Hardening Module to manage advanced parameters of your virtual machines.
#
# Authors
# -------
#
# Author Name <andreas@puppet.com>
#
# Copyright
# ---------
#
# Copyright 2016 Andreas Wilke.
#

class vsphere_vm_hardening (
  $virtualmachines   = ['/datacenter/vm/folder/subfolder/vm1.puppet.com', '/datacenter/vm/folder/subfolder2/vm2.puppet.com'],
  $hardening_config  = { 'isolation.tools.copy.disable' => 'true' , 'isolation.tools.paste.disable' => 'true' },
  ){
  validate_hash($hardening_config)
  $virtualmachines.each |String $vm| {
    vsphere_vm { "${vm}":
      extra_config => $hardening_config,
    }
  }
}
