-- Script Hash: 90042911bb9cf06d682fb85c2526ba2f6dc53027b92f269d81b82e149faac60c133ae72987b68afb2515f8cb5d3e454a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "JadeController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "JadeController";
end;
local l__WatchCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__GameAnimationUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__BlockEngine__7 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__8 = v2.Workspace;
local l__Debris__9 = v2.Debris;
function u1.KnitStart(p2)
	l__WatchCharacter__3(function(p3, p4, p5)
		local l__Humanoid__6 = p4:WaitForChild("Humanoid");
		local function u10(p6)
			p5:GiveTask(p6.AncestryChanged:Connect(function()
				p5:DoCleaning();
				u10(l__Humanoid__6:WaitForChild("Animator"));
			end));
			p5:GiveTask(p6.AnimationPlayed:Connect(function(p7)
				local v7 = p7.Animation;
				if v7 ~= nil then
					v7 = v7.AnimationId;
				end;
				if v7 == l__GameAnimationUtil__4.getAssetId(l__AnimationType__5.JADE_HAMMER_SLAM) then
					local v8 = l__InventoryUtil__6.getInventory(p3).hand;
					if v8 ~= nil then
						v8 = v8.tool;
					end;
					if v8 == nil then
						return nil;
					end;
					for v9, v10 in ipairs(v8:GetDescendants()) do
						if v10:IsA("Trail") then
							v10.Enabled = true;
						end;
					end;
					for v11, v12 in ipairs(p4:GetDescendants()) do
						if v12:IsA("Trail") then
							v12.Enabled = true;
						end;
					end;
					p5:GiveTask(p7.Stopped:Connect(function()
						for v13, v14 in ipairs(v8:GetDescendants()) do
							if v14:IsA("Trail") then
								v14.Enabled = false;
							end;
						end;
						for v15, v16 in ipairs(p4:GetDescendants()) do
							if v16:IsA("Trail") then
								v16.Enabled = false;
							end;
						end;
						local l__Handle__17 = v8:FindFirstChild("Handle");
						if not l__Handle__17 then
							return nil;
						end;
						local l__StrikePosition__18 = l__Handle__17:FindFirstChild("StrikePosition");
						if not l__StrikePosition__18 then
							return nil;
						end;
						local v19 = 0;
						local v20 = false;
						while true do
							if v20 then
								v19 = v19 + 1;
							else
								v20 = true;
							end;
							if not (v19 < 3) then
								break;
							end;
							local v21 = 0;
							local v22 = false;
							while true do
								if v22 then
									v21 = v21 + 1;
								else
									v22 = true;
								end;
								if not (v21 < 3) then
									break;
								end;
								local v23 = l__BlockEngine__7:getBlockPosition(l__StrikePosition__18.WorldPosition - Vector3.new(3, 3, 3) + Vector3.new(v19 * 3, 0, v21 * 3));
								local v24 = l__BlockEngine__7:getStore():getBlockAt(v23);
								if not v24 then
									return nil;
								end;
								local v25 = l__BlockEngine__7:getHandlerRegistry():getHandler(v24.Name);
								if not v25 then
									return nil;
								end;
								local v26 = v25:place(v23 + Vector3.new(0, 1, 0), 0);
								v26.CanCollide = false;
								v26.Anchored = false;
								for v27, v28 in ipairs(v26:GetChildren()) do
									if v28:IsA("BasePart") then
										v28.CanCollide = false;
										v28.Anchored = false;
									end;
								end;
								local l__Unit__29 = (l__StrikePosition__18.WorldPosition - v26.Position).Unit;
								v26.Parent = l__Workspace__8;
								v26.AssemblyLinearVelocity = Vector3.new(l__Unit__29.X, 0.8, l__Unit__29.Y) * 100;
								l__Debris__9:AddItem(v26, 3);							
							end;						
						end;
					end));
				end;
			end));
		end;
		u10((l__Humanoid__6:WaitForChild("Animator")));
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
