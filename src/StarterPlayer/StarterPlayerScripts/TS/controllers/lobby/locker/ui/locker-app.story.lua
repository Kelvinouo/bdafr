-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KillEffectType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local l__EmoteType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__TitleType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local l__LobbyGadgetType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__LockerApp__7 = v1.import(script, script.Parent, "locker-app").LockerApp;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__5:dispatch({
		type = "LockerUpdateAll", 
		locker = {
			selectedKillEffect = l__KillEffectType__1.NONE, 
			killEffects = { l__KillEffectType__1.NONE, l__KillEffectType__1.JELLY, l__KillEffectType__1.GIFT, l__KillEffectType__1.SNOWMAN, l__KillEffectType__1.BLIMP, l__KillEffectType__1.EXPLODE, l__KillEffectType__1.COFFIN, l__KillEffectType__1.ABDUCTION, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK, l__KillEffectType__1.SHARK }, 
			selectedSpray = l__EmoteType__2.CLETUS_CARROT, 
			sprays = { l__EmoteType__2.ROCK_OUT, l__EmoteType__2.BANANA_BARBARIAN, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT, l__EmoteType__2.CLETUS_CARROT }, 
			selectedTitle = l__TitleType__3.MLG, 
			titles = { l__TitleType__3.NONE, l__TitleType__3.MLG, l__TitleType__3.MINERS_OF_THE_GALAXY, l__TitleType__3.MLG, l__TitleType__3.MLG, l__TitleType__3.MLG, l__TitleType__3.MLG, l__TitleType__3.MLG, l__TitleType__3.MLG, l__TitleType__3.MLG }, 
			selectedLobbyGadget = l__LobbyGadgetType__4.RAGEBLADE, 
			lobbyGadgets = { l__LobbyGadgetType__4.NONE, l__LobbyGadgetType__4.RAGEBLADE }
		}
	});
	local u9 = l__CreateRoduxApp__6("LockerApp", l__LockerApp__7, {}, {}, {
		Parent = p1
	});
	return function()
		u8.unmount(u9);
	end;
end;
