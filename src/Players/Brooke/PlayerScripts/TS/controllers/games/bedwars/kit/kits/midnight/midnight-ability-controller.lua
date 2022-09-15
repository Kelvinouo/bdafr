-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MidnightAbilityController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "MidnightAbilityController";
	p1.activeMidnightMaid = u1.new();
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v2.Players;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AbilityId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__EntityUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__PlayerEntity__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__Workspace__8 = v2.Workspace;
local u9 = {
	correctionTintColor = Color3.fromRGB(118, 132, 209), 
	correctionBrightness = 0, 
	correctionContrast = 0.05, 
	atmosphereColor = Color3.fromRGB(45, 56, 46), 
	atmosphereDecay = Color3.fromRGB(30, 32, 35), 
	atmosphereDensity = 0.2, 
	atmosphereHaze = 10, 
	outdoorAmbient = Color3.fromRGB(115, 111, 167), 
	brightness = 1, 
	ambient = Color3.fromRGB(170, 170, 170), 
	farIntensity = 0.25
};
local l__SoundManager__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__12 = v2.TweenService;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Lighting__14 = v2.Lighting;
local l__CollectionService__15 = v2.CollectionService;
local l__default__16 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__17 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__KnitClient__18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		if p3.entityInstance == l__Players__3.LocalPlayer.Character then
			p2.activeMidnightMaid:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__4.AbilityUsed:connect(function(p4)
		if p4.ability == l__AbilityId__5.MIDNIGHT then
			local v6 = l__EntityUtil__6:getEntity(p4.userCharacter);
			if not v1.instanceof(v6, l__PlayerEntity__7) then
				return nil;
			end;
			local l__extra__7 = p4.extra;
			if v6:getPlayer() ~= l__Players__3.LocalPlayer then
				return nil;
			end;
			p2.activeMidnightMaid:DoCleaning();
			task.delay(l__extra__7.expirationTime - l__Workspace__8:GetServerTimeNow(), function()
				p2.activeMidnightMaid:DoCleaning();
			end);
			local v8 = l__extra__7.team == l__Players__3.LocalPlayer:GetAttribute("Team");
			local v9 = {};
			if v8 then
				local v10 = nil;
			else
				local v11 = v6:getInstance().PrimaryPart;
				if v11 ~= nil then
					v11 = v11.Position;
				end;
				v10 = v11;
			end;
			v9.position = v10;
			l__SoundManager__10:playSound(l__GameSound__11.MIDNIGHT_ACTIVATE, v9);
			if v8 then
				local v12 = l__SoundManager__10:playSound(l__GameSound__11.RAVEN_SPACE_AMBIENT);
				v12.Looped = true;
				v12.Volume = 0;
				p2.activeMidnightMaid:GiveTask(function()
					l__TweenService__12:Create(v12, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
						Volume = 0
					}):Play();
					task.delay(1, function()
						v12:Destroy();
					end);
				end);
				local v13 = u13("Folder", {
					Name = "Disabled", 
					Parent = l__Lighting__14
				});
				local v14 = l__Lighting__14:FindFirstChildWhichIsA("Atmosphere");
				local v15 = l__Lighting__14:FindFirstChildWhichIsA("SunRaysEffect");
				if v15 then
					v15.Parent = v13;
					p2.activeMidnightMaid:GiveTask(function()
						v15.Parent = l__Lighting__14;
					end);
				end;
				local v16 = v14:Clone();
				local v17 = u13("ColorCorrectionEffect", {
					Parent = l__Lighting__14
				});
				local v18 = u13("DepthOfFieldEffect", {
					Parent = l__Lighting__14, 
					FocusDistance = 19.76, 
					InFocusRadius = 28.2, 
					FarIntensity = 0, 
					NearIntensity = 0
				});
				l__Lighting__14.OutdoorAmbient = u9.outdoorAmbient;
				l__Lighting__14.Ambient = u9.ambient;
				l__Lighting__14.Brightness = u9.brightness;
				p2.activeMidnightMaid:GiveTask(v17);
				p2.activeMidnightMaid:GiveTask(v18);
				local l__OutdoorAmbient__20 = l__Lighting__14.OutdoorAmbient;
				local l__Ambient__21 = l__Lighting__14.Ambient;
				local l__Brightness__22 = l__Lighting__14.Brightness;
				p2.activeMidnightMaid:GiveTask(function()
					l__Lighting__14.OutdoorAmbient = l__OutdoorAmbient__20;
					l__Lighting__14.Ambient = l__Ambient__21;
					l__Lighting__14.Brightness = l__Brightness__22;
					v16.Parent = l__Lighting__14;
					v14:Destroy();
				end);
				local v19 = {};
				local v20, v21, v22 = ipairs(l__CollectionService__15:GetTagged("DisableDuringMidnight"));
				while true do
					v20(v21, v22);
					if not v20 then
						break;
					end;
					v22 = v20;
					if v21:IsA("PointLight") and v21.Enabled == true then
						v21.Enabled = false;
						table.insert(v19, v21);
					end;				
				end;
				p2.activeMidnightMaid:GiveTask(function()
					local v23, v24, v25 = ipairs(v19);
					while true do
						v23(v24, v25);
						if not v23 then
							break;
						end;
						v25 = v23;
						v24.Enabled = true;					
					end;
				end);
				local l__Volume__23 = v12.Volume;
				l__default__16(1, l__InQuad__17, function(p5)
					v17.Brightness = -0.05 * p5;
					v17.Contrast = 0.05 * p5;
					v17.TintColor = Color3.fromRGB(255, 255, 255):Lerp(u9.correctionTintColor, p5);
					v18.FarIntensity = u9.farIntensity * p5;
					v14.Density = u9.atmosphereDensity * p5 + v16.Density * (1 - p5);
					v14.Color = v16.Color:Lerp(u9.atmosphereColor, p5);
					v14.Decay = v16.Decay:Lerp(u9.atmosphereDecay, p5);
					v14.Haze = u9.atmosphereHaze * p5 + v16.Haze * (1 - p5);
					v12.Volume = p5 * l__Volume__23;
				end, 0, 1);
			end;
		end;
	end);
	l__KnitClient__18.Controllers.KitController:watchLocalKit(function(p6)
		if p6 == l__BedwarsKit__19.MIDNIGHT then
			p2:onEnabled();
		end;
	end);
end;
local l__default__24 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__Flamework__25 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.onEnabled(p7)
	local v26 = u1.new();
	p7.kitMaid = v26;
	l__default__24.Warn("Is using midnight kit");
	v26:GiveTask(l__Flamework__25.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__5.MIDNIGHT, {
		interactionKey = Enum.KeyCode.V, 
		gamepadInteractionKey = Enum.KeyCode.Y, 
		text = "Activate Midnight"
	}));
end;
local v27 = l__KnitClient__18.CreateController(v4.new());
return nil;
