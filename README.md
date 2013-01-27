mac_facts
======
##Overview
This a collection of Facts specific to managing OS X clients with Puppet.

###mac_current_user
This fact displays the current user logged into the console.
###mac_encryption_enabled
Returns true if FileVault 2 is enabled (only compatible with Mac OS X 10.8 and higher).
###mac_has_wireless
Returns true if the Mac has a WiFi interface.
###mac_laptop
If the machine is a laptop, it will return mac_laptop otherwise it will be a mac_desktop (until we get iPads running full OS X...)
###mac_memory_in_gb
Returns a simple value of the amount of memory the Mac has in GB - useful for doing greater or less than searches in the Inventory Service.
###mac_timezone
Returns the current timezone in a format that systemsetup can use.