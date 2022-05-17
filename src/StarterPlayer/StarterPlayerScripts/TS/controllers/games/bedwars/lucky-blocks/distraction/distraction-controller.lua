
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DistractionController";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)

end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DistractionWrapper__5 = v1.import(script, script.Parent, "distraction").DistractionWrapper;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.onStart(p2)
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		l__SoundManager__2:playSound(l__GameSound__3.TV_STATIC);
		l__SoundManager__2:playSound(l__GameSound__3.TURRET_ON);
		local u7 = u4.mount(u4.createElement(l__DistractionWrapper__5), l__Players__6.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
		task.delay(p3.length, function()
			l__SoundManager__2:playSound(l__GameSound__3.TV_STATIC);
			l__SoundManager__2:playSound(l__GameSound__3.TURRET_OFF);
			u4.unmount(u7);
		end);
	end);
end;
l__Reflect__2.defineMetadata(v3, "identifier", "client/controllers/games/bedwars/lucky-blocks/distraction/distraction-controller@DistractionController");
l__Reflect__2.defineMetadata(v3, "flamework:isExternal", false);
l__Reflect__2.defineMetadata(v3, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.defineMetadata(v3, "flamework:decorators", { "$:flamework@Controller" });
l__Reflect__2.defineMetadata(v3, "flamework:decorators.$:flamework@Controller", {
	type = "Controller"
});
return {
	default = v3
};

