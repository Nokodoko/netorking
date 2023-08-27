#!/bin/env lua

local M = {}


M.restart_dhcpcd = function ()
   os.execute('sudo systemctl restart dhcpcd')
end

M.connect = function (station)
  local handle = os.execute('sudo iwctl station wlan0 connect ' .. station)
    if not handle then
        return 1
    else
        return 0
    end
end

M.check = function (status_code, network)
    if status_code == 0 then
       os.execute('notify-send -u normal "Connected to "' .. network)
    elseif status_code == 1 then
       os.execute('notify-send -u critical "Could not connect to"' .. network)
    end
end

return M
