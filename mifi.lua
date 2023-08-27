#!/bin/env lua

local status_ok, M = pcall(require, "dhcp")
if not status_ok then
    return
end

local station = 'Verizon-MiFi8800L-43B4'

M.check(M.connect(station), station)
M.restart_dhcpcd()
