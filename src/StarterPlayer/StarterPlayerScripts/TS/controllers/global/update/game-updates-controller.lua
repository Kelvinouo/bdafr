-- Script Hash: 89791fea3cd9dc3bc79dbd780ba9073fc019d4f883615e417baa530ffefaf6d969ead6dd9bb663c2f9759dc725e45775
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GameUpdatesController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GameUpdatesController";
	p1.remotes = l__default__2.Client:GetNamespace("Update");
end;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	if l__PlaceUtil__3.isGameServer() then
		return nil;
	end;
	p2.remotes:WaitFor("FetchGameUpdates"):andThen(function(p3)
		local v5 = p3:CallServer();
		if not v5.success then
			return nil;
		end;
		if v5.updates then
			l__ClientStore__4:dispatch({
				type = "GameUpdatesSetAll", 
				updates = v5.updates, 
				newestKit = v5.newestKit, 
				newestKitBG = v5.newestKitBG
			});
		end;
		if v5.newUpdate then
			if l__Players__5.LocalPlayer:GetAttribute("FirstTimePlayer") == nil then
				l__Players__5.LocalPlayer:GetAttributeChangedSignal("FirstTimePlayer"):Wait();
			end;
			if l__Players__5.LocalPlayer:GetAttribute("FirstTimePlayer") ~= true then
				p2:openGameUpdateApp();
			end;
		end;
	end);
end;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function v3.openGameUpdateApp(p4)
	l__SoundManager__6:playSound(l__GameSound__7.UI_OPEN);
	l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__9.GAME_UPDATES, {});
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
