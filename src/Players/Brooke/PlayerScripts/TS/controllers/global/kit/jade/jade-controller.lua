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
function u1.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "JadeController";
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__BlockEngine__6 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__7 = v2.Workspace;
local l__Debris__8 = v2.Debris;
function u1.KnitStart(p2)
	l__WatchCharacter__2(function(p3, p4, p5)
		local l__Humanoid__6 = p4:WaitForChild("Humanoid");
		local function u9(p6)
			p5:GiveTask(p6.AncestryChanged:Connect(function()
				p5:DoCleaning();
				u9(l__Humanoid__6:WaitForChild("Animator"));
			end));
			p5:GiveTask(p6.AnimationPlayed:Connect(function(p7)
				local v7 = p7.Animation;
				if v7 ~= nil then
					v7 = v7.AnimationId;
				end;
				if v7 == l__GameAnimationUtil__3.getAssetId(l__AnimationType__4.JADE_HAMMER_SLAM) then
					local v8 = l__InventoryUtil__5.getInventory(p3).hand;
					if v8 ~= nil then
						v8 = v8.tool;
					end;
					if v8 == nil then
						return nil;
					end;
					local v9, v10, v11 = ipairs(v8:GetDescendants());
					while true do
						v9(v10, v11);
						if not v9 then
							break;
						end;
						v11 = v9;
						if v10:IsA("Trail") then
							v10.Enabled = true;
						end;					
					end;
					local v12, v13, v14 = ipairs(p4:GetDescendants());
					while true do
						v12(v13, v14);
						if not v12 then
							break;
						end;
						v14 = v12;
						if v13:IsA("Trail") then
							v13.Enabled = true;
						end;					
					end;
					p5:GiveTask(p7.Stopped:Connect(function()
						local v15, v16, v17 = ipairs(v8:GetDescendants());
						while true do
							v15(v16, v17);
							if not v15 then
								break;
							end;
							v17 = v15;
							if v16:IsA("Trail") then
								v16.Enabled = false;
							end;						
						end;
						local v18, v19, v20 = ipairs(p4:GetDescendants());
						while true do
							v18(v19, v20);
							if not v18 then
								break;
							end;
							v20 = v18;
							if v19:IsA("Trail") then
								v19.Enabled = false;
							end;						
						end;
						local l__Handle__21 = v8:FindFirstChild("Handle");
						if not l__Handle__21 then
							return nil;
						end;
						local l__StrikePosition__22 = l__Handle__21:FindFirstChild("StrikePosition");
						if not l__StrikePosition__22 then
							return nil;
						end;
						local v23 = 0;
						local v24 = false;
						while true do
							if v24 then
								v23 = v23 + 1;
							else
								v24 = true;
							end;
							if not (v23 < 3) then
								break;
							end;
							local v25 = 0;
							local v26 = false;
							while true do
								if v26 then
									v25 = v25 + 1;
								else
									v26 = true;
								end;
								if not (v25 < 3) then
									break;
								end;
								local v27 = l__BlockEngine__6:getBlockPosition(l__StrikePosition__22.WorldPosition - Vector3.new(3, 3, 3) + Vector3.new(v23 * 3, 0, v25 * 3));
								local v28 = l__BlockEngine__6:getStore():getBlockAt(v27);
								if not v28 then
									return nil;
								end;
								local v29 = l__BlockEngine__6:getHandlerRegistry():getHandler(v28.Name);
								if not v29 then
									return nil;
								end;
								local v30 = v29:place(v27 + Vector3.new(0, 1, 0), 0);
								v30.CanCollide = false;
								v30.Anchored = false;
								local v31, v32, v33 = ipairs(v30:GetChildren());
								while true do
									v31(v32, v33);
									if not v31 then
										break;
									end;
									v33 = v31;
									if v32:IsA("BasePart") then
										v32.CanCollide = false;
										v32.Anchored = false;
									end;								
								end;
								local l__Unit__34 = (l__StrikePosition__22.WorldPosition - v30.Position).Unit;
								v30.Parent = l__Workspace__7;
								v30.AssemblyLinearVelocity = Vector3.new(l__Unit__34.X, 0.8, l__Unit__34.Y) * 100;
								l__Debris__8:AddItem(v30, 3);							
							end;						
						end;
					end));
				end;
			end));
		end;
		u9((l__Humanoid__6:WaitForChild("Animator")));
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
