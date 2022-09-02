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
local l__ScaleDampeningPercent__9 = script:FindFirstChild("ScaleDampeningPercent");
math.randomseed(tick());
function findExistingAnimationInSet(p1, p2)
	if p1 ~= nil then
		if p2 == nil then
			return 0;
		end;
	else
		return 0;
	end;
	local l__count__10 = p1.count;
	local v11 = 1 - 1;
	while true do
		if p1[v11].anim.AnimationId == p2.AnimationId then
			return v11;
		end;
		if 0 <= 1 then
			if v11 < l__count__10 then

			else
				break;
			end;
		elseif l__count__10 < v11 then

		else
			break;
		end;
		v11 = v11 + 1;	
	end;
	return 0;
end;
local u1 = {};
local u2 = {};
function configureAnimationSet(p3, p4)
	if u1[p3] ~= nil then
		local v12, v13, v14 = pairs(u1[p3].connections);
		while true do
			local v15, v16 = v12(v13, v14);
			if v15 then

			else
				break;
			end;
			v14 = v15;
			v16:disconnect();		
		end;
	end;
	u1[p3] = {};
	u1[p3].count = 0;
	u1[p3].totalWeight = 0;
	u1[p3].connections = {};
	local u3 = true;
	local v17, v18 = pcall(function()
		u3 = game:GetService("StarterPlayer").AllowCustomAnimations;
	end);
	if not v17 then
		u3 = true;
	end;
	local v19 = script:FindFirstChild(p3);
	if u3 then
		if v19 ~= nil then
			table.insert(u1[p3].connections, v19.ChildAdded:connect(function(p5)
				configureAnimationSet(p3, p4);
			end));
			table.insert(u1[p3].connections, v19.ChildRemoved:connect(function(p6)
				configureAnimationSet(p3, p4);
			end));
			local v20, v21, v22 = pairs(v19:GetChildren());
			while true do
				local v23, v24 = v20(v21, v22);
				if v23 then

				else
					break;
				end;
				v22 = v23;
				if v24:IsA("Animation") then
					local v25 = 1;
					local l__Weight__26 = v24:FindFirstChild("Weight");
					if l__Weight__26 ~= nil then
						v25 = l__Weight__26.Value;
					end;
					u1[p3].count = u1[p3].count + 1;
					local l__count__27 = u1[p3].count;
					u1[p3][l__count__27] = {};
					u1[p3][l__count__27].anim = v24;
					u1[p3][l__count__27].weight = v25;
					u1[p3].totalWeight = u1[p3].totalWeight + u1[p3][l__count__27].weight;
					table.insert(u1[p3].connections, v24.Changed:connect(function(p7)
						configureAnimationSet(p3, p4);
					end));
					table.insert(u1[p3].connections, v24.ChildAdded:connect(function(p8)
						configureAnimationSet(p3, p4);
					end));
					table.insert(u1[p3].connections, v24.ChildRemoved:connect(function(p9)
						configureAnimationSet(p3, p4);
					end));
				end;			
			end;
		end;
	end;
	if u1[p3].count <= 0 then
		local v28, v29, v30 = pairs(p4);
		while true do
			local v31, v32 = v28(v29, v30);
			if v31 then

			else
				break;
			end;
			v30 = v31;
			u1[p3][v31] = {};
			u1[p3][v31].anim = Instance.new("Animation");
			u1[p3][v31].anim.Name = p3;
			u1[p3][v31].anim.AnimationId = v32.id;
			u1[p3][v31].weight = v32.weight;
			u1[p3].count = u1[p3].count + 1;
			u1[p3].totalWeight = u1[p3].totalWeight + v32.weight;		
		end;
	end;
	local v33, v34, v35 = pairs(u1);
	while true do
		local v36, v37 = v33(v34, v35);
		if v36 then

		else
			break;
		end;
		local l__count__38 = v37.count;
		local v39 = 1 - 1;
		while true do
			if u2[v37[v39].anim.AnimationId] == nil then
				l__Humanoid__2:LoadAnimation(v37[v39].anim);
				u2[v37[v39].anim.AnimationId] = true;
			end;
			if 0 <= 1 then
				if v39 < l__count__38 then

				else
					break;
				end;
			elseif l__count__38 < v39 then

			else
				break;
			end;
			v39 = v39 + 1;		
		end;	
	end;
