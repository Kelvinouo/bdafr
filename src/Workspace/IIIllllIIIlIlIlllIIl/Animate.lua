-- Decompiled with the Synapse X Luau decompiler.

local l__Parent__1 = script.Parent;
local l__Humanoid__2 = l__Parent__1:WaitForChild("Humanoid");
local v3, v4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop");
end);
local v5, v6 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserEmoteToRunThresholdChange");
end);
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayEmoteByIdAnimTrackReturn2");
end);
local v9, v10 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAnimateScriptEmoteHook");
end);
local v11, v12 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixLoadAnimationError");
end);
local l__ScaleDampeningPercent__13 = script:FindFirstChild("ScaleDampeningPercent");
math.randomseed(tick());
function findExistingAnimationInSet(p1, p2)
	if p1 ~= nil then
		if p2 == nil then
			return 0;
		end;
	else
		return 0;
	end;
	local l__count__14 = p1.count;
	local v15 = 1 - 1;
	while true do
		if p1[v15].anim.AnimationId == p2.AnimationId then
			return v15;
		end;
		if 0 <= 1 then
			if v15 < l__count__14 then

			else
				break;
			end;
		elseif l__count__14 < v15 then

		else
			break;
		end;
		v15 = v15 + 1;	
	end;
	return 0;
end;
local u1 = {};
local u2 = {};
function configureAnimationSet(p3, p4)
	if u1[p3] ~= nil then
		local v16, v17, v18 = pairs(u1[p3].connections);
		while true do
			local v19, v20 = v16(v17, v18);
			if v19 then

			else
				break;
			end;
			v18 = v19;
			v20:disconnect();		
		end;
	end;
	u1[p3] = {};
	u1[p3].count = 0;
	u1[p3].totalWeight = 0;
	u1[p3].connections = {};
	local u3 = true;
	local v21, v22 = pcall(function()
		u3 = game:GetService("StarterPlayer").AllowCustomAnimations;
	end);
	if not v21 then
		u3 = true;
	end;
	local v23 = script:FindFirstChild(p3);
	if u3 then
		if v23 ~= nil then
			table.insert(u1[p3].connections, v23.ChildAdded:connect(function(p5)
				configureAnimationSet(p3, p4);
			end));
			table.insert(u1[p3].connections, v23.ChildRemoved:connect(function(p6)
				configureAnimationSet(p3, p4);
			end));
			local v24, v25, v26 = pairs(v23:GetChildren());
			while true do
				local v27, v28 = v24(v25, v26);
				if v27 then

				else
					break;
				end;
				v26 = v27;
				if v28:IsA("Animation") then
					local v29 = 1;
					local l__Weight__30 = v28:FindFirstChild("Weight");
					if l__Weight__30 ~= nil then
						v29 = l__Weight__30.Value;
					end;
					u1[p3].count = u1[p3].count + 1;
					local l__count__31 = u1[p3].count;
					u1[p3][l__count__31] = {};
					u1[p3][l__count__31].anim = v28;
					u1[p3][l__count__31].weight = v29;
					u1[p3].totalWeight = u1[p3].totalWeight + u1[p3][l__count__31].weight;
					table.insert(u1[p3].connections, v28.Changed:connect(function(p7)
						configureAnimationSet(p3, p4);
					end));
					table.insert(u1[p3].connections, v28.ChildAdded:connect(function(p8)
						configureAnimationSet(p3, p4);
					end));
					table.insert(u1[p3].connections, v28.ChildRemoved:connect(function(p9)
						configureAnimationSet(p3, p4);
					end));
				end;			
			end;
		end;
	end;
	if u1[p3].count <= 0 then
		local v32, v33, v34 = pairs(p4);
		while true do
			local v35, v36 = v32(v33, v34);
			if v35 then

			else
				break;
			end;
			v34 = v35;
			u1[p3][v35] = {};
			u1[p3][v35].anim = Instance.new("Animation");
			u1[p3][v35].anim.Name = p3;
			u1[p3][v35].anim.AnimationId = v36.id;
			u1[p3][v35].weight = v36.weight;
			u1[p3].count = u1[p3].count + 1;
			u1[p3].totalWeight = u1[p3].totalWeight + v36.weight;		
		end;
	end;
	local v37, v38, v39 = pairs(u1);
	while true do
		local v40, v41 = v37(v38, v39);
		if v40 then

		else
			break;
		end;
		local l__count__42 = v41.count;
		local v43 = 1 - 1;
		while true do
			if u2[v41[v43].anim.AnimationId] == nil then
				l__Humanoid__2:LoadAnimation(v41[v43].anim);
				u2[v41[v43].anim.AnimationId] = true;
			end;
			if 0 <= 1 then
				if v43 < l__count__42 then

				else
					break;
				end;
			elseif l__count__42 < v43 then

			else
				break;
			end;
			v43 = v43 + 1;		
		end;	
	end;
