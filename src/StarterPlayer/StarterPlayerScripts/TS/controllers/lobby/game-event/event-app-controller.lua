-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, script.Parent.Parent.Parent.Parent, "components", "billboard-component", "attributes");
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "EventAppController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "EventAppController";
	p1.eventRemotes = l__default__1.Client:GetNamespace("Event");
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EventMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local l__CollectionService__4 = v2.CollectionService;
local l__SetAttribute__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").SetAttribute;
local l__BillboardTitleAttr__6 = v3.BillboardTitleAttr;
local l__BillboardStudsOffsetAttr__7 = v3.BillboardStudsOffsetAttr;
local l__BillboardMaxSizeAttr__8 = v3.BillboardMaxSizeAttr;
local l__ClientStore__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	local v7 = u2.entries(l__EventMeta__3);
	local function v8(p3)
		local v9 = p3[2];
		if not v9.active then
			return nil;
		end;
		local v10 = l__CollectionService__4:GetTagged(v9.collectionTag);
		local l__name__10 = v9.name;
		local u11 = p3[1];
		local function v11(p4)
			l__SetAttribute__5(p4, l__BillboardTitleAttr__6, l__name__10);
			l__SetAttribute__5(p4, l__BillboardStudsOffsetAttr__7, Vector3.new(0, 7, 0));
			l__SetAttribute__5(p4, l__BillboardMaxSizeAttr__8, Vector2.new(820, 170));
			l__CollectionService__4:AddTag(p4, "Billboard");
			p2:mountEventApp(p4, u11);
		end;
		local v12, v13, v14 = ipairs(v10);
		while true do
			v12(v13, v14);
			if not v12 then
				break;
			end;
			v14 = v12;
			v11(v13, v12 - 1, v10);		
		end;
		local l__shops__15 = v9.shops;
		local function v16(p5)
			local l__collectionTag__17 = p5.collectionTag;
			if l__collectionTag__17 ~= "" and l__collectionTag__17 then
				local v18, v19, v20 = ipairs((l__CollectionService__4:GetTagged(p5.collectionTag)));
				while true do
					v18(v19, v20);
					if not v18 then
						break;
					end;
					v20 = v18;
					p2:mountEventShop(v19, u11);				
				end;
			end;
		end;
		local v21, v22, v23 = ipairs(l__shops__15);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			v16(v22, v21 - 1, l__shops__15);		
		end;
	end;
	local v24, v25, v26 = ipairs(v7);
	while true do
		v24(v25, v26);
		if not v24 then
			break;
		end;
		v26 = v24;
		v8(v25, v24 - 1, v7);	
	end;
	p2.eventRemotes:Get("EventDataUpdate"):Connect(function(p6)
		l__ClientStore__9:dispatch({
			type = "SetEventDataAll", 
			eventData = p6
		});
	end);
end;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__14 = v2.Players;
local l__SoundManager__15 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__17 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__18 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function v5.mountEventApp(p7, p8, p9)
	u12("ProximityPrompt", {
		RequiresLineOfSight = false, 
		MaxActivationDistance = 14, 
		HoldDuration = 0, 
		ActionText = l__EventMeta__3[p9].name, 
		ObjectText = "Open Event", 
		KeyboardKeyCode = l__Theme__13.promptKeyboardKey, 
		Parent = p8
	}).Triggered:Connect(function(p10)
		if p10 == l__Players__14.LocalPlayer then
			l__SoundManager__15:playSound(l__GameSound__16.UI_OPEN);
			l__Flamework__17.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.EVENT_APP, {
				event = p9
			});
		end;
	end);
end;
function v5.mountEventShop(p11, p12, p13)
	u12("ProximityPrompt", {
		RequiresLineOfSight = false, 
		MaxActivationDistance = 11, 
		HoldDuration = 0, 
		ActionText = l__EventMeta__3[p13].name .. "Shop", 
		ObjectText = "Open Shop", 
		KeyboardKeyCode = l__Theme__13.promptKeyboardKey, 
		Parent = p12
	}).Triggered:Connect(function(p14)
		if p14 == l__Players__14.LocalPlayer then
			l__SoundManager__15:playSound(l__GameSound__16.UI_OPEN);
			l__Flamework__17.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.EVENT_APP, {
				event = p13, 
				tab = "shop"
			});
		end;
	end);
end;
local v27 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
