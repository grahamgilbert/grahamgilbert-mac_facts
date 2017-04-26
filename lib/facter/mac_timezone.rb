# mac_timezone.rb
Facter.add(:mac_timezone) do
  confine kernel: 'Darwin'
  setcode do
    Time.now.getlocal.zone
  end
end
