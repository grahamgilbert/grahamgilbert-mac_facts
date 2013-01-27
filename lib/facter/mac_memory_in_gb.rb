#mmac_emory_in_gb.rb
Facter.add(:mac_memory_in_gb) do
  confine :kernel => "Darwin"
  setcode do
    string = Facter::Util::Resolution.exec("/usr/sbin/sysctl hw.memsize")
    
    thestring = string[12..string.length]
    
    new_Val = Float(thestring)
    
    new_Val / 1024 / 1024 / 1024
    

  end
end