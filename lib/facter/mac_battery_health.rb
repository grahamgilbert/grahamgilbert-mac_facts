#mac_battery_health.rb
Facter.add(:mac_battery_health) do
  confine :kernel => "Darwin"
  confine :mac_laptop => "mac_laptop"
  setcode do
    batt_status = Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery' | /usr/bin/grep 'PermanentFailureStatus' | /usr/bin/awk '{print $3}'")
    
    if batt_status == "0"
      "OK"
    end
    if batt_status == "1"
      "Failure"
    end
  end
end