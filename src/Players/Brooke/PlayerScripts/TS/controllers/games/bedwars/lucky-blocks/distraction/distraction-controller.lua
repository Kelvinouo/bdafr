-- Script Hash: d55cb2600b43af05614f4ef5b0772a6b93900a5106e4325da9dc9e8bed6dcd94cfcc74dc96b8c95139b0ba951110492a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__Controller__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DistractionController";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)

end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DistractionWrapper__5 = v1.import(script, script.Parent, "distraction").DistractionWrapper;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v4.onStart(p2)
	l__default__1.Client:Get("Distraction"):Connect(function(p3)
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
l__Reflect__2.defineMetadata(v4, "identifier", "client/controllers/games/bedwars/lucky-blocks/distraction/distraction-controller@DistractionController");
l__Reflect__2.defineMetadata(v4, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v4, "$:flamework@Controller", l__Controller__3, { {} });
return {
	default = v4
};
