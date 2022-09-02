-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "RankPurchaseController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "RankPurchaseController";
end;
local l__CollectionTagAdded__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CollectionTagAdded;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ProximityPromptService__5 = v2.ProximityPromptService;
local l__Players__6 = v2.Players;
local l__MarketplaceService__7 = v2.MarketplaceService;
local l__Gamepass__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local l__Lighting__9 = v2.Lighting;
local l__TweenService__10 = v2.TweenService;
function u1.KnitStart(p2)
	l__CollectionTagAdded__2("VIPRankPurchase", function(p3)
		local v6 = u3.new();
		local u11 = true;
		v6:GiveTask(function()
			u11 = false;
		end);
		local u12 = u4("ProximityPrompt", {
			ActionText = "VIP Rank", 
			ObjectText = "Click to Purchase", 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 20, 
			KeyboardKeyCode = Enum.KeyCode.F, 
			HoldDuration = 0, 
			Parent = p3
		});
		v6:GiveTask(l__ProximityPromptService__5.PromptTriggered:Connect(function(p4, p5)
			if p4 == u12 and p5 == l__Players__6.LocalPlayer then
				l__MarketplaceService__7:PromptGamePassPurchase(p5, l__Gamepass__8.VIP);
			end;
		end));
		p3.AncestryChanged:Connect(function(p6, p7)
			if p7 == nil then
				v6:DoCleaning();
			end;
		end);
		if not p3.PrimaryPart then
			p3:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local u13 = u4("CFrameValue", {
			Parent = l__Lighting__9, 
			Value = p3:GetPrimaryPartCFrame()
		});
		v6:GiveTask(function()
			u13:Destroy();
		end);
		u13.Changed:Connect(function(p8)
			p3:SetPrimaryPartCFrame(p8);
		end);
		while u11 do
			local v7 = l__TweenService__10:Create(u13, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
				Value = u13.Value * CFrame.Angles(0, 2.792526803190927, 0)
			});
			v7:Play();
			v7.Completed:Wait();		
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	RankPurchaseController = u1
};