end;
function configureAnimationSetOld(p10, p11)
	if u1[p10] ~= nil then
		local v40, v41, v42 = pairs(u1[p10].connections);
		while true do
			local v43, v44 = v40(v41, v42);
			if v43 then

			else
				break;
			end;
			v42 = v43;
			v44:disconnect();		
		end;
	end;
	u1[p10] = {};
	u1[p10].count = 0;
	u1[p10].totalWeight = 0;
	u1[p10].connections = {};
	local u4 = true;
	local v45, v46 = pcall(function()
		u4 = game:GetService("StarterPlayer").AllowCustomAnimations;
	end);
	if not v45 then
		u4 = true;
	end;
	local v47 = script:FindFirstChild(p10);
	if u4 then
		if v47 ~= nil then
			table.insert(u1[p10].connections, v47.ChildAdded:connect(function(p12)
				configureAnimationSet(p10, p11);
			end));
			table.insert(u1[p10].connections, v47.ChildRemoved:connect(function(p13)
				configureAnimationSet(p10, p11);
			end));
			local v48 = 1;
			local v49, v50, v51 = pairs(v47:GetChildren());
			while true do
				local v52, v53 = v49(v50, v51);
				if v52 then

				else
					break;
				end;
				v51 = v52;
				if v53:IsA("Animation") then
					table.insert(u1[p10].connections, v53.Changed:connect(function(p14)
						configureAnimationSet(p10, p11);
					end));
					u1[p10][v48] = {};
					u1[p10][v48].anim = v53;
					local l__Weight__54 = v53:FindFirstChild("Weight");
					if l__Weight__54 == nil then
						u1[p10][v48].weight = 1;
					else
						u1[p10][v48].weight = l__Weight__54.Value;
					end;
					u1[p10].count = u1[p10].count + 1;
					u1[p10].totalWeight = u1[p10].totalWeight + u1[p10][v48].weight;
					v48 = v48 + 1;
				end;			
			end;
		end;
	end;
	if u1[p10].count <= 0 then
		local v55, v56, v57 = pairs(p11);
		while true do
			local v58, v59 = v55(v56, v57);
			if v58 then

			else
				break;
			end;
			v57 = v58;
			u1[p10][v58] = {};
			u1[p10][v58].anim = Instance.new("Animation");
			u1[p10][v58].anim.Name = p10;
			u1[p10][v58].anim.AnimationId = v59.id;
			u1[p10][v58].weight = v59.weight;
			u1[p10].count = u1[p10].count + 1;
			u1[p10].totalWeight = u1[p10].totalWeight + v59.weight;		
		end;
	end;
	local v60, v61, v62 = pairs(u1);
	while true do
		local v63, v64 = v60(v61, v62);
		if v63 then

		else
			break;
		end;
		local l__count__65 = v64.count;
		local v66 = 1 - 1;
		while true do
			l__Humanoid__2:LoadAnimation(v64[v66].anim);
			if 0 <= 1 then
				if v66 < l__count__65 then

				else
					break;
				end;
			elseif l__count__65 < v66 then

			else
				break;
			end;
			v66 = v66 + 1;		
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
	local v67 = u5[p15.Name];
	if v67 ~= nil then
		configureAnimationSet(p15.Name, v67);
	end;
end;
script.ChildAdded:connect(scriptChildModified);
script.ChildRemoved:connect(scriptChildModified);
if l__Humanoid__2 then
	local v68 = l__Humanoid__2:FindFirstChildOfClass("Animator");
else
	v68 = nil;
end;
if v68 then
	for v69, v70 in ipairs((v68:GetPlayingAnimationTracks())) do
		v70:Stop(0);
		v70:Destroy();
	end;
