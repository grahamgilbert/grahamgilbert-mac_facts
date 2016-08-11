#mac_battery_health.rb
Facter.add(:mac_battery_health) do
  confine :kernel => 'Darwin'
  confine :mac_laptop => true
  setcode do
    batt_status = Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery'").lines.select { |line| line =~ /PermanentFailureStatus/ }[0].split(' ')[2]
    
    if batt_status == "0"
      true
    else
      false
    end
  end
end