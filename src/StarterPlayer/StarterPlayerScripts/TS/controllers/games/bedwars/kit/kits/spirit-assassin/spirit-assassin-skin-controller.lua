-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SpiritAssassinSkinController";
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
	p1.Name = "SpiritAssassinSkinController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsKitSkin__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__WatchPlayerCharacter__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayerCharacter;
local l__Players__6 = v2.Players;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__2.Controllers.KitController:watchKit(function(p3, p4)
		local v6 = p4 == l__BedwarsKit__3.SPIRIT_ASSASSIN;
		if v6 then
			local v7 = p3.Character;
			if v7 ~= nil then
				v7 = v7:GetAttribute("KitSkin");
			end;
			v6 = v7 == l__BedwarsKitSkin__4.SPIRIT_ASSASSIN_PRISMATIC;
		end;
		if v6 then
			if not p3.Character then
				p3.CharacterAdded:Wait();
			end;
			p2:applyRGBEffect(p3.Character);
		end;
	end);
	l__WatchPlayerCharacter__5(l__Players__6.LocalPlayer, function(p5, p6)
		p2:applyRGBEffect(p5);
	end);
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u8 = { Color3.fromRGB(255, 89, 89), Color3.fromRGB(218, 133, 65), Color3.fromRGB(91, 154, 76), Color3.fromRGB(82, 124, 174), Color3.fromRGB(180, 128, 255) };
local l__TweenService__9 = v2.TweenService;
function v4.applyRGBEffect(p7, p8)
	local u10 = { p8:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("Hair"), p8:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon1"), p8:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon2"), p8:WaitForChild("3DClothing"):WaitForChild("LeftUpperLeg"):WaitForChild("Neon"), p8:WaitForChild("3DClothing"):WaitForChild("RightUpperLeg"):WaitForChild("Neon"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon1"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon2"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon3") };
	task.spawn(function()
		local v8 = u7.new();
		local v9 = Instance.new("Color3Value");
		v9.Value = u8[1];
		v8:GiveTask(v9.Changed:Connect(function(p9)
			for v10, v11 in ipairs(u10) do
				v11.Color = p9;
			end;
		end));
		local v12 = 1;
		while p8.Parent ~= nil do
			local v13 = l__TweenService__9:Create(v9, TweenInfo.new(1), {
				Value = u8[v12 + 1]
			});
			v13:Play();
			v13.Completed:Wait();
			v12 = v12 + 1;
			if #u8 <= v12 then
				v12 = 0;
			end;		
		end;
		v8:DoCleaning();
	end);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v4.new());
return nil;
