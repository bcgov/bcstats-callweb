local status = kong.response.get_status()
if status == 401 then
    kong.response.exit(307, "", { ["Content-Length"] = 0, ["Content-Type"] = "text/plain", ["Location"] = "/" } )
end
