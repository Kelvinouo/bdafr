-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TopBarController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "TopBarController";
end;
local l__StarterGui__1 = v2.StarterGui;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__BedwarsImageId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__5 = v2.ContentProvider;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	p2:mountHud();
	l__StarterGui__1:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
	if l__PlaceUtil__2.isGameServer() then
		v1.Promise.defer(function()
			local v6 = { l__BedwarsImageId__3.HUD_BED_DESTROYED };
			local v7 = table.create(#v6);
			local v8, v9, v10 = ipairs(v6);
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				v10 = v8;
				v7[v8] = u4("ImageLabel", {
					Image = v9
				});			
			end;
			l__ContentProvider__5:PreloadAsync(v7);
		end);
	end;
end;
local l__CreateRoduxApp__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__TopBarAppWrapper__7 = v1.import(script, script.Parent, "ui", "top-bar-app").TopBarAppWrapper;
local l__Players__8 = v2.Players;
function v4.mountHud(p3)
	v1.Promise.defer(function()
		l__CreateRoduxApp__6("TopBarApp", l__TopBarAppWrapper__7, {
			localPlayerId = l__Players__8.LocalPlayer.UserId
		}, {}, {});
	end);
end;
local v11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
