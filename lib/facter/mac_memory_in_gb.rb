# mac_memory_in_gb.rb

Facter.add(:mac_memory_in_gb) do
  confine kernel: 'Darwin'
  setcode do
    Facter.value(:memory)['system']['total_bytes'] / 1_073_741_824
  end
end
