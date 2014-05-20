#mac_admin_users.rb
#require 'facter'
Facter.add(:mac_admin_users) do
  confine :kernel => "Darwin"
  setcode do
      admins = Facter::Util::Resolution.exec("dscl . -read /Groups/admin GroupMembership")

      admins.gsub('GroupMembership: ','').gsub(' ', ', ')
  end
end
