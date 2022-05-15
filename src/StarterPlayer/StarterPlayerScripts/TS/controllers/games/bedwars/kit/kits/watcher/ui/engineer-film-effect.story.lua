
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CreateRoduxApp__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__EngineerFilmEffect__2 = v1.import(script, script.Parent, "engineer-film-effect").EngineerFilmEffect;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local u4 = l__CreateRoduxApp__1("EngineerFilmEffect", l__EngineerFilmEffect__2, {
		transparency = 0.9
	}, {}, {
		Parent = p1
	});
	return function()
		return u3.unmount(u4);
	end;
end;

