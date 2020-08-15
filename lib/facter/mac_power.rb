Facter.add(:mac_power) do
  confine kernel: "Darwin", mac_laptop: true
  setcode do
    require "puppet/util/plist"

    output = Facter::Util::Resolution.exec("/usr/sbin/system_profiler SPPowerDataType -xml")

    data = Puppet::Util::Plist.parse_plist(output)

    battery = {}
    os = system_profiler = Facter.value(:os)
    release = Int(os["release"]["major"])

    for item in data[0]["_items"]
      next unless item["_name"] == "spbattery_information"
      if release > 20
        battery["percent"] = (Float(item["sppower_battery_charge_info"]["sppower_battery_current_capacity"]) / Float(item["sppower_battery_charge_info"]["sppower_battery_max_capacity"]) * 100).round
      else
        battery["percent"] = Int(item["sppower_battery_charge_info"]["sppower_battery_state_of_charge"])
      end
      battery["cycles"] = item["sppower_battery_health_info"]["sppower_battery_cycle_count"]
      battery["healthy"] = (item["sppower_battery_health_info"]["sppower_battery_health"] == "Good")
      battery["charging"] = (item["sppower_battery_charge_info"]["sppower_battery_is_charging"] == "TRUE")
    end
  end

  power = { "battery" => battery }

  power
end
# end

# no breaking changes

Facter.add(:mac_battery_health) do
  confine kernel: "Darwin", mac_laptop: true
  setcode do
    Facter.value(:mac_power)["battery"]["healthy"]
  end
end

Facter.add(:mac_battery_cycles) do
  confine kernel: "Darwin", mac_laptop: true
  setcode do
    Facter.value(:mac_power)["battery"]["cycles"]
  end
end

Facter.add(:mac_battery_charging) do
  confine kernel: "Darwin", mac_laptop: true
  setcode do
    Facter.value(:mac_power)["battery"]["charging"]
  end
end

Facter.add(:mac_battery_charge_percent) do
  confine kernel: "Darwin", mac_laptop: true
  setcode do
    Facter.value(:mac_power)["battery"]["percent"]
  end
end
