-- file : config.lua
local module = {}

module.SSID = {}  
module.SSID["WifiName"] = "Password"

module.HOST = "192.168.2.1"  
module.PORT = 1883  
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"  
return module  
