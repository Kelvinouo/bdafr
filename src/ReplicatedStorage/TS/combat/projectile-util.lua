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
	local v5, v6, v7 = ipairs((p2:GetDescendants()));
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
		if v6:IsA("BasePart") then
			l__PhysicsService__1:SetPartCollisionGroup(v6, "DisablePlayerCollisions");
		end;	
	end;
	local v8 = p9;
	if v8 ~= nil then
		v8 = v8.relative;
	end;
	if v8 ~= nil then
		local v9 = p9.relative.relX;
	else
		v9 = u2.RelX;
	end;
	local v10 = p9;
	if v10 ~= nil then
		v10 = v10.relative;
	end;
	if v10 ~= nil then
		local v11 = p9;
		if v11 ~= nil then
			v11 = v11.relative.relY;
		end;
		local v12 = v11;
	else
		v12 = u2.RelY;
	end;
	local v13 = p9;
	if v13 ~= nil then
		v13 = v13.relative;
	end;
	if v13 ~= nil then
		local v14 = p9;
		if v14 ~= nil then
			v14 = v14.relative.relZ;
		end;
		local v15 = v14;
	else
		v15 = u2.RelZ;
	end;
	p2:SetPrimaryPartCFrame(CFrame.new(p4, p4 + p5) * CFrame.new(Vector3.new(v9, v12, v15)));
	p2.Parent = l__Workspace__3;
	u4("BodyForce", {
		Parent = p2.PrimaryPart, 
		Force = Vector3.new(0, (l__Workspace__3.Gravity - p6) * p2.PrimaryPart.AssemblyMass, 0)
	});
	if p10 then
		p2.PrimaryPart:ApplyImpulse(p5 * p2.PrimaryPart.AssemblyMass);
	end;
	local v16 = l__ProjectileMeta__5[p2.Name];
	local u17 = u6.new();
	u17:GiveTask(p2.PrimaryPart.AncestryChanged:Connect(function()
		u17:DoCleaning();
	end));
	u17:GiveTask(p2.Destroying:Connect(function()
		u17:DoCleaning();
	end));
	local v17 = p9;
	if v17 ~= nil then
		v17 = v17.playerColilsionDisabled;
	end;
	local v18 = v17 == true;
	if not v18 then
		local v19 = v16;
		if v19 ~= nil then
			v19 = v19.playerCollisionDisabled;
		end;
		v18 = v19 == true;
	end;
	if v18 then
		l__PhysicsService__1:SetPartCollisionGroup(p2.PrimaryPart, "DisablePlayerCollisions");
	end;
	local v20 = p9;
	if v20 ~= nil then
		v20 = v20.collisionDisabled;
	end;
	local v21 = v20 == true;
	if not v21 then
		local v22 = v16;
		if v22 ~= nil then
			v22 = v22.collisionDisabled;
		end;
		v21 = v22 == true;
	end;
	if v21 then
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
		local v23 = p2;
		if v23 ~= nil then
			v23 = v23.PrimaryPart;
		end;
		if not v23 then
			return nil;
		end;
		local v24 = v16;
		if v24 ~= nil then
			v24 = v24.returnDistance;
		end;
		if v24 ~= 0 and v24 == v24 and v24 then
			if p1 == nil then
				return nil;
			end;
			local v25 = p1.Character;
			if v25 ~= nil then
				v25 = v25.PrimaryPart;
				if v25 ~= nil then
					v25 = v25.CFrame;
				end;
			end;
			local l__CFrame__26 = p2.PrimaryPart.CFrame;
			if v25 == nil then
				return nil;
			end;
			local l__Magnitude__27 = (v25 - l__CFrame__26.Position).Position.Magnitude;
			if v16.returnDistance < l__Magnitude__27 and not u20 then
				u20 = true;
				u21 = tick();
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_BACKWARD_TRANSIT);
				end;
			elseif l__Magnitude__27 < 10 and u20 then
				u20 = false;
				if p8 == true then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p2:Destroy();
				u17:DoCleaning();
				return nil;
			end;
			if u20 then
				if v16.flightRotation then
					local l__flightRotation__28 = v16.flightRotation;
					local v29 = v25 * CFrame.Angles(l__flightRotation__28.X, l__flightRotation__28.Y, l__flightRotation__28.Z);
				end;
				p2:SetPrimaryPartCFrame((l__CFrame__26:Lerp(v25, (math.clamp((tick() - u21) / 0.2, 0, 1)))));
			end;
		end;
		local function v30(p12, p13, p14, p15)
			if not u18 then
				return false;
			end;
			local v31 = p2;
			if v31 ~= nil then
				v31 = v31.PrimaryPart;
				if v31 ~= nil then
					v31 = v31.Parent;
				end;
			end;
			if not v31 or not p2.Parent then
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
			local v32 = p13.Parent;
			if v32 ~= nil then
				v32 = v32.Name;
			end;
			if v32 == "ArcParticles" then
				return false;
			end;
			local v33 = l__EntityUtil__13:getEntityFromDescendant(p13);
			if l__CollectionService__12:HasTag(p13, "Hitbox") then
				local l__EntityValue__34 = p13:FindFirstChild("EntityValue");
				if l__EntityValue__34 and l__EntityValue__34.Value then
					v33 = l__EntityUtil__13:getEntity(l__EntityValue__34.Value);
				end;
			end;
			if v33 then
				if p13:FindFirstAncestorWhichIsA("Accessory") or p13:IsA("Accessory") then
					return false;
				end;
				p13 = v33:getInstance().PrimaryPart and p13;
				if p1 then
					local v35 = l__EntityUtil__13:getEntity(p1);
				else
					v35 = nil;
				end;
				if v35 and not v35:canAttack(v33) then
					return false;
				end;
			end;
			if p14 and not v33 and table.find(l__CollectionService__12:GetTags(p13), "falling-block") == nil then
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
			local v38 = p9;
			if v38 ~= nil then
				v38 = v38.npcShooterEntity;
			end;
			if v37 or v38 then
				local v39 = p9;
				if v39 ~= nil then
					v39 = v39.projectileSource;
				end;
				local v40 = p9;
				if v40 ~= nil then
					v40 = v40.drawPercent;
				end;
				local v41 = v40;
				if v41 == nil then
					v41 = 1;
				end;
				local v42 = p9;
				if v42 ~= nil then
					v42 = v42.projectileDamageMult;
				end;
				local v43 = v42;
				if v43 == nil then
					v43 = 1;
				end;
				local v44 = p9;
				if v44 ~= nil then
					v44 = v44.metadata;
				end;
				if l__SharedSyncEvents__8.ProjectileHit:fire(v37 and v38, p2.Name, p2, p3, v39, {
					hitCFrame = CFrame.new(p12) * (p2:GetPrimaryPartCFrame() - p2:GetPrimaryPartCFrame().Position), 
					velocity = p2.PrimaryPart.Velocity, 
					part = p13
				}, v33, v41, v43, v44):isCancelled() then
					return false;
				end;
			end;
			p7(p12, p13);
			local v45 = v16;
			if v45 ~= nil then
				v45 = v45.keepProjectileOnHit;
			end;
			if not v45 then
				u17:DoCleaning();
			end;
			return true;
		end;
		local v46 = l__RunService__7:IsServer();
		if v46 then
			local v47 = p9;
			if v47 ~= nil then
				v47 = v47.serverTime;
			end;
			v46 = v47;
			if v46 ~= 0 and v46 == v46 and v46 then
				v46 = u2.LagCompensation;
			end;
		end;
		if v46 ~= 0 and v46 == v46 and v46 then
			l__KnitServer__14.Services.LagCompensationService:pushToPointInTime(p9.serverTime + u19);
		end;
		if u2.DebugLagCompensation then
			local v48, v49, v50 = ipairs(l__Players__9:GetPlayers());
			while true do
				v48(v49, v50);
				if not v48 then
					break;
				end;
				v50 = v48;
				if l__RunService__7:IsServer() and v49.Character then
					local v51 = l__KnitServer__14.Services.LagCompensationService:getHitbox(v49.Character);
					if v51 then
						local v52 = u15.box(CFrame.new(v51.Position) * CFrame.new(0, 1, 0), Vector3.new(2, 4, 2), Color3.fromRGB(255, 0, 0));
						v52.Transparency = 0.9;
						l__GameQueryUtil__11:setQueryIgnored(v52, true);
						l__Debris__16:AddItem(v52, 5);
					end;
				elseif l__RunService__7:IsClient() and v49.Character then
					local v53 = u15.box(CFrame.new(v49.Character:GetPrimaryPartCFrame().Position), Vector3.new(2, 4, 2) * 0.9, Color3.fromRGB(0, 255, 0));
					v53.Transparency = 0.9;
					l__GameQueryUtil__11:setQueryIgnored(v53, true);
					l__Debris__16:AddItem(v53, 5);
				end;			
			end;
		end;
		local function v54()
			local v55 = l__RunService__7:IsServer();
			if v55 then
				local v56 = p9;
				if v56 ~= nil then
					v56 = v56.serverTime;
				end;
				v55 = v56;
				if v55 ~= 0 and v55 == v55 and v55 then
					v55 = u2.LagCompensation;
				end;
			end;
			if v55 ~= 0 and v55 == v55 and v55 then
				l__KnitServer__14.Services.LagCompensationService:pop();
			end;
		end;
		local l__Position__57 = p2.PrimaryPart.CFrame.Position;
		local v58 = {};
		if u22 then
			table.insert(v58, (u22 + l__Position__57) / 2);
		end;
		table.insert(v58, l__Position__57);
		local v59 = v16;
		if v59 ~= nil then
			v59 = v59.hitscanRegionMultiplier;
		end;
		local v60 = v59;
		if v60 == nil then
			v60 = 1;
		end;
		local v61, v62, v63 = ipairs(v58);
		while true do
			v61(v62, v63);
			if not v61 then
				break;
			end;
			local v64 = p9;
			if v64 ~= nil then
				v64 = v64.getSuggestedTarget;
			end;
			if v64 then
				local v65 = p9.getSuggestedTarget();
				if v65 then
					local v66 = Region3.new(v62 - Vector3.new(6, 3, 6) * v60, v62 + Vector3.new(6, 3, 6) * v60);
					local v67 = OverlapParams.new();
					v67.FilterType = Enum.RaycastFilterType.Whitelist;
					v67.FilterDescendantsInstances = { v65 };
					local v68, v69, v70 = ipairs((l__Workspace__3:GetPartBoundsInBox(v66.CFrame, v66.Size, v67)));
					while true do
						v68(v69, v70);
						if not v68 then
							break;
						end;
						v70 = v68;
						if v30(v62, v69, false, v66) then
							v54();
							return nil;
						end;					
					end;
				end;
			end;
			local v71 = Region3.new(v62 - Vector3.new(1.5, 0.5, 1.5) * v60, v62 + Vector3.new(1.5, 0.5, 1.5) * v60);
			local v72, v73, v74 = ipairs((l__Workspace__3:GetPartBoundsInBox(v71.CFrame, v71.Size)));
			while true do
				v72(v73, v74);
				if not v72 then
					break;
				end;
				v74 = v72;
				if v73:IsA("BasePart") and v30(v62, v73, true, v71) then
					v54();
					return nil;
				end;			
			end;
			local v75 = v16;
			if v75 ~= nil then
				v75 = v75.wallHitscanRegionMultiplier;
			end;
			local v76 = v75;
			if v76 == nil then
				v76 = v60;
			end;
			local v77 = Region3.new(v62 - Vector3.new(0.5, 0.25, 0.5) * v76, v62 + Vector3.new(0.5, 0.25, 0.5) * v76);
			local v78, v79, v80 = ipairs((l__Workspace__3:GetPartBoundsInBox(v77.CFrame, v77.Size)));
			while true do
				v78(v79, v80);
				if not v78 then
					break;
				end;
				v80 = v78;
				if v79:IsA("BasePart") and v30(v62, v79, false, v77) then
					v54();
					return nil;
				end;			
			end;		
		end;
		v54();
		u22 = l__Position__57;
	end));
