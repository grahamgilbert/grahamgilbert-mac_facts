# mac_battery_cycles.rb
Facter.add(:mac_battery_cycles) do
  confine kernel: 'Darwin', mac_laptop: true
  setcode do
    output = Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery'")
    if output || output.length == 0
      0
    else
      output.lines.select { |line| line =~ /"CycleCount"/ }[0].split(' ')[2].to_i
    end
  end
end
