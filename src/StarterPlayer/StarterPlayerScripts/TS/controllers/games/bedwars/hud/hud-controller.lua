-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HudController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "HudController";
end;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__StarterGui__4 = v3.StarterGui;
local l__BedwarsImageId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__7 = v3.ContentProvider;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	if l__PlaceUtil__3.isLobbyServer() then
		return nil;
	end;
	p2:mountHUD();
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
	v1.Promise.defer(function()
		local v7 = { l__BedwarsImageId__5.HUD_BED_DESTROYED };
		local function v8(p3)
			return u6("ImageLabel", {
				Image = p3
			});
		end;
		local v9 = table.create(#v7);
		for v10, v11 in ipairs(v7) do
			v9[v10] = v8(v11, v10 - 1, v7);
		end;
		l__ContentProvider__7:PreloadAsync(v9);
	end);
	v1.Promise.defer(function()
		l__default__8.Client:WaitFor("RemoteName"):andThen(function(p4)
			l__ClientStore__9:dispatch({
				type = "SetServerRegion", 
				serverRegion = p4:CallServer()
			});
		end);
	end);
end;
local l__CreateRoduxApp__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__HudAppWrapper__11 = v1.import(script, script.Parent, "ui", "hud-app").HudAppWrapper;
local l__Players__12 = v3.Players;
function u1.mountHUD(p5)
	v1.Promise.defer(function()
		l__CreateRoduxApp__10("HudApp", l__HudAppWrapper__11, {
			localPlayerId = l__Players__12.LocalPlayer.UserId, 
			ToggleTabList = l__KnitClient__2.Controllers.TabListController.toggleTablist
		}, {}, {});
	end);
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
