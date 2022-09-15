-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = Instance.new("Folder");
v4.Name = "WindTrailAmbientEffects";
v4.Parent = v2.Workspace;
local v5 = setmetatable({}, {
	__tostring = function()
		return "WindLineEffectController";
	end, 
	__index = l__KnitController__3
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "WindLineEffectController";
end;
local l__getConfig__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config").getConfig;
function u1.KnitStart(p2)
	if l__getConfig__2("Lobby") then
		return;
	end;
	return nil;
end;
local l__TweenService__3 = v2.TweenService;
function u1.followPath(p3, p4, p5)
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < #p5) then
			break;
		end;
		local v9 = l__TweenService__3:Create(p4, TweenInfo.new(0.05 + 0.05 * math.pow((v7 / #p5 - 0.5) * 4, 2), Enum.EasingStyle.Linear), {
			Position = p5[v7 + 1]
		});
		v9:Play();
		v9.Completed:Wait();	
	end;
end;
local l__Players__4 = v2.Players;
local u5 = Vector3.new(0.1, 0.1, 0.075);
local l__WIND_DIRECTION__6 = v1.import(script, script.Parent, "ambience-settings").WIND_DIRECTION;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__NumberSequenceBuilder__8 = v1.import(script, script.Parent, "number-sequence-builder").NumberSequenceBuilder;
function u1.spawnWindParticle(p6)
	v1.Promise.defer(function()
		local v10 = l__Players__4.LocalPlayer;
		if v10 ~= nil then
			v10 = v10.Character;
			if v10 ~= nil then
				v10 = v10.PrimaryPart;
				if v10 ~= nil then
					v10 = v10.Position;
				end;
			end;
		end;
		if not v10 then
			return nil;
		end;
		local v11 = math.random() * 2 * math.pi;
		local l__Unit__12 = (l__WIND_DIRECTION__6 + u5 * (math.random() * 2 - 1)).Unit;
		local v13 = Vector3.new((15 + math.random() * 30) * math.cos(v11), math.random() * 15 + 30, (15 + math.random() * 30) * math.sin(v11)) + v10 + l__Unit__12 * 52.5;
		local v14 = v13 + l__Unit__12 * 105;
		local v15 = {};
		local v16 = 0;
		local v17 = false;
		while true do
			if v17 then
				v16 = v16 + 0.05;
			else
				v17 = true;
			end;
			if not (v16 < 1) then
				break;
			end;
			table.insert(v15, (CFrame.new(v13, v14) * CFrame.new(0, math.sin(v16 * math.pi * 2) * 2, v16 * (v13 - v14).Magnitude)).Position);		
		end;
		local v18 = u7("Part", {
			Name = "Wind", 
			Anchored = true, 
			CanCollide = false, 
			Transparency = 1, 
			Position = v13, 
			Parent = v4
		});
		local v19 = Instance.new("Attachment", v18);
		v19.CFrame = v19.CFrame + Vector3.new(0, 0.5, 0);
		u7("Trail", {
			FaceCamera = true, 
			LightInfluence = 0.3, 
			Transparency = l__NumberSequenceBuilder__8.new():addKeypoint(0, 0.85):build(), 
			Lifetime = 0.65, 
			WidthScale = l__NumberSequenceBuilder__8.new():addKeypoint(0, 0.2):addKeypoint(0.5, 1):addKeypoint(1, 0.2):build(), 
			Attachment0 = Instance.new("Attachment", v18), 
			Attachment1 = v19, 
			Parent = v18
		});
		v1.Promise.defer(function()
			p6:followPath(v18, v15);
			wait(0.65);
			v18:Destroy();
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	WindLineEffectController = u1
};
