-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = {};
local l__PhysicsService__1 = v3.PhysicsService;
local u2 = v2.ConstantManager.registerConstants(script, {
	RelX = 0.8, 
	RelY = -0.6, 
	RelZ = 0
});
local l__Workspace__3 = v3.Workspace;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ProjectileMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__7 = v3.RunService;
local l__SharedSyncEvents__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local l__Players__9 = v3.Players;
local l__GrapplingHookFunctions__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookFunctions;
local l__GameQueryUtil__11 = v2.GameQueryUtil;
local l__CollectionService__12 = v3.CollectionService;
local l__EntityUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v4.fireProjectile(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	if p10 == nil then
		p10 = true;
	end;
	if not p2.PrimaryPart then
		error("Projectile " .. p2.Name .. " has no primary part.");
	end;
	for v5, v6 in ipairs((p2:GetDescendants())) do
		if v6:IsA("BasePart") then
			l__PhysicsService__1:SetPartCollisionGroup(v6, "DisablePlayerCollisions");
		end;
	end;
	local v7 = p9;
	if v7 ~= nil then
		v7 = v7.relative;
	end;
	if v7 ~= nil then
		local v8 = p9.relative.relX;
	else
		v8 = u2.RelX;
	end;
	local v9 = p9;
	if v9 ~= nil then
		v9 = v9.relative;
	end;
	if v9 ~= nil then
		local v10 = p9;
		if v10 ~= nil then
			v10 = v10.relative.relY;
		end;
		local v11 = v10;
	else
		v11 = u2.RelY;
	end;
	local v12 = p9;
	if v12 ~= nil then
		v12 = v12.relative;
	end;
	if v12 ~= nil then
		local v13 = p9;
		if v13 ~= nil then
			v13 = v13.relative.relZ;
		end;
		local v14 = v13;
	else
		v14 = u2.RelZ;
	end;
	p2:SetPrimaryPartCFrame(CFrame.new(p4, p4 + p5) * CFrame.new(Vector3.new(v8, v11, v14)));
	p2.Parent = l__Workspace__3;
	u4("BodyForce", {
		Parent = p2.PrimaryPart, 
		Force = Vector3.new(0, (l__Workspace__3.Gravity - p6) * p2.PrimaryPart.AssemblyMass, 0)
	});
	if p10 then
		p2.PrimaryPart:ApplyImpulse(p5 * p2.PrimaryPart.AssemblyMass);
	end;
	local v15 = l__ProjectileMeta__5[p2.Name];
	local u14 = u6.new();
	u14:GiveTask(p2.PrimaryPart.AncestryChanged:Connect(function()
		u14:DoCleaning();
	end));
	u14:GiveTask(p2.Destroying:Connect(function()
		u14:DoCleaning();
	end));
	local v16 = p9;
	if v16 ~= nil then
		v16 = v16.playerColilsionDisabled;
	end;
	local v17 = v16 == true;
	if not v17 then
		local v18 = v15;
		if v18 ~= nil then
			v18 = v18.playerCollisionDisabled;
		end;
		v17 = v18 == true;
	end;
	if v17 then
		l__PhysicsService__1:SetPartCollisionGroup(p2.PrimaryPart, "DisablePlayerCollisions");
	end;
	local v19 = p9;
	if v19 ~= nil then
		v19 = v19.collisionDisabled;
	end;
	local v20 = v19 == true;
	if not v20 then
		local v21 = v15;
		if v21 ~= nil then
			v21 = v21.collisionDisabled;
		end;
		v20 = v21 == true;
	end;
	if v20 then
		return nil;
	end;
	local u15 = true;
	u14:GiveTask(function()
		u15 = false;
	end);
	local u16 = false;
	local u17 = -1;
	local u18 = p4;
	u14:GiveTask(l__RunService__7.Heartbeat:Connect(function()
		local v22 = p2;
		if v22 ~= nil then
			v22 = v22.PrimaryPart;
		end;
		if not v22 then
			return nil;
		end;
		local v23 = v15;
		if v23 ~= nil then
			v23 = v23.returnDistance;
		end;
		if v23 ~= 0 and v23 == v23 and v23 then
			if p1 == nil then
				return nil;
			end;
			local v24 = p1.Character;
			if v24 ~= nil then
				v24 = v24.PrimaryPart;
				if v24 ~= nil then
					v24 = v24.CFrame;
				end;
			end;
			local l__CFrame__25 = p2.PrimaryPart.CFrame;
			if v24 == nil then
				return nil;
			end;
			local l__Magnitude__26 = (v24 - l__CFrame__25.Position).Position.Magnitude;
			if v15.returnDistance < l__Magnitude__26 and not u16 then
				u16 = true;
				u17 = tick();
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_BACKWARD_TRANSIT);
				end;
			elseif l__Magnitude__26 < 10 and u16 then
				u16 = false;
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p2:Destroy();
				u14:DoCleaning();
				return nil;
			end;
			if u16 then
				if v15.flightRotation then
					local l__flightRotation__27 = v15.flightRotation;
					local v28 = v24 * CFrame.Angles(l__flightRotation__27.X, l__flightRotation__27.Y, l__flightRotation__27.Z);
				end;
				p2:SetPrimaryPartCFrame((l__CFrame__25:Lerp(v24, (math.clamp((tick() - u17) / 0.2, 0, 1)))));
			end;
		end;
		local function v29(p11, p12, p13)
			if not u15 then
				return false;
			end;
			local v30 = p2;
			if v30 ~= nil then
				v30 = v30.PrimaryPart;
				if v30 ~= nil then
					v30 = v30.Parent;
				end;
			end;
			if not v30 or not p2.Parent then
				return false;
			end;
			if p1 and (not p1:IsDescendantOf(l__Players__9) or not p1.Character) then
				return false;
			end;
			if p12:IsDescendantOf(p2) then
				return false;
			end;
			if l__GameQueryUtil__11:isQueryIgnored(p12) then
				return false;
			end;
			if l__CollectionService__12:HasTag(p12, "ProjectilesIgnore") then
				return false;
			end;
			if p12:GetAttribute("IgnoreProjectileCollision") == true then
				return false;
			end;
			local v31 = p12.Parent;
			if v31 ~= nil then
				v31 = v31.Name;
			end;
			if v31 == "ArcParticles" then
				return false;
			end;
			local v32 = l__EntityUtil__13:getEntityFromDescendant(p12);
			if v32 then
				if p12:FindFirstAncestorWhichIsA("Accessory") or p12:IsA("Accessory") then
					return false;
				end;
				p12 = v32:getInstance().PrimaryPart and p12;
				if p1 then
					local v33 = l__EntityUtil__13:getEntity(p1);
				else
					v33 = nil;
				end;
				if v33 and not v33:canAttack(v32) then
					return false;
				end;
			end;
			if p13 and not v32 and table.find(l__CollectionService__12:GetTags(p12), "falling-block") == nil then
				return false;
			end;
			local v34 = p12:FindFirstAncestorOfClass("Model");
			if v34 and l__ProjectileMeta__5[v34.Name] ~= nil then
				return false;
			end;
			if p1 then
				local v35 = l__EntityUtil__13:getEntity(p1);
			else
				v35 = nil;
			end;
			if v35 then
				local v36 = p9;
				if v36 ~= nil then
					v36 = v36.projectileSource;
				end;
				local v37 = p9;
				if v37 ~= nil then
					v37 = v37.drawPercent;
				end;
				local v38 = v37;
				if v38 == nil then
					v38 = 1;
				end;
				local v39 = p9;
				if v39 ~= nil then
					v39 = v39.projectileDamageMult;
				end;
				local v40 = v39;
				if v40 == nil then
					v40 = 1;
				end;
				local v41 = p9;
				if v41 ~= nil then
					v41 = v41.metadata;
				end;
				if l__SharedSyncEvents__8.ProjectileHit:fire(v35, p2.Name, p2, p3, v36, {
					hitCFrame = CFrame.new(p11) * (p2:GetPrimaryPartCFrame() - p2:GetPrimaryPartCFrame().Position), 
					velocity = p2.PrimaryPart.Velocity, 
					part = p12
				}, v32, v38, v40, v41):isCancelled() then
					return false;
				end;
			end;
			p7(p11, p12);
			local v42 = v15;
			if v42 ~= nil then
				v42 = v42.keepProjectileOnHit;
			end;
			if not v42 then
				u14:DoCleaning();
			end;
			return true;
		end;
		local l__Position__43 = p2.PrimaryPart.CFrame.Position;
		local v44 = {};
		if u18 then
			table.insert(v44, (u18 + l__Position__43) / 2);
		end;
		table.insert(v44, l__Position__43);
		local v45 = v15;
		if v45 ~= nil then
			v45 = v45.hitscanRegionMultiplier;
		end;
		local v46 = v45;
		if v46 == nil then
			v46 = 1;
		end;
		local v47, v48, v49 = ipairs(v44);
		while true do
			local v50, v51 = v47(v48, v49);
			if not v50 then
				break;
			end;
			local v52 = p9;
			if v52 ~= nil then
				v52 = v52.getSuggestedTarget;
			end;
			if v52 then
				local v53 = p9.getSuggestedTarget();
				if v53 then
					local v54 = Region3.new(v51 - Vector3.new(6, 3, 6) * v46, v51 + Vector3.new(6, 3, 6) * v46);
					local v55 = OverlapParams.new();
					v55.FilterType = Enum.RaycastFilterType.Whitelist;
					v55.FilterDescendantsInstances = { v53 };
					for v56, v57 in ipairs((l__Workspace__3:GetPartBoundsInBox(v54.CFrame, v54.Size, v55))) do
						if v29(v51, v57, false) then
							return nil;
						end;
					end;
				end;
			end;
			local v58 = Region3.new(v51 - Vector3.new(1.5, 0.5, 1.5) * v46, v51 + Vector3.new(1.5, 0.5, 1.5) * v46);
			for v59, v60 in ipairs((l__Workspace__3:GetPartBoundsInBox(v58.CFrame, v58.Size))) do
				if v60:IsA("BasePart") and v29(v51, v60, true) then
					return nil;
				end;
			end;
			local v61 = v15;
			if v61 ~= nil then
				v61 = v61.wallHitscanRegionMultiplier;
			end;
			local v62 = v61;
			if v62 == nil then
				v62 = v46;
			end;
			local v63 = Region3.new(v51 - Vector3.new(0.5, 0.25, 0.5) * v62, v51 + Vector3.new(0.5, 0.25, 0.5) * v62);
			for v64, v65 in ipairs((l__Workspace__3:GetPartBoundsInBox(v63.CFrame, v63.Size))) do
				if v65:IsA("BasePart") and v29(v51, v65, false) then
					return nil;
				end;
			end;		
		end;
		u18 = l__Position__43;
	end));
