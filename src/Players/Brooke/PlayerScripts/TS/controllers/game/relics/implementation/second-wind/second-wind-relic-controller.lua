-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__BaseRelicController__3 = v1.import(script, script.Parent.Parent.Parent, "base-relic-controller").BaseRelicController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SecondWindRelicController";
	end, 
	__index = l__BaseRelicController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__RelicType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
local l__GameSound__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.constructor(p1)
	l__BaseRelicController__3.constructor(p1, l__RelicType__1.SECOND_WIND);
	p1.Name = "SecondWindRelicController";
	p1.secondWindSound = l__GameSound__2.STAR_CRUSH;
	l__default__3.Client:OnEvent("RemoteName", function(p2)
		p1:playEffect(p2.player, p2.entityInstance:GetPrimaryPartCFrame());
	end);
end;
function v4.onActivated(p3)

end;
local l__Players__4 = v2.Players;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__Workspace__7 = v2.Workspace;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.playEffect(p4, p5, p6)
	if p5 == l__Players__4.LocalPlayer then
		l__SoundManager__5:playSound(p4.secondWindSound);
	else
		l__SoundManager__5:playSound(p4.secondWindSound, {
			position = p6.Position
		});
	end;
	local v6 = l__ReplicatedStorage__6.Assets.Effects.ConsumeStarEffect:Clone();
	v6.CFrame = p6;
	v6.Parent = l__Workspace__7;
	l__EffectUtil__8:playEffects({ v6 }, nil, {
		destroyAfterSec = 1
	});
end;
function v4.deactivate(p7)

end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return {
	SecondWindRelicController = v4
};
