-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ActionButton;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__Workspace__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__BalanceFile__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
return {
	TNTWarsDroneUI = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = {
			actionName = "drop-tnt"
		};
		local u8 = p2.useValue(-1);
		function v2.onActivated()
			if not l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__4.TNT_WARS_DRONE) then
				u8.value = l__Workspace__5:GetServerTimeNow();
				l__default__6.Client:Get("RemoteName"):SendToServer();
				l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__4.TNT_WARS_DRONE, l__BalanceFile__7.TNT_WARS_DRONE_COOLDOWN, {
					cooldownBar = {
						color = Color3.fromRGB(250, 250, 250)
					}
				});
			end;
		end;
		v2.interactionKey = Enum.KeyCode.Z;
		v2.gamepadInteractionKey = Enum.KeyCode.ButtonB;
		v2.text = "Drop TNT";
		v2.priority = 80;
		return u1.createElement(l__ActionButton__2, v2);
	end)
};
