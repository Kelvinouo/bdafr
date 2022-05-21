-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "RankPurchaseController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "RankPurchaseController";
end;
local l__CollectionTagAdded__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CollectionTagAdded;
local l__Maid__4 = v2.Maid;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ProximityPromptService__6 = v3.ProximityPromptService;
local l__Players__7 = v3.Players;
local l__MarketplaceService__8 = v3.MarketplaceService;
local l__Gamepass__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local l__Lighting__10 = v3.Lighting;
local l__TweenService__11 = v3.TweenService;
function u1.KnitStart(p2)
	l__CollectionTagAdded__3("VIPRankPurchase", function(p3)
		local v7 = l__Maid__4.new();
		local u12 = true;
		v7:GiveTask(function()
			u12 = false;
		end);
		local u13 = u5("ProximityPrompt", {
			ActionText = "VIP Rank", 
			ObjectText = "Click to Purchase", 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 20, 
			KeyboardKeyCode = Enum.KeyCode.F, 
			HoldDuration = 0, 
			Parent = p3
		});
		v7:GiveTask(l__ProximityPromptService__6.PromptTriggered:Connect(function(p4, p5)
			if p4 == u13 and p5 == l__Players__7.LocalPlayer then
				l__MarketplaceService__8:PromptGamePassPurchase(p5, l__Gamepass__9.VIP);
			end;
		end));
		p3.AncestryChanged:Connect(function(p6, p7)
			if p7 == nil then
				v7:DoCleaning();
			end;
		end);
		if not p3.PrimaryPart then
			p3:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local u14 = u5("CFrameValue", {
			Parent = l__Lighting__10, 
			Value = p3:GetPrimaryPartCFrame()
		});
		v7:GiveTask(function()
			u14:Destroy();
		end);
		u14.Changed:Connect(function(p8)
			p3:SetPrimaryPartCFrame(p8);
		end);
		while u12 do
			local v8 = l__TweenService__11:Create(u14, TweenInfo.new(1.7, Enum.EasingStyle.Linear), {
				Value = u14.Value * CFrame.Angles(0, math.rad(160), 0)
			});
			v8:Play();
			v8.Completed:Wait();		
		end;
	end);
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	RankPurchaseController = u2
};
return u1;
