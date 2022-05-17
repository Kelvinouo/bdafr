
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
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__BlockEngine__9 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Maid__10 = v3.Maid;
local l__RunService__11 = v4.RunService;
local l__Workspace__12 = v4.Workspace;
local l__GameQueryUtil__13 = v2.GameQueryUtil;
local l__SoundManager__14 = v2.SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__16 = v4.CollectionService;
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
							local v14 = l__Maid__10.new();
							v14:GiveTask(function()
								v9.Jump = true;
								wait(0.1);
								v9.Jump = false;
							end);
							v11.CFrame = v12;
							local u17 = (l__Character__8:GetPrimaryPartCFrame().Position - l__Value__10.Position).Magnitude;
							local u18 = tick();
							l__RunService__11:BindToRenderStep("zipline", Enum.RenderPriority.Character.Value, function(p5)
								v11.Velocity = (v13.Position - v12.Position).Unit * 40;
								if (v11.Position - v13.Position).Magnitude <= 1 then
									v14:DoCleaning();
									return nil;
								end;
								local function v15(p6)
									if not p6:IsDescendantOf(v11) and not p6:IsDescendantOf(l__Character__8) and not p6:IsDescendantOf(p3) and not p6:IsDescendantOf(l__Workspace__12.CurrentCamera) and not l__GameQueryUtil__13:isQueryIgnored(p6) and (p6.Position - p3.Position).Magnitude > 5 then
										return true;
									end;
									return false;
								end;
								for v16, v17 in ipairs(v11:GetTouchingParts()) do
									if v15(v17) then
										v14:DoCleaning();
										return nil;
									end;
								end;
								if l__Character__8.PrimaryPart then
									for v18, v19 in ipairs(l__Character__8.PrimaryPart:GetTouchingParts()) do
										if v15(v19) then
											v14:DoCleaning();
											return nil;
										end;
									end;
								end;
								local l__Magnitude__20 = (v11.Position - l__Value__10.Position).Magnitude;
								if u17 < l__Magnitude__20 and tick() - u18 > 1.5 then
									v14:DoCleaning();
									return nil;
								end;
								u17 = l__Magnitude__20;
								if not (math.abs(v11.RotVelocity.X) > 1) and not (math.abs(v11.RotVelocity.Y) > 1) and not (math.abs(v11.RotVelocity.Z) > 1) then
									return;
								end;
								v14:DoCleaning();
								return nil;
							end);
							v14:GiveTask(function()
								l__RunService__11:UnbindFromRenderStep("zipline");
							end);
							v14:GiveTask(l__default__8.Client:Get("RemoteName"):Connect(function(p7)
								if p7.entityInstance == l__Players__7.LocalPlayer.Character then
									v14:DoCleaning();
								end;
							end));
							v14:GiveTask(l__Value__10.AncestryChanged:Connect(function(p8, p9)
								if p9 == nil then
									v14:DoCleaning();
								end;
							end));
							v11.AncestryChanged:Connect(function(p10, p11)
								if p11 == nil then
									v14:DoCleaning();
								end;
							end);
						end;
					end;
				end;
			end;
		end);
	end);
	l__CollectionTagAdded__3("zipline-attached", function(p12)
		local v21 = l__Players__7.LocalPlayer.Character == p12;
		local v22 = {};
		if v21 then
			local v23 = nil;
		else
			v23 = p12:GetPrimaryPartCFrame().Position;
		end;
		v22.position = v23;
		l__SoundManager__14:playSound(l__GameSound__15.ZIPLINE_LATCH, v22);
		local v24 = l__Maid__10.new();
		if p12.PrimaryPart then
			local v25 = {};
			if v21 then
				local v26 = nil;
			else
				v26 = p12:GetPrimaryPartCFrame().Position;
			end;
			v25.position = v26;
			v25.parent = p12.PrimaryPart;
			local v27 = l__SoundManager__14:playSound(l__GameSound__15.ZIPLINE_TRAVEL, v25);
			if v27 then
				v27.Looped = true;
				v24:GiveTask(function()
					v27:Stop();
				end);
			end;
		end;
		v24:GiveTask(l__CollectionService__16:GetInstanceRemovedSignal("zipline-attached"):Connect(function(p13)
			if p13 == p12 then
				local v28 = {};
				if v21 then
					local v29 = nil;
				else
					v29 = p12:GetPrimaryPartCFrame().Position;
				end;
				v28.position = v29;
				l__SoundManager__14:playSound(l__GameSound__15.ZIPLINE_UNLATCH, v28);
				v24:DoCleaning();
			end;
		end));
		v24:GiveTask(p12.AncestryChanged:Connect(function(p14, p15)
			if p15 == nil then
				v24:DoCleaning();
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