end;
function configureAnimationSetOld(p10, p11)
	if u1[p10] ~= nil then
		local v44, v45, v46 = pairs(u1[p10].connections);
		while true do
			local v47, v48 = v44(v45, v46);
			if v47 then

			else
				break;
			end;
			v46 = v47;
			v48:disconnect();		
		end;
	end;
	u1[p10] = {};
	u1[p10].count = 0;
	u1[p10].totalWeight = 0;
	u1[p10].connections = {};
	local u4 = true;
	local v49, v50 = pcall(function()
		u4 = game:GetService("StarterPlayer").AllowCustomAnimations;
	end);
	if not v49 then
		u4 = true;
	end;
	local v51 = script:FindFirstChild(p10);
	if u4 then
		if v51 ~= nil then
			table.insert(u1[p10].connections, v51.ChildAdded:connect(function(p12)
				configureAnimationSet(p10, p11);
			end));
			table.insert(u1[p10].connections, v51.ChildRemoved:connect(function(p13)
				configureAnimationSet(p10, p11);
			end));
			local v52 = 1;
			local v53, v54, v55 = pairs(v51:GetChildren());
			while true do
				local v56, v57 = v53(v54, v55);
				if v56 then

				else
					break;
				end;
				v55 = v56;
				if v57:IsA("Animation") then
					table.insert(u1[p10].connections, v57.Changed:connect(function(p14)
						configureAnimationSet(p10, p11);
					end));
					u1[p10][v52] = {};
					u1[p10][v52].anim = v57;
					local l__Weight__58 = v57:FindFirstChild("Weight");
					if l__Weight__58 == nil then
						u1[p10][v52].weight = 1;
					else
						u1[p10][v52].weight = l__Weight__58.Value;
					end;
					u1[p10].count = u1[p10].count + 1;
					u1[p10].totalWeight = u1[p10].totalWeight + u1[p10][v52].weight;
					v52 = v52 + 1;
				end;			
			end;
		end;
	end;
	if u1[p10].count <= 0 then
		local v59, v60, v61 = pairs(p11);
		while true do
			local v62, v63 = v59(v60, v61);
			if v62 then

			else
				break;
			end;
			v61 = v62;
			u1[p10][v62] = {};
			u1[p10][v62].anim = Instance.new("Animation");
			u1[p10][v62].anim.Name = p10;
			u1[p10][v62].anim.AnimationId = v63.id;
			u1[p10][v62].weight = v63.weight;
			u1[p10].count = u1[p10].count + 1;
			u1[p10].totalWeight = u1[p10].totalWeight + v63.weight;		
		end;
	end;
	local v64, v65, v66 = pairs(u1);
	while true do
		local v67, v68 = v64(v65, v66);
		if v67 then

		else
			break;
		end;
		local l__count__69 = v68.count;
		local v70 = 1 - 1;
		while true do
			l__Humanoid__2:LoadAnimation(v68[v70].anim);
			if 0 <= 1 then
				if v70 < l__count__69 then

				else
					break;
				end;
			elseif l__count__69 < v70 then

			else
				break;
			end;
			v70 = v70 + 1;		
		end;	
	end;
