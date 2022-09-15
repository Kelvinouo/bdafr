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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "SpiritAssassinSkinController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__BedwarsKitSkin__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__WatchPlayerCharacter__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayerCharacter;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__KnitClient__1.Controllers.KitController:watchKit(function(p3, p4)
		local v5 = p4 == l__BedwarsKit__2.SPIRIT_ASSASSIN;
		if v5 then
			local v6 = p3.Character;
			if v6 ~= nil then
				v6 = v6:GetAttribute("KitSkin");
			end;
			v5 = v6 == l__BedwarsKitSkin__3.SPIRIT_ASSASSIN_PRISMATIC;
		end;
		if v5 then
			l__WatchPlayerCharacter__4(p3, function(p5, p6)
				p2:applyRGBEffect(p5);
			end);
		end;
	end);
end;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u6 = { Color3.fromRGB(255, 89, 89), Color3.fromRGB(218, 133, 65), Color3.fromRGB(91, 154, 76), Color3.fromRGB(82, 124, 174), Color3.fromRGB(180, 128, 255) };
local l__TweenService__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.applyRGBEffect(p7, p8)
	local u8 = { p8:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("Hair"), p8:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon1"), p8:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon2"), p8:WaitForChild("3DClothing"):WaitForChild("LeftUpperLeg"):WaitForChild("Neon"), p8:WaitForChild("3DClothing"):WaitForChild("RightUpperLeg"):WaitForChild("Neon"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon1"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon2"), p8:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon3") };
	task.spawn(function()
		local v7 = u5.new();
		local v8 = Instance.new("Color3Value");
		v8.Value = u6[1];
		v7:GiveTask(v8.Changed:Connect(function(p9)
			local v9, v10, v11 = ipairs(u8);
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				v11 = v9;
				v10.Color = p9;			
			end;
		end));
		local v12 = 1;
		while p8.Parent ~= nil do
			local v13 = l__TweenService__7:Create(v8, TweenInfo.new(1), {
				Value = u6[v12 + 1]
			});
			v13:Play();
			v13.Completed:Wait();
			v12 = v12 + 1;
			if #u6 <= v12 then
				v12 = 0;
			end;		
		end;
		v7:DoCleaning();
	end);
end;
local v14 = l__KnitClient__1.CreateController(v3.new());
return nil;
