#mac_battery_charging.rb
Facter.add(:mac_battery_charging) do
  confine :kernel => "Darwin"
  confine :mac_laptop => true
  setcode do
    output = Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery' | /usr/bin/grep -w 'IsCharging' | /usr/bin/awk '{print $3}'")
    if output == 'Yes'
    	true
    else
    	false
    end
  end
end