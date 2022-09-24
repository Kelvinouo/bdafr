-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lighting", "default-lighting-constants");
local v6 = {
	name = "Manage Atmosphere", 
	event = "Heartbeat"
};
local u1 = nil;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__ModifierGroup__3 = v2.ModifierGroup;
local l__Lighting__4 = v4.Lighting;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GroupModifierBehavior__6 = v2.GroupModifierBehavior;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u8 = nil;
local l__InQuart__9 = v3.InQuart;
local l__PirateSceneTimestamps__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__InQuad__11 = v3.InQuad;
local l__Linear__12 = v3.Linear;
local u13 = v5.DefaultAtmosphereProperties;
local u14 = v5.DefaultLightingProperties;
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "rain");
local l__Workspace__16 = v4.Workspace;
local l__GameQueryUtil__17 = v2.GameQueryUtil;
local u18 = Random.new();
local l__SoundManager__19 = v2.SoundManager;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u21 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__OutQuad__22 = v3.OutQuad;
local l__useEffect__23 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src.Runtime).useEffect;
function v6.func(p1, p2, p3)
	if p1.chainInfo == nil then
		local v7 = false;
	else
		v7 = p1.chainInfo.stageInChain > 0;
	end;
	if not u1 then
		if l__DeviceUtil__2.isHoarceKat() then
			local v8 = l__ModifierGroup__3.new(l__Lighting__4:FindFirstChildOfClass("Atmosphere") or u5("Atmosphere", {
				Parent = l__Lighting__4
			}), {
				baseProperties = {
					Density = 0.25, 
					Offset = 0, 
					Color = Color3.fromRGB(198, 198, 198), 
					Decay = Color3.fromRGB(104, 112, 124), 
					Glare = 0, 
					Haze = 0
				}, 
				behavior = l__GroupModifierBehavior__6.Merge
			});
		else
			v8 = l__KnitClient__7.Controllers.LightingController:getAtmosphereModifier();
		end;
		u1 = v8;
	end;
	if not u8 then
		if l__DeviceUtil__2.isHoarceKat() then
			local v9 = l__ModifierGroup__3.new(l__Lighting__4, {
				baseProperties = {
					Ambient = Color3.fromRGB(89, 60, 86), 
					Brightness = 2, 
					ColorShift_Bottom = Color3.fromRGB(0, 0, 0), 
					ColorShift_Top = Color3.fromRGB(117, 57, 57), 
					EnvironmentDiffuseScale = 0.1, 
					EnvironmentSpecularScale = 0.1, 
					GlobalShadows = true, 
					OutdoorAmbient = Color3.fromRGB(216, 191, 161), 
					ShadowSoftness = 0.2, 
					ClockTime = 14, 
					GeographicLatitude = -7, 
					ExposureCompensation = 0.05
				}, 
				behavior = l__GroupModifierBehavior__6.Merge
			});
		else
			v9 = l__KnitClient__7.Controllers.LightingController.lightingModifier;
		end;
		u8 = v9;
	end;
	if v7 == true then
		local v10 = 1;
	else
		v10 = math.clamp(math.floor(l__InQuart__9(p1.elapsedEventTime, 0, 1, p1.totalLength) * 10000) / 10000, 0, 1);
	end;
	if v7 and l__PirateSceneTimestamps__10.HouseExplodes < p1.elapsedEventTime then
		if p1.elapsedEventTime < l__PirateSceneTimestamps__10.CelebrationEnds + 0 then
			v10 = math.clamp(l__InQuad__11(p1.elapsedEventTime - l__PirateSceneTimestamps__10.HouseExplodes, 1, -1, l__PirateSceneTimestamps__10.CelebrationEnds - l__PirateSceneTimestamps__10.HouseExplodes), 0, 1);
		else
			v10 = math.clamp(l__InQuad__11(p1.elapsedEventTime - l__PirateSceneTimestamps__10.CelebrationEnds + 0, 0, 1, 2), 0, 1);
		end;
	end;
	if not p2:get("atmosphereModifier") then
		p2:set("atmosphereModifier", u1:addModifier(100, {}));
	elseif v7 == true or p1.totalLength * 0.5 < p1.elapsedEventTime then
		p2:get("atmosphereModifier"):setProperties({
			Density = l__Linear__12(v10, u13.Density, 0.35 - u13.Density, 1), 
			Color = u13.Color:Lerp(Color3.fromRGB(52, 70, 66), v10), 
			Haze = l__Linear__12(v10, u13.Haze, 10 - u13.Haze, 1)
		});
	end;
	if not p2:get("lightingModifier") then
		p2:set("lightingModifier", u8:addModifier(100, {}));
	else
		p2:get("lightingModifier"):setProperties({
			Ambient = u14.Ambient:Lerp(Color3.fromRGB(47, 60, 85), v10), 
			ColorShift_Top = u14.ColorShift_Top:Lerp(Color3.fromRGB(0, 0, 0), v10), 
			OutdoorAmbient = u14.OutdoorAmbient:Lerp(Color3.fromRGB(88, 112, 117), v10), 
			ClockTime = l__Linear__12(v10, u14.ClockTime, 10 - u14.ClockTime, 1), 
			Brightness = l__Linear__12(v10, u14.Brightness, 1 - u14.Brightness, 1)
		});
	end;
	local v11 = p2:get("rainEnabled");
	if v7 == true or p1.totalLength * 0.7 < p1.elapsedEventTime then
		if v11 ~= true then
			u15:Enable();
			u15:SetIntensityRatio(0.2);
			u15:SetTransparency(0.8);
			u15:SetStraightTexture("rbxassetid://8030734851");
			u15:SetSplashTexture("rbxassetid://8030760338");
			u15:SetDirection(Vector3.new(0.1, -1, 0));
			u15:SetSoundId("");
			u15:SetSize(1);
			local l____RainEmitter__12 = l__Workspace__16.CurrentCamera:FindFirstChild("__RainEmitter");
			if l____RainEmitter__12 then
				l__GameQueryUtil__17:setQueryIgnored(l____RainEmitter__12, true);
			end;
			p2:set("rainEnabled", true);
			v11 = true;
		end;
	else
		p2:set("rainEnabled", nil);
		v11 = nil;
	end;
	if v11 == nil then
		u15:Disable();
	end;
	if not p2:get("thunderLightningModifier") then
		p2:set("thunderLightningModifier", u8:addModifier(200, {}));
	elseif v7 == true or p1.totalLength * 0.8 < p1.elapsedEventTime then
		local v13 = p2:get("nextThunder");
		if v13 == 0 or v13 ~= v13 or not v13 then
			p2:set("nextThunder", os.clock() + u18:NextNumber(7, 15));
		elseif v13 < os.clock() and (not (p1.elapsedEventTime < l__PirateSceneTimestamps__10.CelebrationEnds) or not (l__PirateSceneTimestamps__10.CelebrationStarts < p1.elapsedEventTime) or not v7) then
			p2:set("nextThunder", os.clock() + u18:NextNumber(7, 15));
			local u24 = p2:get("thunderLightningModifier");
			task.spawn(function()
				l__SoundManager__19:playSound(l__GameSound__20.PIRATE_EVENT_THUNDER);
				local v14 = u18:NextInteger(1, 3);
				local v15 = 0;
				local v16 = false;
				while true do
					if v16 then
						v15 = v15 + 1;
					else
						v16 = true;
					end;
					if not (v15 < v14) then
						break;
					end;
					task.wait(u18:NextNumber(0.05, 0.3));
					if u24 ~= nil then
						u24:setProperties({
							Brightness = 4 + u18:NextNumber(0, 3)
						});
					end;
					task.wait(u18:NextNumber(0.05, 0.3));
					if u24 ~= nil then
						u24:setProperties({});
					end;				
				end;
			end);
		end;
	end;
	u21.portal(l__Workspace__16.Terrain, function()
		if v7 == true then
			local v17 = 1;
		else
			v17 = math.floor(l__OutQuad__22(p1.elapsedEventTime, 0, 1, p1.totalLength) * 100) / 100;
		end;
		local u25 = u21.useInstance(function(p4)
			local v18 = Instance.new("Clouds");
			p4.clouds = v18;
			return v18;
		end);
		l__useEffect__23(function()
			u25.clouds.Cover = v17 * 0.8;
			u25.clouds.Density = v17;
			u25.clouds.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(15, 25, 36), v17);
		end, v17);
	end);
end;
return {
	ManageAtmosphereBehavior = v6
};
