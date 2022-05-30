-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PyroController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "PyroController";
end;
local l__WatchCharacter__3 = v2.WatchCharacter;
local l__Players__4 = v3.Players;
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__PyroUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
local l__InventoryUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WeldUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__default__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__WatchCharacter__3(function(p3, p4, p5)
		if p3 == l__Players__4.LocalPlayer then
			return nil;
		end;
		local u14 = nil;
		local u15 = nil;
		local function v7(p6)
			if p6 ~= 0 and p6 == p6 and p6 and not (p6 < os.time()) then
				local l__Head__8 = p4:FindFirstChild("Head");
				if not l__Head__8 then
					return nil;
				else
					local v9 = u14;
					if v9 ~= nil then
						v9 = v9.Parent;
					end;
					if not v9 then
						u14 = l__ReplicatedStorage__5:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BrittleParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
						u14.Parent = l__Head__8;
					end;
					if u15 then
						u15:cancel();
					end;
					u15 = v1.Promise.delay(p6 - os.time()):andThen(function()
						if u14 ~= nil then
							u14:Destroy();
						end;
					end);
					p5:GiveTask(function()
						if u15 ~= nil then
							u15:cancel();
						end;
						if u14 ~= nil then
							u14:Destroy();
						end;
					end);
					return;
				end;
			end;
			local v10 = u14;
			if v10 ~= nil then
				v10 = v10.Parent;
			end;
			if v10 then
				u14:Destroy();
			end;
			return nil;
		end;
		v7(p3:GetAttribute("BrittleUntil"));
		p5:GiveTask(p3:GetAttributeChangedSignal("BrittleUntil"):Connect(function()
			v7(p3:GetAttribute("BrittleUntil"));
		end));
	end);
	l__WatchCharacter__3(function(p7, p8, p9)
		local l__Humanoid__11 = p8:WaitForChild("Humanoid");
		local u16 = 0;
		local u17 = 0;
		local function u18(p10)
			p9:GiveTask(p10.AncestryChanged:Connect(function()
				p9:DoCleaning();
				u18(l__Humanoid__11:WaitForChild("Animator"));
			end));
			p9:GiveTask(p10.AnimationPlayed:Connect(function(p11)
				local v12 = p11.Animation;
				if v12 ~= nil then
					v12 = v12.AnimationId;
				end;
				if v12 == l__GameAnimationUtil__6.getAssetId(l__AnimationType__7.FLAMETHROWER_USE) then
					if tick() - u16 < l__PyroUtil__8.FLAMETHROWER_COOLDOWN_SEC * 0.95 then
						return nil;
					end;
					u16 = tick();
					local v13 = l__InventoryUtil__9.getInventory(p7).hand;
					if v13 ~= nil then
						v13 = v13.tool;
					end;
					if v13 then
						local v14 = {};
						if p7 ~= l__Players__4.LocalPlayer then
							local v15 = p8:GetPrimaryPartCFrame().Position;
						else
							v15 = nil;
						end;
						v14.position = v15;
						local v16 = l__SoundManager__10:playSound(l__GameSound__11.FLAMETHROWER_USE, v14);
						l__PyroUtil__8.setEnabled(v13, true);
						p11.Stopped:Connect(function()
							l__PyroUtil__8.setEnabled(v13, false);
							if v16 ~= nil then
								v16:Stop();
							end;
							if v16 ~= nil then
								v16:Destroy();
							end;
						end);
					end;
				end;
				if v12 == l__GameAnimationUtil__6.getAssetId(l__AnimationType__7.FLAMETHROWER_UPGRADE) then
					if not (tick() - u17 < 1) then
						u17 = tick();
						local v17 = {};
						if p7 ~= l__Players__4.LocalPlayer then
							local v18 = p8:GetPrimaryPartCFrame().Position;
						else
							v18 = nil;
						end;
						v17.position = v18;
						local u19 = l__SoundManager__10:playSound(l__GameSound__11.FLAMETHROWER_UPGRADE, v17);
						task.spawn(function()
							p11:GetMarkerReachedSignal("spawn_blowtorch"):Wait();
							local v19 = l__ReplicatedStorage__5:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BlowTorch"):Clone();
							v19.Parent = p8;
							l__WeldUtil__12.weldCharacterAccessories(p8);
							p11:GetMarkerReachedSignal("activate_blowtorch"):Wait();
							local v20 = v19:GetDescendants();
							local function v21(p12)
								if p12:IsA("ParticleEmitter") then
									p12.Enabled = true;
								end;
								if p12:IsA("Light") then
									p12.Enabled = true;
								end;
							end;
							for v22, v23 in ipairs(v20) do
								v21(v23, v22 - 1, v20);
							end;
							p11:GetMarkerReachedSignal("despawn_blowtorch"):Wait();
							v19:Destroy();
							if u19 ~= nil then
								u19:Stop();
							end;
							if u19 ~= nil then
								u19:Destroy();
							end;
						end);
						return;
					end;
				else
					return;
				end;
				return nil;
			end));
		end;
		u18((l__Humanoid__11:WaitForChild("Animator")));
	end);
	l__default__13.Client:WaitFor("RemoteName"):andThen(function(p13)
		p13:Connect(function(p14)
			local v24 = p14.extra;
			if v24 ~= nil then
				v24 = v24.pyroBrittleAttack;
			end;
			if v24 then
				local v25 = {};
				if p14.entityInstance == l__Players__4.LocalPlayer.Character then
					local v26 = nil;
				else
					local v27 = p14.entityInstance.PrimaryPart;
					if v27 ~= nil then
						v27 = v27.Position;
					end;
					v26 = v27;
				end;
				v25.position = v26;
				l__SoundManager__10:playSound(l__GameSound__11.BRITTLE_HIT, v25);
			end;
		end);
	end);
end;
local l__Flamework__20 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function u1.openUpgradeMenu(p15)
	l__Flamework__20.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__21.FLAMETHROWER_UPGRADES, {});
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
