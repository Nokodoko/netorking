#!/bin/env lua

local status_ok, M = pcall(require, "dhcp")
if not status_ok then
    return
end

local station = 'n0koSpeed'

M.check(M.connect(station), station)
M.restart_dhcpcd()
