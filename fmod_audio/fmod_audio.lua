local M = {}

local event_descriptions = {}


function M.get_description(event_path)
	local desc = event_descriptions[event_path]
	if not desc then
		desc = fmod.studio.system:get_event(event_path)
		event_descriptions[event_path] = desc
	end
	return desc
end

--- Plays a fire-and-forget sound effect and marks it for automatic memory release
--- Optional params table: { ParameterName = value }
function M.play_one_shot(event_path, params)
	local desc = M.get_description(event_path)
	local instance = desc:create_instance()

	if params then
		for name, value in pairs(params) do
			instance:set_parameter_by_name(name, value, false)
		end
	end

	instance:start()
	instance:release() -- FMOD automatically destroys the instance once playback finishes
end


function M.play_loop(event_path, params)
	local desc = M.get_description(event_path)
	local instance = desc:create_instance()

	if params then
		for name, value in pairs(params) do
			instance:set_parameter_by_name(name, value, false)
		end
	end

	instance:start()
	return instance
end


function M.stop(instance, immediate)
	if not instance then
		return
	end
	local mode = immediate and fmod.STUDIO_STOP_IMMEDIATE or fmod.STUDIO_STOP_ALLOWFADEOUT
	instance:stop(mode)
	instance:release()
end


function M.set_global_parameter(name, value, ignore_seek_speed)
	fmod.studio.system:set_parameter_by_name(name, value, ignore_seek_speed or false)
end


function M.clear_cache()
	event_descriptions = {}
end

return M
