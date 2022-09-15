-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FireAspectController";
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
	p1.Name = "FireAspectController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u3 = v1.import(script, script.Parent.Parent.Parent, "global", "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local l__Players__4 = v2.Players;
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__CollectionService__6 = v2.CollectionService;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
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
	local u10 = u3;
	function v7.constructor(p3, ...)
		u10.constructor(p3, ...);
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
		local v12, v13, v14 = ipairs(l__ReplicatedStorage__5.Assets.Effects.Burn:GetChildren());
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
		local v16 = {};
		if v9 then
			local v17 = nil;
		else
			v17 = p5.PrimaryPart.Position;
		end;
		v16.position = v17;
		if v9 then
			local v18 = nil;
		else
			v18 = p5.PrimaryPart;
		end;
		v16.parent = v18;
		local v19 = l__SoundManager__7:playSound(l__GameSound__8.BURN_LOOP, v16);
		if v19 then
			v19.Looped = true;
		end;
		p4.maid:GiveTask(function()
			if v19 ~= nil then
				v19:Stop();
			end;
			local function v20(p7)
				if not p7:IsA("ParticleEmitter") then
					p7:Destroy();
					return;
				end;
				p7.Enabled = false;
				task.delay(3, function()
					p7:Destroy();
				end);
			end;
			local v21, v22, v23 = ipairs(v11);
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				v23 = v21;
				v20(v22, v21 - 1, v11);			
			end;
		end);
	end;
	function v7.onRemove(p8, p9, p10)

	end;
	u10 = l__StatusEffectController__6.setHandler;
	u10(l__StatusEffectController__6, l__StatusEffectType__2.BURN, v7);
	u10 = l__default__9.Client;
	u10 = u10.OnEvent;
	u10(u10, "FireAspectHit", function(p11)
		if p11.to.PrimaryPart == nil then
			return nil;
		end;
		local v24 = p11.to == l__Players__4.LocalPlayer.Character;
		local v25 = {};
		if v24 then
			local v26 = nil;
		else
			v26 = p11.to.PrimaryPart.Position;
		end;
		v25.position = v26;
		if v24 then
			local v27 = nil;
		else
			v27 = p11.to.PrimaryPart;
		end;
		v25.parent = v27;
		l__SoundManager__7:playSound(l__GameSound__8.BURN_HIT, v25);
		local l__UpperTorso__28 = p11.to:FindFirstChild("UpperTorso");
		if not l__UpperTorso__28 then
			return nil;
		end;
		local v29 = {};
		if v24 then
			local v30 = nil;
		else
			v30 = l__UpperTorso__28.Position;
		end;
		v29.position = v30;
		l__SoundManager__7:playSound(l__GameSound__8.BURN_HIT, v29);
		local v31 = {};
		local v32, v33, v34 = ipairs(l__ReplicatedStorage__5.Assets.Effects.FireHit:Clone():GetChildren());
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			v33.Parent = l__UpperTorso__28;
			table.insert(v31, v33);		
		end;
		task.delay(5, function()
			local v35, v36, v37 = ipairs(v31);
			while true do
				v35(v36, v37);
				if not v35 then
					break;
				end;
				v37 = v35;
				v36:Destroy();			
			end;
		end);
	end);
end;
local v38 = l__KnitClient__1.CreateController(v4.new());
return nil;
