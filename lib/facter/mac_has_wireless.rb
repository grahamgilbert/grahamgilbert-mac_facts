Facter.add(:mac_has_wireless) do
  confine kernel: "Darwin"
  setcode do
    Facter::Util::Resolution.exec("/usr/sbin/networksetup -listallhardwareports").lines.any? { |line| line.include?("Wi-Fi") }
  end
end
