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
local l__StatusEffectType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "ShieldGenController";
	p1.statusEffectTypes = { l__StatusEffectType__1.SHIELD_GEN_1, l__StatusEffectType__1.SHIELD_GEN_2, l__StatusEffectType__1.SHIELD_GEN_3 };
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__3 = v3.Players;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__Workspace__6 = v3.Workspace;
local l__CollectionService__7 = v3.CollectionService;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__11 = v3.RunService;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__ClientSyncEvents__2.StatusEffectAdded:connect(function(p3)
		if table.find(p2.statusEffectTypes, p3.statusEffect) == nil then
			return nil;
		end;
		local v7 = l__ReplicatedStorage__4.Assets.Effects.Enchant.ShieldGen:Clone();
		v7.Anchored = true;
		v7.CanCollide = false;
		v7.CanQuery = false;
		l__GameQueryUtil__5:setQueryIgnored(v7, true);
		v7.Parent = l__Workspace__6;
		l__CollectionService__7:AddTag(v7, p3.entityInstance.Name .. ":shield-gen");
		local u12 = u8.new();
		v7.AncestryChanged:Connect(function(p4, p5)
			if p5 == nil then
				u12:DoCleaning();
			end;
		end);
		local v8 = l__SoundManager__9:playSound(l__GameSound__10.SHIELD_GEN_LOOP);
		if v8 then
			v8.Looped = true;
			v8:Pause();
		end;
		u12:GiveTask(function()
			if v8 ~= nil then
				v8:Stop();
			end;
		end);
		local u13 = p3.entityInstance == l__Players__3.LocalPlayer.Character;
		local function v9(p6)
			local v10, v11, v12 = ipairs((v7:GetChildren()));
			while true do
				v10(v11, v12);
				if not v10 then
					break;
				end;
				v12 = v10;
				if v11:IsA("ParticleEmitter") then
					v11.Enabled = p6;
				end;			
			end;
			if v8 and u13 then
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
		u12:GiveTask(l__RunService__11.RenderStepped:Connect(function(p7)
			if p3.entityInstance.PrimaryPart == nil then
				return nil;
			end;
			v7.CFrame = CFrame.new(p3.entityInstance.PrimaryPart.Position) * CFrame.Angles(0, l__Workspace__6:GetServerTimeNow() % 6 / 6 * 2 * math.pi, 0);
		end));
	end);
	l__ClientSyncEvents__2.StatusEffectRemoved:connect(function(p8)
		if table.find(p2.statusEffectTypes, p8.statusEffect) == nil then
			return nil;
		end;
		local v13, v14, v15 = ipairs((l__CollectionService__7:GetTagged(p8.entityInstance.Name .. ":shield-gen")));
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			v14:Destroy();		
		end;
	end);
end;
local v16 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
