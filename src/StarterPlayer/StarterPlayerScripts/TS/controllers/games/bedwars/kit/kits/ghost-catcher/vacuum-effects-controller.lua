-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VacuumEffectsController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "VacuumEffectsController";
	p1.fullBagsPlayers = {};
end;
local l__WatchCharacter__1 = v2.WatchCharacter;
local l__GameAnimationUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__8 = v3.Players;
local l__TweenService__9 = v3.TweenService;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__WatchCharacter__1(function(p3, p4, p5)
		local l__Humanoid__7 = p4:WaitForChild("Humanoid");
		local l__fullBagsPlayers__10 = p2.fullBagsPlayers;
		local function u11(p6)
			p5:GiveTask(p6.AncestryChanged:Connect(function()
				p5:DoCleaning();
				u11(l__Humanoid__7:WaitForChild("Animator"));
			end));
			p5:GiveTask(p6.AnimationPlayed:Connect(function(p7)
				local v8 = p7.Animation;
				if v8 ~= nil then
					v8 = v8.AnimationId;
				end;
				if v8 == l__GameAnimationUtil__2.getAssetId(l__AnimationType__3.VACUUM_SUCK) then
					local l__hand__9 = l__InventoryUtil__4.getInventory(p3).hand;
					local v10 = l__hand__9;
					if v10 ~= nil then
						v10 = v10.tool;
					end;
					local v11 = v10 and l__hand__9.itemType == l__ItemType__5.VACUUM;
					if v11 then
						local v12 = {};
						if p3 ~= l__Players__8.LocalPlayer then
							local v13 = p4:GetPrimaryPartCFrame().Position;
						else
							v13 = nil;
						end;
						v12.position = v13;
						local v14 = l__SoundManager__6:playSound(l__GameSound__7.GHOST_VACUUM_SUCKING_LOOP, v12);
						local v15 = l__hand__9.tool:GetDescendants();
						local function v16(p8)
							if p8:IsA("ParticleEmitter") then
								p8.TimeScale = 0.35;
								l__TweenService__9:Create(p8, TweenInfo.new(1, Enum.EasingStyle.Linear), {
									TimeScale = 1
								});
								p8.Enabled = true;
							end;
						end;
						local v17, v18, v19 = ipairs(v15);
						while true do
							v17(v18, v19);
							if not v17 then
								break;
							end;
							v19 = v17;
							v16(v18, v17 - 1, v15);						
						end;
						p7.Stopped:Connect(function()
							if v14 ~= nil then
								v14:Destroy();
							end;
							local v20, v21, v22 = ipairs((l__hand__9.tool:GetDescendants()));
							while true do
								v20(v21, v22);
								if not v20 then
									break;
								end;
								v22 = v20;
								if v21:IsA("ParticleEmitter") then
									v21.Enabled = false;
								end;							
							end;
						end);
					end;
				end;
				if v8 == l__GameAnimationUtil__2.getAssetId(l__AnimationType__3.VACUUM_GHOST_CAPTURED) then
					local v23 = {};
					if p3 ~= l__Players__8.LocalPlayer then
						local v24 = p4:GetPrimaryPartCFrame().Position;
					else
						v24 = nil;
					end;
					v23.position = v24;
					local v25 = l__SoundManager__6:playSound(l__GameSound__7.GHOST_VACUUM_CATCH, v23);
					local l__hand__26 = l__InventoryUtil__4.getInventory(p3).hand;
					local v27 = l__hand__26;
					if v27 ~= nil then
						v27 = v27.tool;
					end;
					local v28 = v27 and l__hand__26.itemType == l__ItemType__5.VACUUM;
					if v28 then
						local l__tool__29 = l__hand__26.tool;
						l__tool__29.Handle.Empty.Transparency = 1;
						l__tool__29.Handle.Full.Transparency = 0;
						l__fullBagsPlayers__10[p3.UserId] = true;
					end;
				end;
				if v8 == l__GameAnimationUtil__2.getAssetId(l__AnimationType__3.VACUUM_LAUNCH) then
					local l__hand__30 = l__InventoryUtil__4.getInventory(p3).hand;
					local v31 = l__hand__30;
					if v31 ~= nil then
						v31 = v31.tool;
					end;
					local v32 = v31 and l__hand__30.itemType == l__ItemType__5.VACUUM;
					if v32 then
						local l__tool__33 = l__hand__30.tool;
						l__tool__33.Handle.Empty.Transparency = 0;
						l__tool__33.Handle.Full.Transparency = 1;
						l__fullBagsPlayers__10[p3.UserId] = nil;
					end;
				end;
			end));
		end;
		u11((l__Humanoid__7:WaitForChild("Animator")));
	end);
end;
local v34 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
