-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = {
	name = "house explodes", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__CollectionService__2 = v2.CollectionService;
local l__Workspace__3 = v2.Workspace;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__8 = v2.Players;
local l__EffectUtil__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__ScreenShakeUtil__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil;
local u11 = Random.new();
function v3.func(p1, p2, p3)
	local v4 = p2:get("ships");
	if v4 == nil then
		return nil;
	end;
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.HouseExplodes then
		return nil;
	end;
	local l__ship1__5 = v4.ship1;
	local v6 = l__ship1__5;
	if v6 then
		local v7 = l__ship1__5.animationTrack;
		if v7 ~= nil then
			v7 = v7.IsPlaying;
		end;
		v6 = v7;
	end;
	if v6 then
		local l__animationTrack__8 = l__ship1__5.animationTrack;
		if l__animationTrack__8 ~= nil then
			l__animationTrack__8:Stop();
		end;
	end;
	local v9, v10, v11 = ipairs(l__CollectionService__2:GetTagged("delete-upon-ship-impact"));
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		if v10:IsDescendantOf(l__Workspace__3) then
			v10:Destroy();
		end;	
	end;
	u4.portal(l__Workspace__3, function()
		local u12 = u4.useInstance(function(p4)
			local v12 = l__ReplicatedStorage__5.Assets.Effects.FracturedHouse:Clone();
			v12:SetPrimaryPartCFrame(CFrame.new(183.959, 345.427, 323.018) * CFrame.Angles(0, 3.141592653589793, 0));
			p4.model = v12;
			return v12;
		end);
		u4.useEffect(function()
			local v13 = v4.ship1;
			if v13 ~= nil then
				v13 = v13.cframe;
			end;
			local v14 = {};
			local v15 = v13;
			if v15 ~= nil then
				v15 = v15.Position;
			end;
			v14.position = v15;
			v14.rollOffMaxDistance = 500;
			v14.rollOffMinDistsance = 300;
			l__SoundManager__6:playSound(l__GameSound__7.PIRATE_EVENT_SHIP_CRASH, v14);
			local v16 = l__Players__8.LocalPlayer;
			if v16 ~= nil then
				v16 = v16.Character;
				if v16 ~= nil then
					v16 = v16:GetPrimaryPartCFrame();
				end;
			end;
			local v17 = v16;
			if v17 == nil then
				v17 = l__Workspace__3.CurrentCamera.CFrame;
			end;
			local v18 = l__ReplicatedStorage__5.Assets.Effects.PirateShipCrash:Clone();
			local v19 = v13;
			if v19 ~= nil then
				v19 = v19.Position;
			end;
			local v20 = v19;
			if v20 == nil then
				v20 = Vector3.new();
			end;
			v18.Position = v20;
			v18.Parent = l__Workspace__3;
			l__EffectUtil__9:playEffects({ v18 }, nil, {
				destroyAfterSec = 5
			});
			l__ScreenShakeUtil__10.shake(u12.model:GetPrimaryPartCFrame().Position, (u12.model:GetPrimaryPartCFrame().Position - v17.Position).Unit, {
				magnitude = 3, 
				duration = 0.46
			});
			local v21, v22, v23 = ipairs(u12.model:GetChildren());
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				v23 = v21;
				if v22:IsA("BasePart") then
					v22.Anchored = false;
					if v13 then
						v22:ApplyImpulse((v22.Position - (v13.Position - Vector3.new(0, 10, 0)) + Vector3.new(u11:NextNumber(-1, 1), u11:NextNumber(-1, 1), u11:NextNumber(-1, 1)) * 20).Unit * (v22.AssemblyMass * 150));
						v22:ApplyAngularImpulse(Vector3.new(u11:NextNumber(-1, 1), u11:NextNumber(-1, 1), u11:NextNumber(-1, 1)) * (v22.AssemblyMass * 300));
					end;
				end;			
			end;
		end);
	end);
end;
return {
	HouseExplodes = v3
};
