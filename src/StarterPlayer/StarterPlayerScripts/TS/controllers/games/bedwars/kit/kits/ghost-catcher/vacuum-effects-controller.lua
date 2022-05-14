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
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "VacuumEffectsController";
	p1.fullBagsPlayers = {};
end;
local l__WatchCharacter__2 = v2.WatchCharacter;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__9 = v3.Players;
local l__TweenService__10 = v3.TweenService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__2(function(p3, p4, p5)
		local l__Humanoid__7 = p4:WaitForChild("Humanoid");
		local l__fullBagsPlayers__11 = p2.fullBagsPlayers;
		local function u12(p6)
			p5:GiveTask(p6.AncestryChanged:Connect(function()
				p5:DoCleaning();
				u12(l__Humanoid__7:WaitForChild("Animator"));
			end));
			p5:GiveTask(p6.AnimationPlayed:Connect(function(p7)
				local v8 = p7.Animation;
				if v8 ~= nil then
					v8 = v8.AnimationId;
				end;
				if v8 == l__GameAnimationUtil__3.getAssetId(l__AnimationType__4.VACUUM_SUCK) then
					local l__hand__9 = l__InventoryUtil__5.getInventory(p3).hand;
					local v10 = l__hand__9;
					if v10 ~= nil then
						v10 = v10.tool;
					end;
					local v11 = v10 and l__hand__9.itemType == l__ItemType__6.VACUUM;
					if v11 then
						local v12 = {};
						if p3 ~= l__Players__9.LocalPlayer then
							local v13 = p4:GetPrimaryPartCFrame().Position;
						else
							v13 = nil;
						end;
						v12.position = v13;
						local v14 = l__hand__9.tool:GetDescendants();
						local function v15(p8)
							if p8:IsA("ParticleEmitter") then
								p8.TimeScale = 0.35;
								l__TweenService__10:Create(p8, TweenInfo.new(1, Enum.EasingStyle.Linear), {
									TimeScale = 1
								});
								p8.Enabled = true;
							end;
						end;
						for v16, v17 in ipairs(v14) do
							v15(v17, v16 - 1, v14);
						end;
						local u13 = l__SoundManager__7:playSound(l__GameSound__8.GHOST_VACUUM_SUCKING_LOOP, v12);
						p7.Stopped:Connect(function()
							if u13 ~= nil then
								u13:Destroy();
							end;
							local v18 = l__hand__9.tool:GetDescendants();
							local function v19(p9)
								if p9:IsA("ParticleEmitter") then
									p9.Enabled = false;
								end;
							end;
							for v20, v21 in ipairs(v18) do
								v19(v21, v20 - 1, v18);
							end;
						end);
					end;
				end;
				if v8 == l__GameAnimationUtil__3.getAssetId(l__AnimationType__4.VACUUM_GHOST_CAPTURED) then
					local v22 = {};
					if p3 ~= l__Players__9.LocalPlayer then
						local v23 = p4:GetPrimaryPartCFrame().Position;
					else
						v23 = nil;
					end;
					v22.position = v23;
					local v24 = l__SoundManager__7:playSound(l__GameSound__8.GHOST_VACUUM_CATCH, v22);
					local l__hand__25 = l__InventoryUtil__5.getInventory(p3).hand;
					local v26 = l__hand__25;
					if v26 ~= nil then
						v26 = v26.tool;
					end;
					local v27 = v26 and l__hand__25.itemType == l__ItemType__6.VACUUM;
					if v27 then
						local l__tool__28 = l__hand__25.tool;
						l__tool__28.Handle.Empty.Transparency = 1;
						l__tool__28.Handle.Full.Transparency = 0;
						l__fullBagsPlayers__11[p3.UserId] = true;
					end;
				end;
				if v8 == l__GameAnimationUtil__3.getAssetId(l__AnimationType__4.VACUUM_LAUNCH) then
					local l__hand__29 = l__InventoryUtil__5.getInventory(p3).hand;
					local v30 = l__hand__29;
					if v30 ~= nil then
						v30 = v30.tool;
					end;
					local v31 = v30 and l__hand__29.itemType == l__ItemType__6.VACUUM;
					if v31 then
						local l__tool__32 = l__hand__29.tool;
						l__tool__32.Handle.Empty.Transparency = 0;
						l__tool__32.Handle.Full.Transparency = 1;
						l__fullBagsPlayers__11[p3.UserId] = nil;
					end;
				end;
			end));
		end;
		u12((l__Humanoid__7:WaitForChild("Animator")));
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
