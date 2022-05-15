
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GhostController";
	end, 
	__index = v4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "GhostController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.ProjectileLaunched:connect(function(p3)
		if p3.projectileType ~= "ghost" then
			return nil;
		end;
		p3.projectile:FindFirstChildOfClass("AnimationController"):LoadAnimation(l__GameAnimationUtil__3.getAnimation(l__AnimationType__4.GHOST_SPIN)):Play(0.05);
	end);
end;
local l__CollectableEntityType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
function v5.validCollectableEntityTypes(p4)
	return { l__CollectableEntityType__5.GHOST };
end;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
function v5.pickDisplayModel(p5, p6, p7)
	return {
		repStorageModel = l__ReplicatedStorage__6:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("Ghost"), 
		collectionTag = p6
	};
end;
local l__default__7 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__8 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__InventoryUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__11 = v3.Players;
local l__KnitClient__12 = v2.KnitClient;
function v5.onWillRemoveEntity(p8, p9, p10, p11, p12)
	local v7 = p12:GetPrimaryPartCFrame();
	if p11 then
		local v8 = p12:FindFirstChildOfClass("AnimationController"):LoadAnimation(l__GameAnimationUtil__3.getAnimation(l__AnimationType__4.GHOST_SPIN));
		v8:Play(0.3, nil, 0.2);
		l__default__7(1.4, l__InQuad__8, function(p13)
			local v9 = p11;
			if v9 ~= nil then
				v9 = v9.Character;
				if v9 ~= nil then
					v9 = v9:GetPrimaryPartCFrame();
				end;
			end;
			local v10 = v9;
			if p11 and v10 then
				local l__hand__11 = l__InventoryUtil__9.getInventory(p11).hand;
				local v12 = l__hand__11;
				if v12 ~= nil then
					v12 = v12.tool;
				end;
				local v13 = v12 and l__hand__11.itemType == l__ItemType__10.VACUUM;
				if v13 then
					v10 = CFrame.new(l__hand__11.tool.Handle.Particle.WorldPosition) * (v10 - v10.Position);
				end;
			end;
			if not v10 then
				return nil;
			end;
			p12:SetPrimaryPartCFrame(v7:Lerp(v10 * CFrame.Angles(0, math.pi, 0), p13));
			v8:AdjustSpeed(0.2 + p13);
		end):Wait();
	end;
	if p11 == l__Players__11.LocalPlayer then
		l__KnitClient__12.Controllers.VacuumController:setLoaded();
		l__GameAnimationUtil__3.playAnimation(l__Players__11.LocalPlayer, l__AnimationType__4.VACUUM_GHOST_CAPTURED, {
			looped = false
		});
	end;
	return nil;
end;
function v5.onCreatedEntity(p14, p15, p16, p17)
	p17:SetPrimaryPartCFrame(p17:GetPrimaryPartCFrame() + Vector3.new(0, 3, 0));
	local v14 = p17:FindFirstChildOfClass("AnimationController");
	if v14 ~= nil then
		v14:LoadAnimation(l__GameAnimationUtil__3.getAnimation(l__AnimationType__4.GHOST_IDLE)):Play();
		task.spawn(function()
			while v1.Promise.delay(math.random(15, 25)):await() and p17.Parent do
				v14:LoadAnimation(l__GameAnimationUtil__3.getAnimation(l__AnimationType__4.GHOST_FLIP)):Play();			
			end;
		end);
	end;
	return nil;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

