-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "GamemodeController";
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
local l__GamemodeType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gamemode", "gamemode-type").GamemodeType;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GamemodeController";
	p1.gamemodeRemotes = l__default__2.Client:GetNamespace("Gamemode");
	p1.currGamemode = l__GamemodeType__3.PVP;
end;
local l__ContextActionService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContextActionService;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	p2.gamemodeRemotes:OnEvent("GamemodeUpdate", function(p3)
		p2.currGamemode = p3.gamemode;
		if p3.gamemode ~= l__GamemodeType__3.CREATIVE then
			l__ContextActionService__4:UnbindAction("creative-inventory-toggle");
			return;
		end;
		l__ContextActionService__4:BindActionAtPriority("creative-inventory-toggle", function(p4, p5, p6)
			if p5 == Enum.UserInputState.Begin then
				p2:toggleCreativeInventory();
			end;
		end, false, Enum.ContextActionPriority.Low.Value, Enum.KeyCode.C);
	end);
end;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__CreativeInventory__7 = v1.import(script, script.Parent, "creative", "ui", "creative-inventory").CreativeInventory;
local l__UILayers__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UILayers;
function v3.toggleCreativeInventory(p7)
	if p7:getLocalPlayerGamemode() ~= l__GamemodeType__3.CREATIVE then
		return nil;
	end;
	local v5 = l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
	if v5:isAppOpen("CreativeInventory") then
		v5:closeApp("CreativeInventory");
		return;
	end;
	v5:closeApp(l__BedwarsAppIds__6.INVENTORY);
	v5:openApp({
		appId = "CreativeInventory", 
		app = l__CreativeInventory__7, 
		layer = l__UILayers__8.MAIN
	}, {
		AppId = "CreativeInventory"
	});
end;
function v3.requestCreativeItem(p8, p9)
	if p8.currGamemode ~= l__GamemodeType__3.CREATIVE then
		return false;
	end;
	return p8.gamemodeRemotes:Get("RequestCreativeItem"):CallServer(p9);
end;
function v3.getLocalPlayerGamemode(p10)
	return p10.currGamemode;
end;
function v3.isInCreativeMode(p11)
	return p11.currGamemode == l__GamemodeType__3.CREATIVE;
end;
function v3.isInPvpMode(p12)
	return p12.currGamemode == l__GamemodeType__3.PVP;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
