# mac_admin_users.rb

Facter.add(:mac_admin_users) do
  confine kernel: 'Darwin'
  setcode do
    require 'puppet/util/plist'
    output = Facter::Util::Resolution.exec('/usr/bin/dscl -plist . -read /Groups/admin GroupMembership')
    data = Puppet::Util::Plist.parse_plist(output)
    data['dsAttrTypeStandard:GroupMembership']
  end
end
