#mac_battery_charge_percent.rb
Facter.add(:mac_battery_charge_percent) do
  confine :kernel => "Darwin"
  confine :mac_laptop => "mac_laptop"
  setcode do
    max_capacity = Facter::Util::Resolution.exec("ioreg -r -c 'AppleSmartBattery' | grep -w 'MaxCapacity' | awk '{print $3}'")
    
    current_capacity = Facter::Util::Resolution.exec("ioreg -r -c 'AppleSmartBattery' | grep -w 'CurrentCapacity' | awk '{print $3}'")
    
    max_capacity = Float(max_capacity)
    
    current_capacity = Float(current_capacity)
    
    charge = (current_capacity / max_capacity * 100)
    
    charge.round
  end
end