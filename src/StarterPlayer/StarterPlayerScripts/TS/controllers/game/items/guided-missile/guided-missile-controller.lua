-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GuidedMissileController";
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
	p1.Name = "GuidedMissileController";
	p1.jumping = Instance.new("BoolValue");
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Workspace__3 = v2.Workspace;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__7 = v2.Players;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__ClientSyncEvents__1.GuidedProjectileDetonated:connect(function(p3)
		if p3.guidedProjectileType == "guided_missile" then
			local v6 = l__ReplicatedStorage__2.Assets.Effects.GuidedMissileExplosion:Clone();
			v6.Position = p3.position;
			v6.Parent = l__Workspace__3;
			v6.Debris1:Emit(5);
			v6.Debris2:Emit(5);
			v6.ExplosionFlames:Emit(50);
			l__SoundManager__4:playSound(l__GameSound__5.GUIDED_MISSILE_EXPLOSION, {
				position = p3.position, 
				rollOffMaxDistance = 160
			});
			task.delay(5, function()
				v6:Destroy();
			end);
		end;
	end);
	l__default__6.Client:OnEvent("RemoteName", function(p4)
		if p4.entityInstance.PrimaryPart and p4.fromEntity and l__Players__7:GetPlayerFromCharacter(p4.fromEntity) == l__Players__7.LocalPlayer and p4.extra.guidedProjectile == "guided_missile" then
			l__SoundManager__4:playSound(l__GameSound__5.ARROW_HIT, {
				position = p4.entityInstance.PrimaryPart.Position, 
				volumeMultiplier = 0.3, 
				rollOffMaxDistance = 150
			});
		end;
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
