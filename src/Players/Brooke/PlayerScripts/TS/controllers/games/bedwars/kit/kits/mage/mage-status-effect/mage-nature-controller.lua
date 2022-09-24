-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util");
local v5 = setmetatable({}, {
	__tostring = function()
		return "MageNatureController";
	end, 
	__index = l__KnitController__3
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "MageNatureController";
	p1.playerBeamMap = {};
	p1.hitTimeMap = {};
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__2 = v2.Players;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__StatusEffectUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v5.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	p2:beamCleanupTicker();
	l__ClientSyncEvents__1.LocalProjectileImpact:connect(function(p3)
		if p3.projectile.Name ~= "mage_spell_nature" then
			return nil;
		end;
		local v7 = l__Players__2:GetPlayerByUserId(p3.projectile:GetAttribute("ProjectileShooter"));
		if not v7 then
			return nil;
		end;
		local v8 = l__EntityUtil__3:getEntity(v7);
		if v8 ~= nil then
			v8 = v8:getInstance();
		end;
		if not v8 then
			return nil;
		end;
		local v9 = p3.hitEntity;
		if v9 ~= nil then
			v9 = v9:getInstance();
		end;
		if not v9 then
			return nil;
		end;
		if l__StatusEffectUtil__4:isActive(v8, l__StatusEffectType__5.MAGE_NATURE_ELEMENT) then
			p2:playLifeStealEffect(v8, v9);
			p2:playLifeStealSound(v8);
		end;
	end);
end;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.playLifeStealSound(p4, p5)
	local v10 = {};
	if p4:isLocal(p5) then
		local v11 = nil;
	else
		local v12 = p5.PrimaryPart;
		if v12 ~= nil then
			v12 = v12.Position;
		end;
		v11 = v12;
	end;
	v10.position = v11;
	l__SoundManager__6:playSound(l__GameSound__7.LIFE_STEAL_HEAL, v10);
end;
function v5.isLocal(p6, p7)
	return p7 == l__Players__2.LocalPlayer.Character;
end;
local l__BannerConnection__8 = v2.ReplicatedStorage.Assets.Effects.BannerConnection;
local l__colorSequence__9 = v4.MageKitUtil.MageElementVisualizations[v4.MageElement.NATURE].colorSequence;
local l__TweenService__10 = v2.TweenService;
local u11 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, math.huge, true);
function v5.playLifeStealEffect(p8, p9, p10)
	if p8:isLocal(p9) or p8:isLocal(p10) then
		local v13 = p9:WaitForChild("UpperTorso", 1);
		if v13 ~= nil then
			v13 = v13:WaitForChild("BodyFrontAttachment", 1);
		end;
		local v14 = p10:WaitForChild("UpperTorso", 1);
		if v14 ~= nil then
			v14 = v14:WaitForChild("BodyFrontAttachment", 1);
		end;
		local v15 = l__BannerConnection__8.Beam1:Clone();
		local v16 = l__BannerConnection__8.Beam2:Clone();
		if v13 and v14 then
			local v17 = p8.playerBeamMap[p9];
			local v18 = v17;
			if v18 ~= nil then
				local v19 = nil;
				local v20, v21, v22 = ipairs(v18);
				while true do
					v20(v21, v22);
					if not v20 then
						break;
					end;
					v22 = v20;
					if v21.target == p10 == true then
						v19 = v21;
						break;
					end;				
				end;
				v18 = v19;
			end;
			if not v18 then
				v15.Color = l__colorSequence__9;
				v15.Attachment0 = v13;
				v15.Attachment1 = v14;
				v15.Parent = p9;
				v16.Color = ColorSequence.new(Color3.fromRGB(247, 235, 135));
				v16.Attachment0 = v13;
				v16.Attachment1 = v14;
				v16.Parent = p9;
				l__TweenService__10:Create(v15, u11, {
					CurveSize0 = -1.25, 
					CurveSize1 = 1.25, 
					Width0 = 1.4, 
					Width1 = 1.4
				}):Play();
				l__TweenService__10:Create(v16, u11, {
					CurveSize0 = 1.25, 
					CurveSize1 = -1.25, 
					Width0 = 1.2, 
					Width1 = 1.2
				}):Play();
				if v17 then
					table.insert(v17, {
						target = p10, 
						front = v15, 
						back = v16
					});
				else
					p8.playerBeamMap[p9] = { {
							target = p10, 
							front = v15, 
							back = v16
						} };
				end;
			end;
		end;
		local v23 = p8.hitTimeMap[p9];
		if v23 then
			v23[p10] = os.time();
			return;
		end;
		p8.hitTimeMap[p9] = {
			[p10] = os.time()
		};
	end;
end;
local l__RunService__12 = v2.RunService;
local l__BalanceFile__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
function v5.beamCleanupTicker(p11)
	l__RunService__12.Heartbeat:Connect(function()
		local l__hitTimeMap__24 = p11.hitTimeMap;
		local function v25(p12, p13)
			local function v26(p14, p15)
				if l__BalanceFile__13.MAGE_LIFE_STEAL_DURATION <= os.time() - p14 then
					local v27 = p11.playerBeamMap[p13];
					local v28 = v27;
					if v28 ~= nil then
						local v29 = nil;
						local v30, v31, v32 = ipairs(v28);
						while true do
							v30(v31, v32);
							if not v30 then
								break;
							end;
							v32 = v30;
							if v31.target == p15 == true then
								v29 = v31;
								break;
							end;						
						end;
						v28 = v29;
					end;
					local v33 = v27;
					if v33 ~= nil then
						local v34 = {};
						local v35 = 0;
						local v36, v37, v38 = ipairs(v33);
						while true do
							v36(v37, v38);
							if not v36 then
								break;
							end;
							if v37.target ~= p15 == true then
								v35 = v35 + 1;
								v34[v35] = v37;
							end;						
						end;
						v33 = v34;
					end;
					if v33 then
						p11.playerBeamMap[p13] = v33;
					end;
					if v28 then
						v28.front:Destroy();
						v28.front.Parent = nil;
						v28.back:Destroy();
						v28.back.Parent = nil;
					end;
					local v39 = p11.hitTimeMap[p13];
					if v39 ~= nil then
						v39[p15] = nil;
					end;
				end;
			end;
			for v40, v41 in pairs(p12) do
				v26(v41, v40, p12);
			end;
		end;
		for v42, v43 in pairs(l__hitTimeMap__24) do
			v25(v43, v42, l__hitTimeMap__24);
		end;
	end);
end;
local v44 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
