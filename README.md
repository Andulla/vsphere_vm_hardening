# vsphere_vm_hardening

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with vsphere_vm_hardening](#setup)
    * [What vsphere_vm_hardening affects](#what-vsphere_vm_hardening-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vsphere_vm_hardening](#beginning-with-vsphere_vm_hardening)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module helps you to enforce the configure of VMware vSphere VM specific hardening advanced configurations available inside the VMware vSphere Hardening Guide for vSphere 6.

https://www.vmware.com/security/hardening-guides.html.

## Setup

### What vsphere_vm_hardening affects

This module can be used to update any advanced parameter of your virtual machines, even if they are not mentioned inside the vSphere Hardening Guide. The following is a list of advanced parameters tested with this module:

* isolation.tools.copy.disable
* isolation.tools.dnd.disable
* isolation.tools.setGUIOptions.enable
* isolation.tools.paste.disable
* isolation.tools.diskShrink.disable
* isolation.tools.diskWiper.disable
* isolation.tools.hgfsServerSet.disable
* scsiX:Y.mode
* isolation.tools.ghi.autologon.disable
* isolation.bios.bbs.disable
* isolation.tools.getCreds.disable
* isolation.tools.ghi.launchmenu.change
* isolation.tools.memSchedFakeSampleStats.disable
* isolation.tools.ghi.protocolhandler.info.disable
* isolation.ghi.host.shellAction.disable
* isolation.tools.dispTopoRequest.disable
* isolation.tools.trashFolderState.disable
* isolation.tools.ghi.trayicon.disable
* isolation.tools.unity.disable
* isolation.tools.unityInterlockOperation.disable
* isolation.tools.unity.push.update.disable
* isolation.tools.unity.taskbar.disable
* isolation.tools.unityActive.disable
* isolation.tools.unity.windowContents.disable
* isolation.tools.vmxDnDVersionGet.disable
* isolation.tools.guestDnDVersionSet.disable
* isolation.tools.vixMessage.disable
* isolation.tools.autoInstall.disable
* floppyX.present
* parallelX.present
* serialX.present
* tools.setInfo.sizeLimit
* isolation.device.connectable.disable
* isolation.device.edit.disable
* tools.guestlib.enableHostInfo
* sched.mem.pshare.salt
* log.keepOld
* log.rotateSize
* RemoteDisplay.maxConnections
* RemoteDisplay.vnc.enabled

Please take a look at the current vSphere Hardening Guide to get the description of each configuration parameter

### Setup Requirements

The module requires the PuppetLabs vSphere module which is only available for Puppet Enterprise.

## Usage

At a minimum, you need to include the vsphere_vm_hardening class.

```puppet
class { 'vsphere_vm_hardening': }
```

#### Parameters
* `virtualmachines`: Array with name of the vSphere virtual machines that should be managed including the vmlocation.
* `hardening_config`: A hash of all the advanced hardening configurations that should be enforced to the advanced configurations.

_Example in Class_:

```puppet
  class {vsphere_vm_hardening:
    virtualmachines  => ["/mydatacenter/vm/myfolder/mysubfolder/myvm1", "/mydatacenter/vm/myfolder/mysubfolder2/myvm2"],
    hardening_config => { 'isolation.tools.copy.disable' => 'true' , 'isolation.tools.paste.disable' => 'true' },
  }
```
I recommend using Hiera to specify all the parameters necessary for the vsphere_vm_hardening class

_Example in Hiera_:

```yaml
vsphere_vm_hardening::virtualmachines:
 - /mydatacenter/vm/myfolder/mysubfolder/myvm1
 - /mydatacenter/vm/myfolder/mysubfolder/myvm2
vsphere_vm_hardening::hardening_config:
    isolation.tools.copy.disable: 'true'
    isolation.tools.paste.disable: 'true'
```

## Reference

The vsphere_vm_hardening module is using the vsphere_vm resource type from the puppetlabs vsphere module

## Limitations

This module was tested inside a vSphere 5.5 environment. As the API used to configure the advanced parameters didn't change with vSphere 6 it should also work.

## Development

Feel free to send me pull requests if you want to update/include something else.

## Release Notes/Contributors/Etc.

This is the first version of the module. Please use it with caution!
