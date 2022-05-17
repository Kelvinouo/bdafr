
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "MidnightAbilityController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__Maid__2 = v2.Maid;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MidnightAbilityController";
	p1.activeMidnightMaid = l__Maid__2.new();
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__4 = v3.Players;
local l__ClientSyncEvents__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__AbilityId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__PlayerEntity__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__Workspace__9 = v3.Workspace;
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
local l__TweenService__13 = v3.TweenService;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Lighting__15 = v3.Lighting;
local l__CollectionService__16 = v3.CollectionService;
local l__default__17 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__18 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__KnitClient__19 = v2.KnitClient;
local l__BedwarsKit__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__default__21 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		if p3.entityInstance == l__Players__4.LocalPlayer.Character then
			p2.activeMidnightMaid:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__5.AbilityUsed:connect(function(p4)
		if p4.ability == l__AbilityId__6.MIDNIGHT then
			local v7 = l__EntityUtil__7:getEntity(p4.userCharacter);
			if not v1.instanceof(v7, l__PlayerEntity__8) then
				return nil;
			end;
			local l__extra__8 = p4.extra;
			if v7:getPlayer() ~= l__Players__4.LocalPlayer then
				return nil;
			end;
			p2.activeMidnightMaid:DoCleaning();
			task.delay(l__extra__8.expirationTime - l__Workspace__9:GetServerTimeNow(), function()
				p2.activeMidnightMaid:DoCleaning();
			end);
			local v9 = l__extra__8.team == l__Players__4.LocalPlayer:GetAttribute("Team");
			local v10 = {};
			if v9 then
				local v11 = nil;
			else
				local v12 = v7:getInstance().PrimaryPart;
				if v12 ~= nil then
					v12 = v12.Position;
				end;
				v11 = v12;
			end;
			v10.position = v11;
			l__SoundManager__11:playSound(l__GameSound__12.MIDNIGHT_ACTIVATE, v10);
			if v9 then
				local v13 = l__SoundManager__11:playSound(l__GameSound__12.RAVEN_SPACE_AMBIENT);
				v13.Looped = true;
				v13.Volume = 0;
				p2.activeMidnightMaid:GiveTask(function()
					l__TweenService__13:Create(v13, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
						Volume = 0
					}):Play();
					task.delay(1, function()
						v13:Destroy();
					end);
				end);
				local v14 = u14("Folder", {
					Name = "Disabled", 
					Parent = l__Lighting__15
				});
				local v15 = l__Lighting__15:FindFirstChildWhichIsA("Atmosphere");
				local v16 = l__Lighting__15:FindFirstChildWhichIsA("SunRaysEffect");
				if v16 then
					v16.Parent = v14;
					p2.activeMidnightMaid:GiveTask(function()
						v16.Parent = l__Lighting__15;
					end);
				end;
				local v17 = v15:Clone();
				local v18 = u14("ColorCorrectionEffect", {
					Parent = l__Lighting__15
				});
				local v19 = u14("DepthOfFieldEffect", {
					Parent = l__Lighting__15, 
					FocusDistance = 19.76, 
					InFocusRadius = 28.2, 
					FarIntensity = 0, 
					NearIntensity = 0
				});
				l__Lighting__15.OutdoorAmbient = u10.outdoorAmbient;
				l__Lighting__15.Ambient = u10.ambient;
				l__Lighting__15.Brightness = u10.brightness;
				p2.activeMidnightMaid:GiveTask(v18);
				p2.activeMidnightMaid:GiveTask(v19);
				local l__OutdoorAmbient__22 = l__Lighting__15.OutdoorAmbient;
				local l__Ambient__23 = l__Lighting__15.Ambient;
				local l__Brightness__24 = l__Lighting__15.Brightness;
				p2.activeMidnightMaid:GiveTask(function()
					l__Lighting__15.OutdoorAmbient = l__OutdoorAmbient__22;
					l__Lighting__15.Ambient = l__Ambient__23;
					l__Lighting__15.Brightness = l__Brightness__24;
					v17.Parent = l__Lighting__15;
					v15:Destroy();
				end);
				local v20 = {};
				for v21, v22 in ipairs(l__CollectionService__16:GetTagged("DisableDuringMidnight")) do
					if v22:IsA("PointLight") and v22.Enabled == true then
						v22.Enabled = false;
						table.insert(v20, v22);
					end;
				end;
				p2.activeMidnightMaid:GiveTask(function()
					for v23, v24 in ipairs(v20) do
						v24.Enabled = true;
					end;
				end);
				local l__Volume__25 = v13.Volume;
				l__default__17(1, l__InQuad__18, function(p5)
					v18.Brightness = -0.05 * p5;
					v18.Contrast = 0.05 * p5;
					v18.TintColor = Color3.fromRGB(255, 255, 255):Lerp(u10.correctionTintColor, p5);
					v19.FarIntensity = u10.farIntensity * p5;
					v15.Density = u10.atmosphereDensity * p5 + v17.Density * (1 - p5);
					v15.Color = v17.Color:Lerp(u10.atmosphereColor, p5);
					v15.Decay = v17.Decay:Lerp(u10.atmosphereDecay, p5);
					v15.Haze = u10.atmosphereHaze * p5 + v17.Haze * (1 - p5);
					v13.Volume = p5 * l__Volume__25;
				end, 0, 1);
			end;
		end;
	end);
	if l__KnitClient__19.Controllers.KitController:isUsingKit(l__Players__4.LocalPlayer, l__BedwarsKit__20.MIDNIGHT) then
		p2:onEnabled();
	end;
	l__ClientSyncEvents__5.KitEquip:connect(function(p6)
		l__default__21.Warn("Kit equipped");
		if p6.player == l__Players__4.LocalPlayer and p6.kit == l__BedwarsKit__20.MIDNIGHT then
			p2:onEnabled();
		end;
	end);
end;
local l__Flamework__26 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v5.onEnabled(p7)
	local v25 = l__Maid__2.new();
	p7.kitMaid = v25;
	l__default__21.Warn("Is using midnight kit");
	v25:GiveTask(l__Flamework__26.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__6.MIDNIGHT, {
		interactionKey = Enum.KeyCode.V, 
		gamepadInteractionKey = Enum.KeyCode.Y, 
		text = "Activate Midnight"
	}));
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

