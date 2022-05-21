-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local u2 = l__KnitController__3;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CloudController";
	p1.clouds = {};
	p1.cloudFolder = u3("Folder", {
		Name = "Clouds", 
		Parent = l__Workspace__4
	});
end;
local l__KnitClient__5 = v2.KnitClient;
local l__CloudNoise__6 = v1.import(script, script.Parent, "cloud-noise").CloudNoise;
function u1.KnitStart(p2)
	if UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value <= Enum.SavedQualitySetting.QualityLevel2.Value then
		return nil;
	end;
	local v6 = l__KnitClient__5.Controllers.MapController:getCFrame("center") or l__KnitClient__5.Controllers.MapController:getCFramesFolder():GetChildren()[1].Value;
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < 80) then
			break;
		end;
		local v9 = 0;
		local v10 = false;
		while true do
			if v10 then
				v9 = v9 + 1;
			else
				v10 = true;
			end;
			if not (v9 < 80) then
				break;
			end;
			if l__CloudNoise__6[v7 + 1][v9] ~= nil then
				p2:spawnCloud(v7, v9, v6.Position);
			end;		
		end;	
	end;
end;
function u1.spawnCloud(p3, p4, p5, p6)
	table.insert(p3.clouds, (u3("Part", {
		Material = Enum.Material.Plastic, 
		Color = Color3.fromRGB(255, 255, 255), 
		Size = Vector3.new(150, 65, 150), 
		CastShadow = false, 
		Anchored = true, 
		TopSurface = Enum.SurfaceType.Smooth, 
		CanCollide = false, 
		Position = Vector3.new(150 * (p4 - 40), 840, 150 * (40 - p5)) + p6, 
		Parent = p3.cloudFolder
	})));
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
