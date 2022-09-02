-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BarbarianKitController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "BarbarianKitController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BarbarianKit__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CreateRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__BarbarianRageBarWrapper__9 = v1.import(script, script.Parent, "ui", "barbarian-rage-bar").BarbarianRageBarWrapper;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__KnitClient__1.Controllers.KitController:watchLocalKit(function(p3)
		if p3 ~= l__BedwarsKit__2.BARBARIAN then
			return nil;
		end;
		l__Players__3.LocalPlayer:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function()
			l__ClientStore__4:dispatch({
				type = "KitBarbarianSetRage", 
				rage = l__Players__3.LocalPlayer:GetAttribute("BarbarianRageLevel")
			});
		end);
		local u10 = l__BarbarianKit__5.SwordProgression[1];
		l__ClientStore__4.changed:connect(function(p4, p5)
			if p4.Kit.barbarianRage ~= p5.Kit.barbarianRage then
				local v5 = l__BarbarianKit__5.getSwordProgress(l__Players__3.LocalPlayer);
				if v5.prev ~= u10 then
					u10 = v5.prev;
					if p5.Kit.barbarianRage < p4.Kit.barbarianRage then
						l__SoundManager__6:playSound(l__GameSound__7.BEDWARS_PURCHASE_ITEM);
					end;
				end;
			end;
		end);
		l__CreateRoduxApp__8("BarbarianRageBar", l__BarbarianRageBarWrapper__9, {});
	end);
end;
local v6 = l__KnitClient__1.CreateController(v3.new());
return nil;
