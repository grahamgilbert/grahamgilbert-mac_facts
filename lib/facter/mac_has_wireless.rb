#has_admins.rb
#require 'facter'
Facter.add(:mac_has_wireless) do
  confine :kernel => "Darwin"
  setcode do
      the_interface = Facter::Util::Resolution.exec("networksetup -listallhardwareports | grep -E '(Wi-Fi|AirPort)' -A 1 | grep -o en.")
      

    if the_interface==""
        "false"
    else
        "true"
    end
  end
end
