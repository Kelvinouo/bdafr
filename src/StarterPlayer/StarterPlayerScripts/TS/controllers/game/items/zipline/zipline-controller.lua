-- Script Hash: 3ffe876ff44cea7f74bdd50d3e00454b7a953d0862330c3def72b40c598c693efb20fc77fb743f67ec9f04c938666fa3
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "ZiplineController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ZiplineController";
end;
local l__CollectionTagAdded__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__Players__7 = v4.Players;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__BlockEngine__10 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Maid__11 = v3.Maid;
local l__KnitClient__12 = v3.KnitClient;
local l__RunService__13 = v4.RunService;
local l__Workspace__14 = v4.Workspace;
local l__GameQueryUtil__15 = v2.GameQueryUtil;
local l__SoundManager__16 = v2.SoundManager;
local l__GameSound__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__18 = v4.CollectionService;
function u1.KnitStart(p2)
	l__CollectionTagAdded__3("zipline", function(p3)
		if p3:GetAttribute("ZiplineDepart") == false then
			return nil;
		end;
		u4("ProximityPrompt", {
			KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
			HoldDuration = 0, 
			ActionText = "Zipline", 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ClickablePrompt = l__DeviceUtil__6.isMobileControls(), 
			Parent = p3
		}).Triggered:Connect(function(p4)
			if p4 == l__Players__7.LocalPlayer then
				if l__ClientSyncEvents__8.ZiplineMount:fire():isCancelled() then
					return nil;
				end;
				local l__Character__8 = p4.Character;
				local v9 = p4.Character;
				if v9 ~= nil then
					v9 = v9:FindFirstChild("Humanoid");
				end;
				if l__Character__8 and v9 then
					local l__Value__10 = p3.ZiplineDestination.Value;
					if l__Value__10 then
						local v11 = l__default__9.Client:Get("RemoteName"):CallServer({
							ziplineBasePosition = l__BlockEngine__10:getBlockPosition(p3.Position)
						});
						if v11 then
							local v12 = CFrame.new(p3.Position, l__Value__10.Position);
							local v13 = CFrame.new(l__Value__10.CFrame.Position, l__Value__10.Position);
							if (v13.Position - v12.Position).Magnitude == 0 then
								v9.Sit = false;
								return nil;
							end;
							local u19 = true;
							local u20 = l__Maid__11.new();
							u20:GiveTask(v9.Jumping:Connect(function()
								u19 = false;
								u20:DoCleaning();
							end));
							local u21 = l__KnitClient__12.Controllers.JumpHeightController:getJumpModifier():addModifier({
								airJumps = 2, 
								jumpHeightMultiplier = 2, 
								deleteWhenLanded = true
							});
							u20:GiveTask(function()
								task.delay(3, function()
									u21.Destroy();
								end);
							end);
							u20:GiveTask(function()
								if not u19 then
									return nil;
								end;
								v9.Jump = true;
								wait(0.1);
								v9.Jump = false;
							end);
							v11.CFrame = v12;
							local u22 = (l__Character__8:GetPrimaryPartCFrame().Position - l__Value__10.Position).Magnitude;
							local u23 = tick();
							l__RunService__13:BindToRenderStep("zipline", Enum.RenderPriority.Character.Value, function(p5)
								v11.Velocity = (v13.Position - v12.Position).Unit * 40;
								if (v11.Position - v13.Position).Magnitude <= 1 then
									u20:DoCleaning();
									return nil;
								end;
								local function v14(p6)
									if not p6:IsDescendantOf(v11) and not p6:IsDescendantOf(l__Character__8) and not p6:IsDescendantOf(p3) and not p6:IsDescendantOf(l__Workspace__14.CurrentCamera) and not l__GameQueryUtil__15:isQueryIgnored(p6) and (p6.Position - p3.Position).Magnitude > 5 then
										return true;
									end;
									return false;
								end;
								for v15, v16 in ipairs(v11:GetTouchingParts()) do
									if v14(v16) then
										u20:DoCleaning();
										return nil;
									end;
								end;
								if l__Character__8.PrimaryPart then
									for v17, v18 in ipairs(l__Character__8.PrimaryPart:GetTouchingParts()) do
										if v14(v18) then
											u20:DoCleaning();
											return nil;
										end;
									end;
								end;
								local l__Magnitude__19 = (v11.Position - l__Value__10.Position).Magnitude;
								if u22 < l__Magnitude__19 and tick() - u23 > 1.5 then
									u20:DoCleaning();
									return nil;
								end;
								u22 = l__Magnitude__19;
								if not (math.abs(v11.RotVelocity.Y) > 1) then
									return;
								end;
								u20:DoCleaning();
								return nil;
							end);
							u20:GiveTask(function()
								l__RunService__13:UnbindFromRenderStep("zipline");
							end);
							u20:GiveTask(l__default__9.Client:Get("RemoteName"):Connect(function(p7)
								if p7.entityInstance == l__Players__7.LocalPlayer.Character then
									u20:DoCleaning();
								end;
							end));
							u20:GiveTask(l__Value__10.AncestryChanged:Connect(function(p8, p9)
								if p9 == nil then
									u20:DoCleaning();
								end;
							end));
							v11.AncestryChanged:Connect(function(p10, p11)
								if p11 == nil then
									u20:DoCleaning();
								end;
							end);
						end;
					end;
				end;
			end;
		end);
	end);
	l__CollectionTagAdded__3("zipline-attached", function(p12)
		local v20 = l__Players__7.LocalPlayer.Character == p12;
		local v21 = {};
		if v20 then
			local v22 = nil;
		else
			v22 = p12:GetPrimaryPartCFrame().Position;
		end;
		v21.position = v22;
		l__SoundManager__16:playSound(l__GameSound__17.ZIPLINE_LATCH, v21);
		local v23 = l__Maid__11.new();
		if p12.PrimaryPart then
			local v24 = {};
			if v20 then
				local v25 = nil;
			else
				v25 = p12:GetPrimaryPartCFrame().Position;
			end;
			v24.position = v25;
			v24.parent = p12.PrimaryPart;
			local v26 = l__SoundManager__16:playSound(l__GameSound__17.ZIPLINE_TRAVEL, v24);
			if v26 then
				v26.Looped = true;
				v23:GiveTask(function()
					v26:Stop();
				end);
			end;
		end;
		v23:GiveTask(l__CollectionService__18:GetInstanceRemovedSignal("zipline-attached"):Connect(function(p13)
			if p13 == p12 then
				local v27 = {};
				if v20 then
					local v28 = nil;
				else
					v28 = p12:GetPrimaryPartCFrame().Position;
				end;
				v27.position = v28;
				l__SoundManager__16:playSound(l__GameSound__17.ZIPLINE_UNLATCH, v27);
				v23:DoCleaning();
			end;
		end));
		v23:GiveTask(p12.AncestryChanged:Connect(function(p14, p15)
			if p15 == nil then
				v23:DoCleaning();
			end;
		end));
	end);
end;
u2 = v3.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ZiplineController = u2
};
return u1;