end;
local l__Projectiles__23 = v3.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Projectiles");
local u24 = nil;
function v4.createProjectile(p16, p17, p18, p19)
	local v81 = l__ProjectileMeta__5[p17].projectileModel;
	if v81 == nil then
		v81 = p17;
	end;
	local v82 = l__Projectiles__23:WaitForChild(v81);
	assert(v82, "Projectile model for projectile " .. p17 .. " can't be found.");
	local v83 = v82:Clone();
	assert(v83.PrimaryPart, "Primary part missing on projectile " .. v83.Name);
	v83.Name = p17;
	if p19 == nil then
		return nil;
	end;
	v83:SetPrimaryPartCFrame(p19);
	v83.Parent = l__Workspace__3;
	v83:SetAttribute("ProjectileShooter", p16.UserId);
	l__CollectionService__12:AddTag(v83, u24(p16.UserId));
	return v83;
end;
u24 = function(p20)
	return "projectile:" .. tostring(p20);
end;
v4.getProjectileCST = u24;
local l__getItemMeta__25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v4.getProjectileSource(p21, p22)
	local v84 = l__getItemMeta__25(p22.Name);
	if v84 == nil then
		return nil;
	end;
	local v85 = v84.projectileSource;
	if v85 == nil then
		local v86 = v84.block;
		if v86 ~= nil then
			v86 = v86.projectileSource;
		end;
		v85 = v86;
	end;
	local v87 = v85;
	if not v87 and p21 and v84.multiProjectileSource then
		v87 = v84.multiProjectileSource[p21];
	end;
	return v87;
