-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__BaseRelicController__3 = v1.import(script, script.Parent.Parent.Parent, "base-relic-controller").BaseRelicController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LooterRelicController";
	end, 
	__index = l__BaseRelicController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__RelicType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
function v4.constructor(p1)
	l__BaseRelicController__3.constructor(p1, l__RelicType__1.LOOTER);
	p1.Name = "LooterRelicController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__Workspace__6 = v2.Workspace;
local l__EffectUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.onActivated(p2)
	l__KnitClient__2.Controllers.PreloadController:runPreload({
		sounds = { "rbxassetid://8854460450" }
	});
	l__default__3.Client:Get("RemoteName"):Connect(function(p3)
		l__SoundManager__4:playSound("rbxassetid://8854460450");
		local v6 = l__ReplicatedStorage__5.Assets.Effects.Enchant.Plunder:Clone();
		v6.CFrame = p3.entityInstance:GetPrimaryPartCFrame();
		v6.Parent = l__Workspace__6;
		l__EffectUtil__7:playEffects({ v6 }, p3.entityInstance);
	end);
end;
function v4.deactivate(p4)

end;
local v7 = l__KnitClient__2.CreateController(v4.new());
return {
	LooterRelicController = v4
};
