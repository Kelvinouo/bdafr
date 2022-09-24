-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BaseRelicController__2 = v1.import(script, script.Parent.Parent.Parent, "base-relic-controller").BaseRelicController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "EssenceOfNatureRelicController";
	end, 
	__index = l__BaseRelicController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__RelicType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
function v3.constructor(p1)
	l__BaseRelicController__2.constructor(p1, l__RelicType__1.ESSENCE_OF_NATURE);
	p1.Name = "EssenceOfNatureRelicController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v3.onActivated(p2)
	l__KnitClient__2.Controllers.PreloadController:runPreload({
		sounds = { l__GameSound__3.LIFE_STEAL_OVERHEAL }
	});
	l__default__4.Client:Get("RemoteName"):Connect(function()
		l__SoundManager__5:playSound(l__GameSound__3.LIFE_STEAL_OVERHEAL);
	end);
end;
function v3.deactivate(p3)

end;
local v5 = l__KnitClient__2.CreateController(v3.new());
return {
	EssenceOfNatureRelicController = v3
};
