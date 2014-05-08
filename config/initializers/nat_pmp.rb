require 'UPnP'

UPnP::UPnP.new.addPortMapping(80, 3000, "TCP", "Headbang")
