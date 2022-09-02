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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "AutoTurretController";
	p1.turret = nil;
	p1.lastShotTime = 0;
	p1.turrets = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__2 = v3.Players;
local l__RunService__3 = v3.RunService;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		if p3.player == l__Players__2.LocalPlayer then
			p2.turret = p3.turret;
			table.insert(p2.turrets, p3.turret);
			print("TURRET PLACED!");
		end;
	end);
	l__RunService__3.Heartbeat:Connect(function()
		if p2.lastShotTime + 1 <= time() then
			local v7, v8, v9 = ipairs(p2.turrets);
			while true do
				v7(v8, v9);
				if not v7 then
					break;
				end;
				p2.lastShotTime = time();
				print("In WatchTag 54");
				local v10 = nil;
				if v10 == nil then
					v10 = p2:findTarget(v8);
				end;
				if p2:validateTarget(v8, v10) then
					local v11 = v10;
					if v11 ~= nil then
						v11 = v11:getInstance():GetPrimaryPartCFrame().Position;
					end;
					local l__Rotate__12 = v8:WaitForChild("Rotate", 3);
					if l__Rotate__12 and v11 then
						l__Rotate__12.CFrame = CFrame.lookAt(l__Rotate__12.Position, v11);
						l__default__1.Client:Get("RemoteName"):SendToServer({
							turret = v8, 
							targetPosition = v11
						});
					end;
					p2:fire(l__Players__2.LocalPlayer, v8, v10);
				end;			
			end;
		end;
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p4)
		if not p4.targetPosition or not p4.turret then
			return nil;
		end;
		local l__Rotate__13 = p4.turret:WaitForChild("Rotate", 3);
		if l__Rotate__13 then
			l__Rotate__13.CFrame = CFrame.lookAt(l__Rotate__13.Position, p4.targetPosition);
		end;
	end);
end;
local l__Workspace__4 = v3.Workspace;
local l__getItemMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__ProjectileHandler__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__KnitClient__8 = v2.KnitClient;
function v5.fire(p5, p6, p7, p8)
	if not p7:IsDescendantOf(l__Workspace__4) then
		print("99");
		return nil;
	end;
	local v14 = l__getItemMeta__5(l__ItemType__6.AUTO_TURRET).block;
	if v14 ~= nil then
		v14 = v14.projectileSource;
	end;
	if not v14 or not p8 then
		return nil;
	end;
	l__KnitClient__8.Controllers.ProjectileController:launchProjectile(l__ItemType__6.AUTO_TURRET, nil, l__ProjectileHandler__7.new(1, 1, "arrow", nil, p8:getInstance():GetPrimaryPartCFrame().Position, Vector3.new(0, 0, 0)), p7, v14);
end;
local l__GameWorldUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
function v5.findTarget(p9, p10)
	local v15 = l__GameWorldUtil__9.getEntitiesWithinRadius(p10.Position, 50);
	if #v15 == 0 then
		return nil;
	end;
	local v16 = nil;
	local v17, v18, v19 = ipairs(v15);
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		if not l__Players__2:GetPlayerFromCharacter(v18:getInstance()) then
			if p9:canSee(p10, v18) then
				return v18;
			end;
			v16 = v18;
		end;	
	end;
	return v16;
end;
function v5.validateTarget(p11, p12, p13)
	local v20 = not p13;
	if not v20 then
		local v21 = p13;
		if v21 ~= nil then
			v21 = v21:isDead();
		end;
		v20 = v21;
	end;
	if v20 then
		return false;
	end;
	if (p13:getInstance():GetPrimaryPartCFrame().Position - p12.Position).Magnitude > 50 then
		return false;
	end;
	return true;
end;
local l__GameQueryUtil__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
function v5.canSee(p14, p15, p16)
	if not p16 then
		return false;
	end;
	local v22 = p15.Position - Vector3.new(0, 1.5, 0);
	local v23 = p16:getInstance();
	local v24 = v23:FindFirstChildWhichIsA("Humanoid");
	if not v23.PrimaryPart then
		local v25 = nil;
	elseif not v24 then
		v25 = nil;
	else
		v25 = v23.PrimaryPart.Position + Vector3.new(0, -1 * (v24.HipHeight + v23.PrimaryPart.Size.Y / 2), 0);
	end;
	if not v22 or not v25 then
		return false;
	end;
	local v26 = v22 + Vector3.new(0, 4, 0);
	local v27 = v25 + Vector3.new(0, 4, 0);
	local v28 = { p15, p16:getInstance() };
	local v29 = RaycastParams.new();
	v29.FilterDescendantsInstances = v28;
	v29.FilterType = Enum.RaycastFilterType.Blacklist;
	local v30 = l__GameQueryUtil__10:raycast(v22, v25 - v22, v29) ~= nil;
	if not v30 then
		local v31 = RaycastParams.new();
		v31.FilterDescendantsInstances = v28;
		v31.FilterType = Enum.RaycastFilterType.Blacklist;
		v30 = l__GameQueryUtil__10:raycast(v25, v22 - v25, v31) ~= nil;
	end;
	local v32 = not v30;
	if not v32 then
		local v33 = RaycastParams.new();
		v33.FilterDescendantsInstances = v28;
		v33.FilterType = Enum.RaycastFilterType.Blacklist;
		local v34 = l__GameQueryUtil__10:raycast(v26, v27 - v26, v33) ~= nil;
		if not v34 then
			local v35 = RaycastParams.new();
			v35.FilterDescendantsInstances = v28;
			v35.FilterType = Enum.RaycastFilterType.Blacklist;
			v34 = l__GameQueryUtil__10:raycast(v27, v26 - v27, v35) ~= nil;
		end;
		v32 = not v34;
		if not v32 then
			local v36 = (v22 + v26) / 2;
			local v37 = (v25 + v27) / 2;
			local v38 = RaycastParams.new();
			v38.FilterDescendantsInstances = v28;
			v38.FilterType = Enum.RaycastFilterType.Blacklist;
			local v39 = l__GameQueryUtil__10:raycast(v36, v37 - v36, v38) ~= nil;
			if not v39 then
				local v40 = RaycastParams.new();
				v40.FilterDescendantsInstances = v28;
				v40.FilterType = Enum.RaycastFilterType.Blacklist;
				v39 = l__GameQueryUtil__10:raycast(v37, v36 - v37, v40) ~= nil;
			end;
			v32 = not v39;
		end;
	end;
	return v32;
end;
local v41 = v2.KnitClient.CreateController(v5.new());
return nil;
