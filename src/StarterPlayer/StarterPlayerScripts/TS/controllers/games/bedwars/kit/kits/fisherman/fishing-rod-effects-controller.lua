
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FishingRodEffectsController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__3 = v4.ReplicatedStorage;
local l__Workspace__4 = v4.Workspace;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__TweenService__6 = v4.TweenService;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__9 = v4.Players;
local l__KnitClient__10 = v3.KnitClient;
local l__ClientSyncEvents__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__InventoryUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local u15 = v2.ConstantManager.registerConstants(script, {
	C0 = -5, 
	C1 = 0, 
	YAngleRod = math.pi / 3, 
	YAngleBobber = math.pi / 3
});
local l__RunService__16 = v4.RunService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:WaitFor("FishCaught"):andThen(function(p3)
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
			local v9 = l__ReplicatedStorage__3.Assets.Misc.Fisherman[p4.dropData.fishModel]:Clone();
			local v10 = p4.dropData.fishSizeMultiplier;
			if v10 == nil then
				v10 = 1;
			end;
			v9.Size = v9.Size * v10;
			v9.Parent = l__Workspace__4;
			l__GameQueryUtil__5:setQueryIgnored(v9, true);
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
			local v14 = l__TweenService__6:Create(v9, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v11);
			v14:Play();
			v14.Completed:Wait();
			wait(0.25);
			local l__Position__15 = v9.Position;
			v9:Destroy();
			if not l__Workspace__4.CurrentCamera or (l__Workspace__4.CurrentCamera.CFrame - l__Position__15).Position.Magnitude > 180 then
				return nil;
			end;
			local v16 = {};
			if p4.catchingPlayer == l__Players__9.LocalPlayer then
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
			l__SoundManager__7:playSound(l__GameSound__8.CONFETTI, v16);
			local v19 = 0;
			local v20, v21, v22 = ipairs(p4.dropData.drops);
			while true do
				local v23, v24 = v20(v21, v22);
				if not v23 then
					break;
				end;
				local v25 = math.min(8, v24.amount);
				if v24.amount > 8 then
					v25 = v25 + math.log(v24.amount - 8 + 1, 2);
				end;
				local v26 = l__KnitClient__10.Controllers.ReceiveItemEffectController:cloneItemIntoModel((l__ReplicatedStorage__3:WaitForChild("Items"):WaitForChild(v24.itemType)));
				local v27 = 0;
				local v28 = false;
				while true do
					if v28 then
						v27 = v27 + 1;
					else
						v28 = true;
					end;
					if not (v27 < math.ceil(v25)) then
						break;
					end;
					local u17 = v19;
					task.spawn(function()
						v1.Promise.delay(math.random() * 0.2):await();
						l__KnitClient__10.Controllers.ReceiveItemEffectController:playEffect(v26, l__Position__15, function()
							local v29 = p4.catchingPlayer.Character;
							if v29 ~= nil then
								v29 = v29.PrimaryPart;
								if v29 ~= nil then
									v29 = v29.CFrame;
								end;
							end;
							return v29;
						end, 0.5 + math.random() * 0.2):andThen(function(p5)
							if p5 then
								local v30 = {};
								if p4.catchingPlayer == l__Players__9.LocalPlayer then
									local v31 = nil;
								else
									local v32 = p4.catchingPlayer.Character;
									if v32 ~= nil then
										v32 = v32.PrimaryPart;
										if v32 ~= nil then
											v32 = v32.Position;
										end;
									end;
									v31 = v32;
								end;
								v30.position = v31;
								v30.volumeMultiplier = 0.8;
								local v33 = l__SoundManager__7:playSound(l__GameSound__8.PICKUP_ITEM_DROP, v30);
								if v33 then
									u17 = u17 + 1;
									v33.PlaybackSpeed = 1 + u17 / 50;
								end;
							end;
						end);
					end);				
				end;			
			end;
		end);
	end);
	l__ClientSyncEvents__11.ProjectileLaunched:connect(function(p6)
		if p6.projectileType ~= "fisherman_bobber" then
			return nil;
		end;
		local v34 = p6.projectile:GetAttribute("ProjectileShooter");
		if v34 == 0 or v34 ~= v34 or not v34 then
			return nil;
		end;
		local v35 = l__Players__9:GetPlayerByUserId(v34);
		if not v35 then
			return nil;
		end;
		local l__hand__36 = l__InventoryUtil__12.getInventory(v35).hand;
		local v37 = l__hand__36;
		if v37 ~= nil then
			v37 = v37.tool;
		end;
		local v38 = not v37 or l__hand__36.itemType ~= l__ItemType__13.FISHING_ROD;
		if v38 then
			return nil;
		end;
		local l__tool__39 = l__hand__36.tool;
		local l__projectile__40 = p6.projectile;
		local u18 = nil;
		local u19 = u14("Beam", {
			Parent = p6.projectile, 
			Attachment0 = l__projectile__40.Handle.LineAttachment, 
			Attachment1 = l__tool__39.Handle.LineAttachment, 
			CurveSize0 = u15.C0, 
			CurveSize1 = u15.C1, 
			Width0 = 0.06, 
			Width1 = 0.06, 
			LightEmission = 0.95, 
			LightInfluence = 0.95, 
			Transparency = NumberSequence.new(0), 
			Color = ColorSequence.new(Color3.fromRGB(120, 120, 120)), 
			FaceCamera = true, 
			Segments = 100
		});
		u18 = l__RunService__16.RenderStepped:Connect(function()
			if not l__tool__39.Parent or not l__projectile__40.Parent then
				u18:Disconnect();
				return nil;
			end;
			local v41 = math.min(1, (l__tool__39.Handle.LineAttachment.WorldPosition - l__projectile__40.Handle.LineAttachment.WorldPosition).Magnitude / 15);
			u19.CurveSize0 = u15.C0 * v41;
			u19.CurveSize1 = u15.C1 * v41;
			l__tool__39.Handle.LineAttachment.WorldCFrame = CFrame.new(l__tool__39.Handle.LineAttachment.WorldCFrame.Position, l__projectile__40.Handle.LineAttachment.WorldPosition) * CFrame.Angles(0, u15.YAngleRod, math.pi / 2);
			l__projectile__40.Handle.LineAttachment.WorldCFrame = CFrame.new(l__projectile__40.Handle.LineAttachment.WorldCFrame.Position, l__tool__39.Handle.LineAttachment.WorldPosition) * CFrame.Angles(0, u15.YAngleBobber, math.pi / 2);
		end);
		task.spawn(function()
			if not l__projectile__40:GetAttribute("WaitingForFish") then
				l__projectile__40:GetAttributeChangedSignal("WaitingForFish"):Wait();
			end;
			v1.Promise.delay(0.5):await();
			local v42 = l__projectile__40;
			if v42 ~= nil then
				v42 = v42.PrimaryPart;
				if v42 ~= nil then
					v42 = v42.Parent;
				end;
			end;
			if v42 == nil then
				return nil;
			end;
			local l__Position__43 = l__projectile__40:GetPrimaryPartCFrame().Position;
			local u20 = nil;
			local u21 = os.clock();
			local u22 = l__projectile__40:GetPrimaryPartCFrame() - l__Position__43;
			u20 = l__RunService__16.RenderStepped:Connect(function()
				if not l__projectile__40.Parent then
					u20:Disconnect();
					return nil;
				end;
				l__projectile__40:SetPrimaryPartCFrame(CFrame.new(l__Position__43 + Vector3.new(0, math.sin((os.clock() - u21) * math.pi) * 0.5, 0)) * u22);
			end);
		end);
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;

