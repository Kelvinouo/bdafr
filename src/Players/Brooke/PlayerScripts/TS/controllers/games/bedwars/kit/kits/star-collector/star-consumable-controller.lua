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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "StarConsumableController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__7 = v2.Players;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u10 = v1.import(script, script.Parent, "ui", "star-collector-notification").StarCollectorNotification;
local l__KnitClient__11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__StarCollectorDisplay__12 = v1.import(script, script.Parent, "ui", "star-collector-display").StarCollectorDisplay;
local l__EffectUtil__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v6 = l__EntityUtil__2:getEntity(p3.player);
		if v6 == nil then
			return nil;
		end;
		local v7 = v6:getInstance();
		if v7 == nil then
			return nil;
		end;
		l__SoundManager__3:playSound(l__GameSound__4.STAR_CRUSH, {
			position = v7.HumanoidRootPart.Position
		});
		local v8 = {};
		local v9, v10, v11 = ipairs(l__ReplicatedStorage__5.Assets.Effects.ConsumeStarEffect:Clone():GetChildren());
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			v10.Parent = v7.HumanoidRootPart;
			table.insert(v8, v10);		
		end;
		if p3.starType == l__ItemType__6.VITALITY_STAR then
			local v12, v13, v14 = ipairs(v8);
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				v14 = v12;
				local v15, v16, v17 = ipairs(v13:GetChildren());
				while true do
					v15(v16, v17);
					if not v15 then
						break;
					end;
					v17 = v15;
					if v16:IsA("ParticleEmitter") then
						v16.Color = ColorSequence.new(Color3.fromRGB(85, 255, 127));
					end;				
				end;			
			end;
			if p3.player == l__Players__7.LocalPlayer then
				local u14 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u10, {
					text = "health +1!", 
					textColor3 = Color3.fromRGB(85, 255, 127)
				}));
				task.delay(3, function()
					u14:DoCleaning();
				end);
			end;
		elseif p3.starType == l__ItemType__6.CRIT_STAR then
			local v18, v19, v20 = ipairs(v8);
			while true do
				v18(v19, v20);
				if not v18 then
					break;
				end;
				v20 = v18;
				local v21, v22, v23 = ipairs(v19:GetChildren());
				while true do
					v21(v22, v23);
					if not v21 then
						break;
					end;
					v23 = v21;
					if v22:IsA("ParticleEmitter") then
						v22.Color = ColorSequence.new(Color3.fromRGB(253, 166, 91));
					end;				
				end;			
			end;
			if p3.player == l__Players__7.LocalPlayer then
				local u15 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u10, {
					text = "crit +1!", 
					textColor3 = Color3.fromRGB(253, 166, 91)
				}));
				task.delay(3, function()
					u15:DoCleaning();
				end);
			end;
		end;
		if p3.player == l__Players__7.LocalPlayer then
			if not p2.starCollectorTree then
				p2.starCollectorTree = l__KnitClient__11.Controllers.StatusInfoListController:waitForSetupAddElement(u9.createElement(l__StarCollectorDisplay__12, {
					greenStars = p3.stats.greenStars, 
					yellowStars = p3.stats.yellowStars
				}));
			else
				u9.update(p2.starCollectorTree, u9.createElement(l__StarCollectorDisplay__12, {
					greenStars = p3.stats.greenStars, 
					yellowStars = p3.stats.yellowStars
				}));
			end;
		end;
		l__EffectUtil__13:playEffects(v8, v7, {
			destroyAfterSec = 2
		});
	end);
end;
local v24 = l__KnitClient__11.CreateController(v4.new());
return nil;
