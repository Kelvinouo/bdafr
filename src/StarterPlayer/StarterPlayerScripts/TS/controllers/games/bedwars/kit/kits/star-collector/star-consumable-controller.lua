-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "StarConsumableController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StarConsumableController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__8 = v2.Players;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u11 = v1.import(script, script.Parent, "ui", "star-collector-notification").StarCollectorNotification;
local l__StarCollectorDisplay__12 = v1.import(script, script.Parent, "ui", "star-collector-display").StarCollectorDisplay;
local l__EffectUtil__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v6 = l__EntityUtil__3:getEntity(p3.player);
		if v6 == nil then
			return nil;
		end;
		local v7 = v6:getInstance();
		if v7 == nil then
			return nil;
		end;
		l__SoundManager__4:playSound(l__GameSound__5.STAR_CRUSH, {
			position = v7.HumanoidRootPart.Position
		});
		local v8 = {};
		for v9, v10 in ipairs(l__ReplicatedStorage__6.Assets.Effects.ConsumeStarEffect:Clone():GetChildren()) do
			v10.Parent = v7.HumanoidRootPart;
			table.insert(v8, v10);
		end;
		if p3.starType == l__ItemType__7.VITALITY_STAR then
			for v11, v12 in ipairs(v8) do
				for v13, v14 in ipairs(v12:GetChildren()) do
					if v14:IsA("ParticleEmitter") then
						v14.Color = ColorSequence.new(Color3.fromRGB(85, 255, 127));
					end;
				end;
			end;
			if p3.player == l__Players__8.LocalPlayer then
				local u14 = l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u10.createElement(u11, {
					text = "health +1!", 
					textColor3 = Color3.fromRGB(85, 255, 127)
				}));
				task.delay(3, function()
					u14:DoCleaning();
				end);
			end;
		elseif p3.starType == l__ItemType__7.CRIT_STAR then
			for v15, v16 in ipairs(v8) do
				for v17, v18 in ipairs(v16:GetChildren()) do
					if v18:IsA("ParticleEmitter") then
						v18.Color = ColorSequence.new(Color3.fromRGB(253, 166, 91));
					end;
				end;
			end;
			if p3.player == l__Players__8.LocalPlayer then
				local u15 = l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u10.createElement(u11, {
					text = "crit +1!", 
					textColor3 = Color3.fromRGB(253, 166, 91)
				}));
				task.delay(3, function()
					u15:DoCleaning();
				end);
			end;
		end;
		if p3.player == l__Players__8.LocalPlayer then
			if not p2.starCollectorTree then
				p2.starCollectorTree = u10.mount(u10.createElement("ScreenGui", {
					ResetOnSpawn = false
				}, { u10.createElement(l__StarCollectorDisplay__12, {
						greenStars = p3.stats.greenStars, 
						yellowStars = p3.stats.yellowStars
					}) }), l__Players__8.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
			else
				u10.update(p2.starCollectorTree, u10.createElement("ScreenGui", {
					ResetOnSpawn = false
				}, { u10.createElement(l__StarCollectorDisplay__12, {
						greenStars = p3.stats.greenStars, 
						yellowStars = p3.stats.yellowStars
					}) }));
			end;
		end;
		l__EffectUtil__13:playEffects(v8, v7, {
			destroyAfterSec = 2
		});
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
