#mac_encryption_enabled.rb
#require 'facter'
Facter.add(:mac_encryption_enabled) do
  confine :kernel => "Darwin"
  setcode do
      osver = Facter.value('macosx_productversion_major')
      case osver
      when "10.8"
        output = Facter::Util::Resolution.exec("/usr/bin/fdesetup status")
        enabled = output.split("\n").first
        if enabled=="FileVault is On."
          "true"
        else
          "false"
        end
      else
        "Not supported"
  end
end
end
