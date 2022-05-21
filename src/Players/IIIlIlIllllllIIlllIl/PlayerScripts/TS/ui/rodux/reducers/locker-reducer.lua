-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KillEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local l__LobbyGadgetType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local l__EmoteType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__TitleType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local u1 = {
	selectedKillEffect = l__KillEffectType__2.NONE, 
	killEffects = { l__KillEffectType__2.NONE }, 
	selectedSpray = l__EmoteType__4.BED_BREAK, 
	sprays = { l__EmoteType__4.BED_BREAK }, 
	selectedTitle = l__TitleType__5.NONE, 
	titles = { l__TitleType__5.NONE }, 
	selectedLobbyGadget = l__LobbyGadgetType__3.NONE, 
	lobbyGadgets = { l__LobbyGadgetType__3.NONE }
};
return {
	LockerReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "LockerUpdateAll" then
			local v6 = {};
			for v7, v8 in pairs(p1) do
				v6[v7] = v8;
			end;
			for v9, v10 in pairs(p2.locker) do
				v6[v9] = v10;
			end;
			return v6;
		end;
		if p2.type == "LockerSetKillEffect" then
			local v11 = {};
			for v12, v13 in pairs(p1) do
				v11[v12] = v13;
			end;
			v11.selectedKillEffect = p2.killEffect;
			return v11;
		end;
		if p2.type == "LockerSetSpray" then
			local v14 = {};
			for v15, v16 in pairs(p1) do
				v14[v15] = v16;
			end;
			v14.selectedSpray = p2.spray;
			return v14;
		end;
		if p2.type == "LockerSetTitle" then
			local v17 = {};
			for v18, v19 in pairs(p1) do
				v17[v18] = v19;
			end;
			v17.selectedTitle = p2.title;
			return v17;
		end;
		if p2.type ~= "LockerSetLobbyGadget" then
			return p1;
		end;
		local v20 = {};
		for v21, v22 in pairs(p1) do
			v20[v21] = v22;
		end;
		v20.selectedLobbyGadget = p2.lobbyGadget;
		return v20;
	end
};