end;
function v4.setupProjectileConstantOrientation(p23, p24)
	local v88 = u6.new();
	local v89 = l__ProjectileMeta__5[p23.Name];
	if v89.useServerModel and p24 ~= l__Players__9.LocalPlayer then
		return v88;
	end;
	local u26 = math.random() * 2 * math.pi;
	task.delay(0, function()
		local u27 = nil;
		local u28 = 0;
		v88:GiveTask(l__RunService__7.Heartbeat:Connect(function(p25)
			if not p23.Parent then
				v88:DoCleaning();
				return nil;
			end;
			if not u27 then
				u27 = p23:GetPrimaryPartCFrame();
			end;
			u28 = u28 + p25;
			local v90 = v89.lifetimeSec;
			if v90 == nil then
				v90 = 10;
			end;
			if v90 < u28 then
				local v91 = v89;
				if v91 ~= nil then
					v91 = v91.returnDistance;
				end;
				if v91 ~= 0 and v91 == v91 and v91 then
					l__SharedSyncEvents__8.HookFunctionSwapEvent:fire(l__Players__9.LocalPlayer, l__GrapplingHookFunctions__10.HOOK_CHAMBERED);
				end;
				p23:Destroy();
				v88:DoCleaning();
				p23:Destroy();
				return nil;
			end;
			local l__Position__92 = p23:GetPrimaryPartCFrame().Position;
			local v93 = v89.flightRotation or Vector3.new();
			local v94 = CFrame.Angles(v93.X, v93.Y, v93.Z);
			local v95 = CFrame.new(l__Position__92, l__Position__92 + p23.PrimaryPart.Velocity);
			if v89.orbit then
				local v96 = u26 + u28 * math.pi * 6;
				local v97 = v89.orbit.radius;
				if v97 == nil then
					v97 = 0.5;
				end;
				local v98 = v89.orbit.timeTillMaxOrbit;
				if v98 == nil then
					v98 = 1;
				end;
				local v99 = v97 * math.min(u28 / v98, 1);
				v95 = CFrame.new(v95 * Vector3.new(v99 * math.sin(v96), v99 * math.cos(v96), 0)) * (v95 - v95.Position);
			end;
			if not v89.noArc then
				v95 = v95 * v94;
			end;
			p23:SetPrimaryPartCFrame(l__SharedSyncEvents__8.ProjectileRender:fire(p23, v89, v95, u28, p25).cframe);
		end));
		v88:GiveTask(l__RunService__7.Stepped:Connect(function(p26)
			if not p23.Parent then
				v88:DoCleaning();
				return nil;
			end;
			if u27 then
				p23:SetPrimaryPartCFrame(u27);
				u27 = nil;
			end;
		end));
	end);
	return v88;
end;
return {
	ProjectileUtil = v4
};
