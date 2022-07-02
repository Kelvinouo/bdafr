-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "RapidRegenController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "RapidRegenController";
	p1.statusEffectTypes = { l__StatusEffectType__2.RAPID_REGEN_1, l__StatusEffectType__2.RAPID_REGEN_2, l__StatusEffectType__2.RAPID_REGEN_3 };
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__GameQueryUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__6 = v2.Workspace;
local l__CollectionService__7 = v2.CollectionService;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__9 = v2.RunService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__3.StatusEffectAdded:connect(function(p3)
		if table.find(p2.statusEffectTypes, p3.statusEffect) == nil then
			return nil;
		end;
		local v6 = l__ReplicatedStorage__4.Assets.Effects.Enchant.RapidRegen:Clone();
		v6.Anchored = true;
		v6.CanCollide = false;
		v6.CanQuery = false;
		l__GameQueryUtil__5:setQueryIgnored(v6, true);
		v6.Parent = l__Workspace__6;
		l__CollectionService__7:AddTag(v6, p3.entityInstance.Name .. ":rapid-regen");
		local u10 = u8.new();
		v6.AncestryChanged:Connect(function(p4, p5)
			if p5 == nil then
				u10:DoCleaning();
			end;
		end);
		local function v7(p6)
			for v8, v9 in ipairs((v6:GetChildren())) do
				if v9:IsA("ParticleEmitter") then
					v9.Enabled = p6;
				end;
			end;
		end;
		v7(p3.entityInstance:GetAttribute("RapidRegenVisible") == true);
		p3.entityInstance:GetAttributeChangedSignal("RapidRegenVisible"):Connect(function()
			v7(p3.entityInstance:GetAttribute("RapidRegenVisible") == true);
		end);
		u10:GiveTask(l__RunService__9.RenderStepped:Connect(function(p7)
			if p3.entityInstance.PrimaryPart == nil then
				return nil;
			end;
			v6.CFrame = p3.entityInstance.PrimaryPart.CFrame;
		end));
	end);
	l__ClientSyncEvents__3.StatusEffectRemoved:connect(function(p8)
		if table.find(p2.statusEffectTypes, p8.statusEffect) == nil then
			return nil;
		end;
		for v10, v11 in ipairs((l__CollectionService__7:GetTagged(p8.entityInstance.Name .. ":rapid-regen"))) do
			v11:Destroy();
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
