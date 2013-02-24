#mac_battery_cycles.rb
Facter.add(:mac_battery_cycles) do
  confine :kernel => "Darwin"
  setcode do
    Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery' | grep -w 'CycleCount' | awk '{print $3}'")
  end
end