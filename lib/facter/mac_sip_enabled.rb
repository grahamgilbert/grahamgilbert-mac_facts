#!/usr/bin/env ruby

#mac_sip_enabled.rb
require 'facter'
Facter.add(:mac_sip_enabled) do
  confine :kernel => "Darwin"
  setcode do
      osver = Facter.value('macosx_productversion_major')
      if osver == "10.11"
        output = Facter::Util::Resolution.exec("/usr/bin/csrutil status")
        enabled = output.split(" ")[4]
        enabled.chomp('.')
      else
        "Not supported"
    end
end
end
