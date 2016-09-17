require 'spec_helper'
describe 'vsphere_vm_hardening' do
  context 'with default values for all parameters' do
    it { should contain_class('vsphere_vm_hardening') }
  end
end
