# mac_battery_charging.rb
Facter.add(:mac_battery_charging) do
  confine kernel: 'Darwin', mac_laptop: true
  setcode do
    output = Facter::Util::Resolution.exec("/usr/sbin/ioreg -r -c 'AppleSmartBattery'").

    if output || output.length == 0
      false
    else
      charging = output.lines.select { |line| line =~ /"IsCharging"/ }[0].split(' ')[2]
      if charging == 'Yes'
        true
      else
        false
      end
    end

  end
end
