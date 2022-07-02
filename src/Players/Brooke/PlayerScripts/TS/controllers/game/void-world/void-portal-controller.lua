-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VoidPortalController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidPortalController";
end;
local l__Players__2 = v3.Players;
local l__CollectionService__3 = v3.CollectionService;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__5 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__WatchCollectionTag__8 = v2.WatchCollectionTag;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VoidPortalTag__11 = v1.import(script, script.Parent, "void-portal-tag").VoidPortalTag;
local l__VoidWorldUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil;
local l__getItemMeta__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__default__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__InventoryUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__Flamework__18 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SoundManager__19 = v2.SoundManager;
local l__GameSound__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	task.spawn(function()
		while true do
			local v7 = task.wait(0.25);
			if v7 == 0 then
				break;
			end;
			if v7 ~= v7 then
				break;
			end;
			if not v7 then
				break;
			end;
			local v8 = l__Players__2.LocalPlayer.Character;
			if v8 ~= nil then
				v8 = v8.PrimaryPart;
				if v8 ~= nil then
					v8 = v8.Position;
				end;
			end;
			for v9, v10 in ipairs(l__CollectionService__3:GetTagged("VoidPortal")) do
				task.spawn(function()
					if v8 then
						local v11 = (v8 - v10.Position).Magnitude;
					else
						v11 = math.huge;
					end;
					local l__Rig__12 = v10:FindFirstChild("Rig");
					if not l__Rig__12 then
						return nil;
					end;
					if not l__Rig__12.PrimaryPart then
						return nil;
					end;
					if v8 then
						local v13 = l__Rig__12:GetPrimaryPartCFrame();
						local u21 = Vector3.new(v8.X, v13.Y, v8.Z);
						l__default__4(0.25, l__Linear__5, function(p3)
							if not l__Rig__12.PrimaryPart then
								return nil;
							end;
							l__Rig__12:SetPrimaryPartCFrame(v13:Lerp(CFrame.new(v13.Position, u21) * CFrame.Angles(0, math.pi / 2, 0), p3));
						end);
					end;
					local v14 = l__Rig__12;
					if v14 ~= nil then
						v14 = v14:FindFirstChildWhichIsA("AnimationController");
						if v14 ~= nil then
							v14 = v14:FindFirstChildWhichIsA("Animator");
						end;
					end;
					if v14 then
						local v15 = v11 < 10;
						local v16 = nil;
						local v17, v18, v19 = ipairs((v14:GetPlayingAnimationTracks()));
						while true do
							local v20, v21 = v17(v18, v19);
							if not v20 then
								break;
							end;
							local v22 = v21.Animation;
							if v22 ~= nil then
								v22 = v22.AnimationId;
							end;
							if v22 == l__GameAnimationUtil__6.getAssetId(l__AnimationType__7.VOID_PORTAL_EXCITED) == true then
								v16 = v21;
								break;
							end;						
						end;
						if v15 and not v16 then
							l__GameAnimationUtil__6.playAnimation(v14, l__AnimationType__7.VOID_PORTAL_EXCITED, {
								fadeInTime = 0.1
							});
							return;
						end;
						if not v15 and v16 then
							v16:Stop(0.5);
							task.delay(0.15, function()
								v16:Destroy();
							end);
						end;
					end;
				end);
			end;		
		end;
	end);
	l__WatchCollectionTag__8("VoidPortal", function(p4)
		local v23 = u9.new();
		task.spawn(function()
			p4:WaitForChild("Rig");
			l__GameAnimationUtil__6.playAnimation(p4.Rig:WaitForChild("AnimationController"):WaitForChild("Animator"), l__AnimationType__7.VOID_PORTAL_IDLE);
		end);
		task.spawn(function()
			local v24 = p4:GetAttribute("CloseTime");
			if v24 == 0 or v24 ~= v24 or not v24 then
				p4:GetAttributeChangedSignal("CloseTime"):Wait();
			end;
			local v25 = p4:GetAttribute("CloseTime");
			if v25 ~= nil then
				u10.mount(u10.createElement(l__VoidPortalTag__11, {
					getTag = function(p5)
						return "Closes in " .. tostring(p5) .. "s";
					end, 
					closeTime = v25
				}), p4, "VoidTag");
			end;
		end);
		local v26 = p4:GetAttribute("VoidExit") == true;
		local v27 = tostring(l__VoidWorldUtil__12.VOID_ENTRY_COST) .. " " .. l__getItemMeta__13(l__VoidWorldUtil__12.VOID_ENTRY_MATERIAL).displayName;
		local v28 = {
			KeyboardKeyCode = l__Theme__15.promptKeyboardKey, 
			HoldDuration = 3, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6
		};
		if v26 then
			local v29 = "Exit";
		else
			v29 = "Enter (" .. v27 .. ")";
		end;
		v28.ActionText = v29;
		v28.ObjectText = "Void";
		v28.ClickablePrompt = false;
		v28.Parent = p4;
		local v30 = u14("ProximityPrompt", v28);
		p4.AncestryChanged:Connect(function(p6, p7)
			if p7 == nil then
				v23:DoCleaning();
			end;
		end);
		v23:GiveTask(l__default__16.Client:Get("RemoteName"):Connect(function(p8)
			if p8.entityInstance == l__Players__2.LocalPlayer.Character then
				v30:InputHoldEnd();
			end;
		end));
		v30.PromptButtonHoldBegan:Connect(function(p9)
			if not v26 and not l__InventoryUtil__17.hasEnough(p9, l__VoidWorldUtil__12.VOID_ENTRY_MATERIAL, l__VoidWorldUtil__12.VOID_ENTRY_COST) then
				v30:InputHoldEnd();
				l__Flamework__18.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You need " .. v27 .. " to enter the Void."
				});
				return nil;
			end;
			local v31 = u9.new();
			local u22 = l__GameAnimationUtil__6.playAnimation(l__Players__2.LocalPlayer, l__AnimationType__7.OPEN_CRATE);
			v31:GiveTask(function()
				if u22 ~= nil then
					u22:Stop();
				end;
				if u22 ~= nil then
					u22:Destroy();
				end;
			end);
			v30.PromptButtonHoldEnded:Connect(function()
				v31:DoCleaning();
			end);
			v30.AncestryChanged:Connect(function(p10, p11)
				if p11 == nil then
					v31:DoCleaning();
				end;
			end);
		end);
		v30.Triggered:Connect(function(p12)
			l__SoundManager__19:playSound(l__GameSound__20.VOID_PORTAL_TELEPORT);
			l__default__16.Client:Get("RemoteName"):SendToServer({
				blockInstance = p4
			});
		end);
	end);
	l__default__16.Client:WaitFor("RemoteName"):andThen(function(p13)
		p13:Connect(function(p14)
			if p14.player == l__Players__2.LocalPlayer then
				return nil;
			end;
			l__SoundManager__19:playSound(l__GameSound__20.VOID_PORTAL_TELEPORT, {
				position = p14.portal.Position, 
				rollOffMaxDistance = 80
			});
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
