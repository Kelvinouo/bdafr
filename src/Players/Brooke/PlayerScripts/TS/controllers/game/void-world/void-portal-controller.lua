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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "VoidPortalController";
end;
local l__Players__1 = v3.Players;
local l__CollectionService__2 = v3.CollectionService;
local l__default__3 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__WatchCollectionTag__7 = v2.WatchCollectionTag;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VoidPortalTag__10 = v1.import(script, script.Parent, "void-portal-tag").VoidPortalTag;
local l__VoidWorldUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil;
local l__getItemMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__default__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__InventoryUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__Flamework__17 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__SoundManager__18 = v2.SoundManager;
local l__GameSound__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
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
			local v8 = l__Players__1.LocalPlayer.Character;
			if v8 ~= nil then
				v8 = v8.PrimaryPart;
				if v8 ~= nil then
					v8 = v8.Position;
				end;
			end;
			local v9, v10, v11 = ipairs(l__CollectionService__2:GetTagged("VoidPortal"));
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				v11 = v9;
				task.spawn(function()
					if v8 then
						local v12 = (v8 - v10.Position).Magnitude;
					else
						v12 = math.huge;
					end;
					local l__Rig__13 = v10:FindFirstChild("Rig");
					if not l__Rig__13 then
						return nil;
					end;
					if not l__Rig__13.PrimaryPart then
						return nil;
					end;
					if v8 then
						local v14 = l__Rig__13:GetPrimaryPartCFrame();
						local u20 = Vector3.new(v8.X, v14.Y, v8.Z);
						l__default__3(0.25, l__Linear__4, function(p3)
							if not l__Rig__13.PrimaryPart then
								return nil;
							end;
							l__Rig__13:SetPrimaryPartCFrame(v14:Lerp(CFrame.new(v14.Position, u20) * CFrame.Angles(0, math.pi / 2, 0), p3));
						end);
					end;
					local v15 = l__Rig__13;
					if v15 ~= nil then
						v15 = v15:FindFirstChildWhichIsA("AnimationController");
						if v15 ~= nil then
							v15 = v15:FindFirstChildWhichIsA("Animator");
						end;
					end;
					if v15 then
						local v16 = v12 < 10;
						local v17 = nil;
						local v18, v19, v20 = ipairs((v15:GetPlayingAnimationTracks()));
						while true do
							v18(v19, v20);
							if not v18 then
								break;
							end;
							local v21 = v19.Animation;
							if v21 ~= nil then
								v21 = v21.AnimationId;
							end;
							if v21 == l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.VOID_PORTAL_EXCITED) == true then
								v17 = v19;
								break;
							end;						
						end;
						if v16 and not v17 then
							l__GameAnimationUtil__5.playAnimation(v15, l__AnimationType__6.VOID_PORTAL_EXCITED, {
								fadeInTime = 0.1
							});
							return;
						end;
						if not v16 and v17 then
							v17:Stop(0.5);
							task.delay(0.15, function()
								v17:Destroy();
							end);
						end;
					end;
				end);			
			end;		
		end;
	end);
	l__WatchCollectionTag__7("VoidPortal", function(p4)
		local v22 = u8.new();
		task.spawn(function()
			p4:WaitForChild("Rig");
			l__GameAnimationUtil__5.playAnimation(p4.Rig:WaitForChild("AnimationController"):WaitForChild("Animator"), l__AnimationType__6.VOID_PORTAL_IDLE);
		end);
		task.spawn(function()
			local v23 = p4:GetAttribute("CloseTime");
			if v23 == 0 or v23 ~= v23 or not v23 then
				p4:GetAttributeChangedSignal("CloseTime"):Wait();
			end;
			local v24 = p4:GetAttribute("CloseTime");
			if v24 ~= nil then
				u9.mount(u9.createElement(l__VoidPortalTag__10, {
					getTag = function(p5)
						return "Closes in " .. tostring(p5) .. "s";
					end, 
					closeTime = v24
				}), p4, "VoidTag");
			end;
		end);
		local v25 = p4:GetAttribute("VoidExit") == true;
		local v26 = tostring(l__VoidWorldUtil__11.VOID_ENTRY_COST) .. " " .. l__getItemMeta__12(l__VoidWorldUtil__11.VOID_ENTRY_MATERIAL).displayName;
		local v27 = {
			KeyboardKeyCode = l__Theme__14.promptKeyboardKey, 
			HoldDuration = 3, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6
		};
		if v25 then
			local v28 = "Exit";
		else
			v28 = "Enter (" .. v26 .. ")";
		end;
		v27.ActionText = v28;
		v27.ObjectText = "Void";
		v27.ClickablePrompt = false;
		v27.Parent = p4;
		local v29 = u13("ProximityPrompt", v27);
		p4.AncestryChanged:Connect(function(p6, p7)
			if p7 == nil then
				v22:DoCleaning();
			end;
		end);
		v22:GiveTask(l__default__15.Client:Get("RemoteName"):Connect(function(p8)
			if p8.entityInstance == l__Players__1.LocalPlayer.Character then
				v29:InputHoldEnd();
			end;
		end));
		v29.PromptButtonHoldBegan:Connect(function(p9)
			if not v25 and not l__InventoryUtil__16.hasEnough(p9, l__VoidWorldUtil__11.VOID_ENTRY_MATERIAL, l__VoidWorldUtil__11.VOID_ENTRY_COST) then
				v29:InputHoldEnd();
				l__Flamework__17.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You need " .. v26 .. " to enter the Void."
				});
				return nil;
			end;
			local v30 = u8.new();
			local u21 = l__GameAnimationUtil__5.playAnimation(l__Players__1.LocalPlayer, l__AnimationType__6.OPEN_CRATE);
			v30:GiveTask(function()
				if u21 ~= nil then
					u21:Stop();
				end;
				if u21 ~= nil then
					u21:Destroy();
				end;
			end);
			v29.PromptButtonHoldEnded:Connect(function()
				v30:DoCleaning();
			end);
			v29.AncestryChanged:Connect(function(p10, p11)
				if p11 == nil then
					v30:DoCleaning();
				end;
			end);
		end);
		v29.Triggered:Connect(function(p12)
			l__SoundManager__18:playSound(l__GameSound__19.VOID_PORTAL_TELEPORT);
			l__default__15.Client:Get("RemoteName"):SendToServer({
				blockInstance = p4
			});
		end);
	end);
	l__default__15.Client:WaitFor("RemoteName"):andThen(function(p13)
		p13:Connect(function(p14)
			if p14.player == l__Players__1.LocalPlayer then
				return nil;
			end;
			l__SoundManager__18:playSound(l__GameSound__19.VOID_PORTAL_TELEPORT, {
				position = p14.portal.Position, 
				rollOffMaxDistance = 80
			});
		end);
	end);
end;
local v31 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
