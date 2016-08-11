# mac_admin_users.rb

Facter.add(:mac_admin_users) do
  confine kernel: 'Darwin'
  setcode do
    Facter::Util::Resolution.exec('/usr/bin/dscl . -read /Groups/admin GroupMembership').gsub('GroupMembership: ', '').split(' ')
  end
end
