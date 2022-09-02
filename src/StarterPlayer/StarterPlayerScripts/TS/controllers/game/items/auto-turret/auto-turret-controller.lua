-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "AutoTurretController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "AutoTurretController";
	p1.turret = nil;
	p1.lastShotTime = 0;
	p1.turrets = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v3.Players;
local l__RunService__4 = v3.RunService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:Get("RemoteName"):Connect(function(p3)
		if p3.player == l__Players__3.LocalPlayer then
			p2.turret = p3.turret;
			table.insert(p2.turrets, p3.turret);
			print("TURRET PLACED!");
		end;
	end);
	l__RunService__4.Heartbeat:Connect(function()
		if p2.lastShotTime + 1 <= time() then
			local v7, v8, v9 = ipairs(p2.turrets);
			while true do
				local v10, v11 = v7(v8, v9);
				if not v10 then
					break;
				end;
				p2.lastShotTime = time();
				print("In WatchTag 54");
				local v12 = nil;
				if v12 == nil then
					v12 = p2:findTarget(v11);
				end;
				if p2:validateTarget(v11, v12) then
					local v13 = v12;
					if v13 ~= nil then
						v13 = v13:getInstance():GetPrimaryPartCFrame().Position;
					end;
					local l__Rotate__14 = v11:WaitForChild("Rotate", 3);
					if l__Rotate__14 and v13 then
						l__Rotate__14.CFrame = CFrame.lookAt(l__Rotate__14.Position, v13);
						l__default__2.Client:Get("RemoteName"):SendToServer({
							turret = v11, 
							targetPosition = v13
						});
					end;
					p2:fire(l__Players__3.LocalPlayer, v11, v12);
				end;			
			end;
		end;
	end);
	l__default__2.Client:Get("RemoteName"):Connect(function(p4)
		if not p4.targetPosition or not p4.turret then
			return nil;
		end;
		local l__Rotate__15 = p4.turret:WaitForChild("Rotate", 3);
		if l__Rotate__15 then
			l__Rotate__15.CFrame = CFrame.lookAt(l__Rotate__15.Position, p4.targetPosition);
		end;
	end);
end;
local l__Workspace__5 = v3.Workspace;
local l__getItemMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__ProjectileHandler__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__KnitClient__9 = v2.KnitClient;
function v5.fire(p5, p6, p7, p8)
	if not p7:IsDescendantOf(l__Workspace__5) then
		print("99");
		return nil;
	end;
	local v16 = l__getItemMeta__6(l__ItemType__7.AUTO_TURRET).block;
	if v16 ~= nil then
		v16 = v16.projectileSource;
	end;
	if not v16 or not p8 then
		return nil;
	end;
	l__KnitClient__9.Controllers.ProjectileController:launchProjectile(l__ItemType__7.AUTO_TURRET, nil, l__ProjectileHandler__8.new(1, 1, "arrow", nil, p8:getInstance():GetPrimaryPartCFrame().Position, Vector3.new(0, 0, 0)), p7, v16);
end;
local l__GameWorldUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
function v5.findTarget(p9, p10)
	local v17 = l__GameWorldUtil__10.getEntitiesWithinRadius(p10.Position, 50);
	if #v17 == 0 then
		return nil;
	end;
	local v18 = nil;
	for v19, v20 in ipairs(v17) do
		if not l__Players__3:GetPlayerFromCharacter(v20:getInstance()) then
			if p9:canSee(p10, v20) then
				return v20;
			end;
			v18 = v20;
		end;
	end;
	return v18;
end;
function v5.validateTarget(p11, p12, p13)
	local v21 = not p13;
	if not v21 then
		local v22 = p13;
		if v22 ~= nil then
			v22 = v22:isDead();
		end;
		v21 = v22;
	end;
	if v21 then
		return false;
	end;
	if (p13:getInstance():GetPrimaryPartCFrame().Position - p12.Position).Magnitude > 50 then
		return false;
	end;
	return true;
end;
local l__GameQueryUtil__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
function v5.canSee(p14, p15, p16)
	if not p16 then
		return false;
	end;
	local v23 = p15.Position - Vector3.new(0, 1.5, 0);
	local v24 = p16:getInstance();
	local v25 = v24:FindFirstChildWhichIsA("Humanoid");
	if not v24.PrimaryPart then
		local v26 = nil;
	elseif not v25 then
		v26 = nil;
	else
		v26 = v24.PrimaryPart.Position + Vector3.new(0, -1 * (v25.HipHeight + v24.PrimaryPart.Size.Y / 2), 0);
	end;
	if not v23 or not v26 then
		return false;
	end;
	local v27 = v23 + Vector3.new(0, 4, 0);
	local v28 = v26 + Vector3.new(0, 4, 0);
	local v29 = { p15, p16:getInstance() };
	local v30 = RaycastParams.new();
	v30.FilterDescendantsInstances = v29;
	v30.FilterType = Enum.RaycastFilterType.Blacklist;
	local v31 = l__GameQueryUtil__11:raycast(v23, v26 - v23, v30) ~= nil;
	if not v31 then
		local v32 = RaycastParams.new();
		v32.FilterDescendantsInstances = v29;
		v32.FilterType = Enum.RaycastFilterType.Blacklist;
		v31 = l__GameQueryUtil__11:raycast(v26, v23 - v26, v32) ~= nil;
	end;
	local v33 = not v31;
	if not v33 then
		local v34 = RaycastParams.new();
		v34.FilterDescendantsInstances = v29;
		v34.FilterType = Enum.RaycastFilterType.Blacklist;
		local v35 = l__GameQueryUtil__11:raycast(v27, v28 - v27, v34) ~= nil;
		if not v35 then
			local v36 = RaycastParams.new();
			v36.FilterDescendantsInstances = v29;
			v36.FilterType = Enum.RaycastFilterType.Blacklist;
			v35 = l__GameQueryUtil__11:raycast(v28, v27 - v28, v36) ~= nil;
		end;
		v33 = not v35;
		if not v33 then
			local v37 = (v23 + v27) / 2;
			local v38 = (v26 + v28) / 2;
			local v39 = RaycastParams.new();
			v39.FilterDescendantsInstances = v29;
			v39.FilterType = Enum.RaycastFilterType.Blacklist;
			local v40 = l__GameQueryUtil__11:raycast(v37, v38 - v37, v39) ~= nil;
			if not v40 then
				local v41 = RaycastParams.new();
				v41.FilterDescendantsInstances = v29;
				v41.FilterType = Enum.RaycastFilterType.Blacklist;
				v40 = l__GameQueryUtil__11:raycast(v38, v37 - v38, v41) ~= nil;
			end;
			v33 = not v40;
		end;
	end;
	return v33;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
