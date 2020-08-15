# mac_sip_enabled.rb
require "facter"
Facter.add(:mac_sip_enabled) do
  confine kernel: "Darwin"
  setcode do
    if Facter.value(:os)["release"]["major"].to_i >= 15
      output = Facter::Util::Resolution.exec("/usr/bin/csrutil status")
      status = output.split(" ")[4].chomp(".")
      if status == "enabled"
        true
      else
        false
      end
    end
  end
end
