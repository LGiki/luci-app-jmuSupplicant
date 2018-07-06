module("luci.controller.jmusupplicant", package.seeall)

function index()
    -- if not nixio.fs.access("/etc/config/jmusupplicant") then
    --     return
    -- end
    -- if luci.sys.call("command -v jmusupplicant >/dev/null") ~= 0 then
    --     return
    -- end
    entry({"admin", "services", "jmusupplicant"},
        alias("admin", "services", "jmusupplicant", "general"),
        _("jmusupplicant"), 10).dependent = true

    entry({"admin", "services", "jmusupplicant", "general"}, cbi("jmusupplicant/general"), _("jmusupplicant Settings"), 10).leaf = true
    entry({"admin", "services", "jmusupplicant", "log"}, cbi("jmusupplicant/log"), _("jmusupplicant LOG"), 20).leaf = true
end
