local defork = require("defork.defork")

local M = {}

M.in_active_dialogue = false

-- Useful to implement avatar swapping in the future
M.dialogue_avatar_map = {}

M.dialogue_map = {
	{
		id = "trapped_inside_the_cave",
		start_passage = "A",
		consumed = false,
		dialogue_resource = defork.load("/assets/dialogue/trapped_inside_the_cave.json")
	}
}

M.retrieve_dialogue = function (dialogue_id)
	for i = 1, #M.dialogue_map do
		if M.dialogue_map[i].id == dialogue_id then
			return M.dialogue_map[i]
		end
	end
end

return M