end;
local u5 = {
	idle = { {
			id = "http://www.roblox.com/asset/?id=507766666", 
			weight = 1
		}, {
			id = "http://www.roblox.com/asset/?id=507766951", 
			weight = 1
		}, {
			id = "http://www.roblox.com/asset/?id=507766388", 
			weight = 9
		} }, 
	walk = { {
			id = "http://www.roblox.com/asset/?id=507777826", 
			weight = 10
		} }, 
	run = { {
			id = "http://www.roblox.com/asset/?id=507767714", 
			weight = 10
		} }, 
	swim = { {
			id = "http://www.roblox.com/asset/?id=507784897", 
			weight = 10
		} }, 
	swimidle = { {
			id = "http://www.roblox.com/asset/?id=507785072", 
			weight = 10
		} }, 
	jump = { {
			id = "http://www.roblox.com/asset/?id=507765000", 
			weight = 10
		} }, 
	fall = { {
			id = "http://www.roblox.com/asset/?id=507767968", 
			weight = 10
		} }, 
	climb = { {
			id = "http://www.roblox.com/asset/?id=507765644", 
			weight = 10
		} }, 
	sit = { {
			id = "http://www.roblox.com/asset/?id=2506281703", 
			weight = 10
		} }, 
	toolnone = { {
			id = "http://www.roblox.com/asset/?id=507768375", 
			weight = 10
		} }, 
	toolslash = { {
			id = "http://www.roblox.com/asset/?id=522635514", 
			weight = 10
		} }, 
	toollunge = { {
			id = "http://www.roblox.com/asset/?id=522638767", 
			weight = 10
		} }, 
	wave = { {
			id = "http://www.roblox.com/asset/?id=507770239", 
			weight = 10
		} }, 
	point = { {
			id = "http://www.roblox.com/asset/?id=507770453", 
			weight = 10
		} }, 
	dance = { {
			id = "http://www.roblox.com/asset/?id=507771019", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=507771955", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=507772104", 
			weight = 10
		} }, 
	dance2 = { {
			id = "http://www.roblox.com/asset/?id=507776043", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=507776720", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=507776879", 
			weight = 10
		} }, 
	dance3 = { {
			id = "http://www.roblox.com/asset/?id=507777268", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=507777451", 
			weight = 10
		}, {
			id = "http://www.roblox.com/asset/?id=507777623", 
			weight = 10
		} }, 
	laugh = { {
			id = "http://www.roblox.com/asset/?id=507770818", 
			weight = 10
		} }, 
	cheer = { {
			id = "http://www.roblox.com/asset/?id=507770677", 
			weight = 10
		} }
};
function scriptChildModified(p15)
	local v71 = u5[p15.Name];
	if v71 ~= nil then
		configureAnimationSet(p15.Name, v71);
	end;
end;
script.ChildAdded:connect(scriptChildModified);
script.ChildRemoved:connect(scriptChildModified);
for v72, v73 in pairs(u5) do
	configureAnimationSet(v72, v73);
end;
local u6 = "";
local u7 = {
	wave = false, 
	point = false, 
	dance = true, 
	dance2 = true, 
	dance3 = true, 
	laugh = false, 
	cheer = false
};
local u8 = v9 or v10;
local u9 = false;
local u10 = nil;
local u11 = nil;
local u12 = nil;
local u13 = nil;
local u14 = nil;
function stopAllAnimations()
	local v74 = u6;
	if u7[v74] ~= nil then
		if u7[v74] == false then
			v74 = "idle";
		end;
	end;
	if u8 then
		if u9 then
			v74 = "idle";
			u9 = false;
		end;
	end;
	u6 = "";
	u10 = nil;
	if u11 ~= nil then
		u11:disconnect();
	end;
	if u12 ~= nil then
		u12:Stop();
		u12:Destroy();
		u12 = nil;
	end;
	if u13 ~= nil then
		u13:disconnect();
	end;
	if u14 ~= nil then
		u14:Stop();
		u14:Destroy();
		u14 = nil;
	end;
	return v74;
