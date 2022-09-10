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
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "PyroController";
end;
local l__WatchCharacter__2 = v2.WatchCharacter;
local l__Players__3 = v3.Players;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__PyroUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
local l__EntityUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WeldUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__default__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__WatchCharacter__2(function(p3, p4, p5)
		if p3 == l__Players__3.LocalPlayer then
			return nil;
		end;
		local u13 = nil;
		local u14 = nil;
		local function v7(p6)
			if p6 ~= 0 and p6 == p6 and p6 and not (p6 < os.time()) then
				local l__Head__8 = p4:FindFirstChild("Head");
				if not l__Head__8 then
					return nil;
				else
					local v9 = u13;
					if v9 ~= nil then
						v9 = v9.Parent;
					end;
					if not v9 then
						u13 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BrittleParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
						u13.Parent = l__Head__8;
					end;
					if u14 then
						u14:cancel();
					end;
					u14 = v1.Promise.delay(p6 - os.time()):andThen(function()
						if u13 ~= nil then
							u13:Destroy();
						end;
					end);
					p5:GiveTask(function()
						if u14 ~= nil then
							u14:cancel();
						end;
						if u13 ~= nil then
							u13:Destroy();
						end;
					end);
					return;
				end;
			end;
			local v10 = u13;
			if v10 ~= nil then
				v10 = v10.Parent;
			end;
			if v10 then
				u13:Destroy();
			end;
			return nil;
		end;
		v7(p3:GetAttribute("BrittleUntil"));
		p5:GiveTask(p3:GetAttributeChangedSignal("BrittleUntil"):Connect(function()
			v7(p3:GetAttribute("BrittleUntil"));
		end));
	end);
	l__WatchCharacter__2(function(p7, p8, p9)
		local l__Humanoid__11 = p8:WaitForChild("Humanoid");
		local u15 = 0;
		local u16 = 0;
		local function u17(p10)
			p9:GiveTask(p10.AncestryChanged:Connect(function()
				p9:DoCleaning();
				u17(l__Humanoid__11:WaitForChild("Animator"));
			end));
			p9:GiveTask(p10.AnimationPlayed:Connect(function(p11)
				local v12 = p11.Animation;
				if v12 ~= nil then
					v12 = v12.AnimationId;
				end;
				if v12 == l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.FLAMETHROWER_USE) then
					if tick() - u15 < l__PyroUtil__7.FLAMETHROWER_COOLDOWN_SEC * 0.95 then
						return nil;
					end;
					u15 = tick();
					local v13 = l__EntityUtil__8:getEntity(p7);
					if v13 ~= nil then
						v13 = v13:getHandItemInstanceFromCharacter();
					end;
					if v13 then
						local v14 = {};
						if p7 ~= l__Players__3.LocalPlayer then
							local v15 = p8:GetPrimaryPartCFrame().Position;
						else
							v15 = nil;
						end;
						v14.position = v15;
						local v16 = l__SoundManager__9:playSound(l__GameSound__10.FLAMETHROWER_USE, v14);
						l__PyroUtil__7.setEnabled(v13, true);
						p11.Stopped:Connect(function()
							l__PyroUtil__7.setEnabled(v13, false);
							if v16 ~= nil then
								v16:Stop();
							end;
							if v16 ~= nil then
								v16:Destroy();
							end;
						end);
					end;
				end;
				if v12 == l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.FLAMETHROWER_UPGRADE) then
					if not (tick() - u16 < 1) then
						u16 = tick();
						local v17 = {};
						if p7 ~= l__Players__3.LocalPlayer then
							local v18 = p8:GetPrimaryPartCFrame().Position;
						else
							v18 = nil;
						end;
						v17.position = v18;
						local u18 = l__SoundManager__9:playSound(l__GameSound__10.FLAMETHROWER_UPGRADE, v17);
						task.spawn(function()
							p11:GetMarkerReachedSignal("spawn_blowtorch"):Wait();
							local v19 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BlowTorch"):Clone();
							v19.Parent = p8;
							l__WeldUtil__11:weldCharacterAccessories(p8);
							p11:GetMarkerReachedSignal("activate_blowtorch"):Wait();
							local v20, v21, v22 = ipairs((v19:GetDescendants()));
							while true do
								v20(v21, v22);
								if not v20 then
									break;
								end;
								if v21:IsA("ParticleEmitter") then
									v21.Enabled = true;
								end;
								if v21:IsA("Light") then
									v21.Enabled = true;
								end;							
							end;
							p11:GetMarkerReachedSignal("despawn_blowtorch"):Wait();
							v19:Destroy();
							if u18 ~= nil then
								u18:Stop();
							end;
							if u18 ~= nil then
								u18:Destroy();
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
		u17((l__Humanoid__11:WaitForChild("Animator")));
	end);
	l__default__12.Client:WaitFor("RemoteName"):andThen(function(p12)
		p12:Connect(function(p13)
			local v23 = p13.extra;
			if v23 ~= nil then
				v23 = v23.pyroBrittleAttack;
			end;
			if v23 then
				local v24 = {};
				if p13.entityInstance == l__Players__3.LocalPlayer.Character then
					local v25 = nil;
				else
					local v26 = p13.entityInstance.PrimaryPart;
					if v26 ~= nil then
						v26 = v26.Position;
					end;
					v25 = v26;
				end;
				v24.position = v25;
				l__SoundManager__9:playSound(l__GameSound__10.BRITTLE_HIT, v24);
			end;
		end);
	end);
end;
local l__Flamework__19 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function u1.openUpgradeMenu(p14)
	l__Flamework__19.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__20.FLAMETHROWER_UPGRADES, {});
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
