require("luci.sys")

m = Map("jmusupplicant", translate("jmuSupplicant LOG"), translate("Log file:/tmp/mentohust.log"))

s = m:section(TypedSection, "jmusupplicant", "")
s.addremove = false
s.anonymous = true

view_cfg = s:option(TextValue, "1", nil)
    view_cfg.rows = 25
    view_cfg.readonly = true
  
    function view_cfg.cfgvalue()  
        return nixio.fs.readfile("/tmp/jmusupplicant.log") or ""  
    end  

return m
