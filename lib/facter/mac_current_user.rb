# mac_current_user.rb
Facter.add(:mac_current_user) do
  confine kernel: 'Darwin'
  setcode do
    require 'etc'
    Etc.getpwuid(File.stat('/dev/console').uid).name
  end
end
