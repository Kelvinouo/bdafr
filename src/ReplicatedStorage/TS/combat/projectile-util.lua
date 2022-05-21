-- Script Hash: dc7aa882ad6dbcb9827ca38470dc27f590e4356ccf69e461c622989eefa4fedb2637102c7f3c4754ba896971ae254132
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
local l__Maid__6 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
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
	local v5 = p2:GetDescendants();
	local function v6(p11)
		if p11:IsA("BasePart") then
			l__PhysicsService__1:SetPartCollisionGroup(p11, "DisablePlayerCollisions");
		end;
	end;
	for v7, v8 in ipairs(v5) do
		v6(v8, v7 - 1, v5);
	end;
	local v9 = p9;
	if v9 ~= nil then
		v9 = v9.relative;
	end;
	if v9 ~= nil then
		local v10 = p9.relative.relX;
	else
		v10 = u2.RelX;
	end;
	local v11 = p9;
	if v11 ~= nil then
		v11 = v11.relative;
	end;
	if v11 ~= nil then
		local v12 = p9;
		if v12 ~= nil then
			v12 = v12.relative.relY;
		end;
		local v13 = v12;
	else
		v13 = u2.RelY;
	end;
	local v14 = p9;
	if v14 ~= nil then
		v14 = v14.relative;
	end;
	if v14 ~= nil then
		local v15 = p9;
		if v15 ~= nil then
			v15 = v15.relative.relZ;
		end;
		local v16 = v15;
	else
		v16 = u2.RelZ;
	end;
	p2:SetPrimaryPartCFrame(CFrame.new(p4, p4 + p5) * CFrame.new(Vector3.new(v10, v13, v16)));
	p2.Parent = l__Workspace__3;
	u4("BodyForce", {
		Parent = p2.PrimaryPart, 
		Force = Vector3.new(0, (l__Workspace__3.Gravity - p6) * p2.PrimaryPart.AssemblyMass, 0)
	});
	if p10 then
		p2.PrimaryPart:ApplyImpulse(p5 * p2.PrimaryPart.AssemblyMass);
	end;
	local v17 = l__ProjectileMeta__5[p2.Name];
	local u14 = l__Maid__6.new();
	u14:GiveTask(p2.PrimaryPart.AncestryChanged:Connect(function()
		u14:DoCleaning();
	end));
	u14:GiveTask(p2.Destroying:Connect(function()
		u14:DoCleaning();
	end));
	local v18 = p9;
	if v18 ~= nil then
		v18 = v18.playerColilsionDisabled;
	end;
	local v19 = v18 == true;
	if not v19 then
		local v20 = v17;
		if v20 ~= nil then
			v20 = v20.playerCollisionDisabled;
		end;
		v19 = v20 == true;
	end;
	if v19 then
		l__PhysicsService__1:SetPartCollisionGroup(p2.PrimaryPart, "DisablePlayerCollisions");
	end;
	local v21 = p9;
	if v21 ~= nil then
		v21 = v21.collisionDisabled;
	end;
	local v22 = v21 == true;
	if not v22 then
		local v23 = v17;
		if v23 ~= nil then
			v23 = v23.collisionDisabled;
		end;
		v22 = v23 == true;
	end;
	if v22 then
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
		local v24 = p2;
		if v24 ~= nil then
			v24 = v24.PrimaryPart;
		end;
		if not v24 then
			return nil;
		end;
		local v25 = v17;
		if v25 ~= nil then
			v25 = v25.returnDistance;
		end;
		if v25 ~= 0 and v25 == v25 and v25 then
			if p1 == nil then
				return nil;
			end;
			local v26 = p1.Character;
			if v26 ~= nil then
				v26 = v26.PrimaryPart;
				if v26 ~= nil then
					v26 = v26.CFrame;
				end;
			end;
			local l__CFrame__27 = p2.PrimaryPart.CFrame;
			if v26 == nil then
				return nil;
			end;
			local l__Magnitude__28 = (v26 - l__CFrame__27.Position).Position.Magnitude;
			if v17.returnDistance < l__Magnitude__28 and not u16 then
				u16 = true;
				u17 = tick();
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_BACKWARD_TRANSIT);
				end;
			elseif l__Magnitude__28 < 10 and u16 then
				u16 = false;
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p2:Destroy();
				u14:DoCleaning();
				return nil;
			end;
			if u16 then
				if v17.flightRotation then
					local l__flightRotation__29 = v17.flightRotation;
					local v30 = v26 * CFrame.Angles(l__flightRotation__29.X, l__flightRotation__29.Y, l__flightRotation__29.Z);
				end;
				p2:SetPrimaryPartCFrame((l__CFrame__27:Lerp(v26, (math.clamp((tick() - u17) / 0.2, 0, 1)))));
			end;
		end;
		local function v31(p12, p13, p14)
			if not u15 then
				return false;
			end;
			local v32 = p2;
			if v32 ~= nil then
				v32 = v32.PrimaryPart;
				if v32 ~= nil then
					v32 = v32.Parent;
				end;
			end;
			if not v32 or not p2.Parent then
				return false;
			end;
			if p1 and (not p1:IsDescendantOf(l__Players__9) or not p1.Character) then
				return false;
			end;
			if p13:IsDescendantOf(p2) then
				return false;
			end;
			if l__GameQueryUtil__11:isQueryIgnored(p13) then
				return false;
			end;
			if l__CollectionService__12:HasTag(p13, "ProjectilesIgnore") then
				return false;
			end;
			if p13:GetAttribute("IgnoreProjectileCollision") == true then
				return false;
			end;
			local v33 = p13.Parent;
			if v33 ~= nil then
				v33 = v33.Name;
			end;
			if v33 == "ArcParticles" then
				return false;
			end;
			local v34 = l__EntityUtil__13:getEntityFromDescendant(p13);
			if v34 then
				if p13:FindFirstAncestorWhichIsA("Accessory") or p13:IsA("Accessory") then
					return false;
				end;
				p13 = v34:getInstance().PrimaryPart and p13;
				if p1 then
					local v35 = l__EntityUtil__13:getEntity(p1);
				else
					v35 = nil;
				end;
				if v35 and not v35:canAttack(v34) then
					return false;
				end;
			end;
			if p14 and not v34 and table.find(l__CollectionService__12:GetTags(p13), "falling-block") == nil then
				return false;
			end;
			local v36 = p13:FindFirstAncestorOfClass("Model");
			if v36 and l__ProjectileMeta__5[v36.Name] ~= nil then
				return false;
			end;
			if p1 then
				local v37 = l__EntityUtil__13:getEntity(p1);
			else
				v37 = nil;
			end;
			if v37 then
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
				if l__SharedSyncEvents__8.ProjectileHit:fire(v37, p2.Name, p2, p3, v38, {
					hitCFrame = CFrame.new(p12) * (p2:GetPrimaryPartCFrame() - p2:GetPrimaryPartCFrame().Position), 
					velocity = p2.PrimaryPart.Velocity, 
					part = p13
				}, v34, v40, v42, v43):isCancelled() then
					return false;
				end;
			end;
			p7(p12, p13);
			local v44 = v17;
			if v44 ~= nil then
				v44 = v44.keepProjectileOnHit;
			end;
			if not v44 then
				u14:DoCleaning();
			end;
			return true;
		end;
		local l__Position__45 = p2.PrimaryPart.CFrame.Position;
		local v46 = {};
		if u18 then
			table.insert(v46, (u18 + l__Position__45) / 2);
		end;
		table.insert(v46, l__Position__45);
		local v47 = v17;
		if v47 ~= nil then
			v47 = v47.hitscanRegionMultiplier;
		end;
		local v48 = v47;
		if v48 == nil then
			v48 = 1;
		end;
		local v49, v50, v51 = ipairs(v46);
		while true do
			local v52, v53 = v49(v50, v51);
			if not v52 then
				break;
			end;
			local v54 = p9;
			if v54 ~= nil then
				v54 = v54.getSuggestedTarget;
			end;
			if v54 then
				local v55 = p9.getSuggestedTarget();
				if v55 then
					local v56 = Region3.new(v53 - Vector3.new(6, 3, 6) * v48, v53 + Vector3.new(6, 3, 6) * v48);
					local v57 = OverlapParams.new();
					v57.FilterType = Enum.RaycastFilterType.Whitelist;
					v57.FilterDescendantsInstances = { v55 };
					for v58, v59 in ipairs((l__Workspace__3:GetPartBoundsInBox(v56.CFrame, v56.Size, v57))) do
						if v31(v53, v59, false) then
							return nil;
						end;
					end;
				end;
			end;
			local v60 = Region3.new(v53 - Vector3.new(1.5, 0.5, 1.5) * v48, v53 + Vector3.new(1.5, 0.5, 1.5) * v48);
			for v61, v62 in ipairs((l__Workspace__3:GetPartBoundsInBox(v60.CFrame, v60.Size))) do
				if v62:IsA("BasePart") and v31(v53, v62, true) then
					return nil;
				end;
			end;
			local v63 = v17;
			if v63 ~= nil then
				v63 = v63.wallHitscanRegionMultiplier;
			end;
			local v64 = v63;
			if v64 == nil then
				v64 = v48;
			end;
			local v65 = Region3.new(v53 - Vector3.new(0.5, 0.25, 0.5) * v64, v53 + Vector3.new(0.5, 0.25, 0.5) * v64);
			for v66, v67 in ipairs((l__Workspace__3:GetPartBoundsInBox(v65.CFrame, v65.Size))) do
				if v67:IsA("BasePart") and v31(v53, v67, false) then
					return nil;
				end;
			end;		
		end;
		u18 = l__Position__45;
	end));
