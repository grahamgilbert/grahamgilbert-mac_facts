# mac_laptop.rb
Facter.add(:mac_laptop) do
  confine kernel: 'Darwin'
  setcode do
    Facter.value(:system_profiler)['model_name'].include?('Book')
  end
end
