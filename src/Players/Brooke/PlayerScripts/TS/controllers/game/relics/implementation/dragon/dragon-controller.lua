-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "DragonController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "DragonController";
end;
local l__WatchCollectionTag__1 = v2.WatchCollectionTag;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v4.ReplicatedStorage;
local l__Workspace__6 = v4.Workspace;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__RunService__9 = v4.RunService;
local l__KnitClient__10 = v3.KnitClient;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__WatchCollectionTag__1("Dragon", function(p3)
		if not p3.PrimaryPart then
			p3:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local v8 = {
			rollOffMaxDistance = 600, 
			rollOffMinDistsance = 100
		};
		local v9 = p3.PrimaryPart;
		if v9 ~= nil then
			v9 = v9.Position;
		end;
		v8.position = v9;
		l__SoundManager__2:playSound(l__GameSound__3.DRAGON_ROAR, v8);
		local v10 = u4.new();
		local v11 = l__ReplicatedStorage__5.Assets.Effects.DragonEffect:Clone();
		v11.CanCollide = false;
		v11.Anchored = true;
		v11.Parent = l__Workspace__6;
		v10:GiveTask(v11);
		local v12, v13, v14 = ipairs(v11:GetDescendants());
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			if v13:IsA("Beam") then
				v13.Enabled = false;
			end;		
		end;
		task.spawn(function()
			local v15 = p3;
			if v15 ~= nil then
				v15 = v15:WaitForChild("AnimationController");
				if v15 ~= nil then
					v15 = v15:WaitForChild("Animator");
				end;
			end;
			local v16 = v15;
			if v16 ~= nil then
				v16 = v16:GetPlayingAnimationTracks();
			end;
			if v16 then
				local v17, v18, v19 = ipairs(v16);
				while true do
					v17(v18, v19);
					if not v17 then
						break;
					end;
					local v20 = v18.Animation;
					if v20 ~= nil then
						v20 = v20.AnimationId;
					end;
					if v20 == l__GameAnimationUtil__7.getAssetId(l__AnimationType__8.DRAGON_FLYING) then
						v18:GetMarkerReachedSignal("sound"):Connect(function()
							l__SoundManager__2:playSound(l__GameSound__3.DRAGON_WING_FLAP_1, {
								position = p3.RootPart.Position, 
								rollOffMinDistsance = 30, 
								playbackSpeedMultiplier = 1 + math.random() * 0.2, 
								rollOffMaxDistance = 400
							});
						end);
					end;				
				end;
			end;
			v15.AnimationPlayed:Connect(function(p4)
				local v21 = p4.Animation;
				if v21 ~= nil then
					v21 = v21.AnimationId;
				end;
				if v21 == l__GameAnimationUtil__7.getAssetId(l__AnimationType__8.DRAGON_FLYING) then
					p4:GetMarkerReachedSignal("sound"):Connect(function()
						l__SoundManager__2:playSound(l__GameSound__3.DRAGON_WING_FLAP_1, {
							position = p3.RootPart.Position, 
							rollOffMinDistsance = 30, 
							playbackSpeedMultiplier = 1 + math.random() * 0.2, 
							rollOffMaxDistance = 400
						});
					end);
				end;
			end);
		end);
		local u11 = "forward";
		local u12 = 0;
		v10:GiveTask(l__RunService__9.Heartbeat:Connect(function()
			v11.CFrame = p3.RootPart.master_bone.torso["torso.001"].neck["neck.001"]["neck.002"].head.TransformedWorldCFrame * CFrame.new(v11:GetAttribute("EffectOffset") or Vector3.new(0, 20, 0)) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966);
			local v22 = p3:GetAttribute("attacking");
			if v22 then
				local v23, v24, v25 = ipairs(v11:GetDescendants());
				while true do
					v23(v24, v25);
					if not v23 then
						break;
					end;
					v25 = v23;
					if v24:IsA("Beam") then
						local l__Attachment0__26 = v24.Attachment0;
						local l__Attachment1__27 = v24.Attachment1;
						if l__Attachment1__27 and l__Attachment0__26 then
							if u11 == "forward" then
								local v28 = math.clamp((os.clock() - u12) * 4, 0, 1);
							else
								v28 = math.clamp(1 + (u12 - os.clock()) * 4, 0, 1);
							end;
							l__Attachment1__27.WorldPosition = l__Attachment0__26.WorldPosition:Lerp((CFrame.new(v22) * (l__Attachment1__27.CFrame - l__Attachment1__27.CFrame.Position)).Position + l__Attachment1__27.CFrame.LookVector * 7, math.clamp(v28, 0.3, 1));
						end;
					end;				
				end;
			end;
		end));
		v10:GiveTask(p3:GetAttributeChangedSignal("attacking"):Connect(function()
			local v29 = p3:GetAttribute("attacking");
			if v29 == nil then
				u12 = os.clock();
				u11 = "backpack";
				task.delay(0.3, function()
					local v30, v31, v32 = ipairs(v11:GetDescendants());
					while true do
						v30(v31, v32);
						if not v30 then
							break;
						end;
						v32 = v30;
						if v31:IsA("Beam") then
							v31.Enabled = false;
						end;					
					end;
				end);
				return;
			end;
			u12 = os.clock();
			u11 = "forward";
			l__KnitClient__10.Controllers.ScreenShakeController:shake(p3.PrimaryPart.Position, (p3.PrimaryPart.Position - v29).Unit, {
				magnitude = 0.8, 
				duration = 4, 
				cycles = 120
			});
			local v33 = {
				rollOffMaxDistance = 600, 
				rollOffMinDistsance = 100
			};
			local v34 = p3.PrimaryPart;
			if v34 ~= nil then
				v34 = v34.Position;
			end;
			v33.position = v34;
			l__SoundManager__2:playSound(l__GameSound__3.DRAGON_ROAR, v33);
			local v35, v36, v37 = ipairs(v11:GetDescendants());
			while true do
				v35(v36, v37);
				if not v35 then
					break;
				end;
				v37 = v35;
				if v36:IsA("Beam") then
					v36.Enabled = true;
				end;			
			end;
		end));
		p3.AncestryChanged:Connect(function()
			if not p3:IsDescendantOf(l__Workspace__6) then
				v10:DoCleaning();
			end;
		end);
	end);
end;
local v38 = v3.KnitClient.CreateController(v6.new());
return nil;
