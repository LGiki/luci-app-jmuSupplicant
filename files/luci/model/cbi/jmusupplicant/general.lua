require("luci.sys")

m = Map("jmusupplicant", translate("jmuSupplicant"), translate("Configure jmuSupplicant 802.11x."))

s = m:section(TypedSection, "jmusupplicant", "")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))
name = s:option(Value, "username", translate("Username"),translate("The username given to you by your network administrator"))
pass = s:option(Value, "password", translate("Password"), translate("The password you set or given to you by your network administrator"))
pass.password = true

service = s:option(ListValue, "service", translate("Service"), translate("Internet Service Provider"))
service.default = 0
service.datatype = "uinteger"
service:value(0, translate("Campus Network"))
service:value(1, translate("China Unicom"))
service:value(2, translate("China Mobile"))
service:value(3, translate("China Telecom"))

ifname = s:option(ListValue, "ifname", translate("Interfaces"), translate("Physical interface of WAN"))
for k, v in ipairs(luci.sys.net.devices()) do
    if v ~= "lo" then
        ifname:value(v)
    end
end

ipaddr = s:option(Value, "ipaddr", translate("IP Address"), translate("Your IPv4 Address. (DHCP users can set to 0.0.0.0)"))
ipaddr.default = "0.0.0.0"

mask = s:option(Value, "mask", translate("NetMask"), translate("NetMask, it doesn't matter"))
mask.default = "0.0.0.0"

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/init.d/jmusupplicant restart")
end

return m
