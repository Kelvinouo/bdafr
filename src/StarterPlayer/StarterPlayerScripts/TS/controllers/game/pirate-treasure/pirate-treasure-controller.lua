-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PirateTreasureController";
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
	p1.Name = "PirateTreasureController";
	p1.treasureMap = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local l__Workspace__3 = v3.Workspace;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__Players__7 = v3.Players;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__EntityUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__WatchCharacter__14 = v2.WatchCharacter;
local l__AnimatorAdded__15 = v2.AnimatorAdded;
local l__WeldUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		local v7 = l__ReplicatedStorage__2.Assets.Effects.PirateTreasure:Clone();
		v7.Parent = l__Workspace__3;
		if v7 then
			local l__Main__8 = v7:WaitForChild("Main", 3);
			if l__Main__8 then
				p2.treasureMap[p3.secret] = v7;
				v7:SetAttribute("Secret", p3.secret);
				p3.position = p3.position - Vector3.new(0, 2, 0);
				v7:SetPrimaryPartCFrame(CFrame.new(p3.position));
				local v9 = u4("ProximityPrompt", {
					ActionText = "Treasure Chest", 
					ObjectText = "Open", 
					HoldDuration = 3, 
					KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
					RequiresLineOfSight = false, 
					MaxActivationDistance = 5, 
					Parent = l__Main__8, 
					ClickablePrompt = l__DeviceUtil__6.isMobileControls()
				});
				v9.Triggered:Connect(function(p4)
					if p4 == l__Players__7.LocalPlayer then
						l__GameAnimationUtil__8.playAnimation(p4, l__AnimationType__9.SHOVEL_DIG);
						l__SoundManager__10:playSound(l__GameSound__11.SNAP_TRAP_CONSUME_MARK);
						local v10 = l__EntityUtil__12:getEntity(p4);
						if v10 ~= nil then
							v10 = v10:isAlive();
						end;
						if not v10 then
							return nil;
						end;
						if not p2:openChest(v7) then
							v9:Destroy();
							l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
								message = "You are late! Somebody else has took the treasure!"
							});
							return;
						end;
					else
						return;
					end;
					v9:Destroy();
					l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
						message = "You've found the priate's treasure! You will get extra Doubloons for this match!"
					});
				end);
				return;
			end;
		else
			return;
		end;
		return nil;
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p5)
		p2.treasureMap[p5.secret] = nil;
		local u17 = p2.treasureMap[p5.secret];
		task.delay(0.3, function()
			if u17 then
				p2:openChestAnimation(u17);
			end;
		end);
	end);
	l__WatchCharacter__14(function(p6, p7)
		l__AnimatorAdded__15(p7:WaitForChild("Humanoid"), function(p8)
			p8.AnimationPlayed:Connect(function(p9)
				local v11 = p9.Animation;
				if v11 ~= nil then
					v11 = v11.AnimationId;
				end;
				if v11 == l__GameAnimationUtil__8.getAssetId(l__AnimationType__9.SHOVEL_DIG) then
					local v12 = l__ReplicatedStorage__2.Assets.Effects.Shovel:Clone();
					v12.Parent = p7;
					l__WeldUtil__16:weldCharacterAccessories(p7);
					local v13 = l__EntityUtil__12:getEntity(p6);
					if v13 ~= nil then
						v13 = v13:getHandItemInstanceFromCharacter();
					end;
					if v13 then
						local v14, v15, v16 = ipairs(v13:GetChildren());
						while true do
							v14(v15, v16);
							if not v14 then
								break;
							end;
							v16 = v14;
							if v15:IsA("BasePart") then
								v15.Transparency = 1;
							end;						
						end;
					end;
					p9.Stopped:Connect(function()
						v12:Destroy();
						if v13 then
							local v17, v18, v19 = ipairs(v13:GetChildren());
							while true do
								v17(v18, v19);
								if not v17 then
									break;
								end;
								v19 = v17;
								if v18:IsA("BasePart") then
									v18.Transparency = 0;
								end;							
							end;
						end;
					end);
				end;
			end);
		end);
	end);
end;
function v5.openChest(p10, p11)
	return l__default__1.Client:Get("RemoteName"):CallServer({
		secret = p11:GetAttribute("Secret")
	});
end;
function v5.openChestAnimation(p12, p13)
	p13:SetPrimaryPartCFrame(p13:GetPrimaryPartCFrame() + Vector3.new(0, 2, 0));
	local v20 = p13:WaitForChild("Main", 3);
	if v20 ~= nil then
		v20 = v20:WaitForChild("lid_close", 3);
	end;
	local v21 = p13:WaitForChild("Main", 3);
	if v21 ~= nil then
		v21 = v21:WaitForChild("lid_open", 3);
	end;
	local v22 = p13:WaitForChild("Main", 3);
	if v22 ~= nil then
		v22 = v22:WaitForChild("particle", 3);
	end;
	if v20 and v21 and v22 then
		v20.Transparency = 1;
		v21.Transparency = 0;
		local v23, v24, v25 = ipairs(v22:GetChildren());
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			v25 = v23;
			if v24:IsA("ParticleEmitter") then
				v24.Enabled = true;
			end;		
		end;
		task.delay(3, function()
			p13:Destroy();
		end);
	end;
end;
local v26 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
