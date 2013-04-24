# mac_flash_version.rb
Facter.add(:mac_flash_version) do
  confine :kernel => "Darwin"
  setcode do
    Facter::Util::Resolution.exec("/usr/bin/defaults read '/Library/Internet\ Plug-Ins/Flash Player.plugin/Contents/Info' CFBundleVersion 2>/dev/null")
  end
end