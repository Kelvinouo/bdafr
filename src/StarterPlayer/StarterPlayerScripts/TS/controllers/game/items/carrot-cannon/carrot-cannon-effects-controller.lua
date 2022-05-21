-- Script Hash: de22bc8f9535dbcca45a980b73bf4cd607db1298fa99e571417fd7fd97999ad2b7e5d456b30c942a8caa151031085eaf
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "CarrotCannonEffectsController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "CarrotCannonEffectsController";
	p1.hitMarkerOverflow = 0;
	p1.effectCooldown = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v4.Players;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__WatchCharacter__5 = v2.WatchCharacter;
local l__AnimatorAdded__6 = v2.AnimatorAdded;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__MapUtil__10 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__ExpireList__11 = v2.ExpireList;
local l__CarrotCannonConstants__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "carrot-cannon", "carrot-cannon-constants").CarrotCannonConstants;
local l__RunService__13 = v4.RunService;
local l__SoundManager__14 = v2.SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if p4.shooter ~= l__Players__3.LocalPlayer then
				p2:playExplosion(p4.position);
			end;
		end);
	end);
	l__ClientSyncEvents__4.LocalProjectileImpact:connect(function(p5)
		if p5.projectile.Name == "carrot_rocket" then
			p2:playExplosion(p5.hitPosition);
		end;
	end);
	l__WatchCharacter__5(function(p6, p7, p8)
		l__AnimatorAdded__6(p7:WaitForChild("Humanoid"), function(p9)
			p9.AnimationPlayed:Connect(function(p10)
				local v8 = p10.Animation;
				if v8 ~= nil then
					v8 = v8.AnimationId;
				end;
				if v8 == l__GameAnimationUtil__7.getAssetId(l__AnimationType__8.CARROT_CANNON_SHOOT) then
					local v9 = l__InventoryUtil__9.getInventory(p6).hand;
					if v9 ~= nil then
						v9 = v9.tool;
					end;
					if v9 then
						local v10 = l__MapUtil__10.getOrCreate(p2.effectCooldown, p6.UserId, l__ExpireList__11.new(l__CarrotCannonConstants__12.COOLDOWN * 0.9));
						if #v10:getValues() >= 4 then
							return nil;
						end;
						v10:add(math.random());
						p2:playFireEffect(p7);
					end;
				end;
			end);
		end);
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p11)
		if p11.entityInstance.PrimaryPart and p11.fromEntity and p11.entityInstance ~= l__Players__3.LocalPlayer.Character and l__Players__3:GetPlayerFromCharacter(p11.fromEntity) == l__Players__3.LocalPlayer and p11.extra.paintBlast then
			p2.hitMarkerOverflow = math.min(p2.hitMarkerOverflow + 1, 3);
		end;
	end);
	local u16 = 0;
	l__RunService__13.RenderStepped:Connect(function()
		if tick() - u16 < 0.1 then
			return nil;
		end;
		if p2.hitMarkerOverflow > 0 then
			p2.hitMarkerOverflow = p2.hitMarkerOverflow - 1;
			l__SoundManager__14:playSound(l__GameSound__15.ARROW_HIT, {
				volumeMultiplier = 0.2
			});
			u16 = tick();
		end;
	end);
end;
local l__Workspace__17 = v4.Workspace;
local l__KnitClient__18 = v3.KnitClient;
local l__ItemType__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__EffectUtil__20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v6.playFireEffect(p12, p13)
	local v11 = l__Workspace__17.CurrentCamera;
	if v11 ~= nil then
		v11 = v11.CFrame.Position;
	end;
	if not v11 or (p13:GetPrimaryPartCFrame().Position - v11).Magnitude > 300 then
		return nil;
	end;
	local v12 = p13;
	if p13 == l__Players__3.LocalPlayer.Character and l__KnitClient__18.Controllers.ViewmodelController:isVisible() then
		local v13 = l__KnitClient__18.Controllers.ViewmodelController:getViewModel();
		if v13 then
			v12 = v13;
		end;
	end;
	local v14 = v12:FindFirstChild(l__ItemType__19.CARROT_CANNON);
	if not v14 then
		return nil;
	end;
	l__EffectUtil__20:playEffects(v14:GetDescendants(), nil);
end;
local l__ReplicatedStorage__21 = v4.ReplicatedStorage;
function v6.playExplosion(p14, p15)
	local v15 = l__ReplicatedStorage__21.Assets.Effects.Explosion:Clone();
	l__SoundManager__14:playSound(l__GameSound__15.TNT_EXPLODE_1, {
		position = p15, 
		rollOffMaxDistance = 200
	});
	l__SoundManager__14:playSound(l__GameSound__15.CARROT_LAUNCHER_IMPACT, {
		position = p15, 
		rollOffMaxDistance = 200
	});
	v15.Parent = l__Workspace__17;
	l__EffectUtil__20:playEffects({ v15 }, nil, {
		sizeMultiplier = 0.75
	});
	v15.CFrame = CFrame.new(p15);
	task.delay(2, function()
		v15:Destroy();
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
