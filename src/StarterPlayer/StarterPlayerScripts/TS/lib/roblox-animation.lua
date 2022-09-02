-- Decompiled with the Synapse X Luau decompiler.

return function(p1, p2)
	local l__Humanoid__1 = p1:WaitForChild("Humanoid");
	local l__ScaleDampeningPercent__2 = p2:FindFirstChild("ScaleDampeningPercent");
	math.randomseed(tick());
	function findExistingAnimationInSet(p3, p4)
		if p3 ~= nil then
			if p4 == nil then
				return 0;
			end;
		else
			return 0;
		end;
		local l__count__3 = p3.count;
		local v4 = 1 - 1;
		while true do
			if p3[v4].anim.AnimationId == p4.AnimationId then
				return v4;
			end;
			if 0 <= 1 then
				if v4 < l__count__3 then

				else
					break;
				end;
			elseif l__count__3 < v4 then

			else
				break;
			end;
			v4 = v4 + 1;		
		end;
		return 0;
	end;
	local u1 = {};
	local u2 = {};
	function configureAnimationSet(p5, p6)
		if u1[p5] ~= nil then
			local v5, v6, v7 = pairs(u1[p5].connections);
			while true do
				local v8, v9 = v5(v6, v7);
				if v8 then

				else
					break;
				end;
				v7 = v8;
				v9:disconnect();			
			end;
		end;
		u1[p5] = {};
		u1[p5].count = 0;
		u1[p5].totalWeight = 0;
		u1[p5].connections = {};
		local u3 = true;
		local v10, v11 = pcall(function()
			u3 = game:GetService("StarterPlayer").AllowCustomAnimations;
		end);
		if not v10 then
			u3 = true;
		end;
		local v12 = p2:FindFirstChild(p5);
		if u3 then
			if v12 ~= nil then
				table.insert(u1[p5].connections, v12.ChildAdded:connect(function(p7)
					configureAnimationSet(p5, p6);
				end));
				table.insert(u1[p5].connections, v12.ChildRemoved:connect(function(p8)
					configureAnimationSet(p5, p6);
				end));
				local v13, v14, v15 = pairs(v12:GetChildren());
				while true do
					local v16, v17 = v13(v14, v15);
					if v16 then

					else
						break;
					end;
					v15 = v16;
					if v17:IsA("Animation") then
						local v18 = 1;
						local l__Weight__19 = v17:FindFirstChild("Weight");
						if l__Weight__19 ~= nil then
							v18 = l__Weight__19.Value;
						end;
						u1[p5].count = u1[p5].count + 1;
						local l__count__20 = u1[p5].count;
						u1[p5][l__count__20] = {};
						u1[p5][l__count__20].anim = v17;
						u1[p5][l__count__20].weight = v18;
						u1[p5].totalWeight = u1[p5].totalWeight + u1[p5][l__count__20].weight;
						table.insert(u1[p5].connections, v17.Changed:connect(function(p9)
							configureAnimationSet(p5, p6);
						end));
						table.insert(u1[p5].connections, v17.ChildAdded:connect(function(p10)
							configureAnimationSet(p5, p6);
						end));
						table.insert(u1[p5].connections, v17.ChildRemoved:connect(function(p11)
							configureAnimationSet(p5, p6);
						end));
					end;				
				end;
			end;
		end;
		if u1[p5].count <= 0 then
			local v21, v22, v23 = pairs(p6);
			while true do
				local v24, v25 = v21(v22, v23);
				if v24 then

				else
					break;
				end;
				v23 = v24;
				u1[p5][v24] = {};
				u1[p5][v24].anim = Instance.new("Animation");
				u1[p5][v24].anim.Name = p5;
				u1[p5][v24].anim.AnimationId = v25.id;
				u1[p5][v24].weight = v25.weight;
				u1[p5].count = u1[p5].count + 1;
				u1[p5].totalWeight = u1[p5].totalWeight + v25.weight;			
			end;
		end;
		local v26, v27, v28 = pairs(u1);
		while true do
			local v29, v30 = v26(v27, v28);
			if v29 then

			else
				break;
			end;
			local l__count__31 = v30.count;
			local v32 = 1 - 1;
			while true do
				if u2[v30[v32].anim.AnimationId] == nil then
					l__Humanoid__1:LoadAnimation(v30[v32].anim);
					u2[v30[v32].anim.AnimationId] = true;
				end;
				if 0 <= 1 then
					if v32 < l__count__31 then

					else
						break;
					end;
				elseif l__count__31 < v32 then

				else
					break;
				end;
				v32 = v32 + 1;			
			end;		
		end;
	end;
	function configureAnimationSetOld(p12, p13)
		if u1[p12] ~= nil then
			local v33, v34, v35 = pairs(u1[p12].connections);
			while true do
				local v36, v37 = v33(v34, v35);
				if v36 then

				else
					break;
				end;
				v35 = v36;
				v37:disconnect();			
			end;
		end;
		u1[p12] = {};
		u1[p12].count = 0;
		u1[p12].totalWeight = 0;
		u1[p12].connections = {};
		local u4 = true;
		local v38, v39 = pcall(function()
			u4 = game:GetService("StarterPlayer").AllowCustomAnimations;
		end);
		if not v38 then
			u4 = true;
		end;
		local v40 = p2:FindFirstChild(p12);
		if u4 then
			if v40 ~= nil then
				table.insert(u1[p12].connections, v40.ChildAdded:connect(function(p14)
					configureAnimationSet(p12, p13);
				end));
				table.insert(u1[p12].connections, v40.ChildRemoved:connect(function(p15)
					configureAnimationSet(p12, p13);
				end));
				local v41 = 1;
				local v42, v43, v44 = pairs(v40:GetChildren());
				while true do
					local v45, v46 = v42(v43, v44);
					if v45 then

					else
						break;
					end;
					v44 = v45;
					if v46:IsA("Animation") then
						table.insert(u1[p12].connections, v46.Changed:connect(function(p16)
							configureAnimationSet(p12, p13);
						end));
						u1[p12][v41] = {};
						u1[p12][v41].anim = v46;
						local l__Weight__47 = v46:FindFirstChild("Weight");
						if l__Weight__47 == nil then
							u1[p12][v41].weight = 1;
						else
							u1[p12][v41].weight = l__Weight__47.Value;
						end;
						u1[p12].count = u1[p12].count + 1;
						u1[p12].totalWeight = u1[p12].totalWeight + u1[p12][v41].weight;
						v41 = v41 + 1;
					end;				
				end;
			end;
		end;
		if u1[p12].count <= 0 then
			local v48, v49, v50 = pairs(p13);
			while true do
				local v51, v52 = v48(v49, v50);
				if v51 then

				else
					break;
				end;
				v50 = v51;
				u1[p12][v51] = {};
				u1[p12][v51].anim = Instance.new("Animation");
				u1[p12][v51].anim.Name = p12;
				u1[p12][v51].anim.AnimationId = v52.id;
				u1[p12][v51].weight = v52.weight;
				u1[p12].count = u1[p12].count + 1;
				u1[p12].totalWeight = u1[p12].totalWeight + v52.weight;			
			end;
		end;
		local v53, v54, v55 = pairs(u1);
		while true do
			local v56, v57 = v53(v54, v55);
			if v56 then

			else
				break;
			end;
			local l__count__58 = v57.count;
			local v59 = 1 - 1;
			while true do
				l__Humanoid__1:LoadAnimation(v57[v59].anim);
				if 0 <= 1 then
					if v59 < l__count__58 then

					else
						break;
					end;
				elseif l__count__58 < v59 then

				else
					break;
				end;
				v59 = v59 + 1;			
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
	function scriptChildModified(p17)
		local v60 = u5[p17.Name];
		if v60 ~= nil then
			configureAnimationSet(p17.Name, v60);
		end;
	end;
	p2.ChildAdded:connect(scriptChildModified);
	p2.ChildRemoved:connect(scriptChildModified);
	for v61, v62 in pairs(u5) do
		configureAnimationSet(v61, v62);
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
	local u8 = nil;
	local u9 = nil;
	local u10 = nil;
	local u11 = nil;
	local u12 = nil;
	function stopAllAnimations()
		local v63 = u6;
		if u7[v63] ~= nil then
			if u7[v63] == false then
				v63 = "idle";
			end;
		end;
		u6 = "";
		u8 = nil;
		if u9 ~= nil then
			u9:disconnect();
		end;
		if u10 ~= nil then
			u10:Stop();
			u10:Destroy();
			u10 = nil;
		end;
		if u11 ~= nil then
			u11:disconnect();
		end;
		if u12 ~= nil then
			u12:Stop();
			u12:Destroy();
			u12 = nil;
		end;
		return v63;
	end;
	local u13 = l__ScaleDampeningPercent__2;
	function getHeightScale()
		if l__Humanoid__1 then

		else
			return 1;
		end;
		if not l__Humanoid__1.AutomaticScalingEnabled then
			return 1;
		end;
		local v64 = l__Humanoid__1.HipHeight / 2;
		if u13 == nil then
			u13 = p2:FindFirstChild("ScaleDampeningPercent");
		end;
		if u13 ~= nil then
			v64 = 1 + (l__Humanoid__1.HipHeight - 2) * u13.Value / 2;
		end;
		return v64;
	end;
	local function u14(p18)
		local v65 = p18 * 1.25 / getHeightScale();
		local v66 = 0.0001;
		local v67 = 0.0001;
		local v68 = v65 / 0.5;
		local v69 = v65 / 1;
		if v65 <= 0.5 then
			v66 = 1;
		elseif v65 < 1 then
			local v70 = (v65 - 0.5) / 0.5;
			v66 = 1 - v70;
			v67 = v70;
			v68 = 1;
			v69 = 1;
		else
			v67 = 1;
		end;
		u10:AdjustWeight(v66);
		u12:AdjustWeight(v67);
		u10:AdjustSpeed(v68);
		u12:AdjustSpeed(v69);
	end;
	local u15 = 1;
	function setAnimationSpeed(p19)
		if u6 == "walk" then
			u14(p19);
			return;
		end;
		if p19 ~= u15 then
			u15 = p19;
			u10:AdjustSpeed(u15);
		end;
	end;
	function keyFrameReachedFunc(p20)
		if p20 == "End" then
			if u6 == "walk" then
				u12.TimePosition = 0;
				u10.TimePosition = 0;
				return;
			end;
			local v71 = u6;
			if u7[v71] ~= nil then
				if u7[v71] == false then
					v71 = "idle";
				end;
			end;
			playAnimation(v71, 0.15, l__Humanoid__1);
			setAnimationSpeed(u15);
		end;
	end;
	function rollAnimation(p21)
		local v72 = math.random(1, u1[p21].totalWeight);
		local v73 = 1;
		while true do
			if u1[p21][v73].weight < v72 then

			else
				break;
			end;
			v72 = v72 - u1[p21][v73].weight;
			v73 = v73 + 1;		
		end;
		return v73;
	end;
	local function u16(p22, p23, p24, p25)
		if p22 ~= u8 then
			if u10 ~= nil then
				u10:Stop(p24);
				u10:Destroy();
			end;
			if u12 ~= nil then
				u12:Stop(p24);
				u12:Destroy();
			end;
			u15 = 1;
			u10 = p25:LoadAnimation(p22);
			u10.Priority = Enum.AnimationPriority.Core;
			u10:Play(p24);
			u6 = p23;
			u8 = p22;
			if u9 ~= nil then
				u9:disconnect();
			end;
			u9 = u10.KeyframeReached:connect(keyFrameReachedFunc);
			if p23 == "walk" then
				u12 = p25:LoadAnimation(u1.run[rollAnimation("run")].anim);
				u12.Priority = Enum.AnimationPriority.Core;
				u12:Play(p24);
				if u11 ~= nil then
					u11:disconnect();
				end;
				u11 = u12.KeyframeReached:connect(keyFrameReachedFunc);
			end;
		end;
	end;
	local u17 = false;
	function playAnimation(p26, p27, p28)
		u16(u1[p26][rollAnimation(p26)].anim, p26, p27, p28);
		u17 = false;
	end;
	function playEmote(p29, p30, p31)
		u16(p29, p29.Name, p30, p31);
		u17 = true;
	end;
	local u18 = "";
	function toolKeyFrameReachedFunc(p32)
		if p32 == "End" then
			playToolAnimation(u18, 0, l__Humanoid__1);
		end;
	end;
	local u19 = nil;
	local u20 = nil;
	local u21 = nil;
	function playToolAnimation(p33, p34, p35, p36)
		local l__anim__74 = u1[p33][rollAnimation(p33)].anim;
		if u19 ~= l__anim__74 then
			if u20 ~= nil then
				u20:Stop();
				u20:Destroy();
				p34 = 0;
			end;
			u20 = p35:LoadAnimation(l__anim__74);
			if p36 then
				u20.Priority = p36;
			end;
			u20:Play(p34);
			u18 = p33;
			u19 = l__anim__74;
			u21 = u20.KeyframeReached:connect(toolKeyFrameReachedFunc);
		end;
	end;
	function stopToolAnimations()
		if u21 ~= nil then
			u21:disconnect();
		end;
		u18 = "";
		u19 = nil;
		if u20 ~= nil then
			u20:Stop();
			u20:Destroy();
			u20 = nil;
		end;
		return u18;
	end;
	local u22 = "Standing";
	function onRunning(p37)
		if 0.75 < p37 then
			playAnimation("walk", 0.2, l__Humanoid__1);
			setAnimationSpeed(p37 / 16);
			u22 = "Running";
			return;
		end;
		if u7[u6] == nil then
			if not u17 then
				playAnimation("idle", 0.2, l__Humanoid__1);
				u22 = "Standing";
			end;
		end;
	end;
	function onDied()
		u22 = "Dead";
	end;
	local u23 = 0;
	function onJumping()
		playAnimation("jump", 0.1, l__Humanoid__1);
		u23 = 0.31;
		u22 = "Jumping";
	end;
	function onClimbing(p38)
		playAnimation("climb", 0.1, l__Humanoid__1);
		setAnimationSpeed(p38 / 5);
		u22 = "Climbing";
	end;
	function onGettingUp()
		u22 = "GettingUp";
	end;
	function onFreeFall()
		if u23 <= 0 then
			playAnimation("fall", 0.2, l__Humanoid__1);
		end;
		u22 = "FreeFall";
	end;
	function onFallingDown()
		u22 = "FallingDown";
	end;
	function onSeated()
		u22 = "Seated";
	end;
	function onPlatformStanding()
		u22 = "PlatformStanding";
	end;
	function onSwimming(p39)
		if 1 < p39 then

		else
			playAnimation("swimidle", 0.4, l__Humanoid__1);
			u22 = "Standing";
			return;
		end;
		playAnimation("swim", 0.4, l__Humanoid__1);
		setAnimationSpeed(p39 / 10);
		u22 = "Swimming";
	end;
	local u24 = "None";
	function animateTool()
		if u24 == "None" then
			playToolAnimation("toolnone", 0.1, l__Humanoid__1, Enum.AnimationPriority.Idle);
			return;
		end;
		if u24 == "Slash" then
			playToolAnimation("toolslash", 0, l__Humanoid__1, Enum.AnimationPriority.Action);
			return;
		end;
		if u24 == "Lunge" then

		else
			return;
		end;
		playToolAnimation("toollunge", 0, l__Humanoid__1, Enum.AnimationPriority.Action);
	end;
	function getToolAnim(p40)
		local v75, v76, v77 = ipairs(p40:GetChildren());
		while true do
			local v78, v79 = v75(v76, v77);
			if v78 then

			else
				break;
			end;
			v77 = v78;
			if v79.Name == "toolanim" then
				if v79.className == "StringValue" then
					return v79;
				end;
			end;		
		end;
		return nil;
	end;
	local u25 = 0;
	local u26 = 0;
	function stepAnimate(p41)
		u25 = p41;
		if 0 < u23 then
			u23 = u23 - (p41 - u25);
		end;
		if u22 == "FreeFall" then
			if u23 <= 0 then
				playAnimation("fall", 0.2, l__Humanoid__1);
			else
				if u22 == "Seated" then
					playAnimation("sit", 0.5, l__Humanoid__1);
					return;
				end;
				if u22 == "Running" then
					playAnimation("walk", 0.2, l__Humanoid__1);
				elseif u22 ~= "Dead" then
					if u22 ~= "GettingUp" then
						if u22 ~= "FallingDown" then
							if u22 ~= "Seated" then
								if u22 == "PlatformStanding" then
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
			if u22 == "Seated" then
				playAnimation("sit", 0.5, l__Humanoid__1);
				return;
			end;
			if u22 == "Running" then
				playAnimation("walk", 0.2, l__Humanoid__1);
			elseif u22 ~= "Dead" then
				if u22 ~= "GettingUp" then
					if u22 ~= "FallingDown" then
						if u22 ~= "Seated" then
							if u22 == "PlatformStanding" then
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
		local v80 = p1:FindFirstChildOfClass("Tool");
		if v80 then
			if v80:FindFirstChild("Handle") then

			else
				stopToolAnimations();
				u24 = "None";
				u19 = nil;
				u26 = 0;
				return;
			end;
		else
			stopToolAnimations();
			u24 = "None";
			u19 = nil;
			u26 = 0;
			return;
		end;
		local v81 = getToolAnim(v80);
		if v81 then
			u24 = v81.Value;
			v81.Parent = nil;
			u26 = p41 + 0.3;
		end;
		if u26 < p41 then
			u26 = 0;
			u24 = "None";
		end;
		animateTool();
	end;
	local v82 = {};
	table.insert(v82, l__Humanoid__1.Died:connect(onDied));
	table.insert(v82, l__Humanoid__1.Running:connect(onRunning));
	table.insert(v82, l__Humanoid__1.Jumping:connect(onJumping));
	playAnimation("idle", 0.1, l__Humanoid__1);
	u22 = "Standing";
	local u27 = true;
	task.defer(function()
		while p1.Parent ~= nil and u27 == true do
			local v83, v84 = wait(0.1);
			stepAnimate(v84);		
		end;
	end);
	return function()
		u27 = false;
		for v85, v86 in pairs(v82) do
			v86:Disconnect();
		end;
	end;
end;
