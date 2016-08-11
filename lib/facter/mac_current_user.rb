# mac_current_user.rb
Facter.add(:mac_current_user) do
  confine kernel: 'Darwin'
  setcode do
    Facter::Util::Resolution.exec('/bin/ls -l /dev/console').split(' ')[2]
  end
end
