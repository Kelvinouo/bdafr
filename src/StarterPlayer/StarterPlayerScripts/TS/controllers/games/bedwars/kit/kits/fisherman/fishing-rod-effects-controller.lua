-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "FishingRodEffectsController";
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
	p1.Name = "FishingRodEffectsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v4.ReplicatedStorage;
local l__Workspace__3 = v4.Workspace;
local l__GameQueryUtil__4 = v2.GameQueryUtil;
local l__TweenService__5 = v4.TweenService;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__8 = v4.Players;
local l__KnitClient__9 = v3.KnitClient;
local l__ClientSyncEvents__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__InventoryUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local u14 = v2.ConstantManager.registerConstants(script, {
	C0 = -5, 
	C1 = 0, 
	YAngleRod = math.pi / 3, 
	YAngleBobber = math.pi / 3
});
local l__RunService__15 = v4.RunService;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			local v8 = p4.catchingPlayer.Character;
			if v8 ~= nil then
				v8 = v8.PrimaryPart;
				if v8 ~= nil then
					v8 = v8.Position;
				end;
			end;
			if not v8 then
				return nil;
			end;
			local v9 = l__ReplicatedStorage__2.Assets.Misc.Fisherman[p4.dropData.fishModel]:Clone();
			local v10 = p4.dropData.fishSizeMultiplier;
			if v10 == nil then
				v10 = 1;
			end;
			v9.Size = v9.Size * v10;
			v9.Parent = l__Workspace__3;
			l__GameQueryUtil__4:setQueryIgnored(v9, true);
			v9.Position = p4.catchPosition;
			local v11 = {};
			local v12 = p4.catchingPlayer.Character;
			if v12 ~= nil then
				v12 = v12.PrimaryPart;
				if v12 ~= nil then
					v12 = v12.Position;
				end;
			end;
			local v13 = v12;
			if v13 == nil then
				v13 = v8;
			end;
			v11.Position = v13 + Vector3.new(0, 6, 0);
			local v14 = l__TweenService__5:Create(v9, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v11);
			v14:Play();
			v14.Completed:Wait();
			wait(0.25);
			local l__Position__15 = v9.Position;
			v9:Destroy();
			if not l__Workspace__3.CurrentCamera or (l__Workspace__3.CurrentCamera.CFrame - l__Position__15).Position.Magnitude > 180 then
				return nil;
			end;
			local v16 = {};
			if p4.catchingPlayer == l__Players__8.LocalPlayer then
				local v17 = nil;
			else
				local v18 = p4.catchingPlayer.Character;
				if v18 ~= nil then
					v18 = v18.PrimaryPart;
					if v18 ~= nil then
						v18 = v18.Position;
					end;
				end;
				v17 = v18;
			end;
			v16.position = v17;
			v16.volumeMultiplier = 0.8;
			l__SoundManager__6:playSound(l__GameSound__7.CONFETTI, v16);
			local v19 = 0;
			local v20, v21, v22 = ipairs(p4.dropData.drops);
			while true do
				v20(v21, v22);
				if not v20 then
					break;
				end;
				local v23 = math.min(8, v21.amount);
				if v21.amount > 8 then
					v23 = v23 + math.log(v21.amount - 8 + 1, 2);
				end;
				local v24 = l__KnitClient__9.Controllers.ReceiveItemEffectController:cloneItemIntoModel((l__ReplicatedStorage__2:WaitForChild("Items"):WaitForChild(v21.itemType)));
				local v25 = 0;
				local v26 = false;
				while true do
					if v26 then
						v25 = v25 + 1;
					else
						v26 = true;
					end;
					if not (v25 < math.ceil(v23)) then
						break;
					end;
					local u16 = v19;
					task.spawn(function()
						v1.Promise.delay(math.random() * 0.2):await();
						l__KnitClient__9.Controllers.ReceiveItemEffectController:playEffect(v24, l__Position__15, function()
							local v27 = p4.catchingPlayer.Character;
							if v27 ~= nil then
								v27 = v27.PrimaryPart;
								if v27 ~= nil then
									v27 = v27.CFrame;
								end;
							end;
							return v27;
						end, 0.5 + math.random() * 0.2):andThen(function(p5)
							if p5 then
								local v28 = {};
								if p4.catchingPlayer == l__Players__8.LocalPlayer then
									local v29 = nil;
								else
									local v30 = p4.catchingPlayer.Character;
									if v30 ~= nil then
										v30 = v30.PrimaryPart;
										if v30 ~= nil then
											v30 = v30.Position;
										end;
									end;
									v29 = v30;
								end;
								v28.position = v29;
								v28.volumeMultiplier = 0.8;
								local v31 = l__SoundManager__6:playSound(l__GameSound__7.PICKUP_ITEM_DROP, v28);
								if v31 then
									u16 = u16 + 1;
									v31.PlaybackSpeed = 1 + u16 / 50;
								end;
							end;
						end);
					end);				
				end;			
			end;
		end);
	end);
	l__ClientSyncEvents__10.ProjectileLaunched:connect(function(p6)
		if p6.projectileType ~= "fisherman_bobber" then
			return nil;
		end;
		local v32 = p6.projectile:GetAttribute("ProjectileShooter");
		if v32 == 0 or v32 ~= v32 or not v32 then
			return nil;
		end;
		local v33 = l__Players__8:GetPlayerByUserId(v32);
		if not v33 then
			return nil;
		end;
		local l__hand__34 = l__InventoryUtil__11.getInventory(v33).hand;
		local v35 = l__hand__34;
		if v35 ~= nil then
			v35 = v35.tool;
		end;
		local v36 = not v35 or l__hand__34.itemType ~= l__ItemType__12.FISHING_ROD;
		if v36 then
			return nil;
		end;
		local l__tool__37 = l__hand__34.tool;
		local l__projectile__38 = p6.projectile;
		local u17 = nil;
		local u18 = u13("Beam", {
			Parent = p6.projectile, 
			Attachment0 = l__projectile__38.Handle.LineAttachment, 
			Attachment1 = l__tool__37.Handle.LineAttachment, 
			CurveSize0 = u14.C0, 
			CurveSize1 = u14.C1, 
			Width0 = 0.06, 
			Width1 = 0.06, 
			LightEmission = 0.95, 
			LightInfluence = 0.95, 
			Transparency = NumberSequence.new(0), 
			Color = ColorSequence.new(Color3.fromRGB(120, 120, 120)), 
			FaceCamera = true, 
			Segments = 100
		});
		u17 = l__RunService__15.RenderStepped:Connect(function()
			if not l__tool__37.Parent or not l__projectile__38.Parent then
				u17:Disconnect();
				return nil;
			end;
			local v39 = math.min(1, (l__tool__37.Handle.LineAttachment.WorldPosition - l__projectile__38.Handle.LineAttachment.WorldPosition).Magnitude / 15);
			u18.CurveSize0 = u14.C0 * v39;
			u18.CurveSize1 = u14.C1 * v39;
			l__tool__37.Handle.LineAttachment.WorldCFrame = CFrame.new(l__tool__37.Handle.LineAttachment.WorldCFrame.Position, l__projectile__38.Handle.LineAttachment.WorldPosition) * CFrame.Angles(0, u14.YAngleRod, math.pi / 2);
			l__projectile__38.Handle.LineAttachment.WorldCFrame = CFrame.new(l__projectile__38.Handle.LineAttachment.WorldCFrame.Position, l__tool__37.Handle.LineAttachment.WorldPosition) * CFrame.Angles(0, u14.YAngleBobber, math.pi / 2);
		end);
		task.spawn(function()
			if not l__projectile__38:GetAttribute("WaitingForFish") then
				l__projectile__38:GetAttributeChangedSignal("WaitingForFish"):Wait();
			end;
			v1.Promise.delay(0.5):await();
			local v40 = l__projectile__38;
			if v40 ~= nil then
				v40 = v40.PrimaryPart;
				if v40 ~= nil then
					v40 = v40.Parent;
				end;
			end;
			if v40 == nil then
				return nil;
			end;
			local l__Position__41 = l__projectile__38:GetPrimaryPartCFrame().Position;
			local u19 = nil;
			local u20 = os.clock();
			local u21 = l__projectile__38:GetPrimaryPartCFrame() - l__Position__41;
			u19 = l__RunService__15.RenderStepped:Connect(function()
				if not l__projectile__38.Parent then
					u19:Disconnect();
					return nil;
				end;
				l__projectile__38:SetPrimaryPartCFrame(CFrame.new(l__Position__41 + Vector3.new(0, math.sin((os.clock() - u20) * math.pi) * 0.5, 0)) * u21);
			end);
		end);
	end);
end;
local v42 = v3.KnitClient.CreateController(v6.new());
return nil;
