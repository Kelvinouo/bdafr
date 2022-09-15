-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "IceQueenProgressController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__BedwarsKit__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1)
	l__LegacyKitKnitController__2.constructor(p1, { l__BedwarsKit__1.ICE_QUEEN });
	p1.Name = "IceQueenProgressController";
	p1.maid = u2.new();
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__IceQueenKit__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ice-queen", "ice-queen-kit").IceQueenKit;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v3.KnitStart(p2)
	l__LegacyKitKnitController__2.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		l__ClientStore__4:dispatch({
			type = "KitIceQueenSetProgress", 
			progress = p3.damage / l__IceQueenKit__5.DAMAGE_REQUIREMENT
		});
	end);
	l__ClientStore__4.changed:connect(function(p4, p5)
		local l__iceQueenProgress__5 = p4.Kit.iceQueenProgress;
		local l__iceQueenProgress__6 = p5.Kit.iceQueenProgress;
		if l__iceQueenProgress__5 ~= l__iceQueenProgress__6 and l__iceQueenProgress__5 >= 1 and l__iceQueenProgress__6 < 1 then
			p2.maid:DoCleaning();
			task.spawn(function()
				l__SoundManager__6:playSound(l__GameSound__7.ICE_QUEEN_PASSIVE_UNLOCKED);
			end);
		end;
	end);
end;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__IceQueenProgressBar__10 = v1.import(script, script.Parent, "ui", "ice-queen-progress-bar").IceQueenProgressBar;
function v3.onKitEnabled(p6)
	task.spawn(function()
		print("mounting ice queen progress bar.");
		p6.maid:GiveTask((l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__9(l__IceQueenProgressBar__10))));
	end);
end;
function v3.onKitDisabled(p7)
	task.spawn(function()
		p7.maid:DoCleaning();
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
