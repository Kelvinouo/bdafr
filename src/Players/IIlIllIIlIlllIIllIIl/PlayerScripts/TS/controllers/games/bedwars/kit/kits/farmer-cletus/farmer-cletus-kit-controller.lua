-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__4 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FarmerCletusKitController";
	end, 
	__index = l__LegacyKitKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__LegacyKitKnitController__4;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.FARMER_CLETUS });
	p1.Name = "FarmerCletusKitController";
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__5 = v3.Players;
local l__BlockEngine__6 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Lighting__10 = v3.Lighting;
local l__GameQueryUtil__11 = v2.GameQueryUtil;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__13 = v2.Empty;
local l__ItemViewport__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__TweenService__15 = v3.TweenService;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if l__Players__5.LocalPlayer.Character and l__Players__5.LocalPlayer:DistanceFromCharacter(l__BlockEngine__6:getWorldPosition(p4.blockPosition)) <= 100 then
				local v7 = l__BlockEngine__6:getWorldPosition(p4.blockPosition);
				if p4.player ~= l__Players__5.LocalPlayer then
					l__SoundManager__7:playSound(l__GameSound__8.CROP_HARVEST, {
						position = v7
					});
				end;
				local v8 = u9("Part", {
					Name = "HarvestCropFloatEffect", 
					Size = Vector3.new(1, 1, 1), 
					CFrame = CFrame.new(v7), 
					Transparency = 1, 
					Anchored = true, 
					CanCollide = false, 
					Parent = l__Lighting__10
				});
				l__GameQueryUtil__11:setQueryIgnored(v8, true);
				local v9 = u12.createRef();
				local v10 = u12.mount(u12.createElement("BillboardGui", {
					[u12.Ref] = v9, 
					Adornee = v8, 
					Size = UDim2.fromScale(2.5, 2.5), 
					LightInfluence = 0
				}, { u12.createElement(l__Empty__13, {
						Size = UDim2.fromScale(1, 1), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5)
					}, { u12.createElement(l__ItemViewport__14, {
							ItemType = p4.floatEffectItem or p4.itemType
						}) }) }), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
				l__TweenService__15:Create(v9:getValue(), TweenInfo.new(0.7), {
					StudsOffsetWorldSpace = Vector3.new(0, 3.2, 0)
				}):Play();
				v1.Promise.delay(0.5):andThen(function()
					l__TweenService__15:Create(v9:getValue(), TweenInfo.new(0.2), {
						Size = UDim2.fromScale(0, 0)
					}):Play();
				end);
				v1.Promise.delay(1.5):andThen(function()
					u12.unmount(v10);
				end);
			end;
		end);
	end);
end;
local l__CollectionTagAdded__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u17 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__getItemMeta__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Theme__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameAnimationUtil__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.onKitEnabled(p5)
	print("enabling farmer cletus kit controller!");
	l__CollectionTagAdded__16("BedwarsHarvestableCrop", function(p6)
		u17.new():GiveTask(u9("ProximityPrompt", {
			ActionText = "Harvest", 
			ObjectText = l__getItemMeta__18(p6.Name).displayName, 
			HoldDuration = 0, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			KeyboardKeyCode = l__Theme__19.promptKeyboardKey, 
			Parent = p6
		}).Triggered:Connect(function(p7)
			l__GameAnimationUtil__20.playAnimation(p7, l__AnimationType__21.PUNCH);
			l__SoundManager__7:playSound(l__GameSound__8.CROP_HARVEST);
			l__default__4.Client:Get("RemoteName"):CallServer({
				position = l__BlockEngine__6:getBlockPosition(p6.Position)
			});
		end));
	end);
end;
function u1.onKitDisabled(p8)

end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	FarmerCletusKitController = u2
};
return u1;
