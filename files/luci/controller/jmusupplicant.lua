module("luci.controller.jmusupplicant", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/jmusupplicant") then
        return
    end
    if luci.sys.call("command -v jmusupplicant >/dev/null") ~= 0 then
        return
    end
    entry({"admin", "services", "jmusupplicant"},
        alias("admin", "services", "jmusupplicant", "general"),
        _("jmuSupplicant"), 10).dependent = true

    entry({"admin", "services", "jmusupplicant", "general"}, cbi("jmusupplicant/general"), _("jmuSupplicant Settings"), 10).leaf = true
    -- entry({"admin", "services", "jmusupplicant", "log"}, cbi("jmusupplicant/log"), _("jmuSupplicant LOG"), 20).leaf = true
end
