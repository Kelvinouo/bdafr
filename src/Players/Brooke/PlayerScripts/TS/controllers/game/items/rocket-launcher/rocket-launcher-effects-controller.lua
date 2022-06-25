-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "RocketLauncherEffectsController";
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
	p1.Name = "RocketLauncherEffectsController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
local l__Workspace__4 = v3.Workspace;
local l__KnitClient__5 = v2.KnitClient;
local l__WatchCharacter__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__InventoryUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__ItemType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__WeldUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
		return p3:Connect(function(p4)
			task.spawn(function()
				local v7 = l__ReplicatedStorage__3.Assets.Effects.RocketLauncherExplode:Clone();
				v7.Parent = l__Workspace__4;
				v7:SetPrimaryPartCFrame(CFrame.new(p4.position));
				l__KnitClient__5.Controllers.FancyExplosionController:createExplosion({
					position = p4.position, 
					radius = 15, 
					randomSizeOffset = 10, 
					randomPositionOffset = 1, 
					rotationSpeed = 15, 
					model = v7, 
					inDuration = 0.3, 
					outDuration = 0.3
				}):await();
				v7:Destroy();
			end);
			local v8 = 0;
			local v9 = false;
			while true do
				if v9 then
					v8 = v8 + 1;
				else
					v9 = true;
				end;
				if not (v8 < math.random() * 2 + 2) then
					break;
				end;
				task.spawn(function()
					local v10 = l__ReplicatedStorage__3.Assets.Effects.RocketLauncherDebris:Clone();
					v10.Parent = l__Workspace__4;
					v10.Position = p4.position;
					local v11 = math.random() * math.pi * 2;
					v10:ApplyImpulse(Vector3.new(math.cos(v11) * 40, 70, math.sin(v11) * 40) * v10.Mass);
					wait(1);
					v10:Destroy();
				end);			
			end;
		end);
	end);
	l__WatchCharacter__6(function(p5, p6, p7)
		local l__Humanoid__12 = p6:WaitForChild("Humanoid");
		local function u12(p8)
			p7:GiveTask(p8.AncestryChanged:Connect(function()
				p7:DoCleaning();
				u12(l__Humanoid__12:WaitForChild("Animator"));
			end));
			p7:GiveTask(p8.AnimationPlayed:Connect(function(p9)
				local v13 = p9.Animation;
				if v13 ~= nil then
					v13 = v13.AnimationId;
				end;
				if v13 == l__GameAnimationUtil__7.getAssetId(l__AnimationType__8.ROCKET_LAUNCHER_SHOT) then
					local v14 = l__InventoryUtil__9.getInventory(p5).hand;
					if v14 ~= nil then
						v14 = v14.tool;
					end;
					if v14 and v14.Name == l__ItemType__10.ROCKET_LAUNCHER then
						v14.Handle.Missile.Transparency = 1;
						local v15 = v14:GetDescendants();
						local function v16(p10)
							if p10:IsA("ParticleEmitter") then
								p10:Emit(5);
							end;
						end;
						for v17, v18 in ipairs(v15) do
							v16(v18, v17 - 1, v15);
						end;
					end;
				end;
				if v13 == l__GameAnimationUtil__7.getAssetId(l__AnimationType__8.ROCKET_LAUNCHER_RELOAD) then
					local v19 = l__InventoryUtil__9.getInventory(p5).hand;
					if v19 ~= nil then
						v19 = v19.tool;
					end;
					if v19 and v19.Name == l__ItemType__10.ROCKET_LAUNCHER then
						p9:GetMarkerReachedSignal("grab_missile"):Connect(function()
							local u13 = l__ReplicatedStorage__3:WaitForChild("Items"):WaitForChild("rocket_launcher_missile"):Clone();
							p9:GetMarkerReachedSignal("insert_missile"):Connect(function()
								u13:Destroy();
								if v19.Parent and v19:FindFirstChild("Handle") then
									v19.Handle.Missile.Transparency = 0;
								end;
							end);
							local v20 = p6:FindFirstChildWhichIsA("Humanoid");
							if v20 ~= nil then
								v20:AddAccessory(u13);
							end;
							l__WeldUtil__11.weldCharacterAccessories(p6);
						end);
					end;
				end;
			end));
		end;
		u12((l__Humanoid__12:WaitForChild("Animator")));
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
