-- Script Hash: 4c30f04fec1fa860a9b41b9bdf576e360764ff1644a3d5e1873c062288f943c1c8f3492d3f8f695b9abc82c52a6a9927
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "StoreController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StoreController";
end;
local l__MarketplaceService__2 = v2.MarketplaceService;
local l__Players__3 = v2.Players;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__MarketplaceService__2.PromptGamePassPurchaseFinished:Connect(function(p3, p4, p5)
		if p3 == l__Players__3.LocalPlayer and p5 then
			l__SoundManager__4:playSound(l__GameSound__5.BEDWARS_UPGRADE_SUCCESS);
		end;
	end);
	l__default__6.Client:OnEvent("RemoteName", function(p6)
		l__SoundManager__4:playSound(l__GameSound__5.BEDWARS_UPGRADE_SUCCESS);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
