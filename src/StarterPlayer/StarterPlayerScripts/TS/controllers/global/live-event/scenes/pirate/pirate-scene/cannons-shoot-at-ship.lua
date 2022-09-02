-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = {
	name = "cannons shoot at ship", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__CollectionService__2 = v3.CollectionService;
local l__TweenService__3 = v3.TweenService;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__Workspace__5 = v3.Workspace;
local l__EffectUtil__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__ScreenShakeUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil;
local l__SoundManager__8 = v2.SoundManager;
local l__RandomUtil__9 = v2.RandomUtil;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__createCannonball__11 = v1.import(script, script.Parent, "modules", "create-cannonball").createCannonball;
local u12 = v1.import(script, script.Parent, "modules", "target-health").getPirateShipTargetHealth;
local l__KnitClient__13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v4.func(p1, p2, p3)
	if p1.elapsedEventTime < l__PirateSceneTimestamps__1.PreparationEnds then
		return nil;
	end;
	if l__PirateSceneTimestamps__1.ShipGetShotDown < p1.elapsedEventTime then
		return nil;
	end;
	local v5 = p2:get("ships");
	if v5 ~= nil then
		v5 = v5.ship1;
	end;
	if v5 == nil then
		return nil;
	end;
	local v6 = p2:get("nextCannonFire");
	if v6 == nil then
		v6 = {};
		p2:set("nextCannonFire", v6);
	end;
	local v7, v8, v9 = ipairs(l__CollectionService__2:GetTagged("LobbyCannon"));
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		if v8:IsA("Model") and v8.PrimaryPart then
			local v10 = v6[v8];
			if v10 == nil then
				v10 = os.clock() + math.random(1, 3);
				v6[v8] = v10;
			end;
			if v10 < os.clock() then
				local l__CFrame__11 = v8.PrimaryPart.CFrame;
				l__TweenService__3:Create(v8.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					CFrame = CFrame.new(l__CFrame__11.Position, v5.cframe.Position * Vector3.new(1, 0, 1) + Vector3.new(0, l__CFrame__11.Position.Y, 0)) * CFrame.Angles(0, -math.pi / 2, 0)
				}):Play();
				v6[v8] = os.clock() + math.random(1, 3);
				local l__Position__12 = (v8:GetPrimaryPartCFrame() * CFrame.new(-4, 3.5, 0)).Position;
				local v13 = l__ReplicatedStorage__4.Assets.Effects.CannonShoot.Attachment:Clone();
				v13.WorldPosition = l__Position__12;
				v13.Parent = l__Workspace__5.Terrain;
				l__EffectUtil__6:playEffects(v13:GetDescendants(), nil, {
					destroyAfterSec = 3
				});
				task.delay(1, function()
					return v13:Destroy();
				end);
				if (l__Workspace__5.CurrentCamera.CFrame.Position - l__Position__12).Magnitude < 20 then
					l__ScreenShakeUtil__7.shake(l__Position__12, (l__Position__12 - v5.instance:GetPrimaryPartCFrame().Position).Unit, {
						magnitude = 1.2, 
						cycles = 5, 
						duration = 0.2
					});
				end;
				l__SoundManager__8:playSound(l__RandomUtil__9.fromList(l__GameSound__10.PIRATE_CANNON_1, l__GameSound__10.PIRATE_CANNON_2, l__GameSound__10.PIRATE_CANNON_3), {
					position = v13.Position, 
					parent = v13, 
					rollOffMaxDistance = 150
				});
				local v14 = select(2, v5.instance:GetBoundingBox()) * (Vector3.new(math.random() - 0.5, math.random() - 0.5, math.random() - 0.5) * 0.5);
				local v15 = RaycastParams.new();
				v15.FilterDescendantsInstances = { v5.instance };
				v15.FilterType = Enum.RaycastFilterType.Whitelist;
				local v16 = l__Workspace__5:Raycast(l__Position__12, (v5.cframe.Position + v14 - l__Position__12) * 1.5, v15);
				local v17 = {
					origin = l__Position__12
				};
				if v16 then
					local v18 = v16.Position;
				else
					v18 = v5.cframe.Position + v14;
				end;
				v17.goal = v18;
				v17.duration = 1;
				l__createCannonball__11(v17);
				task.delay(1, function()
					local v19 = p2:get("shipHealth");
					if v19 == nil then
						v19 = 1000;
					end;
					local v20 = u12(p1.elapsedEventTime);
					if v19 < v20 then
						return nil;
					end;
					local v21 = v19 - (v19 - v20) / 3;
					p2:set("shipHealth", v21);
					l__KnitClient__13.Controllers.BossBarController:updateHealth(v21);
				end);
			end;
		end;	
	end;
	p2:set("nextCannonFire", v6);
end;
return {
	CannonsShootAtShip = v4
};
