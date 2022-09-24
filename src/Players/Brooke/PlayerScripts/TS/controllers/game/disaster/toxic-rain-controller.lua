-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ToxicRainController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "ToxicRainController";
end;
local l__Workspace__1 = v3.Workspace;
local l__GameQueryUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__DisasterType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-type").DisasterType;
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "rain");
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Lighting__8 = v3.Lighting;
local l__KnitClient__9 = v2.KnitClient;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__Workspace__1.CurrentCamera.ChildAdded:Connect(function(p3)
		if p3.Name == "__RainEmitter" and p3:IsA("BasePart") then
			l__GameQueryUtil__2:setQueryIgnored(p3, true);
		end;
	end);
	l__ClientSyncEvents__3.DisasterBegan:connect(function(p4)
		l__default__4.Debug("Received on the client");
		if p4.disasterType == l__DisasterType__5.TOXIC_RAIN then
			u6:Enable();
			u6:SetColor(Color3.fromRGB(0, 255, 0));
			u6:SetIntensityRatio(0.5);
			u6:SetSoundId("rbxassetid://9112794264");
			local l____RainEmitter__7 = l__Workspace__1.CurrentCamera:FindFirstChild("__RainEmitter");
			if l____RainEmitter__7 then
				l__GameQueryUtil__2:setQueryIgnored(l____RainEmitter__7, true);
			end;
			local u10 = u7("ColorCorrectionEffect", {
				Brightness = -0.02, 
				TintColor = Color3.fromRGB(224, 221, 255), 
				Parent = l__Lighting__8
			});
			local u11 = u7("Clouds", {
				Cover = 0.9, 
				Density = 1, 
				Color = Color3.fromRGB(50, 32, 32), 
				Parent = l__Workspace__1.Terrain
			});
			local u12 = l__KnitClient__9.Controllers.LightingController.lightingModifier:addModifier(60, {
				Ambient = Color3.fromRGB(81, 68, 149), 
				OutdoorAmbient = Color3.fromRGB(110, 138, 198)
			});
			local u13 = l__KnitClient__9.Controllers.LightingController:getAtmosphereModifier():addModifier(60, {
				Density = 0.52, 
				Offset = 0, 
				Color = Color3.fromRGB(71, 216, 95), 
				Decay = Color3.fromRGB(0, 0, 0), 
				Glare = 0, 
				Haze = 10
			});
			task.delay(p4.endTime - l__Workspace__1:GetServerTimeNow(), function()
				u6:Disable();
				u10:Destroy();
				u11:Destroy();
				u12:destroy();
				u13:destroy();
			end);
		end;
	end);
end;
local v8 = v2.KnitClient.CreateController(v5.new());
return nil;
