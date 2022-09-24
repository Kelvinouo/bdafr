-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GlitchEffectsController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "GlitchEffectsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local l__Workspace__3 = v3.Workspace;
local l__GameQueryUtil__4 = v2.GameQueryUtil;
local l__scalePart__5 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scalePart;
local l__Debris__6 = v3.Debris;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			local v7 = l__ReplicatedStorage__2.Assets.Effects.GlitchExplosion:Clone();
			v7.Position = p4.position;
			v7.Parent = l__Workspace__3;
			l__GameQueryUtil__4:setQueryIgnored(v7, true);
			l__scalePart__5(v7, p4.scale);
			local v8, v9, v10 = ipairs((v7:GetDescendants()));
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				v10 = v8;
				if v9:IsA("ParticleEmitter") then
					v9:Emit(p4.numberParticles);
				end;			
			end;
			l__Debris__6:AddItem(v7, p4.duration);
		end);
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p5)
		local l__entity__11 = p5.entity;
		l__KnitClient__7.Controllers.GlitchEffectsController:playGlitchExplosion(l__entity__11:GetPivot().Position, {
			entityTarget = p5.entity, 
			effectConfig = {
				sizeMultiplier = 0.5
			}
		});
		l__SoundManager__8:playSound(l__GameSound__9.GLITCH_AMBIENT_1, {
			parent = l__entity__11, 
			position = l__entity__11:GetPivot().Position, 
			rollOffMaxDistance = 30
		});
	end);
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__EffectUtil__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v5.playGlitchExplosion(p6, p7, p8)
	local v12 = u10.new();
	local v13 = l__ReplicatedStorage__2.Assets.Effects.GlitchExplosion:Clone();
	v13.Position = p7;
	local v14 = p8;
	if v14 ~= nil then
		v14 = v14.parent;
	end;
	local v15 = v14;
	if v15 == nil then
		v15 = l__Workspace__3;
	end;
	v13.Parent = v15;
	local v16 = p8;
	if v16 ~= nil then
		v16 = v16.disableSound;
	end;
	if not v16 then
		local v17 = {
			position = p7, 
			rollOffMaxDistance = 30
		};
		local v18 = p8;
		if v18 ~= nil then
			v18 = v18.entityTarget;
		end;
		local v19 = v18;
		if v19 == nil then
			local v20 = p8;
			if v20 ~= nil then
				v20 = v20.parent;
			end;
			v19 = v20;
		end;
		v17.parent = v19;
		l__SoundManager__8:playSound(l__GameSound__9.GLITCHED_LUCKY_BLOCK_TELEPORT, v17);
	end;
	local v21 = p8;
	if v21 ~= nil then
		v21 = v21.loopConfig;
		if v21 ~= nil then
			v21 = v21.looped;
		end;
	end;
	if v21 then
		local v22 = p8;
		if v22 ~= nil then
			v22 = v22.entityTarget;
		end;
		local v23 = {};
		local v24 = p8;
		if v24 ~= nil then
			v24 = v24.effectConfig;
		end;
		if type(v24) == "table" then
			for v25, v26 in pairs(v24) do
				v23[v25] = v26;
			end;
		end;
		l__EffectUtil__11:playEffects({ v13 }, v22, v23);
		local u12 = true;
		local u13 = 0 + 1;
		task.spawn(function()
			task.delay(0.5, function()
				local function v27()
					l__EffectUtil__11:disableEffects({ v13 });
				end;
				while true do
					local v28 = u12;
					if v28 then
						local v29 = p8.loopConfig;
						if v29 ~= nil then
							v29 = v29.loopDelay;
						end;
						v28 = { wait(v29) };
					end;
					if not v28 then
						break;
					end;
					local v30 = p8.loopConfig;
					if v30 ~= nil then
						v30 = v30.numLoops;
					end;
					local v31 = v30;
					if v31 ~= 0 and v31 == v31 and v31 then
						local v32 = p8.loopConfig;
						if v32 ~= nil then
							v32 = v32.numLoops;
						end;
						v31 = v32 <= u13;
					end;
					if v31 ~= 0 and v31 == v31 and v31 then
						u12 = false;
						return;
					end;
					v27();
					u13 = u13 + 1;				
				end;
			end);
		end);
		v12:GiveTask(function()
			u12 = false;
		end);
	else
		local v33 = p8;
		if v33 ~= nil then
			v33 = v33.entityTarget;
		end;
		local v34 = {
			destroyAfterSec = 0.5
		};
		local v35 = p8;
		if v35 ~= nil then
			v35 = v35.effectConfig;
		end;
		if type(v35) == "table" then
			for v36, v37 in pairs(v35) do
				v34[v36] = v37;
			end;
		end;
		l__EffectUtil__11:playEffects({ v13 }, v33, v34);
	end;
	v12:GiveTask(v13);
	return v12;
end;
local v38 = l__KnitClient__7.CreateController(v5.new());
return nil;
