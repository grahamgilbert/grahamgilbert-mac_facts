#mac_battery_cycles.rb
Facter.add(:mac_battery_cycles) do
  confine :kernel => 'Darwin'
  confine :mac_laptop => true
  setcode do
    Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery'").lines.select { |line| line =~ /"CycleCount"/ }[0].split(' ')[2].to_i
  end
end