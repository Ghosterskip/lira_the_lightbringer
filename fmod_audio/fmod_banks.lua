local M = {}

local banks = {}

-- Register all your FMOD banks here.
-- Set preload_samples = true for banks with rapid SFX (footsteps, UI, combat)
-- to prevent micro-stutters on the first play. Leave false for music/streams.
local BANKS = {
	master = {
		resource = "/assets/banks/Master.bank",
		path = "bank:/Master",
		preload_samples = false,
	},
	strings = {
		resource = "/assets/banks/Master.strings.bank",
		path = "bank:/Master.strings",
		preload_samples = false,
	},
	sfx = {
		resource = "/assets/banks/SFX.bank",
		path = "bank:/SFX",
		preload_samples = false,
	},
	ui = {
		resource = "/assets/banks/UI.bank",
		path = "bank:/UI",
		preload_samples = false,
	},
	music = {
		resource = "/assets/banks/Music.bank",
		path = "bank:/Music",
		preload_samples = false,
	}
}

local function load_bank(id)
	if banks[id] then
		return banks[id]
	end

	local bank_cfg = BANKS[id]
	if not bank_cfg then
		error("Unknown FMOD bank: " .. tostring(id))
	end

	local ok_existing, existing = pcall(function()
		return fmod.studio.system:get_bank(bank_cfg.path)
	end)

	local bank_handle
	if ok_existing and existing then
		bank_handle = existing
	else
		local ok, result = pcall(function()
			return fmod.studio.system:load_bank_memory(
				resource.load(bank_cfg.resource),
				fmod.STUDIO_LOAD_BANK_NORMAL
			)
		end)

		if not ok then
			error(result)
		end
		bank_handle = result
	end

	if bank_cfg.preload_samples then
		bank_handle:load_sample_data()
	end

	banks[id] = bank_handle
	return bank_handle
end

local function unload_bank(id)
	local bank_cfg = BANKS[id]
	if not bank_cfg then
		return
	end

	local bank_handle = banks[id]
	if not bank_handle then
		local ok, existing = pcall(function()
			return fmod.studio.system:get_bank(bank_cfg.path)
		end)
		if ok then
			bank_handle = existing
		end
	end

	if bank_handle then
		if bank_cfg.preload_samples then
			bank_handle:unload_sample_data()
		end
		bank_handle:unload()
	end

	banks[id] = nil
end


function M.load(ids)
	for i = 1, #ids do
		load_bank(ids[i])
	end
end


function M.unload(ids)
	for i = 1, #ids do
		unload_bank(ids[i])
	end
end

return M