end;
local u15 = l__ScaleDampeningPercent__13;
function getHeightScale()
	if l__Humanoid__2 then

	else
		return 1;
	end;
	if not l__Humanoid__2.AutomaticScalingEnabled then
		return 1;
	end;
	local v75 = l__Humanoid__2.HipHeight / 2;
	if u15 == nil then
		u15 = script:FindFirstChild("ScaleDampeningPercent");
	end;
	if u15 ~= nil then
		v75 = 1 + (l__Humanoid__2.HipHeight - 2) * u15.Value / 2;
	end;
	return v75;
end;
local function u16(p16)
	return p16 * 1.25 / getHeightScale();
end;
local function u17(p17)
	local v76 = u16(p17);
	local v77 = 0.0001;
	local v78 = 0.0001;
	local v79 = v76 / 0.5;
	local v80 = v76 / 1;
	if v76 <= 0.5 then
		v77 = 1;
	elseif v76 < 1 then
		local v81 = (v76 - 0.5) / 0.5;
		v77 = 1 - v81;
		v78 = v81;
		v79 = 1;
		v80 = 1;
	else
		v78 = 1;
	end;
	u12:AdjustWeight(v77);
	u14:AdjustWeight(v78);
	u12:AdjustSpeed(v79);
	u14:AdjustSpeed(v80);
end;
local u18 = 1;
function setAnimationSpeed(p18)
	if u6 == "walk" then
		u17(p18);
		return;
	end;
	if p18 ~= u18 then
		u18 = p18;
		u12:AdjustSpeed(u18);
	end;
end;
local u19 = v3 or v4;
function keyFrameReachedFunc(p19)
	if p19 == "End" then
		if u6 == "walk" then
			if u19 == true then

			else
				u14.TimePosition = 0;
				u12.TimePosition = 0;
				return;
			end;
			if u14.Looped ~= true then
				u14.TimePosition = 0;
			end;
			if u12.Looped ~= true then
				u12.TimePosition = 0;
				return;
			end;
		else
			local v82 = u6;
			if u7[v82] ~= nil then
				if u7[v82] == false then
					v82 = "idle";
				end;
			end;
			if u8 then
				if u9 then
					if u12.Looped then
						return;
					end;
					v82 = "idle";
					u9 = false;
				end;
			end;
			playAnimation(v82, 0.15, l__Humanoid__2);
			setAnimationSpeed(u18);
		end;
	end;
end;
function rollAnimation(p20)
	local v83 = math.random(1, u1[p20].totalWeight);
	local v84 = 1;
	while true do
		if u1[p20][v84].weight < v83 then

		else
			break;
		end;
		v83 = v83 - u1[p20][v84].weight;
		v84 = v84 + 1;	
	end;
	return v84;
end;
local function u20(p21, p22, p23, p24)
	if p21 ~= u10 then
		if u12 ~= nil then
			u12:Stop(p23);
			u12:Destroy();
		end;
		if u14 ~= nil then
			u14:Stop(p23);
			u14:Destroy();
			if u19 == true then
				u14 = nil;
			end;
		end;
		u18 = 1;
		u12 = p24:LoadAnimation(p21);
		u12.Priority = Enum.AnimationPriority.Core;
		u12:Play(p23);
		u6 = p22;
		u10 = p21;
		if u11 ~= nil then
			u11:disconnect();
		end;
		u11 = u12.KeyframeReached:connect(keyFrameReachedFunc);
		if p22 == "walk" then
			u14 = p24:LoadAnimation(u1.run[rollAnimation("run")].anim);
			u14.Priority = Enum.AnimationPriority.Core;
			u14:Play(p23);
			if u13 ~= nil then
				u13:disconnect();
			end;
			u13 = u14.KeyframeReached:connect(keyFrameReachedFunc);
		end;
	end;
end;
function playAnimation(p25, p26, p27)
	u20(u1[p25][rollAnimation(p25)].anim, p25, p26, p27);
	u9 = false;
end;
function playEmote(p28, p29, p30)
	u20(p28, p28.Name, p29, p30);
	u9 = true;
