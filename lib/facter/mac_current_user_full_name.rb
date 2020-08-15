# mac_current_user_full_name.rb
Facter.add(:mac_current_user_full_name) do
  # Limit this fact to macOS only
  confine :kernel => "Darwin"
  setcode do
    # Assign external 'mac_current_user' fact to current_user
    current_user = Facter.value(:mac_current_user)
    # Creating shell command and passing in current_user
    shell_command = "/usr/bin/id -F #{current_user}"
    # Execute shell command
    Facter::Core::Execution.execute(shell_command)
  end
end
