-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BaseRelicController__2 = v1.import(script, script.Parent.Parent.Parent, "base-relic-controller").BaseRelicController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GlitchedEnchantingRelicController";
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
	l__BaseRelicController__2.constructor(p1, l__RelicType__1.GLITCHED_ENCHANTING);
	p1.Name = "GlitchedEnchantingRelicController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCollectionTag__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__ReplicatedStorage__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
local l__EffectUtil__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v3.onActivated(p2)
	l__KnitClient__2.Controllers.PreloadController:runPreload({
		sounds = { l__GameSound__3.GLITCH_ETABLE_IMPLOSION, l__GameSound__3.GLITCH_ETABLE_ORB_CONSUME, l__GameSound__3.GLITCH_ETABLE_REPAIR_HAMMER_1, l__GameSound__3.GLITCH_ETABLE_REPAIR_HAMMER_2, l__GameSound__3.GLITCH_ETABLE_REPAIR_HAMMER_3, l__GameSound__3.GLITCH_ETABLE_REPAIR_HAMMER_4, l__GameSound__3.GLITCHED_LUCKY_BLOCK_DAMAGE }
	});
	l__WatchCollectionTag__4("enchant-table", function(p3)
		if table.find(p2.teamIds, (p3:GetAttribute("Team"))) ~= nil then
			local v5 = l__ReplicatedStorage__5.Assets.Effects.GlitchedLuckyBlockEffect:Clone();
			v5.Name = "GlitchParticles";
			v5.Parent = p3;
			v5.Transparency = 1;
			v5.CFrame = CFrame.new(p3.Position);
			l__EffectUtil__6:playEffects({ v5 }, nil, {
				destroyAfterSec = 1.5, 
				sizeMultiplier = 1.3, 
				particleMultiplier = 1.3
			});
		end;
	end);
end;
function v3.deactivate(p4)

end;
local v6 = l__KnitClient__2.CreateController(v3.new());
return {
	GlitchedEnchantingRelicController = v3
};
