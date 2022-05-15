
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "ShieldGenController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ShieldGenController";
	p1.statusEffectTypes = { l__StatusEffectType__2.SHIELD_GEN_1, l__StatusEffectType__2.SHIELD_GEN_2, l__StatusEffectType__2.SHIELD_GEN_3 };
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__4 = v4.Players;
local l__ReplicatedStorage__5 = v4.ReplicatedStorage;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local l__Workspace__7 = v4.Workspace;
local l__CollectionService__8 = v4.CollectionService;
local l__Maid__9 = v3.Maid;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__12 = v4.RunService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__3.StatusEffectAdded:connect(function(p3)
		if table.find(p2.statusEffectTypes, p3.statusEffect) == nil then
			return nil;
		end;
		local v8 = l__ReplicatedStorage__5.Assets.Effects.Enchant.ShieldGen:Clone();
		v8.Anchored = true;
		v8.CanCollide = false;
		v8.CanQuery = false;
		l__GameQueryUtil__6:setQueryIgnored(v8, true);
		v8.Parent = l__Workspace__7;
		l__CollectionService__8:AddTag(v8, p3.entityInstance.Name .. ":shield-gen");
		local u13 = l__Maid__9.new();
		v8.AncestryChanged:Connect(function(p4, p5)
			if p5 == nil then
				u13:DoCleaning();
			end;
		end);
		local v9 = l__SoundManager__10:playSound(l__GameSound__11.SHIELD_GEN_LOOP);
		if v9 then
			v9.Looped = true;
			v9:Pause();
		end;
		u13:GiveTask(function()
			if v9 ~= nil then
				v9:Stop();
			end;
		end);
		local u14 = p3.entityInstance == l__Players__4.LocalPlayer.Character;
		local function v10(p6)
			local v11 = v8:GetChildren();
			local function v12(p7)
				if p7:IsA("ParticleEmitter") then
					p7.Enabled = p6;
				end;
			end;
			for v13, v14 in ipairs(v11) do
				v12(v14, v13 - 1, v11);
			end;
			if v9 and u14 then
				if not p6 then
					v9:Pause();
					return;
				end;
			else
				return;
			end;
			v9:Play();
		end;
		v10(p3.entityInstance:GetAttribute("ShieldGenVisible") == true);
		p3.entityInstance:GetAttributeChangedSignal("ShieldGenVisible"):Connect(function()
			v10(p3.entityInstance:GetAttribute("ShieldGenVisible") == true);
		end);
		u13:GiveTask(l__RunService__12.RenderStepped:Connect(function(p8)
			if p3.entityInstance.PrimaryPart == nil then
				return nil;
			end;
			v8.CFrame = CFrame.new(p3.entityInstance.PrimaryPart.Position) * CFrame.Angles(0, l__Workspace__7:GetServerTimeNow() % 6 / 6 * 2 * math.pi, 0);
		end));
	end);
	l__ClientSyncEvents__3.StatusEffectRemoved:connect(function(p9)
		if table.find(p2.statusEffectTypes, p9.statusEffect) == nil then
			return nil;
		end;
		local v15 = l__CollectionService__8:GetTagged(p9.entityInstance.Name .. ":shield-gen");
		local function v16(p10)
			p10:Destroy();
		end;
		for v17, v18 in ipairs(v15) do
			v16(v18, v17 - 1, v15);
		end;
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;

