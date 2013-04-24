# mac_java_vendor.rb
Facter.add(:mac_java_vendor) do
  confine :kernel => "Darwin"
  setcode do
    vendor = Facter::Util::Resolution.exec("/usr/bin/defaults read '/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Info' CFBundleIdentifier 2>/dev/null")
    
    if vendor == "com.oracle.java.JavaAppletPlugin"
      "Oracle"
    elsif vendor == "com.apple.java.JavaAppletPlugin"
      "Apple"
    end
  end
end