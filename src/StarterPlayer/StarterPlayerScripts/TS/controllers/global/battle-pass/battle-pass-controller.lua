-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BattlePassController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BattlePassController";
	p1.remotes = l__default__2.Client:GetNamespace("BattlePass");
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__4 = v2.Players;
function v4.KnitStart(p2)
	p2.remotes:WaitFor("GetBattlePass"):andThen(function(p3)
		l__ClientStore__3:dispatch({
			type = "BattlePassUpdateAll", 
			battlePass = p3:CallServer()
		});
	end);
	l__Players__4.LocalPlayer:GetAttributeChangedSignal("BattlePassXP"):Connect(function()
		l__ClientStore__3:dispatch({
			type = "BattlePassSetXP", 
			experience = l__Players__4.LocalPlayer:GetAttribute("BattlePassXP")
		});
	end);
	l__Players__4.LocalPlayer:GetAttributeChangedSignal("BattlePassPaid"):Connect(function()
		l__ClientStore__3:dispatch({
			type = "BattlePassSetPaid", 
			paid = l__Players__4.LocalPlayer:GetAttribute("BattlePassPaid")
		});
	end);
end;
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-dev-products").BattlePassLevelDevProducts;
local l__MarketplaceService__6 = v2.MarketplaceService;
function v4.promptPurchaseToLevel(p4, p5)
	local v6 = p5 - l__ClientStore__3:getState().BattlePass.level;
	if v6 > 0 and v6 - 1 < #u5 then
		l__MarketplaceService__6:PromptProductPurchase(l__Players__4.LocalPlayer, u5[v6 - 1 + 1]);
	end;
end;
local l__Gamepass__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
function v4.promptBattlePassPurchase(p6)
	if not l__ClientStore__3:getState().BattlePass.paid then
		l__MarketplaceService__6:PromptGamePassPurchase(l__Players__4.LocalPlayer, l__Gamepass__7.BATTLE_PASS_S4);
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
