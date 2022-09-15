-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = {
	name = "make ships red on hit", 
	event = "Heartbeat"
};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__SingleMotor__2 = v2.SingleMotor;
local l__useEvent__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "useEvent").useEvent;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__PlayerEntity__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__Players__6 = v3.Players;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ReplicatedStorage__8 = v3.ReplicatedStorage;
local l__Workspace__9 = v3.Workspace;
local l__EffectUtil__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Spring__13 = v2.Spring;
function v4.func(p1, p2, p3)
	local v5 = p2:get("ships");
	if v5 == nil then
		return nil;
	end;
	local v6 = v5.ship1;
	if v6 ~= nil then
		v6 = v6.instance;
	end;
	if v6 == nil then
		return nil;
	end;
	local u14 = u1.useState(l__SingleMotor__2.new(1));
	u1.useEffect(function()
		return function()
			u14:destroy();
		end;
	end);
	local v7 = u1.useState({});
	for v8, v9 in pairs(v7) do
		if os.clock() - v9.timestamp > 0.1 then
			v7[v8] = nil;
		end;
	end;
	local v10, v11, v12 = l__useEvent__3("projectile hit", l__ClientSyncEvents__4.ProjectileHit);
	while true do
		local v13 = v10(v11, v12);
		if not v13 then
			break;
		end;
		local v14 = v13[1];
		local v15 = v1.instanceof(v14.shooter, l__PlayerEntity__5) and v14.shooter:getPlayer() == l__Players__6.LocalPlayer;
		if v15 then
			local v16 = v14.hitData.part;
			if v16 ~= nil then
				v16 = v16.Parent;
			end;
			v15 = v16 == v6 and (not v14:isCancelled() and v7[v14.projectileRefId] == nil);
		end;
		if v15 then
			local v17 = p2:get("shipHealth");
			if v17 == nil then
				v17 = 1000;
			end;
			local v18 = v17 - 6;
			p2:set("shipHealth", v18);
			l__KnitClient__7.Controllers.BossBarController:updateHealth(v18);
			v7[v14.projectileRefId] = {
				timestamp = os.clock()
			};
			local v19 = l__ReplicatedStorage__8.Assets.Effects.PirateShipHit:Clone();
			v19.Position = v14.hitData.hitCFrame.Position;
			v19.Parent = l__Workspace__9;
			l__EffectUtil__10:playEffects({ v19 }, nil, {
				destroyAfterSec = 3
			});
			l__SoundManager__11:playSound(l__GameSound__12.PIRATE_SHIP_HIT);
			u14:setGoal(l__Spring__13.new(0.5, {
				dampingRatio = 0.75, 
				frequency = 6
			}));
			task.delay(0.15, function()
				u14:setGoal(l__Spring__13.new(1, {
					dampingRatio = 0.75, 
					frequency = 4
				}));
			end);
		end;	
	end;
end;
return {
	MakeShipsRedOnHit = v4
};
