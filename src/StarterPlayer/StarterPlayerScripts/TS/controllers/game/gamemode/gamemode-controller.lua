-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GamemodeController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GamemodeType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gamemode", "gamemode-type").GamemodeType;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "GamemodeController";
	p1.gamemodeRemotes = l__default__1.Client:GetNamespace("Gamemode");
	p1.currGamemode = l__GamemodeType__2.PVP;
end;
local l__ContextActionService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContextActionService;
local l__ComponentUtil__4 = v2.ComponentUtil;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "id-billboard-component").default;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	p2.gamemodeRemotes:OnEvent("GamemodeUpdate", function(p3)
		p2.currGamemode = p3.gamemode;
		if p3.gamemode ~= l__GamemodeType__2.CREATIVE then
			l__ContextActionService__3:UnbindAction("creative-inventory-toggle");
			local v6, v7, v8 = ipairs((l__ComponentUtil__4:getAllComponents(l__default__5)));
			while true do
				v6(v7, v8);
				if not v6 then
					break;
				end;
				v8 = v6;
				v7:closeUIDBillboard();			
			end;
			return;
		end;
		l__ContextActionService__3:BindActionAtPriority("creative-inventory-toggle", function(p4, p5, p6)
			if p5 == Enum.UserInputState.Begin then
				p2:toggleCreativeInventory();
			end;
		end, false, Enum.ContextActionPriority.Low.Value, Enum.KeyCode.C);
		local v9, v10, v11 = ipairs((l__ComponentUtil__4:getAllComponents(l__default__5)));
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			v10:displayUIDBillboard();		
		end;
	end);
end;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__CreativeInventory__8 = v1.import(script, script.Parent, "creative", "ui", "creative-inventory").CreativeInventory;
local l__UILayers__9 = v2.UILayers;
function v4.toggleCreativeInventory(p7)
	if p7:getLocalPlayerGamemode() ~= l__GamemodeType__2.CREATIVE then
		return nil;
	end;
	local v12 = l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
	if v12:isAppOpen("CreativeInventory") then
		v12:closeApp("CreativeInventory");
		return;
	end;
	v12:closeApp(l__BedwarsAppIds__7.INVENTORY);
	v12:openApp({
		appId = "CreativeInventory", 
		app = l__CreativeInventory__8, 
		layer = l__UILayers__9.MAIN
	}, {
		AppId = "CreativeInventory"
	});
end;
function v4.requestCreativeItem(p8, p9)
	if p8.currGamemode ~= l__GamemodeType__2.CREATIVE then
		return false;
	end;
	return p8.gamemodeRemotes:Get("RequestCreativeItem"):CallServer(p9);
end;
function v4.getLocalPlayerGamemode(p10)
	return p10.currGamemode;
end;
function v4.isLocalPlayerInCreativeMode(p11)
	return p11.currGamemode == l__GamemodeType__2.CREATIVE;
end;
function v4.isLocalPlayerInPVPMode(p12)
	return p12.currGamemode == l__GamemodeType__2.PVP;
end;
local v13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
