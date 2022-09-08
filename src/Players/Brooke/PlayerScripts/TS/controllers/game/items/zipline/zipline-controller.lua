-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function u1.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "ZiplineController";
end;
local l__CollectionTagAdded__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__Players__6 = v4.Players;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__BlockEngine__9 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__11 = v3.KnitClient;
local l__RunService__12 = v4.RunService;
local l__Workspace__13 = v4.Workspace;
local l__GameQueryUtil__14 = v2.GameQueryUtil;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__17 = v4.CollectionService;
function u1.KnitStart(p2)
	l__CollectionTagAdded__2("zipline", function(p3)
		if p3:GetAttribute("ZiplineDepart") == false then
			return nil;
		end;
		u3("ProximityPrompt", {
			KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
			HoldDuration = 0, 
			ActionText = "Zipline", 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ClickablePrompt = l__DeviceUtil__5.isMobileControls(), 
			Parent = p3
		}).Triggered:Connect(function(p4)
			if p4 == l__Players__6.LocalPlayer then
				if l__ClientSyncEvents__7.ZiplineMount:fire():isCancelled() then
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
						local v11 = l__default__8.Client:Get("RemoteName"):CallServer({
							ziplineBasePosition = l__BlockEngine__9:getBlockPosition(p3.Position)
						});
						if v11 then
							local v12 = CFrame.new(p3.Position, l__Value__10.Position);
							local v13 = CFrame.new(l__Value__10.CFrame.Position, l__Value__10.Position);
							if (v13.Position - v12.Position).Magnitude == 0 then
								v9.Sit = false;
								return nil;
							end;
							local u18 = true;
							local u19 = u10.new();
							u19:GiveTask(v9.Jumping:Connect(function()
								u18 = false;
								u19:DoCleaning();
							end));
							local u20 = l__KnitClient__11.Controllers.JumpHeightController:getJumpModifier():addModifier({
								airJumps = 2, 
								jumpHeightMultiplier = 2, 
								deleteWhenLanded = true
							});
							u19:GiveTask(function()
								task.delay(3, function()
									u20.Destroy();
								end);
							end);
							u19:GiveTask(function()
								if not u18 then
									return nil;
								end;
								v9.Sit = false;
							end);
							v11.CFrame = v12;
							local u21 = (l__Character__8:GetPrimaryPartCFrame().Position - l__Value__10.Position).Magnitude;
							local u22 = tick();
							l__RunService__12:BindToRenderStep("zipline", Enum.RenderPriority.Character.Value, function(p5)
								v11.Velocity = (v13.Position - v12.Position).Unit * 40;
								if (v11.Position - v13.Position).Magnitude <= 1 then
									u19:DoCleaning();
									return nil;
								end;
								local function v14(p6)
									if not p6:IsDescendantOf(v11) and not p6:IsDescendantOf(l__Character__8) and not p6:IsDescendantOf(p3) and not p6:IsDescendantOf(l__Workspace__13.CurrentCamera) and not l__GameQueryUtil__14:isQueryIgnored(p6) and (p6.Position - p3.Position).Magnitude > 5 then
										return true;
									end;
									return false;
								end;
								local v15, v16, v17 = ipairs(v11:GetTouchingParts());
								while true do
									v15(v16, v17);
									if not v15 then
										break;
									end;
									v17 = v15;
									if v14(v16) then
										u19:DoCleaning();
										return nil;
									end;								
								end;
								if l__Character__8.PrimaryPart then
									local v18, v19, v20 = ipairs(l__Character__8.PrimaryPart:GetTouchingParts());
									while true do
										v18(v19, v20);
										if not v18 then
											break;
										end;
										v20 = v18;
										if v14(v19) then
											u19:DoCleaning();
											return nil;
										end;									
									end;
								end;
								local l__Magnitude__21 = (v11.Position - v13.Position).Magnitude;
								if u21 < l__Magnitude__21 and tick() - u22 > 1.5 then
									u19:DoCleaning();
									return nil;
								end;
								u21 = l__Magnitude__21;
								if not (math.abs(v11.RotVelocity.Y) > 1) then
									return;
								end;
								u19:DoCleaning();
								return nil;
							end);
							u19:GiveTask(function()
								l__RunService__12:UnbindFromRenderStep("zipline");
							end);
							u19:GiveTask(l__default__8.Client:Get("RemoteName"):Connect(function(p7)
								if p7.entityInstance == l__Players__6.LocalPlayer.Character then
									u19:DoCleaning();
								end;
							end));
							u19:GiveTask(l__Value__10.AncestryChanged:Connect(function(p8, p9)
								if p9 == nil then
									u19:DoCleaning();
								end;
							end));
							v11.AncestryChanged:Connect(function(p10, p11)
								if p11 == nil then
									u19:DoCleaning();
								end;
							end);
						end;
					end;
				end;
			end;
		end);
	end);
	l__CollectionTagAdded__2("zipline-attached", function(p12)
		local v22 = l__Players__6.LocalPlayer.Character == p12;
		local v23 = {};
		if v22 then
			local v24 = nil;
		else
			v24 = p12:GetPrimaryPartCFrame().Position;
		end;
		v23.position = v24;
		l__SoundManager__15:playSound(l__GameSound__16.ZIPLINE_LATCH, v23);
		local v25 = u10.new();
		if p12.PrimaryPart then
			local v26 = {};
			if v22 then
				local v27 = nil;
			else
				v27 = p12:GetPrimaryPartCFrame().Position;
			end;
			v26.position = v27;
			v26.parent = p12.PrimaryPart;
			local v28 = l__SoundManager__15:playSound(l__GameSound__16.ZIPLINE_TRAVEL, v26);
			if v28 then
				v28.Looped = true;
				v25:GiveTask(function()
					v28:Stop();
				end);
			end;
		end;
		v25:GiveTask(l__CollectionService__17:GetInstanceRemovedSignal("zipline-attached"):Connect(function(p13)
			if p13 == p12 then
				local v29 = {};
				if v22 then
					local v30 = nil;
				else
					v30 = p12:GetPrimaryPartCFrame().Position;
				end;
				v29.position = v30;
				l__SoundManager__15:playSound(l__GameSound__16.ZIPLINE_UNLATCH, v29);
				v25:DoCleaning();
			end;
		end));
		v25:GiveTask(p12.AncestryChanged:Connect(function(p14, p15)
			if p15 == nil then
				v25:DoCleaning();
			end;
		end));
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(u1.new());
return {
	ZiplineController = u1
};