end;
local l__Projectiles__19 = v3.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Projectiles");
local u20 = nil;
function v4.createProjectile(p14, p15, p16, p17)
	local v66 = l__ProjectileMeta__5[p15].projectileModel;
	if v66 == nil then
		v66 = p15;
	end;
	local v67 = l__Projectiles__19:WaitForChild(v66);
	assert(v67, "Projectile model for projectile " .. p15 .. " can't be found.");
	local v68 = v67:Clone();
	assert(v68.PrimaryPart, "Primary part missing on projectile " .. v68.Name);
	v68.Name = p15;
	if p17 == nil then
		return nil;
	end;
	v68:SetPrimaryPartCFrame(p17);
	v68.Parent = l__Workspace__3;
	v68:SetAttribute("ProjectileShooter", p14.UserId);
	l__CollectionService__12:AddTag(v68, u20(p14.UserId));
	return v68;
end;
u20 = function(p18)
	return "projectile:" .. tostring(p18);
end;
v4.getProjectileCST = u20;
local l__getItemMeta__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.getProjectileSource(p19, p20)
	local v69 = l__getItemMeta__21(p20.Name);
	if v69 == nil then
		return nil;
	end;
	local v70 = v69.projectileSource;
	if v70 == nil then
		local v71 = v69.block;
		if v71 ~= nil then
			v71 = v71.projectileSource;
		end;
		v70 = v71;
	end;
	local v72 = v70;
	if not v72 and p19 and v69.multiProjectileSource then
		v72 = v69.multiProjectileSource[p19];
	end;
	return v72;
