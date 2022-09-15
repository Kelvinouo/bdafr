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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "SocialConnectionsNPCController";
end;
local l__CollectionTagAdded__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__4 = v2.Players;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ColorUtil__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__CollectionService__8 = v2.CollectionService;
function v4.KnitStart(p2)
	l__CollectionTagAdded__1("VerifyNPC", function(p3)
		u2("ProximityPrompt", {
			ActionText = "Verify Account", 
			HoldDuration = 0, 
			KeyboardKeyCode = l__Theme__3.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Parent = p3
		}).Triggered:Connect(function(p4)
			if p4 == l__Players__4.LocalPlayer then
				l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.SOCIAL_CONNECTIONS, {});
			end;
		end);
		local l__PrimaryPart__6 = p3.PrimaryPart;
		l__PrimaryPart__6:SetAttribute("BillboardTitle", "<font color=\"" .. l__ColorUtil__7.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">Verify Account</font>");
		l__PrimaryPart__6:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3));
		l__PrimaryPart__6:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0));
		l__CollectionService__8:AddTag(l__PrimaryPart__6, "Billboard");
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
