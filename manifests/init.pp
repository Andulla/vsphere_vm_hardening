# Class: vsphere_vm_hardening
# ===========================
#
# Full description of class vsphere_vm_hardening here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'vsphere_vm_hardening':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#

class vsphere_vm_hardening {
  $virtualmachines   = ['vm1.puppet.com', 'vm2.puppet.com'],
  $hardening_config  = { 'isolation.tools.copy.disable' => true , 'isolation.tools.paste.disable' => true },
  $vmlocation        = '/datacenter/vm/folder/subfolder/',
  ){
  validate_hash($hardening_config)
  $allconfigs =  join(join_keys_to_values($hardening_config, "' => '"), "' , '")
  $finalconfig = "'${allconfigs}'"
  notice ($finalconfig)
  $virtualmachines.each |String $vm| {
    vsphere_vm { "${vmlocation}${vm}":
      extra_config => $finalconfig,
    }
  }
}
