#mac_timezone.rb
Facter.add(:mac_timezone) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/systemsetup -gettimezone")
    
    string[11..string.length]

  end
end