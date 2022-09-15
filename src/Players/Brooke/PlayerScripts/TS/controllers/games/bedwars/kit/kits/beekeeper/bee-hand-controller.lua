-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BeeHandController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	l__HandKnitController__3.constructor(p1, ...);
	p1.Name = "BeeHandController";
	p1.maid = u2.new();
end;
function u1.KnitStart(p2)
	l__HandKnitController__3.KnitStart(p2);
end;
local l__CollectionService__3 = v2.CollectionService;
local l__Players__4 = v2.Players;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.toggleAllBeehivePrompts(p3, p4)
	local v6, v7, v8 = ipairs(l__CollectionService__3:GetTagged("beehive"));
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		if v7:GetAttribute("PlacedByUserId") == l__Players__4.LocalPlayer.UserId then
			local v9 = v7:FindFirstChildOfClass("ProximityPrompt");
			if v9 then
				v9.Enabled = p4;
				p3.maid:GiveTask(v9.TriggerEnded:Connect(function(p5)
					if p5 == l__Players__4.LocalPlayer then
						l__GameAnimationUtil__5.playAnimation(p5, l__AnimationType__6.PUNCH);
					end;
				end));
			end;
		end;	
	end;
end;
function u1.onEnable(p6, p7)
	p6:toggleAllBeehivePrompts(true);
end;
function u1.onDisable(p8)
	p8.maid:DoCleaning();
	p8:toggleAllBeehivePrompts(false);
end;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p9, p10)
	return p10.itemType == l__ItemType__7.BEE;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
