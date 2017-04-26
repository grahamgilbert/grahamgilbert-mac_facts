# mac_java_vendor.rb

Facter.add(:mac_java_vendor) do
  confine kernel: 'Darwin'
  setcode do
    require 'puppet/util/plist'
    begin
    vendor = Puppet::Util::Plist.read_plist_file('/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Info.plist')['CFBundleIdentifier']
    if vendor == 'com.oracle.java.JavaAppletPlugin'
      'Oracle'
    elsif vendor == 'com.apple.java.JavaAppletPlugin'
      'Apple'
     end
  rescue Errno::ENOENT
    nil
  end
  end
end
