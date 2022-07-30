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
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__TweenService__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	local u6 = { Color3.fromRGB(255, 89, 89), Color3.fromRGB(218, 133, 65), Color3.fromRGB(91, 154, 76), Color3.fromRGB(82, 124, 174), Color3.fromRGB(180, 128, 255) };
	l__KnitClient__2.Controllers.KitController:watchKit(function(p3, p4)
		if p4 == l__BedwarsKit__3.SPIRIT_ASSASSIN then
			if not p3.Character then
				p3.CharacterAdded:Wait();
			end;
			local l__Character__5 = p3.Character;
			local u7 = { l__Character__5:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("Hair"), l__Character__5:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon1"), l__Character__5:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon2"), l__Character__5:WaitForChild("3DClothing"):WaitForChild("LeftUpperLeg"):WaitForChild("Neon"), l__Character__5:WaitForChild("3DClothing"):WaitForChild("RightUpperLeg"):WaitForChild("Neon"), l__Character__5:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon1"), l__Character__5:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon2"), l__Character__5:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon3") };
			local u8 = u4.new();
			task.spawn(function()
				local v6 = Instance.new("Color3Value");
				v6.Value = u6[1];
				v6.Changed:Connect(function(p5)
					for v7, v8 in ipairs(u7) do
						v8.Color = p5;
					end;
				end);
				local v9 = 1;
				while l__Character__5.Parent ~= nil do
					local v10 = l__TweenService__5:Create(v6, TweenInfo.new(1), {
						Value = u6[v9 + 1]
					});
					v10:Play();
					v10.Completed:Wait();
					v9 = v9 + 1;
					if #u6 <= v9 then
						v9 = 0;
					end;				
				end;
				u8:DoCleaning();
			end);
		end;
	end);
end;
u1 = l__KnitClient__2.CreateController;
u1 = u1(v3.new());
return nil;
