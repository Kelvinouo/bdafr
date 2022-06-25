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
						local v16 = v14:GetPlayingAnimationTracks();
						local function v17(p4)
							local v18 = p4.Animation;
							if v18 ~= nil then
								v18 = v18.AnimationId;
							end;
							return v18 == l__GameAnimationUtil__6.getAssetId(l__AnimationType__7.VOID_PORTAL_EXCITED);
						end;
						local v19 = nil;
						for v20, v21 in ipairs(v16) do
							if v17(v21, v20 - 1, v16) == true then
								v19 = v21;
								break;
							end;
						end;
						if v15 and not v19 then
							l__GameAnimationUtil__6.playAnimation(v14, l__AnimationType__7.VOID_PORTAL_EXCITED, {
								fadeInTime = 0.1
							});
							return;
						end;
						if not v15 and v19 then
							v19:Stop(0.5);
							task.delay(0.15, function()
								v19:Destroy();
							end);
						end;
					end;
				end);
			end;		
		end;
	end);
	l__WatchCollectionTag__8("VoidPortal", function(p5)
		local v22 = u9.new();
		task.spawn(function()
			p5:WaitForChild("Rig");
			l__GameAnimationUtil__6.playAnimation(p5.Rig:WaitForChild("AnimationController"):WaitForChild("Animator"), l__AnimationType__7.VOID_PORTAL_IDLE);
		end);
		task.spawn(function()
			local v23 = p5:GetAttribute("CloseTime");
			if v23 == 0 or v23 ~= v23 or not v23 then
				p5:GetAttributeChangedSignal("CloseTime"):Wait();
			end;
			local v24 = p5:GetAttribute("CloseTime");
			if v24 ~= nil then
				u10.mount(u10.createElement(l__VoidPortalTag__11, {
					getTag = function(p6)
						return "Closes in " .. tostring(p6) .. "s";
					end, 
					closeTime = v24
				}), p5, "VoidTag");
			end;
		end);
		local v25 = p5:GetAttribute("VoidExit") == true;
		local v26 = tostring(l__VoidWorldUtil__12.VOID_ENTRY_COST) .. " " .. l__getItemMeta__13(l__VoidWorldUtil__12.VOID_ENTRY_MATERIAL).displayName;
		local v27 = {
			KeyboardKeyCode = l__Theme__15.promptKeyboardKey, 
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
		v27.Parent = p5;
		local v29 = u14("ProximityPrompt", v27);
		p5.AncestryChanged:Connect(function(p7, p8)
			if p8 == nil then
				v22:DoCleaning();
			end;
		end);
		v22:GiveTask(l__default__16.Client:Get("RemoteName"):Connect(function(p9)
			if p9.entityInstance == l__Players__2.LocalPlayer.Character then
				v29:InputHoldEnd();
			end;
		end));
		v29.PromptButtonHoldBegan:Connect(function(p10)
			if not v25 and not l__InventoryUtil__17.hasEnough(p10, l__VoidWorldUtil__12.VOID_ENTRY_MATERIAL, l__VoidWorldUtil__12.VOID_ENTRY_COST) then
				v29:InputHoldEnd();
				l__Flamework__18.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
					message = "You need " .. v26 .. " to enter the Void."
				});
				return nil;
			end;
			local v30 = u9.new();
			local u22 = l__GameAnimationUtil__6.playAnimation(l__Players__2.LocalPlayer, l__AnimationType__7.OPEN_CRATE);
			v30:GiveTask(function()
				if u22 ~= nil then
					u22:Stop();
				end;
				if u22 ~= nil then
					u22:Destroy();
				end;
			end);
			v29.PromptButtonHoldEnded:Connect(function()
				v30:DoCleaning();
			end);
			v29.AncestryChanged:Connect(function(p11, p12)
				if p12 == nil then
					v30:DoCleaning();
				end;
			end);
		end);
		v29.Triggered:Connect(function(p13)
			l__SoundManager__19:playSound(l__GameSound__20.VOID_PORTAL_TELEPORT);
			l__default__16.Client:Get("RemoteName"):SendToServer({
				blockInstance = p5
			});
		end);
	end);
	l__default__16.Client:WaitFor("RemoteName"):andThen(function(p14)
		p14:Connect(function(p15)
			if p15.player == l__Players__2.LocalPlayer then
				return nil;
			end;
			l__SoundManager__19:playSound(l__GameSound__20.VOID_PORTAL_TELEPORT, {
				position = p15.portal.Position, 
				rollOffMaxDistance = 80
			});
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
