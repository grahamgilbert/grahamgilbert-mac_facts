#mac_laptop.rb
Facter.add(:mac_laptop) do
  confine :kernel => "Darwin"
  setcode do
    #Facter::Util::Resolution.exec("/bin/date")
    
    if Facter.value('sp_machine_name').include?("Book")
      "mac_laptop"
    else
      "mac_desktop"
    end
  end
end