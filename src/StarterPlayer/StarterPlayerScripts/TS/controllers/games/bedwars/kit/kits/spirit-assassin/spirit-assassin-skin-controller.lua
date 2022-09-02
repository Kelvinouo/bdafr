-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SpiritAssassinSkinController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SpiritAssassinSkinController";
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsKitSkin__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__WatchPlayerCharacter__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayerCharacter;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__2.Controllers.KitController:watchKit(function(p3, p4)
		local v5 = p4 == l__BedwarsKit__3.SPIRIT_ASSASSIN;
		if v5 then
			local v6 = p3.Character;
			if v6 ~= nil then
				v6 = v6:GetAttribute("KitSkin");
			end;
			v5 = v6 == l__BedwarsKitSkin__4.SPIRIT_ASSASSIN_PRISMATIC;
		end;
		if v5 then
			l__WatchPlayerCharacter__5(p3, function(p5, p6)
				p2:applyRGBEffect(p5);
			end);
		end;
	end);
end;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u7 = { Color3.fromRGB(255, 89, 89), Color3.fromRGB(218, 133, 65), Color3.fromRGB(91, 154, 76), Color3.fromRGB(82, 124, 174), Color3.fromRGB(180, 128, 255) };
local l__TweenService__8 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.applyRGBEffect(p7, p8)
	local u9 = { p8:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("Hair"), p8:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon1"), p8:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon2"), p8:WaitForChild("3DClothing"):WaitForChild("LeftUpperLeg"):WaitForChild("Neon"), p8:WaitForChild("3DClothing"):WaitForChild("RightUpperLeg"):WaitForChild("Neon"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon1"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon2"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon3") };
	task.spawn(function()
		local v7 = u6.new();
		local v8 = Instance.new("Color3Value");
		v8.Value = u7[1];
		v7:GiveTask(v8.Changed:Connect(function(p9)
			for v9, v10 in ipairs(u9) do
				v10.Color = p9;
			end;
		end));
		local v11 = 1;
		while p8.Parent ~= nil do
			local v12 = l__TweenService__8:Create(v8, TweenInfo.new(1), {
				Value = u7[v11 + 1]
			});
			v12:Play();
			v12.Completed:Wait();
			v11 = v11 + 1;
			if #u7 <= v11 then
				v11 = 0;
			end;		
		end;
		v7:DoCleaning();
	end);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v3.new());
return nil;
