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
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "LobbyCustomMatchesController";
end;
local l__CollectionTagAdded__2 = v2.CollectionTagAdded;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__5 = v3.Players;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__8 = v1.import(script, script.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ColorUtil__9 = v2.ColorUtil;
local l__CollectionService__10 = v3.CollectionService;
u1.KnitStart = v1.async(function(p2)
	l__CollectionTagAdded__2("CustomMatchesNpc", function(p3)
		u3("ProximityPrompt", {
			ActionText = "Custom Matches", 
			HoldDuration = 0, 
			KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Parent = p3
		}).Triggered:Connect(function(p4)
			if p4 == l__Players__5.LocalPlayer then
				local v7 = {};
				local u11 = l__default__6.Client:GetNamespace("CustomMatches");
				v7.OnJoinMatch = v1.async(function(p5)
					if p5 == "" or not p5 then
						return nil;
					end;
					print("Join match response", (v1.await(v1.await(u11:WaitFor("JoinByCode")):CallServerAsync(p5))));
				end);
				function v7.OnCreateMatch(p6, p7)
					local v8 = u11:WaitFor("CreateCustomMatch"):expect():CallServerAsync(p6, p7):expect();
					print("Create match response", v8);
					return v8;
				end;
				function v7.OnClose()
					l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__8.CUSTOM_MATCHES);
				end;
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.CUSTOM_MATCHES, v7);
			end;
		end);
		local l__PrimaryPart__9 = p3.PrimaryPart;
		l__PrimaryPart__9:SetAttribute("BillboardTitle", "<font color=\"" .. l__ColorUtil__9.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">Custom Matches</font>");
		l__PrimaryPart__9:SetAttribute("BillboardSize", UDim2.fromScale(6.5, 1.3));
		l__PrimaryPart__9:SetAttribute("BillboardStudsOffset", Vector3.new(0, 4, 0));
		l__CollectionService__10:AddTag(l__PrimaryPart__9, "Billboard");
	end);
end);
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
