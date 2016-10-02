local module = {}  
m = nil
t = require("ds18b20")

-- Sends a simple ping to the broker
-- .. and the reading from every available sensor to a
-- different channel
local function send_ping()  
    m:publish(config.ENDPOINT .. "ping","id=" .. config.ID,0,0)
    addrs = t.addrs()
    if (addrs ~= nil) then
      print("Found "..table.getn(addrs).." sensors")
    else
      print("Found no sensors")
    end
    for idx,addr in pairs(addrs) do 
      temp = t.read(addr,t.C)
      if (temp ~= nil) then
        -- might be disconnected in the meanwhile
        m:publish("sensors/temp" .. idx, temp,0,0)
      end
    end
    tmr.start(6)
end

-- Sends my id to the broker for registration
local function register_myself()  
    m:subscribe(config.ENDPOINT .. config.ID,0,function(conn)
        print("Successfully subscribed to data endpoint")
    end)
end

local function mqtt_start()  
    m = mqtt.Client(config.ID, 120)
    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con) 
        register_myself()
        -- And then pings each 1000 milliseconds
        tmr.stop(6)
        tmr.alarm(6, 1000, tmr.ALARM_SEMI, send_ping)
    end) 

end

function module.start()  
  mqtt_start()
  D1 = 1
  t.setup(D1)
end

return module  
