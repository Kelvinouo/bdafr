-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LobbyCustomMatchesController";
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
	p1.Name = "LobbyCustomMatchesController";
end;
local l__CollectionTagAdded__3 = v2.CollectionTagAdded;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__6 = v3.Players;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__9 = v1.import(script, script.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ColorUtil__10 = v2.ColorUtil;
local l__CollectionService__11 = v3.CollectionService;
u1.KnitStart = v1.async(function(p2)
	l__CollectionTagAdded__3("CustomMatchesNpc", function(p3)
		u4("ProximityPrompt", {
			ActionText = "Custom Matches", 
			HoldDuration = 0, 
			KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Parent = p3
		}).Triggered:Connect(function(p4)
			if p4 == l__Players__6.LocalPlayer then
				local v7 = {};
				local u12 = l__default__7.Client:GetNamespace("CustomMatches");
				v7.OnJoinMatch = v1.async(function(p5)
					if p5 == "" or not p5 then
						return nil;
					end;
					print("Join match response", (v1.await(v1.await(u12:WaitFor("JoinByCode")):CallServerAsync(p5))));
				end);
				function v7.OnCreateMatch(p6, p7)
					print("Create match response", (u12:WaitFor("CreateCustomMatch"):expect():CallServerAsync(p6, p7):expect()));
				end;
				function v7.OnClose()
					l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__9.CUSTOM_MATCHES);
				end;
				l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__9.CUSTOM_MATCHES, v7);
			end;
		end);
		local l__PrimaryPart__8 = p3.PrimaryPart;
		l__PrimaryPart__8:SetAttribute("BillboardTitle", "<font color=\"" .. l__ColorUtil__10.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">Custom Matches</font>");
		l__PrimaryPart__8:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3));
		l__PrimaryPart__8:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0));
		l__CollectionService__11:AddTag(l__PrimaryPart__8, "Billboard");
	end);
end);
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
