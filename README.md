mac_facts
======

##Overview

This a collection of Facts specific to managing OS X clients with Puppet.

###mac_admin_users

A comma separated list of users in the admin group

###mac_battery_charge_percent

The current battery charge, in percent

###mac_battery_charging

Whether the battery is currently charging or not

###mac_battery_cycles

The number of cycles the battery has been through

###mac_battery_health

Whether the battery has failed or not

###mac_current_user

This fact displays the current user logged into the console.

###mac_encryption_enabled

Returns true if FileVault 2 is enabled (only compatible with Mac OS X 10.8 and higher).

###mac_flash_version

Returns the value of the version of Adobe Flash that's installed

###mac_java_vendor

Returns Oracle or Apple, depending on the vendor of the installed Java

###mac_java_version

Returns the version of Java

###mac_laptop

If the machine is a laptop, it will return mac_laptop otherwise it will be a mac_desktop (until we get iPads running full OS X...)

###mac_memory_in_gb

Returns a simple value of the amount of memory the Mac has in GB - useful for doing greater or less than searches in the Inventory Service.

###mac_timezone

Returns the current timezone in a format that systemsetup can use.
