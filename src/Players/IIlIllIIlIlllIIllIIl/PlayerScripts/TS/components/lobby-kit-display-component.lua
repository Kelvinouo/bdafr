-- Script Hash: 807203f774e28548eafca310896630b056d9ca1e6e1df15b80cc318fdf08ebb67fda0f31258c60f1e02681338393b750
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit");
local v5 = setmetatable({}, {
	__tostring = function()
		return "LobbyKitDisplayComponent";
	end
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local l__Maid__1 = v2.Maid;
local l__getBedwarsKitMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__BedwarsKitShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__6 = v3.Players;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__8 = v1.import(script, script.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ReplicatedStorage__9 = v3.ReplicatedStorage;
local l__WeldUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__BedwarsKit__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__AngelType__12 = v4.AngelType;
local l__AngelKitUtil__13 = v4.AngelKitUtil;
local l__BarbarianKit__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__AxolotlType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType;
local l__KnitClient__17 = v2.KnitClient;
local l__GameQueryUtil__18 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__19 = v3.Workspace;
local l__CollectionService__20 = v3.CollectionService;
function v5.constructor(p1, p2)
	p1.maid = l__Maid__1.new();
	if p2:IsA("BasePart") then
		p2.Transparency = 1;
	end;
	local v7 = p2:GetAttribute("Kit");
	local v8 = l__getBedwarsKitMeta__2(v7);
	local v9 = table.find(l__BedwarsKitShop__3.BattlePassPodiumKits, v7) ~= nil;
	local v10 = {
		RequiresLineOfSight = false, 
		MaxActivationDistance = 11, 
		HoldDuration = 0, 
		ActionText = v8.name
	};
	if v9 then
		local v11 = "View Battle Pass";
	else
		v11 = "View Kit";
	end;
	v10.ObjectText = v11;
	v10.KeyboardKeyCode = l__Theme__5.promptKeyboardKey;
	v10.Parent = p2;
	u4("ProximityPrompt", v10).Triggered:Connect(function(p3)
		if p3 == l__Players__6.LocalPlayer then
			if not v9 then
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.KIT_SHOP, {
					SelectedKit = v7
				});
				return;
			end;
		else
			return;
		end;
		l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.BATTLEPASS, {});
	end);
	v1.Promise.defer(function()
		local v12 = p2:WaitForChild(v7);
		if v8.previewItems then
			local v13, v14, v15 = ipairs(v8.previewItems);
			while true do
				local v16, v17 = v13(v14, v15);
				if not v16 then
					break;
				end;
				local v18 = l__ReplicatedStorage__9:FindFirstChild("Items");
				if v18 ~= nil then
					v18 = v18:FindFirstChild(v17);
					if v18 ~= nil then
						v18 = v18:Clone();
					end;
				end;
				if v18 then
					v18.Parent = v12;
				end;			
			end;
			l__WeldUtil__10.weldCharacterAccessories(v12);
		end;
		if v7 == l__BedwarsKit__11.ANGEL then
			task.defer(function()
				local v19 = true;
				while true do
					if v19 then
						local v20 = l__AngelType__12.LIGHT;
					else
						v20 = l__AngelType__12.VOID;
					end;
					l__AngelKitUtil__13.changeAngelAppearance(v12, v20);
					v19 = not v19;
					local v21 = wait(3);
					if v21 == 0 then
						break;
					end;
					if v21 ~= v21 then
						break;
					end;
					if not v21 then
						break;
					end;				
				end;
			end);
			return;
		end;
		if v7 == l__BedwarsKit__11.BARBARIAN then
			l__BarbarianKit__14.updateAppearance(v12, l__BarbarianKit__14.FULL_RAGE);
			return;
		end;
		if v7 == l__BedwarsKit__11.AXOLOTL then
			for v22, v23 in ipairs(u15.values(l__AxolotlType__16)) do
				local v24 = l__KnitClient__17.Controllers.AxolotlController:createClientOnlyAxolotlData(v12, v23);
			end;
			return;
		end;
		if v7 == l__BedwarsKit__11.CYBER then
			local v25 = { Vector3.new(2, 3, 2), Vector3.new(-2.5, 5, -2), Vector3.new(2, 1, -3.4), Vector3.new(-2.9, -1.3, 2.4) };
			local v26 = 0;
			local v27 = false;
			while true do
				if v27 then
					v26 = v26 + 1;
				else
					v27 = true;
				end;
				if not (v26 < #v25) then
					break;
				end;
				local v28 = l__ReplicatedStorage__9.Assets:WaitForChild("Projectiles"):WaitForChild("drone"):Clone();
				local l__Humanoid__29 = v28:FindFirstChild("Humanoid");
				if l__Humanoid__29 ~= nil then
					l__Humanoid__29:Destroy();
				end;
				for v30, v31 in ipairs(v28:GetDescendants()) do
					if v31:IsA("BasePart") then
						v31.Anchored = true;
						v31.CanCollide = false;
						l__GameQueryUtil__18:setQueryIgnored(v31, true);
					end;
				end;
				v28:SetPrimaryPartCFrame(v12:GetPrimaryPartCFrame() + v25[v26 + 1]);
				v28.Parent = l__Workspace__19;
				l__CollectionService__20:AddTag(v28, "LobbyDrone");			
			end;
		end;
	end);
end;
function v5.Destroy(p4)
	p4.maid:DoCleaning();
end;
v5.Tag = "LobbyKitDisplayComponent";
return v5;
