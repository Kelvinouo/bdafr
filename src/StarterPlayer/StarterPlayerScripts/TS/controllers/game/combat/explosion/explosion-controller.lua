-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ExplosionController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__4 = v3.Workspace;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ExplosionController";
	p1.explosionsFolder = u3("Folder", {
		Name = "Explosions", 
		Parent = l__Workspace__4
	});
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
local l__Debris__10 = v3.Debris;
local l__GetTarmacAsset__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
function u1.KnitStart(p2)
	l__default__5.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			l__ClientSyncEvents__6.ExplosionEffectEvent:fire(p4.position, p4.explosionType);
			if p4.disableDefaultEffect then
				return nil;
			end;
			if not p4.disableSound then
				l__SoundManager__7:playSound(l__GameSound__8.TNT_EXPLODE_1, {
					position = p4.position, 
					rollOffMaxDistance = 300
				});
			end;
			local v7 = u3("Part", {
				Size = Vector3.new(1, 1, 1), 
				CFrame = CFrame.new(p4.position), 
				Anchored = true, 
				CanCollide = false, 
				Transparency = 1, 
				Parent = p2.explosionsFolder
			});
			l__GameQueryUtil__9:setQueryIgnored(v7, true);
			l__Debris__10:AddItem(v7, 3);
			local v8 = Random.new();
			local v9 = u3("ParticleEmitter", {
				Color = ColorSequence.new(Color3.new(0.92, 0.92, 0.92), Color3.new(1, 1, 1)), 
				LightInfluence = 0.1, 
				Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 1), NumberSequenceKeypoint.new(1, 0) }), 
				Transparency = NumberSequence.new(0, 1), 
				Acceleration = Vector3.new(0, 4, 0), 
				Drag = 3.5, 
				EmissionDirection = Enum.NormalId.Top, 
				Lifetime = NumberRange.new(3, 5), 
				Rate = 0, 
				Rotation = NumberRange.new(0, 360), 
				RotSpeed = NumberRange.new(50, 100), 
				Speed = NumberRange.new(17, 30), 
				SpreadAngle = Vector2.new(100, 100), 
				Parent = v7
			});
			local v10 = 25 * p4.power;
			local v11 = 0;
			local v12 = false;
			while true do
				if v12 then
					v11 = v11 + 1;
				else
					v12 = true;
				end;
				if not (v11 < v10) then
					break;
				end;
				v9.Texture = l__GetTarmacAsset__11("Explode" .. tostring((v8:NextInteger(1, 7)))).Image;
				v9:Emit(1);			
			end;
		end);
	end);
end;
function u1.playExplodeEffect(p5, p6, p7)
	l__SoundManager__7:playSound(l__GameSound__8.TNT_EXPLODE_1, {
		position = p6, 
		rollOffMaxDistance = 220
	});
	local v13 = u3("Part", {
		Size = Vector3.new(1, 1, 1), 
		CFrame = CFrame.new(p6), 
		Anchored = true, 
		CanCollide = false, 
		Transparency = 1, 
		Parent = p5.explosionsFolder
	});
	l__GameQueryUtil__9:setQueryIgnored(v13, true);
	l__Debris__10:AddItem(v13, 3);
	local v14 = Random.new();
	local v15 = NumberRange.new(17, 30);
	local v16 = u3("ParticleEmitter", {
		Color = ColorSequence.new(Color3.new(0.92, 0.92, 0.92), Color3.new(1, 1, 1)), 
		LightInfluence = 0.1, 
		Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 2, 1), NumberSequenceKeypoint.new(1, 0) }), 
		Transparency = NumberSequence.new(0, 1), 
		Acceleration = Vector3.new(0, 4, 0), 
		Drag = 3.5, 
		EmissionDirection = Enum.NormalId.Top, 
		Lifetime = NumberRange.new(3, 5), 
		Rate = 0, 
		Rotation = NumberRange.new(0, 360), 
		RotSpeed = NumberRange.new(50, 100), 
		Speed = NumberRange.new(v15.Min * p7, v15.Max * p7), 
		SpreadAngle = Vector2.new(100, 100), 
		Parent = v13
	});
	local v17 = 0;
	local v18 = false;
	while true do
		if v18 then
			v17 = v17 + 1;
		else
			v18 = true;
		end;
		if not (v17 < 25) then
			break;
		end;
		v16.Texture = l__GetTarmacAsset__11("Explode" .. tostring((v14:NextInteger(1, 7)))).Image;
		v16:Emit(1);	
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ExplosionController = u2
};
return u1;
