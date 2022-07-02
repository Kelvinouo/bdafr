-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ShieldGenController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ShieldGenController";
	p1.statusEffectTypes = { l__StatusEffectType__2.SHIELD_GEN_1, l__StatusEffectType__2.SHIELD_GEN_2, l__StatusEffectType__2.SHIELD_GEN_3 };
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__4 = v3.Players;
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local l__Workspace__7 = v3.Workspace;
local l__CollectionService__8 = v3.CollectionService;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__12 = v3.RunService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__3.StatusEffectAdded:connect(function(p3)
		if table.find(p2.statusEffectTypes, p3.statusEffect) == nil then
			return nil;
		end;
		local v7 = l__ReplicatedStorage__5.Assets.Effects.Enchant.ShieldGen:Clone();
		v7.Anchored = true;
		v7.CanCollide = false;
		v7.CanQuery = false;
		l__GameQueryUtil__6:setQueryIgnored(v7, true);
		v7.Parent = l__Workspace__7;
		l__CollectionService__8:AddTag(v7, p3.entityInstance.Name .. ":shield-gen");
		local u13 = u9.new();
		v7.AncestryChanged:Connect(function(p4, p5)
			if p5 == nil then
				u13:DoCleaning();
			end;
		end);
		local v8 = l__SoundManager__10:playSound(l__GameSound__11.SHIELD_GEN_LOOP);
		if v8 then
			v8.Looped = true;
			v8:Pause();
		end;
		u13:GiveTask(function()
			if v8 ~= nil then
				v8:Stop();
			end;
		end);
		local u14 = p3.entityInstance == l__Players__4.LocalPlayer.Character;
		local function v9(p6)
			for v10, v11 in ipairs((v7:GetChildren())) do
				if v11:IsA("ParticleEmitter") then
					v11.Enabled = p6;
				end;
			end;
			if v8 and u14 then
				if not p6 then
					v8:Pause();
					return;
				end;
			else
				return;
			end;
			v8:Play();
		end;
		v9(p3.entityInstance:GetAttribute("ShieldGenVisible") == true);
		p3.entityInstance:GetAttributeChangedSignal("ShieldGenVisible"):Connect(function()
			v9(p3.entityInstance:GetAttribute("ShieldGenVisible") == true);
		end);
		u13:GiveTask(l__RunService__12.RenderStepped:Connect(function(p7)
			if p3.entityInstance.PrimaryPart == nil then
				return nil;
			end;
			v7.CFrame = CFrame.new(p3.entityInstance.PrimaryPart.Position) * CFrame.Angles(0, l__Workspace__7:GetServerTimeNow() % 6 / 6 * 2 * math.pi, 0);
		end));
	end);
	l__ClientSyncEvents__3.StatusEffectRemoved:connect(function(p8)
		if table.find(p2.statusEffectTypes, p8.statusEffect) == nil then
			return nil;
		end;
		for v12, v13 in ipairs((l__CollectionService__8:GetTagged(p8.entityInstance.Name .. ":shield-gen"))) do
			v13:Destroy();
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
