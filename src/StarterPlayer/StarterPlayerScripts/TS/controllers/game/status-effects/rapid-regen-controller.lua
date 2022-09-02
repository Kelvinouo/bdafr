-- Script Hash: d9aff135ff6f208e0d209b23c29b7857ac9e100a4cf15ac7845516b48cfc3abc853eaf067af97b3a8342be688dc5b45d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "RapidRegenController";
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
	p1.Name = "RapidRegenController";
	p1.statusEffectTypes = { l__StatusEffectType__2.RAPID_REGEN_1, l__StatusEffectType__2.RAPID_REGEN_2, l__StatusEffectType__2.RAPID_REGEN_3 };
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__GameQueryUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__6 = v3.Workspace;
local l__CollectionService__7 = v3.CollectionService;
local l__Maid__8 = v2.Maid;
local l__RunService__9 = v3.RunService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__3.StatusEffectAdded:connect(function(p3)
		if table.find(p2.statusEffectTypes, p3.statusEffect) == nil then
			return nil;
		end;
		local v7 = l__ReplicatedStorage__4.Assets.Effects.Enchant.RapidRegen:Clone();
		v7.Anchored = true;
		v7.CanCollide = false;
		v7.CanQuery = false;
		l__GameQueryUtil__5:setQueryIgnored(v7, true);
		v7.Parent = l__Workspace__6;
		l__CollectionService__7:AddTag(v7, p3.entityInstance.Name .. ":rapid-regen");
		local u10 = l__Maid__8.new();
		v7.AncestryChanged:Connect(function(p4, p5)
			if p5 == nil then
				u10:DoCleaning();
			end;
		end);
		local function v8(p6)
			local v9 = v7:GetChildren();
			local function v10(p7)
				if p7:IsA("ParticleEmitter") then
					p7.Enabled = p6;
				end;
			end;
			for v11, v12 in ipairs(v9) do
				v10(v12, v11 - 1, v9);
			end;
		end;
		v8(p3.entityInstance:GetAttribute("RapidRegenVisible") == true);
		p3.entityInstance:GetAttributeChangedSignal("RapidRegenVisible"):Connect(function()
			v8(p3.entityInstance:GetAttribute("RapidRegenVisible") == true);
		end);
		u10:GiveTask(l__RunService__9.RenderStepped:Connect(function(p8)
			if p3.entityInstance.PrimaryPart == nil then
				return nil;
			end;
			v7.CFrame = p3.entityInstance.PrimaryPart.CFrame;
		end));
	end);
	l__ClientSyncEvents__3.StatusEffectRemoved:connect(function(p9)
		if table.find(p2.statusEffectTypes, p9.statusEffect) == nil then
			return nil;
		end;
		local v13 = l__CollectionService__7:GetTagged(p9.entityInstance.Name .. ":rapid-regen");
		local function v14(p10)
			p10:Destroy();
		end;
		for v15, v16 in ipairs(v13) do
			v14(v16, v15 - 1, v13);
		end;
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