end;
local l__Projectiles__19 = v3.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Projectiles");
local u20 = nil;
function v4.createProjectile(p15, p16, p17, p18)
	local v68 = l__ProjectileMeta__5[p16].projectileModel;
	if v68 == nil then
		v68 = p16;
	end;
	local v69 = l__Projectiles__19:WaitForChild(v68);
	assert(v69, "Projectile model for projectile " .. p16 .. " can't be found.");
	local v70 = v69:Clone();
	assert(v70.PrimaryPart, "Primary part missing on projectile " .. v70.Name);
	v70.Name = p16;
	if p18 == nil then
		return nil;
	end;
	v70:SetPrimaryPartCFrame(p18);
	v70.Parent = l__Workspace__3;
	v70:SetAttribute("ProjectileShooter", p15.UserId);
	l__CollectionService__12:AddTag(v70, u20(p15.UserId));
	return v70;
end;
u20 = function(p19)
	return "projectile:" .. tostring(p19);
end;
v4.getProjectileCST = u20;
local l__getItemMeta__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.getProjectileSource(p20, p21)
	local v71 = l__getItemMeta__21(p21.Name);
	if v71 == nil then
		return nil;
	end;
	local v72 = v71.projectileSource;
	if v72 == nil then
		local v73 = v71.block;
		if v73 ~= nil then
			v73 = v73.projectileSource;
		end;
		v72 = v73;
	end;
	local v74 = v72;
	if not v74 and p20 and v71.multiProjectileSource then
		v74 = v71.multiProjectileSource[p20];
	end;
	return v74;
