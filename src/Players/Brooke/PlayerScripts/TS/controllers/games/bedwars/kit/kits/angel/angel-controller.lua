-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "AngelController";
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
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.ANGEL });
	p1.Name = "AngelController";
	p1.maid = u4.new();
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ANGEL_KILL_REQUIREMENT__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit").ANGEL_KILL_REQUIREMENT;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__5.Client:OnEvent("RemoteName", function(p3)
		l__ClientStore__6:dispatch({
			type = "KitAngelIncrementProgress", 
			progress = p3.incrementProgress / l__ANGEL_KILL_REQUIREMENT__7
		});
	end);
end;
local l__Players__8 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__AngelUi__11 = v1.import(script, script.Parent, "ui", "angel-ui").AngelUi;
function u1.onKitEnabled(p4)
	local l__LocalPlayer__5 = l__Players__8.LocalPlayer;
	p4.maid:GiveTask((l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__10(l__AngelUi__11, {
		SelectAngel = function(p5)
			l__default__5.Client:Get("RemoteName"):SendToServer({
				angel = p5
			});
		end
	}))));
	p4.maid:GiveTask(l__LocalPlayer__5:GetAttributeChangedSignal("AngelType"):Connect(function()
		if l__LocalPlayer__5:GetAttribute("AngelType") then
			p4.maid:DoCleaning();
		end;
	end));
end;
function u1.onKitDisabled(p6)
	p6.maid:DoCleaning();
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
