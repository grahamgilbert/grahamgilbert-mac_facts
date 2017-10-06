# is_imac.rb

Facter.add(:is_imac) do
  confine kernel: 'Darwin'
  setcode do

     system_profiler = Facter.value(:system_profiler)
     model = system_profiler['model_identifier']
     if model.include? 'iMac'
       true
     else
       false
     end
  end
end
