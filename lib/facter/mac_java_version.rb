# mac_java_version.rb
Facter.add(:mac_java_version) do
  confine :kernel => "Darwin"
  setcode do
    Facter::Util::Resolution.exec("/usr/bin/defaults read '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Info' CFBundleVersion 2>/dev/null")
  end
end