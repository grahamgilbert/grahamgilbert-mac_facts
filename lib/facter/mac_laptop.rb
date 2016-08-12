# mac_laptop.rb
Facter.add(:mac_laptop) do
  confine kernel: 'Darwin'
  setcode do
    Facter.value('sp_machine_name').include?('Book')
  end
end
