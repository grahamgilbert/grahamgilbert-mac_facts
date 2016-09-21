Facter.add(:mac_power) do
  confine kernel: 'Darwin', mac_laptop: true
  setcode do
    require 'puppet/util/plist'

    output = Facter::Util::Resolution.exec('/usr/sbin/system_profiler SPPowerDataType -xml')

    data = Puppet::Util::Plist.parse_plist(output)

    battery = {}

    for item in data[0]['_items']
      next unless item['_name'] == 'spbattery_information'
      battery['percent'] = (Float(item['sppower_battery_charge_info']['sppower_battery_current_capacity']) / Float(item['sppower_battery_charge_info']['sppower_battery_max_capacity']) * 100).round
      battery['cycles'] = item['sppower_battery_health_info']['sppower_battery_cycle_count']
      battery['healthy'] = (item['sppower_battery_health_info']['sppower_battery_health'] == 'Good')
      battery['charging'] = (item['sppower_battery_charge_info']['sppower_battery_is_charging'] == 'TRUE')
    end

    power = { 'battery' => battery }

    power
  end
end
