-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit");
local v4 = setmetatable({}, {
	__tostring = function()
		return "LobbyKitDisplayComponent";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__getBedwarsKitMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__BedwarsKitShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__6 = v2.Players;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__8 = v1.import(script, script.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ReplicatedStorage__9 = v2.ReplicatedStorage;
local l__WeldUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__BedwarsKit__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__AngelType__12 = v3.AngelType;
local l__AngelKitUtil__13 = v3.AngelKitUtil;
local l__BarbarianKit__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__AxolotlType__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType;
local l__KnitClient__17 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameQueryUtil__18 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__19 = v2.Workspace;
local l__CollectionService__20 = v2.CollectionService;
function v4.constructor(p1, p2)
	p1.maid = u1.new();
	if p2:IsA("BasePart") then
		p2.Transparency = 1;
	end;
	local v6 = p2:GetAttribute("Kit");
	local v7 = l__getBedwarsKitMeta__2(v6);
	local v8 = table.find(l__BedwarsKitShop__3.BattlePassPodiumKits, v6) ~= nil;
	local v9 = {
		RequiresLineOfSight = false, 
		MaxActivationDistance = 11, 
		HoldDuration = 0, 
		ActionText = v7.name
	};
	if v8 then
		local v10 = "View Battle Pass";
	else
		v10 = "View Kit";
	end;
	v9.ObjectText = v10;
	v9.KeyboardKeyCode = l__Theme__5.promptKeyboardKey;
	v9.Parent = p2;
	u4("ProximityPrompt", v9).Triggered:Connect(function(p3)
		if p3 == l__Players__6.LocalPlayer then
			if not v8 then
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.KIT_SHOP, {
					SelectedKit = v6
				});
				return;
			end;
		else
			return;
		end;
		l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__8.BATTLEPASS, {});
	end);
	v1.Promise.defer(function()
		local v11 = p2:WaitForChild(v6);
		if v7.previewItems then
			local v12, v13, v14 = ipairs(v7.previewItems);
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				local v15 = l__ReplicatedStorage__9:FindFirstChild("Items");
				if v15 ~= nil then
					v15 = v15:FindFirstChild(v13);
					if v15 ~= nil then
						v15 = v15:Clone();
					end;
				end;
				if v15 then
					v15.Parent = v11;
				end;			
			end;
			l__WeldUtil__10:weldCharacterAccessories(v11);
		end;
		if v6 == l__BedwarsKit__11.ANGEL then
			task.defer(function()
				local v16 = true;
				while true do
					if v16 then
						local v17 = l__AngelType__12.LIGHT;
					else
						v17 = l__AngelType__12.VOID;
					end;
					l__AngelKitUtil__13.changeAngelAppearance(v11, v17);
					v16 = not v16;
					local v18 = wait(3);
					if v18 == 0 then
						break;
					end;
					if v18 ~= v18 then
						break;
					end;
					if not v18 then
						break;
					end;				
				end;
			end);
			return;
		end;
		if v6 == l__BedwarsKit__11.BARBARIAN then
			l__BarbarianKit__14.updateAppearance(v11, l__BarbarianKit__14.FULL_RAGE);
			return;
		end;
		if v6 == l__BedwarsKit__11.AXOLOTL then
			local v19, v20, v21 = ipairs(u15.values(l__AxolotlType__16));
			while true do
				v19(v20, v21);
				if not v19 then
					break;
				end;
				v21 = v19;
				local v22 = l__KnitClient__17.Controllers.AxolotlController:createClientOnlyAxolotlData(v11, v20);			
			end;
			return;
		end;
		if v6 == l__BedwarsKit__11.CYBER then
			local v23 = { Vector3.new(2, 3, 2), Vector3.new(-2.5, 5, -2), Vector3.new(2, 1, -3.4), Vector3.new(-2.9, -1.3, 2.4) };
			local v24 = 0;
			local v25 = false;
			while true do
				if v25 then
					v24 = v24 + 1;
				else
					v25 = true;
				end;
				if not (v24 < #v23) then
					break;
				end;
				local v26 = l__ReplicatedStorage__9.Assets:WaitForChild("Projectiles"):WaitForChild("drone"):Clone();
				local l__Humanoid__27 = v26:FindFirstChild("Humanoid");
				if l__Humanoid__27 ~= nil then
					l__Humanoid__27:Destroy();
				end;
				local v28, v29, v30 = ipairs(v26:GetDescendants());
				while true do
					v28(v29, v30);
					if not v28 then
						break;
					end;
					v30 = v28;
					if v29:IsA("BasePart") then
						v29.Anchored = true;
						v29.CanCollide = false;
						v29.CastShadow = false;
						l__GameQueryUtil__18:setQueryIgnored(v29, true);
					end;				
				end;
				v26:SetPrimaryPartCFrame(v11:GetPrimaryPartCFrame() + v23[v24 + 1]);
				v26.Parent = l__Workspace__19;
				l__CollectionService__20:AddTag(v26, "LobbyDrone");			
			end;
		end;
	end);
end;
function v4.Destroy(p4)
	p4.maid:DoCleaning();
end;
v4.Tag = "LobbyKitDisplayComponent";
return v4;
