# mac_encryption_enabled.rb

Facter.add(:mac_encryption_enabled) do
  confine kernel: 'Darwin'
  setcode do
    if Facter.value(:os)['release']['major'].to_i >= 12
      output = Facter::Util::Resolution.exec('/usr/bin/fdesetup status')
      enabled = output.split("\n").first
      if enabled == 'FileVault is On.'
        true
      else
        false
      end
    end
  end
end
