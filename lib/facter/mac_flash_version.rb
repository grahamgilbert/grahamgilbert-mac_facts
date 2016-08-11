# mac_flash_version.rb

require 'puppet/util/plist'

Facter.add(:mac_flash_version) do
  confine :kernel => 'Darwin'
  setcode do
  	begin
    	Puppet::Util::Plist.read_plist_file('/Library/Internet Plug-Ins/Flash Player.plugin/Contents/Info.plist')['CFBundleVersion']
    rescue Errno::ENOENT
    	nil
    end
  end
end