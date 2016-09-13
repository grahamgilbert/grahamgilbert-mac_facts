# mac_battery_charge_percent.rb
Facter.add(:mac_battery_charge_percent) do
  confine kernel: 'Darwin', mac_laptop: true
  setcode do
    output = Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery'").lines
    if output || output.length == 0
      0
    else

      max_capacity = output.select { |line| line =~ /"MaxCapacity"/ }[0].split(' ')[2]

      current_capacity = output.select { |line| line =~ /"CurrentCapacity"/ }[0].split(' ')[2]

      max_capacity = Float(max_capacity)

      current_capacity = Float(current_capacity)

      charge = (current_capacity / max_capacity * 100)

      charge.round
    end
  end
end
