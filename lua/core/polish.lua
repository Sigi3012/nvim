local nvt_api = require("nvim-tree.api")
local nvt_Event = nvt_api.events.Event
nvt_api.events.subscribe(nvt_Event.TreeOpen, function()
	nvt_api.tree.expand_all()
end)
