-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = {
	name = "Ships fire tnt", 
	event = "Heartbeat"
};
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__Players__2 = v3.Players;
local u3 = Random.new();
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__5 = v3.Workspace;
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__7 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__ReplicatedStorage__8 = v3.ReplicatedStorage;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.func(p1, p2, p3)
	local v5 = p2:get("ships");
	if v5 ~= nil then
		v5 = v5.ship1;
	end;
	if v5 == nil then
		return nil;
	end;
	local v6 = math.floor(p1.elapsedEventTime / 3600 * 1000) / 1000;
	if v6 > 0 and v6 % 12 == 0 and not l__DeviceUtil__1.isHoarceKat() and p2:get("tntFiredThisServer") ~= true then
		p2:set("tntFiredThisServer", true);
		task.spawn(function()
			local l__Character__7 = l__Players__2.LocalPlayer.Character;
			if l__Character__7 == nil or l__Character__7.PrimaryPart == nil then
				return nil;
			end;
			local l__Position__8 = l__Character__7:GetPrimaryPartCFrame().Position;
			local v9 = 0;
			local v10 = false;
			while true do
				if v10 then
					v9 = v9 + 1;
				else
					v10 = true;
				end;
				if not (v9 < 3) then
					break;
				end;
				local v11 = l__Position__8 + Vector3.new(u3:NextNumber(-10, 10), 0, u3:NextNumber(-10, 10));
				local v12 = u4("Part", {
					Size = Vector3.new(1, 1, 1), 
					Position = v5.cframe.Position, 
					Transparency = 1, 
					Anchored = true, 
					CanCollide = false, 
					Parent = l__Workspace__5
				});
				local v13 = u4("Trail", {
					Attachment0 = u4("Attachment", {
						Position = Vector3.new(0, -1, 0), 
						Parent = v12
					}), 
					Attachment1 = u4("Attachment", {
						Position = Vector3.new(0, 1, 0), 
						Parent = v12
					}), 
					Parent = v12
				});
				l__default__6(3, l__InQuad__7, function(p4)
					v12.Position = p4;
				end, v5.cframe.Position, v11):Wait();
				v12.Transparency = 1;
				local v14 = l__ReplicatedStorage__8.Assets.Effects.GuidedMissileExplosion:Clone();
				v14.Position = v11;
				v14.Parent = l__Workspace__5;
				v14.Debris1:Emit(5);
				v14.Debris2:Emit(5);
				v14.ExplosionFlames:Emit(50);
				l__SoundManager__9:playSound(l__GameSound__10.MINICOPTER_EXPLODE, {
					position = v11, 
					rollOffMaxDistance = 160
				});
				task.delay(5, function()
					v12:Destroy();
					v14:Destroy();
				end);			
			end;
		end);
	end;
end;
return {
	ShipsFireTntBehavior = v4
};
