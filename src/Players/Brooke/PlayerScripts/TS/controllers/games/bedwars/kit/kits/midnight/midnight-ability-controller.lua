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
local u1 = l__KnitController__3;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MidnightAbilityController";
	p1.activeMidnightMaid = u2.new();
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__4 = v2.Players;
local l__ClientSyncEvents__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AbilityId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__PlayerEntity__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__Workspace__9 = v2.Workspace;
local u10 = {
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
local l__SoundManager__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__13 = v2.TweenService;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Lighting__15 = v2.Lighting;
local l__CollectionService__16 = v2.CollectionService;
local l__default__17 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__18 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__KnitClient__19 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		if p3.entityInstance == l__Players__4.LocalPlayer.Character then
			p2.activeMidnightMaid:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__5.AbilityUsed:connect(function(p4)
		if p4.ability == l__AbilityId__6.MIDNIGHT then
			local v6 = l__EntityUtil__7:getEntity(p4.userCharacter);
			if not v1.instanceof(v6, l__PlayerEntity__8) then
				return nil;
			end;
			local l__extra__7 = p4.extra;
			if v6:getPlayer() ~= l__Players__4.LocalPlayer then
				return nil;
			end;
			p2.activeMidnightMaid:DoCleaning();
			task.delay(l__extra__7.expirationTime - l__Workspace__9:GetServerTimeNow(), function()
				p2.activeMidnightMaid:DoCleaning();
			end);
			local v8 = l__extra__7.team == l__Players__4.LocalPlayer:GetAttribute("Team");
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
			l__SoundManager__11:playSound(l__GameSound__12.MIDNIGHT_ACTIVATE, v9);
			if v8 then
				local v12 = l__SoundManager__11:playSound(l__GameSound__12.RAVEN_SPACE_AMBIENT);
				v12.Looped = true;
				v12.Volume = 0;
				p2.activeMidnightMaid:GiveTask(function()
					l__TweenService__13:Create(v12, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
						Volume = 0
					}):Play();
					task.delay(1, function()
						v12:Destroy();
					end);
				end);
				local v13 = u14("Folder", {
					Name = "Disabled", 
					Parent = l__Lighting__15
				});
				local v14 = l__Lighting__15:FindFirstChildWhichIsA("Atmosphere");
				local v15 = l__Lighting__15:FindFirstChildWhichIsA("SunRaysEffect");
				if v15 then
					v15.Parent = v13;
					p2.activeMidnightMaid:GiveTask(function()
						v15.Parent = l__Lighting__15;
					end);
				end;
				local v16 = v14:Clone();
				local v17 = u14("ColorCorrectionEffect", {
					Parent = l__Lighting__15
				});
				local v18 = u14("DepthOfFieldEffect", {
					Parent = l__Lighting__15, 
					FocusDistance = 19.76, 
					InFocusRadius = 28.2, 
					FarIntensity = 0, 
					NearIntensity = 0
				});
				l__Lighting__15.OutdoorAmbient = u10.outdoorAmbient;
				l__Lighting__15.Ambient = u10.ambient;
				l__Lighting__15.Brightness = u10.brightness;
				p2.activeMidnightMaid:GiveTask(v17);
				p2.activeMidnightMaid:GiveTask(v18);
				local l__OutdoorAmbient__21 = l__Lighting__15.OutdoorAmbient;
				local l__Ambient__22 = l__Lighting__15.Ambient;
				local l__Brightness__23 = l__Lighting__15.Brightness;
				p2.activeMidnightMaid:GiveTask(function()
					l__Lighting__15.OutdoorAmbient = l__OutdoorAmbient__21;
					l__Lighting__15.Ambient = l__Ambient__22;
					l__Lighting__15.Brightness = l__Brightness__23;
					v16.Parent = l__Lighting__15;
					v14:Destroy();
				end);
				local v19 = {};
				for v20, v21 in ipairs(l__CollectionService__16:GetTagged("DisableDuringMidnight")) do
					if v21:IsA("PointLight") and v21.Enabled == true then
						v21.Enabled = false;
						table.insert(v19, v21);
					end;
				end;
				p2.activeMidnightMaid:GiveTask(function()
					for v22, v23 in ipairs(v19) do
						v23.Enabled = true;
					end;
				end);
				local l__Volume__24 = v12.Volume;
				l__default__17(1, l__InQuad__18, function(p5)
					v17.Brightness = -0.05 * p5;
					v17.Contrast = 0.05 * p5;
					v17.TintColor = Color3.fromRGB(255, 255, 255):Lerp(u10.correctionTintColor, p5);
					v18.FarIntensity = u10.farIntensity * p5;
					v14.Density = u10.atmosphereDensity * p5 + v16.Density * (1 - p5);
					v14.Color = v16.Color:Lerp(u10.atmosphereColor, p5);
					v14.Decay = v16.Decay:Lerp(u10.atmosphereDecay, p5);
					v14.Haze = u10.atmosphereHaze * p5 + v16.Haze * (1 - p5);
					v12.Volume = p5 * l__Volume__24;
				end, 0, 1);
			end;
		end;
	end);
	l__KnitClient__19.Controllers.KitController:watchLocalKit(function(p6)
		if p6 == l__BedwarsKit__20.MIDNIGHT then
			p2:onEnabled();
		end;
	end);
end;
local l__default__25 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__Flamework__26 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.onEnabled(p7)
	local v24 = u2.new();
	p7.kitMaid = v24;
	l__default__25.Warn("Is using midnight kit");
	v24:GiveTask(l__Flamework__26.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__6.MIDNIGHT, {
		interactionKey = Enum.KeyCode.V, 
		gamepadInteractionKey = Enum.KeyCode.Y, 
		text = "Activate Midnight"
	}));
end;
u1 = l__KnitClient__19.CreateController;
u1 = u1(v4.new());
return nil;
