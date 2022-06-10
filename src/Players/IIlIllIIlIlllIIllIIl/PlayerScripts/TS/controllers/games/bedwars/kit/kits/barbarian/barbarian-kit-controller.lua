-- Script Hash: 9e485a7222ab5469270df842f4b1fcc4dee4066c6aece344216445c80e3978703e49c7831448060592ffae48301f5cbd
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BarbarianKitController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__LegacyKitKnitController__2;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.BARBARIAN });
	p1.Name = "BarbarianKitController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BarbarianKit__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CreateRoduxApp__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__BarbarianRageBarWrapper__10 = v1.import(script, script.Parent, "ui", "barbarian-rage-bar").BarbarianRageBarWrapper;
function u1.onKitEnabled(p3)
	p3:gunGamePromise():andThen(function(p4)
		if not p4 then
			l__Players__4.LocalPlayer:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function()
				l__ClientStore__5:dispatch({
					type = "KitBarbarianSetRage", 
					rage = l__Players__4.LocalPlayer:GetAttribute("BarbarianRageLevel")
				});
			end);
			local u11 = l__BarbarianKit__6.SwordProgression[1];
			l__ClientStore__5.changed:connect(function(p5, p6)
				if p5.Kit.barbarianRage ~= p6.Kit.barbarianRage then
					local v5 = l__BarbarianKit__6.getSwordProgress(l__Players__4.LocalPlayer);
					if v5.prev ~= u11 then
						u11 = v5.prev;
						if p6.Kit.barbarianRage < p5.Kit.barbarianRage then
							l__SoundManager__7:playSound(l__GameSound__8.BEDWARS_PURCHASE_ITEM);
						end;
					end;
				end;
			end);
			l__CreateRoduxApp__9("BarbarianRageBar", l__BarbarianRageBarWrapper__10, {});
		end;
	end);
end;
function u1.onKitDisabled(p7)

end;
local l__QueueType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
function u1.gunGamePromise(p8)
	return v1.Promise.new(function(p9)
		local u13 = nil;
		u13 = l__ClientStore__5.changed:connect(function(p10, p11)
			if p10.Game.queueType ~= p11.Game.queueType then
				u13:disconnect();
				p9(p10.Game.queueType == l__QueueType__12.GUN_GAME);
			end;
		end);
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	BarbarianKitController = u2
};
return u1;