end;
local u21 = "";
function toolKeyFrameReachedFunc(p31)
	if p31 == "End" then
		playToolAnimation(u21, 0, l__Humanoid__2);
	end;
end;
local u22 = nil;
local u23 = nil;
local u24 = nil;
function playToolAnimation(p32, p33, p34, p35)
	local l__anim__85 = u1[p32][rollAnimation(p32)].anim;
	if u22 ~= l__anim__85 then
		if u23 ~= nil then
			u23:Stop();
			u23:Destroy();
			p33 = 0;
		end;
		u23 = p34:LoadAnimation(l__anim__85);
		if p35 then
			u23.Priority = p35;
		end;
		u23:Play(p33);
		u21 = p32;
		u22 = l__anim__85;
		u24 = u23.KeyframeReached:connect(toolKeyFrameReachedFunc);
	end;
end;
function stopToolAnimations()
	if u24 ~= nil then
		u24:disconnect();
	end;
	u21 = "";
	u22 = nil;
	if u23 ~= nil then
		u23:Stop();
		u23:Destroy();
		u23 = nil;
	end;
	return u21;
end;
local u25 = v5 or v6;
local u26 = "Standing";
function onRunning(p36)
	local v86 = u25;
	if v86 then
		v86 = u9 and l__Humanoid__2.MoveDirection == Vector3.new(0, 0, 0);
	end;
	if (v86 and l__Humanoid__2.WalkSpeed or 0.75) < p36 then
		playAnimation("walk", 0.2, l__Humanoid__2);
		setAnimationSpeed(p36 / 16);
		u26 = "Running";
		return;
	end;
	if u7[u6] == nil then
		if not u9 then
			playAnimation("idle", 0.2, l__Humanoid__2);
			u26 = "Standing";
		end;
	end;
end;
function onDied()
	u26 = "Dead";
end;
local u27 = 0;
function onJumping()
	playAnimation("jump", 0.1, l__Humanoid__2);
	u27 = 0.31;
	u26 = "Jumping";
end;
function onClimbing(p37)
	playAnimation("climb", 0.1, l__Humanoid__2);
	setAnimationSpeed(p37 / 5);
	u26 = "Climbing";
end;
function onGettingUp()
	u26 = "GettingUp";
end;
function onFreeFall()
	if u27 <= 0 then
		playAnimation("fall", 0.2, l__Humanoid__2);
	end;
	u26 = "FreeFall";
end;
function onFallingDown()
	u26 = "FallingDown";
end;
function onSeated()
	u26 = "Seated";
end;
function onPlatformStanding()
	u26 = "PlatformStanding";
end;
function onSwimming(p38)
	if 1 < p38 then

	else
		playAnimation("swimidle", 0.4, l__Humanoid__2);
		u26 = "Standing";
		return;
	end;
	playAnimation("swim", 0.4, l__Humanoid__2);
	setAnimationSpeed(p38 / 10);
	u26 = "Swimming";
end;
local u28 = "None";
function animateTool()
	if u28 == "None" then
		playToolAnimation("toolnone", 0.1, l__Humanoid__2, Enum.AnimationPriority.Idle);
		return;
	end;
	if u28 == "Slash" then
		playToolAnimation("toolslash", 0, l__Humanoid__2, Enum.AnimationPriority.Action);
		return;
	end;
	if u28 == "Lunge" then

	else
		return;
	end;
	playToolAnimation("toollunge", 0, l__Humanoid__2, Enum.AnimationPriority.Action);
end;
function getToolAnim(p39)
	local v87, v88, v89 = ipairs(p39:GetChildren());
	while true do
		local v90, v91 = v87(v88, v89);
		if v90 then

		else
			break;
		end;
		v89 = v90;
		if v91.Name == "toolanim" then
			if v91.className == "StringValue" then
				return v91;
			end;
		end;	
	end;
	return nil;
