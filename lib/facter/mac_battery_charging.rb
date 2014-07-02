#mac_battery_charging.rb
Facter.add(:mac_battery_charging) do
  confine :kernel => "Darwin"
  confine :mac_laptop => "mac_laptop"
  setcode do
    Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery' | /usr/bin/grep -w 'IsCharging' | /usr/bin/awk '{print $3}'")
  end
end