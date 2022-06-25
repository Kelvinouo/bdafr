-- Script Hash: 8d987af96df2400da654a6e42f210a79f536dfb3ddff734ec1cb98700d0a5bc18956eb5e0c8adcbd980b17c2b1a42f17
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SocialConnectionsNPCController";
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
	p1.Name = "SocialConnectionsNPCController";
end;
local l__CollectionTagAdded__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__5 = v2.Players;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ColorUtil__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__CollectionService__9 = v2.CollectionService;
function v4.KnitStart(p2)
	l__CollectionTagAdded__2("VerifyNPC", function(p3)
		u3("ProximityPrompt", {
			ActionText = "Verify Account", 
			HoldDuration = 0, 
			KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Parent = p3
		}).Triggered:Connect(function(p4)
			if p4 == l__Players__5.LocalPlayer then
				l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__7.SOCIAL_CONNECTIONS, {});
			end;
		end);
		local l__PrimaryPart__6 = p3.PrimaryPart;
		l__PrimaryPart__6:SetAttribute("BillboardTitle", "<font color=\"" .. l__ColorUtil__8.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">Verify Account</font>");
		l__PrimaryPart__6:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3));
		l__PrimaryPart__6:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0));
		l__CollectionService__9:AddTag(l__PrimaryPart__6, "Billboard");
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