end;
local u29 = 0;
local u30 = 0;
function stepAnimate(p40)
	u29 = p40;
	if 0 < u27 then
		u27 = u27 - (p40 - u29);
	end;
	if u26 == "FreeFall" then
		if u27 <= 0 then
			playAnimation("fall", 0.2, l__Humanoid__2);
		else
			if u26 == "Seated" then
				playAnimation("sit", 0.5, l__Humanoid__2);
				return;
			end;
			if u26 == "Running" then
				playAnimation("walk", 0.2, l__Humanoid__2);
			elseif u26 ~= "Dead" then
				if u26 ~= "GettingUp" then
					if u26 ~= "FallingDown" then
						if u26 ~= "Seated" then
							if u26 == "PlatformStanding" then
								stopAllAnimations();
							end;
						else
							stopAllAnimations();
						end;
					else
						stopAllAnimations();
					end;
				else
					stopAllAnimations();
				end;
			else
				stopAllAnimations();
			end;
		end;
	else
		if u26 == "Seated" then
			playAnimation("sit", 0.5, l__Humanoid__2);
			return;
		end;
		if u26 == "Running" then
			playAnimation("walk", 0.2, l__Humanoid__2);
		elseif u26 ~= "Dead" then
			if u26 ~= "GettingUp" then
				if u26 ~= "FallingDown" then
					if u26 ~= "Seated" then
						if u26 == "PlatformStanding" then
							stopAllAnimations();
						end;
					else
						stopAllAnimations();
					end;
				else
					stopAllAnimations();
				end;
			else
				stopAllAnimations();
			end;
		else
			stopAllAnimations();
		end;
	end;
	local v92 = l__Parent__1:FindFirstChildOfClass("Tool");
	if v92 then
		if v92:FindFirstChild("Handle") then

		else
			stopToolAnimations();
			u28 = "None";
			u22 = nil;
			u30 = 0;
			return;
		end;
	else
		stopToolAnimations();
		u28 = "None";
		u22 = nil;
		u30 = 0;
		return;
	end;
	local v93 = getToolAnim(v92);
	if v93 then
		u28 = v93.Value;
		v93.Parent = nil;
		u30 = p40 + 0.3;
	end;
	if u30 < p40 then
		u30 = 0;
		u28 = "None";
	end;
	animateTool();
end;
l__Humanoid__2.Died:connect(onDied);
l__Humanoid__2.Running:connect(onRunning);
l__Humanoid__2.Jumping:connect(onJumping);
l__Humanoid__2.Climbing:connect(onClimbing);
l__Humanoid__2.GettingUp:connect(onGettingUp);
l__Humanoid__2.FreeFalling:connect(onFreeFall);
l__Humanoid__2.FallingDown:connect(onFallingDown);
l__Humanoid__2.Seated:connect(onSeated);
l__Humanoid__2.PlatformStanding:connect(onPlatformStanding);
l__Humanoid__2.Swimming:connect(onSwimming);
game:GetService("Players").LocalPlayer.Chatted:connect(function(p41)
	local v94 = "";
	if string.sub(p41, 1, 3) == "/e " then
		v94 = string.sub(p41, 4);
	elseif string.sub(p41, 1, 7) == "/emote " then
		v94 = string.sub(p41, 8);
	end;
	if u26 == "Standing" and u7[v94] ~= nil then
		playAnimation(v94, 0.1, l__Humanoid__2);
	end;
end);
if u8 then
	local u31 = v7 or v8;
	script:WaitForChild("PlayEmote").OnInvoke = function(p42)
		if u26 ~= "Standing" then
			return;
		end;
		if u7[p42] ~= nil then
			playAnimation(p42, 0.1, l__Humanoid__2);
			if u31 then
				return true, u12;
			else
				return true;
			end;
		end;
		if typeof(p42) ~= "Instance" or not p42:IsA("Animation") then
			return false;
		end;
		playEmote(p42, 0.1, l__Humanoid__2);
		if u31 then
			return true, u12;
		end;
		return true;
	end;
end;
if not v11 and not v12 or l__Parent__1.Parent ~= nil then
	playAnimation("idle", 0.1, l__Humanoid__2);
	u26 = "Standing";
end;
while l__Parent__1.Parent ~= nil do
	local v95, v96 = wait(0.1);
	stepAnimate(v96);
end;
