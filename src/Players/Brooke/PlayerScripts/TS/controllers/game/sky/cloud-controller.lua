-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CloudController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "CloudController";
	p1.clouds = {};
	p1.cloudFolder = u2("Folder", {
		Name = "Clouds", 
		Parent = l__Workspace__3
	});
end;
local l__KnitClient__4 = v2.KnitClient;
local l__CloudNoise__5 = v1.import(script, script.Parent, "cloud-noise").CloudNoise;
function u1.KnitStart(p2)
	if UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value <= Enum.SavedQualitySetting.QualityLevel2.Value then
		return nil;
	end;
	l__KnitClient__4.Controllers.MapController:getCFrame("center"):andThen(function(p3)
		if not p3 then
			p3 = l__KnitClient__4.Controllers.MapController:getCFramesFolder():GetChildren()[1].Value;
		end;
		local v6 = 0;
		local v7 = false;
		while true do
			if v7 then
				v6 = v6 + 1;
			else
				v7 = true;
			end;
			if not (v6 < 80) then
				break;
			end;
			local v8 = 0;
			local v9 = false;
			while true do
				if v9 then
					v8 = v8 + 1;
				else
					v9 = true;
				end;
				if not (v8 < 80) then
					break;
				end;
				if l__CloudNoise__5[v6 + 1][v8] ~= nil then
					p2:spawnCloud(v6, v8, p3.Position);
				end;			
			end;		
		end;
	end);
end;
function u1.spawnCloud(p4, p5, p6, p7)
	table.insert(p4.clouds, (u2("Part", {
		Material = Enum.Material.Plastic, 
		Color = Color3.fromRGB(255, 255, 255), 
		Size = Vector3.new(150, 65, 150), 
		CastShadow = false, 
		Anchored = true, 
		TopSurface = Enum.SurfaceType.Smooth, 
		CanCollide = false, 
		Position = Vector3.new(150 * (p5 - 40), 840, 150 * (40 - p6)) + p7, 
		Parent = p4.cloudFolder
	})));
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
