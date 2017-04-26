# mac_admin_users.rb

Facter.add(:mac_admin_users) do
  confine kernel: 'Darwin'
  setcode do
    require 'etc'
    Etc.getgrgid(80).mem
  end
end
