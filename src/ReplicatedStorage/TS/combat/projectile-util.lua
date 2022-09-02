-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = {};
local l__PhysicsService__1 = v3.PhysicsService;
local u2 = v2.ConstantManager.registerConstants(script, {
	RelX = 0.8, 
	RelY = -0.6, 
	RelZ = 0, 
	DebugLagCompensation = false, 
	LagCompensation = true
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
local l__KnitServer__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitServer;
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local l__Debris__16 = v3.Debris;
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
	local u17 = u6.new();
	u17:GiveTask(p2.PrimaryPart.AncestryChanged:Connect(function()
		u17:DoCleaning();
	end));
	u17:GiveTask(p2.Destroying:Connect(function()
		u17:DoCleaning();
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
	local u18 = true;
	u17:GiveTask(function()
		u18 = false;
	end);
	local u19 = 0;
	local u20 = false;
	local u21 = -1;
	local u22 = p4;
	u17:GiveTask(l__RunService__7.Heartbeat:Connect(function(p11)
		u19 = u19 + p11;
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
			if v15.returnDistance < l__Magnitude__26 and not u20 then
				u20 = true;
				u21 = tick();
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_BACKWARD_TRANSIT);
				end;
			elseif l__Magnitude__26 < 10 and u20 then
				u20 = false;
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p2:Destroy();
				u17:DoCleaning();
				return nil;
			end;
			if u20 then
				if v15.flightRotation then
					local l__flightRotation__27 = v15.flightRotation;
					local v28 = v24 * CFrame.Angles(l__flightRotation__27.X, l__flightRotation__27.Y, l__flightRotation__27.Z);
				end;
				p2:SetPrimaryPartCFrame((l__CFrame__25:Lerp(v24, (math.clamp((tick() - u21) / 0.2, 0, 1)))));
			end;
		end;
		local function v29(p12, p13, p14)
			if not u18 then
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
			if p13:IsDescendantOf(p2) then
				return false;
			end;
			if l__GameQueryUtil__11:isQueryIgnored(p13) and not l__CollectionService__12:HasTag(p13, "Hitbox") then
				return false;
			end;
			if l__CollectionService__12:HasTag(p13, "ProjectilesIgnore") then
				return false;
			end;
			if p13:GetAttribute("IgnoreProjectileCollision") == true then
				return false;
			end;
			local v31 = p13.Parent;
			if v31 ~= nil then
				v31 = v31.Name;
			end;
			if v31 == "ArcParticles" then
				return false;
			end;
			local v32 = l__EntityUtil__13:getEntityFromDescendant(p13);
			if l__CollectionService__12:HasTag(p13, "Hitbox") then
				local l__EntityValue__33 = p13:FindFirstChild("EntityValue");
				if l__EntityValue__33 and l__EntityValue__33.Value then
					v32 = l__EntityUtil__13:getEntity(l__EntityValue__33.Value);
				end;
			end;
			if v32 then
				if p13:FindFirstAncestorWhichIsA("Accessory") or p13:IsA("Accessory") then
					return false;
				end;
				p13 = v32:getInstance().PrimaryPart and p13;
				if p1 then
					local v34 = l__EntityUtil__13:getEntity(p1);
				else
					v34 = nil;
				end;
				if v34 and not v34:canAttack(v32) then
					return false;
				end;
			end;
			if p14 and not v32 and table.find(l__CollectionService__12:GetTags(p13), "falling-block") == nil then
				return false;
			end;
			local v35 = p13:FindFirstAncestorOfClass("Model");
			if v35 and l__ProjectileMeta__5[v35.Name] ~= nil then
				return false;
			end;
			if p1 then
				local v36 = l__EntityUtil__13:getEntity(p1);
			else
				v36 = nil;
			end;
			local v37 = p9;
			if v37 ~= nil then
				v37 = v37.npcShooterEntity;
			end;
			if v36 or v37 then
				local v38 = p9;
				if v38 ~= nil then
					v38 = v38.projectileSource;
				end;
				local v39 = p9;
				if v39 ~= nil then
					v39 = v39.drawPercent;
				end;
				local v40 = v39;
				if v40 == nil then
					v40 = 1;
				end;
				local v41 = p9;
				if v41 ~= nil then
					v41 = v41.projectileDamageMult;
				end;
				local v42 = v41;
				if v42 == nil then
					v42 = 1;
				end;
				local v43 = p9;
				if v43 ~= nil then
					v43 = v43.metadata;
				end;
				if l__SharedSyncEvents__8.ProjectileHit:fire(v36 and v37, p2.Name, p2, p3, v38, {
					hitCFrame = CFrame.new(p12) * (p2:GetPrimaryPartCFrame() - p2:GetPrimaryPartCFrame().Position), 
					velocity = p2.PrimaryPart.Velocity, 
					part = p13
				}, v32, v40, v42, v43):isCancelled() then
					return false;
				end;
			end;
			p7(p12, p13);
			local v44 = v15;
			if v44 ~= nil then
				v44 = v44.keepProjectileOnHit;
			end;
			if not v44 then
				u17:DoCleaning();
			end;
			return true;
		end;
		local v45 = l__RunService__7:IsServer();
		if v45 then
			local v46 = p9;
			if v46 ~= nil then
				v46 = v46.serverTime;
			end;
			v45 = v46;
			if v45 ~= 0 and v45 == v45 and v45 then
				v45 = u2.LagCompensation;
			end;
		end;
		if v45 ~= 0 and v45 == v45 and v45 then
			l__KnitServer__14.Services.LagCompensationService:pushToPointInTime(p9.serverTime + u19);
		end;
		if u2.DebugLagCompensation then
			for v47, v48 in ipairs(l__Players__9:GetPlayers()) do
				if l__RunService__7:IsServer() and v48.Character then
					local v49 = l__KnitServer__14.Services.LagCompensationService:getHitbox(v48.Character);
					if v49 then
						local v50 = u15.box(CFrame.new(v49.Position) * CFrame.new(0, 1, 0), Vector3.new(2, 4, 2), Color3.fromRGB(255, 0, 0));
						v50.Transparency = 0.9;
						l__GameQueryUtil__11:setQueryIgnored(v50, true);
						l__Debris__16:AddItem(v50, 5);
					end;
				elseif l__RunService__7:IsClient() and v48.Character then
					local v51 = u15.box(CFrame.new(v48.Character:GetPrimaryPartCFrame().Position), Vector3.new(2, 4, 2) * 0.9, Color3.fromRGB(0, 255, 0));
					v51.Transparency = 0.9;
					l__GameQueryUtil__11:setQueryIgnored(v51, true);
					l__Debris__16:AddItem(v51, 5);
				end;
			end;
		end;
		local function v52()
			local v53 = l__RunService__7:IsServer();
			if v53 then
				local v54 = p9;
				if v54 ~= nil then
					v54 = v54.serverTime;
				end;
				v53 = v54;
				if v53 ~= 0 and v53 == v53 and v53 then
					v53 = u2.LagCompensation;
				end;
			end;
			if v53 ~= 0 and v53 == v53 and v53 then
				l__KnitServer__14.Services.LagCompensationService:pop();
			end;
		end;
		local l__Position__55 = p2.PrimaryPart.CFrame.Position;
		local v56 = {};
		if u22 then
			table.insert(v56, (u22 + l__Position__55) / 2);
		end;
		table.insert(v56, l__Position__55);
		local v57 = v15;
		if v57 ~= nil then
			v57 = v57.hitscanRegionMultiplier;
		end;
		local v58 = v57;
		if v58 == nil then
			v58 = 1;
		end;
		local v59, v60, v61 = ipairs(v56);
		while true do
			local v62, v63 = v59(v60, v61);
			if not v62 then
				break;
			end;
			local v64 = p9;
			if v64 ~= nil then
				v64 = v64.getSuggestedTarget;
			end;
			if v64 then
				local v65 = p9.getSuggestedTarget();
				if v65 then
					local v66 = Region3.new(v63 - Vector3.new(6, 3, 6) * v58, v63 + Vector3.new(6, 3, 6) * v58);
					local v67 = OverlapParams.new();
					v67.FilterType = Enum.RaycastFilterType.Whitelist;
					v67.FilterDescendantsInstances = { v65 };
					for v68, v69 in ipairs((l__Workspace__3:GetPartBoundsInBox(v66.CFrame, v66.Size, v67))) do
						if v29(v63, v69, false) then
							v52();
							return nil;
						end;
					end;
				end;
			end;
			local v70 = Region3.new(v63 - Vector3.new(1.5, 0.5, 1.5) * v58, v63 + Vector3.new(1.5, 0.5, 1.5) * v58);
			for v71, v72 in ipairs((l__Workspace__3:GetPartBoundsInBox(v70.CFrame, v70.Size))) do
				if v72:IsA("BasePart") and v29(v63, v72, true) then
					v52();
					return nil;
				end;
			end;
			local v73 = v15;
			if v73 ~= nil then
				v73 = v73.wallHitscanRegionMultiplier;
			end;
			local v74 = v73;
			if v74 == nil then
				v74 = v58;
			end;
			local v75 = Region3.new(v63 - Vector3.new(0.5, 0.25, 0.5) * v74, v63 + Vector3.new(0.5, 0.25, 0.5) * v74);
			for v76, v77 in ipairs((l__Workspace__3:GetPartBoundsInBox(v75.CFrame, v75.Size))) do
				if v77:IsA("BasePart") and v29(v63, v77, false) then
					v52();
					return nil;
				end;
			end;		
		end;
		v52();
		u22 = l__Position__55;
	end));
end;
local l__Projectiles__23 = v3.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Projectiles");
local u24 = nil;
function v4.createProjectile(p15, p16, p17, p18)
	local v78 = l__ProjectileMeta__5[p16].projectileModel;
	if v78 == nil then
		v78 = p16;
	end;
	local v79 = l__Projectiles__23:WaitForChild(v78);
	assert(v79, "Projectile model for projectile " .. p16 .. " can't be found.");
	local v80 = v79:Clone();
	assert(v80.PrimaryPart, "Primary part missing on projectile " .. v80.Name);
	v80.Name = p16;
	if p18 == nil then
		return nil;
	end;
	v80:SetPrimaryPartCFrame(p18);
	v80.Parent = l__Workspace__3;
	v80:SetAttribute("ProjectileShooter", p15.UserId);
	l__CollectionService__12:AddTag(v80, u24(p15.UserId));
	return v80;
end;
u24 = function(p19)
	return "projectile:" .. tostring(p19);
end;
v4.getProjectileCST = u24;
local l__getItemMeta__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.getProjectileSource(p20, p21)
	local v81 = l__getItemMeta__25(p21.Name);
	if v81 == nil then
		return nil;
	end;
	local v82 = v81.projectileSource;
	if v82 == nil then
		local v83 = v81.block;
		if v83 ~= nil then
			v83 = v83.projectileSource;
		end;
		v82 = v83;
	end;
	local v84 = v82;
	if not v84 and p20 and v81.multiProjectileSource then
		v84 = v81.multiProjectileSource[p20];
	end;
	return v84;
end;
function v4.setupProjectileConstantOrientation(p22, p23)
	local v85 = u6.new();
	local v86 = l__ProjectileMeta__5[p22.Name];
	if v86.useServerModel and p23 ~= l__Players__9.LocalPlayer then
		return v85;
	end;
	local u26 = math.random() * 2 * math.pi;
	task.delay(0, function()
		local u27 = nil;
		local u28 = 0;
		v85:GiveTask(l__RunService__7.Heartbeat:Connect(function(p24)
			if not p22.Parent then
				v85:DoCleaning();
				return nil;
			end;
			if not u27 then
				u27 = p22:GetPrimaryPartCFrame();
			end;
			u28 = u28 + p24;
			local v87 = v86.lifetimeSec;
			if v87 == nil then
				v87 = 10;
			end;
			if v87 < u28 then
				local v88 = v86;
				if v88 ~= nil then
					v88 = v88.returnDistance;
				end;
				if v88 ~= 0 and v88 == v88 and v88 then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p22:Destroy();
				v85:DoCleaning();
				p22:Destroy();
				return nil;
			end;
			local l__Position__89 = p22:GetPrimaryPartCFrame().Position;
			local v90 = v86.flightRotation or Vector3.new();
			local v91 = CFrame.Angles(v90.X, v90.Y, v90.Z);
			local v92 = CFrame.new(l__Position__89, l__Position__89 + p22.PrimaryPart.Velocity);
			if v86.orbit then
				local v93 = u26 + u28 * math.pi * 6;
				local v94 = v86.orbit.radius;
				if v94 == nil then
					v94 = 0.5;
				end;
				local v95 = v86.orbit.timeTillMaxOrbit;
				if v95 == nil then
					v95 = 1;
				end;
				local v96 = v94 * math.min(u28 / v95, 1);
				v92 = CFrame.new(v92 * Vector3.new(v96 * math.sin(v93), v96 * math.cos(v93), 0)) * (v92 - v92.Position);
			end;
			if not v86.noArc then
				v92 = v92 * v91;
			end;
			p22:SetPrimaryPartCFrame(l__SharedSyncEvents__8.ProjectileRender:fire(p22, v86, v92, u28, p24).cframe);
		end));
		v85:GiveTask(l__RunService__7.Stepped:Connect(function(p25)
			if not p22.Parent then
				v85:DoCleaning();
				return nil;
			end;
			if u27 then
				p22:SetPrimaryPartCFrame(u27);
				u27 = nil;
			end;
		end));
	end);
	return v85;
end;
return {
	ProjectileUtil = v4
};