end;
for v71, v72 in pairs(u5) do
	configureAnimationSet(v71, v72);
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
local u8 = false;
local u9 = nil;
local u10 = nil;
local u11 = nil;
local u12 = nil;
local u13 = nil;
function stopAllAnimations()
	local v73 = u6;
	if u7[v73] ~= nil then
		if u7[v73] == false then
			v73 = "idle";
		end;
	end;
	if u8 then
		v73 = "idle";
		u8 = false;
	end;
	u6 = "";
	u9 = nil;
	if u10 ~= nil then
		u10:disconnect();
	end;
	if u11 ~= nil then
		u11:Stop();
		u11:Destroy();
		u11 = nil;
	end;
	if u12 ~= nil then
		u12:disconnect();
	end;
	if u13 ~= nil then
		u13:Stop();
		u13:Destroy();
		u13 = nil;
	end;
	return v73;
end;
local u14 = l__ScaleDampeningPercent__9;
function getHeightScale()
	if l__Humanoid__2 then

	else
		return 1;
	end;
	if not l__Humanoid__2.AutomaticScalingEnabled then
		return 1;
	end;
	local v74 = l__Humanoid__2.HipHeight / 2;
	if u14 == nil then
		u14 = script:FindFirstChild("ScaleDampeningPercent");
	end;
	if u14 ~= nil then
		v74 = 1 + (l__Humanoid__2.HipHeight - 2) * u14.Value / 2;
	end;
	return v74;
end;
local function u15(p16)
	local v75 = p16 * 1.25 / getHeightScale();
	local v76 = 0.0001;
	local v77 = 0.0001;
	local v78 = v75 / 0.5;
	local v79 = v75 / 1;
	if v75 <= 0.5 then
		v76 = 1;
	elseif v75 < 1 then
		local v80 = (v75 - 0.5) / 0.5;
		v76 = 1 - v80;
		v77 = v80;
		v78 = 1;
		v79 = 1;
	else
		v77 = 1;
	end;
	u11:AdjustWeight(v76);
	u13:AdjustWeight(v77);
	u11:AdjustSpeed(v78);
	u13:AdjustSpeed(v79);
end;
local u16 = 1;
function setAnimationSpeed(p17)
	if u6 == "walk" then
		u15(p17);
		return;
	end;
	if p17 ~= u16 then
		u16 = p17;
		u11:AdjustSpeed(u16);
	end;
end;
local u17 = v3 or v4;
function keyFrameReachedFunc(p18)
	if p18 == "End" then
		if u6 == "walk" then
			if u17 == true then

			else
				u13.TimePosition = 0;
				u11.TimePosition = 0;
				return;
			end;
			if u13.Looped ~= true then
				u13.TimePosition = 0;
			end;
			if u11.Looped ~= true then
				u11.TimePosition = 0;
				return;
			end;
		else
			local v81 = u6;
			if u7[v81] ~= nil then
				if u7[v81] == false then
					v81 = "idle";
				end;
			end;
			if u8 then
				if u11.Looped then
					return;
				end;
				v81 = "idle";
				u8 = false;
			end;
			playAnimation(v81, 0.15, l__Humanoid__2);
			setAnimationSpeed(u16);
		end;
	end;
end;
function rollAnimation(p19)
	local v82 = math.random(1, u1[p19].totalWeight);
	local v83 = 1;
	while true do
		if u1[p19][v83].weight < v82 then

		else
			break;
		end;
		v82 = v82 - u1[p19][v83].weight;
		v83 = v83 + 1;	
	end;
	return v83;
