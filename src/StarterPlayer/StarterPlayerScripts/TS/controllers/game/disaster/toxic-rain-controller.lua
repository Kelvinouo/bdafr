-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ToxicRainController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__default__3 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__DisasterType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-type").DisasterType;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "rain").src);
local l__Workspace__6 = v3.Workspace;
local l__GameQueryUtil__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Lighting__9 = v3.Lighting;
local l__KnitClient__10 = v2.KnitClient;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.DisasterBegan:connect(function(p3)
		l__default__3.Debug("Received on the client");
		if p3.disasterType == l__DisasterType__4.TOXIC_RAIN then
			u5:Enable();
			u5:SetColor(Color3.fromRGB(0, 255, 0));
			u5:SetIntensityRatio(0.5);
			u5:SetSoundId("rbxassetid://9112794264");
			local l____RainEmitter__7 = l__Workspace__6.CurrentCamera:FindFirstChild("__RainEmitter");
			if l____RainEmitter__7 then
				l__GameQueryUtil__7:setQueryIgnored(l____RainEmitter__7, true);
			end;
			local u11 = u8("ColorCorrectionEffect", {
				Brightness = -0.02, 
				TintColor = Color3.fromRGB(224, 221, 255), 
				Parent = l__Lighting__9
			});
			local u12 = u8("Clouds", {
				Cover = 0.9, 
				Density = 1, 
				Color = Color3.fromRGB(50, 32, 32), 
				Parent = l__Workspace__6.Terrain
			});
			local u13 = l__Workspace__6.CurrentCamera.ChildAdded:Connect(function(p4)
				if p4.Name == "__RainEmitter" and p4:IsA("BasePart") then
					l__GameQueryUtil__7:setQueryIgnored(p4, true);
				end;
			end);
			local u14 = l__KnitClient__10.Controllers.LightingController.lightingModifier:addModifier(60, {
				Ambient = Color3.fromRGB(81, 68, 149), 
				OutdoorAmbient = Color3.fromRGB(110, 138, 198)
			});
			local u15 = l__KnitClient__10.Controllers.LightingController.atmosphereModifier:addModifier(60, {
				Density = 0.52, 
				Offset = 0, 
				Color = Color3.fromRGB(71, 216, 95), 
				Decay = Color3.fromRGB(0, 0, 0), 
				Glare = 0, 
				Haze = 10
			});
			task.delay(p3.endTime - l__Workspace__6:GetServerTimeNow(), function()
				u5:Disable();
				u11:Destroy();
				u12:Destroy();
				u13:Disconnect();
				u14:destroy();
				u15:destroy();
			end);
		end;
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
