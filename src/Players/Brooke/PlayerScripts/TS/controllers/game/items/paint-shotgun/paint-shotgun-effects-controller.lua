-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "PaintShotgunEffectsController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "PaintShotgunEffectsController";
	p1.hitMarkerOverflow = 0;
	p1.effectCooldown = {};
end;
local l__WatchCharacter__1 = v2.WatchCharacter;
local l__Players__2 = v4.Players;
local l__AnimatorAdded__3 = v2.AnimatorAdded;
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__MapUtil__7 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__ExpireList__8 = v2.ExpireList;
local l__PaintShotgunConstants__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "paint-shotgun", "paint-shotgun-constants").PaintShotgunConstants;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__RunService__11 = v4.RunService;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__WatchCharacter__1(function(p3, p4, p5)
		if p3 == l__Players__2.LocalPlayer then
			return nil;
		end;
		l__AnimatorAdded__3(p4:WaitForChild("Humanoid"), function(p6)
			p6.AnimationPlayed:Connect(function(p7)
				local v8 = p7.Animation;
				if v8 ~= nil then
					v8 = v8.AnimationId;
				end;
				if v8 == l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.PAINT_SHOTGUN_SHOOT) then
					local v9 = l__InventoryUtil__6.getInventory(p3).hand;
					if v9 ~= nil then
						v9 = v9.tool;
					end;
					if v9 then
						local v10 = l__MapUtil__7.getOrCreate(p2.effectCooldown, p3.UserId, l__ExpireList__8.new(l__PaintShotgunConstants__9.COOLDOWN * 0.9));
						if #v10:getValues() >= 2 then
							return nil;
						end;
						v10:add(math.random());
						p2:playShotgunEffect(p4);
					end;
				end;
			end);
		end);
	end);
	l__default__10.Client:OnEvent("RemoteName", function(p8)
		if p8.entityInstance.PrimaryPart and p8.fromEntity and l__Players__2:GetPlayerFromCharacter(p8.fromEntity) == l__Players__2.LocalPlayer and p8.extra.paintBlast then
			p2.hitMarkerOverflow = math.min(p2.hitMarkerOverflow + 1, 3);
		end;
	end);
	local u14 = 0;
	l__RunService__11.RenderStepped:Connect(function()
		if tick() - u14 < 0.1 then
			return nil;
		end;
		if p2.hitMarkerOverflow > 0 then
			p2.hitMarkerOverflow = p2.hitMarkerOverflow - 1;
			l__SoundManager__12:playSound(l__GameSound__13.ARROW_HIT, {
				volumeMultiplier = 0.2
			});
			u14 = tick();
		end;
	end);
end;
local l__Workspace__15 = v4.Workspace;
local l__KnitClient__16 = v3.KnitClient;
local l__ItemType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v6.playShotgunEffect(p9, p10)
	local v11 = l__Workspace__15.CurrentCamera;
	if v11 ~= nil then
		v11 = v11.CFrame.Position;
	end;
	if not v11 or (p10:GetPrimaryPartCFrame().Position - v11).Magnitude > 300 then
		return nil;
	end;
	local v12 = {};
	if p10 ~= l__Players__2.LocalPlayer.Character then
		local v13 = p10:GetPrimaryPartCFrame().Position;
	else
		v13 = nil;
	end;
	v12.position = v13;
	l__SoundManager__12:playSound(l__GameSound__13.PAINT_SHOTGUN_BLAST, v12);
	local v14 = p10;
	if p10 == l__Players__2.LocalPlayer.Character and l__KnitClient__16.Controllers.ViewmodelController:isVisible() then
		local v15 = l__KnitClient__16.Controllers.ViewmodelController:getViewModel();
		if v15 then
			v14 = v15;
		end;
	end;
	local v16 = v14:FindFirstChild(l__ItemType__17.PAINT_SHOTGUN);
	if not v16 then
		return nil;
	end;
	l__EffectUtil__18:playEffects(v16:GetDescendants(), nil);
end;
local v17 = v3.KnitClient.CreateController(v6.new());
return nil;