end;
local function u18(p20, p21, p22, p23)
	if p20 ~= u9 then
		if u11 ~= nil then
			u11:Stop(p22);
			u11:Destroy();
		end;
		if u13 ~= nil then
			u13:Stop(p22);
			u13:Destroy();
			if u17 == true then
				u13 = nil;
			end;
		end;
		u16 = 1;
		u11 = p23:LoadAnimation(p20);
		u11.Priority = Enum.AnimationPriority.Core;
		u11:Play(p22);
		u6 = p21;
		u9 = p20;
		if u10 ~= nil then
			u10:disconnect();
		end;
		u10 = u11.KeyframeReached:connect(keyFrameReachedFunc);
		if p21 == "walk" then
			u13 = p23:LoadAnimation(u1.run[rollAnimation("run")].anim);
			u13.Priority = Enum.AnimationPriority.Core;
			u13:Play(p22);
			if u12 ~= nil then
				u12:disconnect();
			end;
			u12 = u13.KeyframeReached:connect(keyFrameReachedFunc);
		end;
	end;
end;
function playAnimation(p24, p25, p26)
	u18(u1[p24][rollAnimation(p24)].anim, p24, p25, p26);
	u8 = false;
end;
function playEmote(p27, p28, p29)
	u18(p27, p27.Name, p28, p29);
	u8 = true;
end;
local u19 = "";
function toolKeyFrameReachedFunc(p30)
	if p30 == "End" then
		playToolAnimation(u19, 0, l__Humanoid__2);
	end;
end;
local u20 = nil;
local u21 = nil;
local u22 = nil;
function playToolAnimation(p31, p32, p33, p34)
	local l__anim__84 = u1[p31][rollAnimation(p31)].anim;
	if u20 ~= l__anim__84 then
		if u21 ~= nil then
			u21:Stop();
			u21:Destroy();
			p32 = 0;
		end;
		u21 = p33:LoadAnimation(l__anim__84);
		if p34 then
			u21.Priority = p34;
		end;
		u21:Play(p32);
		u19 = p31;
		u20 = l__anim__84;
		u22 = u21.KeyframeReached:connect(toolKeyFrameReachedFunc);
	end;
end;
function stopToolAnimations()
	if u22 ~= nil then
		u22:disconnect();
	end;
	u19 = "";
	u20 = nil;
	if u21 ~= nil then
		u21:Stop();
		u21:Destroy();
		u21 = nil;
	end;
	return u19;
end;
local u23 = v5 or v6;
local u24 = "Standing";
function onRunning(p35)
	local v85 = u23;
	if v85 then
		v85 = u8 and l__Humanoid__2.MoveDirection == Vector3.new(0, 0, 0);
	end;
	if (v85 and l__Humanoid__2.WalkSpeed or 0.75) < p35 then
		playAnimation("walk", 0.2, l__Humanoid__2);
		setAnimationSpeed(p35 / 16);
		u24 = "Running";
		return;
	end;
	if u7[u6] == nil then
		if not u8 then
			playAnimation("idle", 0.2, l__Humanoid__2);
			u24 = "Standing";
		end;
	end;
end;
function onDied()
	u24 = "Dead";
end;
local u25 = 0;
function onJumping()
	playAnimation("jump", 0.1, l__Humanoid__2);
	u25 = 0.31;
	u24 = "Jumping";
end;
function onClimbing(p36)
	playAnimation("climb", 0.1, l__Humanoid__2);
	setAnimationSpeed(p36 / 5);
	u24 = "Climbing";
end;
function onGettingUp()
	u24 = "GettingUp";
end;
function onFreeFall()
	if u25 <= 0 then
		playAnimation("fall", 0.2, l__Humanoid__2);
	end;
	u24 = "FreeFall";
end;
function onFallingDown()
	u24 = "FallingDown";
end;
function onSeated()
	u24 = "Seated";
end;
function onPlatformStanding()
	u24 = "PlatformStanding";
end;
function onSwimming(p37)
	if 1 < p37 then

	else
		playAnimation("swimidle", 0.4, l__Humanoid__2);
		u24 = "Standing";
		return;
	end;
	playAnimation("swim", 0.4, l__Humanoid__2);
	setAnimationSpeed(p37 / 10);
	u24 = "Swimming";