end;
function v4.setupProjectileConstantOrientation(p22, p23)
	local v75 = l__Maid__6.new();
	local v76 = l__ProjectileMeta__5[p22.Name];
	if v76.useServerModel and p23 ~= l__Players__9.LocalPlayer then
		return v75;
	end;
	local u22 = math.random() * 2 * math.pi;
	task.delay(0, function()
		local u23 = nil;
		local u24 = 0;
		v75:GiveTask(l__RunService__7.Heartbeat:Connect(function(p24)
			if not p22.Parent then
				v75:DoCleaning();
				return nil;
			end;
			if not u23 then
				u23 = p22:GetPrimaryPartCFrame();
			end;
			u24 = u24 + p24;
			local v77 = v76.lifetimeSec;
			if v77 == nil then
				v77 = 10;
			end;
			if v77 < u24 then
				local v78 = v76;
				if v78 ~= nil then
					v78 = v78.returnDistance;
				end;
				if v78 ~= 0 and v78 == v78 and v78 then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p22:Destroy();
				v75:DoCleaning();
				p22:Destroy();
				return nil;
			end;
			local l__Position__79 = p22:GetPrimaryPartCFrame().Position;
			local v80 = v76.flightRotation or Vector3.new();
			local v81 = CFrame.Angles(v80.X, v80.Y, v80.Z);
			local v82 = CFrame.new(l__Position__79, l__Position__79 + p22.PrimaryPart.Velocity);
			if v76.orbit then
				local v83 = u22 + u24 * math.pi * 6;
				local v84 = v76.orbit.radius;
				if v84 == nil then
					v84 = 0.5;
				end;
				local v85 = v76.orbit.timeTillMaxOrbit;
				if v85 == nil then
					v85 = 1;
				end;
				local v86 = v84 * math.min(u24 / v85, 1);
				v82 = CFrame.new(v82 * Vector3.new(v86 * math.sin(v83), v86 * math.cos(v83), 0)) * (v82 - v82.Position);
			end;
			if not v76.noArc then
				v82 = v82 * v81;
			end;
			p22:SetPrimaryPartCFrame(l__SharedSyncEvents__8.ProjectileRender:fire(p22, v76, v82, u24, p24).cframe);
		end));
		v75:GiveTask(l__RunService__7.Stepped:Connect(function(p25)
			if not p22.Parent then
				v75:DoCleaning();
				return nil;
			end;
			if u23 then
				p22:SetPrimaryPartCFrame(u23);
				u23 = nil;
			end;
		end));
	end);
	return v75;
end;
return {
	ProjectileUtil = v4
};
