-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "HealingController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "HealingController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = v1.import(script, script.Parent.Parent.Parent, "global", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local l__Players__4 = v2.Players;
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__CollectionService__6 = v2.CollectionService;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local l__StatusEffectController__6 = l__KnitClient__1.Controllers.StatusEffectController;
	local v7 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = u3
	});
	v7.__index = v7;
	function v7.new(...)
		local v8 = setmetatable({}, v7);
		return v8:constructor(...) and v8;
	end;
	local u7 = u3;
	function v7.constructor(p3, ...)
		u7.constructor(p3, ...);
	end;
	function v7.onApply(p4, p5, p6)
		if p5.PrimaryPart == nil then
			return nil;
		end;
		local v9 = p5 == l__Players__4.LocalPlayer.Character;
		local l__UpperTorso__10 = p5:FindFirstChild("UpperTorso");
		if not l__UpperTorso__10 then
			return nil;
		end;
		local v11 = {};
		local v12, v13, v14 = ipairs(l__ReplicatedStorage__5.Assets.Effects.Healing:GetChildren());
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			local v15 = v13:Clone();
			v15.Parent = l__UpperTorso__10;
			if v9 and (v15:IsA("ParticleEmitter") or v15:IsA("Beam")) then
				l__CollectionService__6:AddTag(v15, "FirstPersonHidden");
			end;
			table.insert(v11, v15);		
		end;
		p4.maid:GiveTask(function()
			local function v16(p7)
				if not p7:IsA("ParticleEmitter") then
					p7:Destroy();
					return;
				end;
				p7.Enabled = false;
				task.delay(3, function()
					p7:Destroy();
				end);
			end;
			local v17, v18, v19 = ipairs(v11);
			while true do
				v17(v18, v19);
				if not v17 then
					break;
				end;
				v19 = v17;
				v16(v18, v17 - 1, v11);			
			end;
		end);
	end;
	function v7.onRemove(p8, p9, p10)

	end;
	u7 = l__StatusEffectController__6.setHandler;
	u7(l__StatusEffectController__6, l__StatusEffectType__2.HEAL_OVER_TIME, v7);
end;
local v20 = l__KnitClient__1.CreateController(v4.new());
return nil;