end;
function v4.setupProjectileConstantOrientation(p21, p22)
	local v73 = u6.new();
	local v74 = l__ProjectileMeta__5[p21.Name];
	if v74.useServerModel and p22 ~= l__Players__9.LocalPlayer then
		return v73;
	end;
	local u22 = math.random() * 2 * math.pi;
	task.delay(0, function()
		local u23 = nil;
		local u24 = 0;
		v73:GiveTask(l__RunService__7.Heartbeat:Connect(function(p23)
			if not p21.Parent then
				v73:DoCleaning();
				return nil;
			end;
			if not u23 then
				u23 = p21:GetPrimaryPartCFrame();
			end;
			u24 = u24 + p23;
			local v75 = v74.lifetimeSec;
			if v75 == nil then
				v75 = 10;
			end;
			if v75 < u24 then
				local v76 = v74;
				if v76 ~= nil then
					v76 = v76.returnDistance;
				end;
				if v76 ~= 0 and v76 == v76 and v76 then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p21:Destroy();
				v73:DoCleaning();
				p21:Destroy();
				return nil;
			end;
			local l__Position__77 = p21:GetPrimaryPartCFrame().Position;
			local v78 = v74.flightRotation or Vector3.new();
			local v79 = CFrame.Angles(v78.X, v78.Y, v78.Z);
			local v80 = CFrame.new(l__Position__77, l__Position__77 + p21.PrimaryPart.Velocity);
			if v74.orbit then
				local v81 = u22 + u24 * math.pi * 6;
				local v82 = v74.orbit.radius;
				if v82 == nil then
					v82 = 0.5;
				end;
				local v83 = v74.orbit.timeTillMaxOrbit;
				if v83 == nil then
					v83 = 1;
				end;
				local v84 = v82 * math.min(u24 / v83, 1);
				v80 = CFrame.new(v80 * Vector3.new(v84 * math.sin(v81), v84 * math.cos(v81), 0)) * (v80 - v80.Position);
			end;
			if not v74.noArc then
				v80 = v80 * v79;
			end;
			p21:SetPrimaryPartCFrame(l__SharedSyncEvents__8.ProjectileRender:fire(p21, v74, v80, u24, p23).cframe);
		end));
		v73:GiveTask(l__RunService__7.Stepped:Connect(function(p24)
			if not p21.Parent then
				v73:DoCleaning();
				return nil;
			end;
			if u23 then
				p21:SetPrimaryPartCFrame(u23);
				u23 = nil;
			end;
		end));
	end);
	return v73;
end;
return {
	ProjectileUtil = v4
};