end;
local u26 = "None";
function animateTool()
	if u26 == "None" then
		playToolAnimation("toolnone", 0.1, l__Humanoid__2, Enum.AnimationPriority.Idle);
		return;
	end;
	if u26 == "Slash" then
		playToolAnimation("toolslash", 0, l__Humanoid__2, Enum.AnimationPriority.Action);
		return;
	end;
	if u26 == "Lunge" then

	else
		return;
	end;
	playToolAnimation("toollunge", 0, l__Humanoid__2, Enum.AnimationPriority.Action);
end;
function getToolAnim(p38)
	local v86, v87, v88 = ipairs(p38:GetChildren());
	while true do
		local v89, v90 = v86(v87, v88);
		if v89 then

		else
			break;
		end;
		v88 = v89;
		if v90.Name == "toolanim" then
			if v90.className == "StringValue" then
				return v90;
			end;
		end;	
	end;
	return nil;
end;
local u27 = 0;
local u28 = 0;
function stepAnimate(p39)
	u27 = p39;
	if 0 < u25 then
		u25 = u25 - (p39 - u27);
	end;
	if u24 == "FreeFall" then
		if u25 <= 0 then
			playAnimation("fall", 0.2, l__Humanoid__2);
		else
			if u24 == "Seated" then
				playAnimation("sit", 0.5, l__Humanoid__2);
				return;
			end;
			if u24 == "Running" then
				playAnimation("walk", 0.2, l__Humanoid__2);
			elseif u24 ~= "Dead" then
				if u24 ~= "GettingUp" then
					if u24 ~= "FallingDown" then
						if u24 ~= "Seated" then
							if u24 == "PlatformStanding" then
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
		if u24 == "Seated" then
			playAnimation("sit", 0.5, l__Humanoid__2);
			return;
		end;
		if u24 == "Running" then
			playAnimation("walk", 0.2, l__Humanoid__2);
		elseif u24 ~= "Dead" then
			if u24 ~= "GettingUp" then
				if u24 ~= "FallingDown" then
					if u24 ~= "Seated" then
						if u24 == "PlatformStanding" then
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
	local v91 = l__Parent__1:FindFirstChildOfClass("Tool");
	if v91 then
		if v91:FindFirstChild("Handle") then

		else
			stopToolAnimations();
			u26 = "None";
			u20 = nil;
			u28 = 0;
			return;
		end;
	else
		stopToolAnimations();
		u26 = "None";
		u20 = nil;
		u28 = 0;
		return;
	end;
	local v92 = getToolAnim(v91);
	if v92 then
		u26 = v92.Value;
		v92.Parent = nil;
		u28 = p39 + 0.3;
	end;
	if u28 < p39 then
		u28 = 0;
		u26 = "None";
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
game:GetService("Players").LocalPlayer.Chatted:connect(function(p40)
	local v93 = "";
	if string.sub(p40, 1, 3) == "/e " then
		v93 = string.sub(p40, 4);
	elseif string.sub(p40, 1, 7) == "/emote " then
		v93 = string.sub(p40, 8);
	end;
	if u24 == "Standing" and u7[v93] ~= nil then
		playAnimation(v93, 0.1, l__Humanoid__2);
	end;
end);
local u29 = v7 or v8;
script:WaitForChild("PlayEmote").OnInvoke = function(p41)
	if u24 ~= "Standing" then
		return;
	end;
	if u7[p41] ~= nil then
		playAnimation(p41, 0.1, l__Humanoid__2);
		if u29 then
			return true, u11;
		else
			return true;
		end;
	end;
	if typeof(p41) ~= "Instance" or not p41:IsA("Animation") then
		return false;
	end;
	playEmote(p41, 0.1, l__Humanoid__2);
	if u29 then
		return true, u11;
	end;
	return true;
end;
if l__Parent__1.Parent ~= nil then
	playAnimation("idle", 0.1, l__Humanoid__2);
	u24 = "Standing";
end;
while l__Parent__1.Parent ~= nil do
	local v94, v95 = wait(0.1);
	stepAnimate(v95);
end;
