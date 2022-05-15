
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__LockerTab__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local l__EmoteMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__KillEffectMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local l__TitleMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local l__LobbyGadgetMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local l__getLobbyGadgetImage__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ScaleComponent__9 = v2.ScaleComponent;
local l__WidgetComponent__10 = v2.WidgetComponent;
local l__LockerShowcase__11 = v1.import(script, script.Parent, "locker-showcase").LockerShowcase;
local l__DividerComponent__12 = v2.DividerComponent;
local l__LockerTabList__13 = v1.import(script, script.Parent, "locker-tab-list").LockerTabList;
local l__LockerItemsGrid__14 = v1.import(script, script.Parent, "locker-items-grid").LockerItemsGrid;
local l__SlideIn__15 = v2.SlideIn;
return {
	LockerCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5, v6 = l__useState__3(l__LockerTab__1.EMOTES);
		local v7, v8 = l__useState__3(nil);
		local v9, v10 = l__useState__3(nil);
		local function u16()
			if v5 == l__LockerTab__1.EMOTES then
				local l__sprays__11 = p1.store.Locker.sprays;
				local function v12(p3)
					local v13 = l__EmoteMeta__2[p3];
					local v14 = {};
					local v15 = {
						name = v13.name
					};
					local v16 = v13.image;
					if v16 == nil then
						v16 = "";
					end;
					v15.imageId = v16;
					v14.image = v15;
					v14.itemEnum = p3;
					v14.type = l__LockerTab__1.EMOTES;
					return v14;
				end;
				local v17 = table.create(#l__sprays__11);
				for v18, v19 in ipairs(l__sprays__11) do
					v17[v18] = v12(v19, v18 - 1, l__sprays__11);
				end;
				return v17;
			end;
			if v5 == l__LockerTab__1.KILL_EFFECTS then
				local l__killEffects__20 = p1.store.Locker.killEffects;
				local function v21(p4)
					local v22 = l__KillEffectMeta__3[p4];
					local v23 = {};
					local v24 = {
						name = v22.name
					};
					local v25 = v22.image;
					if v25 == nil then
						v25 = "";
					end;
					v24.imageId = v25;
					v23.image = v24;
					v23.itemEnum = p4;
					v23.type = l__LockerTab__1.KILL_EFFECTS;
					return v23;
				end;
				local v26 = table.create(#l__killEffects__20);
				for v27, v28 in ipairs(l__killEffects__20) do
					v26[v27] = v21(v28, v27 - 1, l__killEffects__20);
				end;
				return v26;
			end;
			if v5 == l__LockerTab__1.TITLES then
				local l__titles__29 = p1.store.Locker.titles;
				local function v30(p5)
					local v31 = l__TitleMeta__4[p5];
					local v32 = v31.text;
					if v31.name == "None" then
						v32 = "None";
					end;
					local v33 = {
						image = {
							name = v32, 
							imageId = ""
						}
					};
					local v34 = {};
					for v35, v36 in pairs(v31) do
						v34[v35] = v36;
					end;
					v33.title = v34;
					v33.itemEnum = p5;
					v33.type = l__LockerTab__1.TITLES;
					return v33;
				end;
				local v37 = table.create(#l__titles__29);
				for v38, v39 in ipairs(l__titles__29) do
					v37[v38] = v30(v39, v38 - 1, l__titles__29);
				end;
				return v37;
			end;
			local l__lobbyGadgets__40 = p1.store.Locker.lobbyGadgets;
			local function v41(p6)
				local v42 = l__LobbyGadgetMeta__5[p6];
				local v43 = nil;
				if v42.items then
					local v44 = l__getLobbyGadgetImage__6(p6);
					if v44 == nil then
						v44 = "";
					end;
					v43 = v44;
				end;
				local v45 = {};
				local v46 = {
					name = v42.name
				};
				local v47 = v42.image;
				if v47 == nil then
					v47 = v43;
					if v47 == nil then
						v47 = "";
					end;
				end;
				v46.imageId = v47;
				v45.image = v46;
				v45.itemEnum = p6;
				v45.type = l__LockerTab__1.LOBBY_GADGETS;
				return v45;
			end;
			local v48 = table.create(#l__lobbyGadgets__40);
			for v49, v50 in ipairs(l__lobbyGadgets__40) do
				v48[v49] = v41(v50, v49 - 1, l__lobbyGadgets__40);
			end;
			return v48;
		end;
		local function u17()
			if v5 == l__LockerTab__1.EMOTES then
				local v51 = l__EmoteMeta__2[p1.store.Locker.selectedSpray];
				local v52 = {};
				local v53 = {
					name = v51.name
				};
				local v54 = v51.image;
				if v54 == nil then
					v54 = "";
				end;
				v53.imageId = v54;
				v52.image = v53;
				v52.itemEnum = p1.store.Locker.selectedSpray;
				v52.type = l__LockerTab__1.EMOTES;
				return v52;
			end;
			if v5 == l__LockerTab__1.KILL_EFFECTS then
				local v55 = l__KillEffectMeta__3[p1.store.Locker.selectedKillEffect];
				local v56 = {};
				local v57 = {
					name = v55.name
				};
				local v58 = v55.image;
				if v58 == nil then
					v58 = "";
				end;
				v57.imageId = v58;
				v56.image = v57;
				v56.itemEnum = p1.store.Locker.selectedKillEffect;
				v56.type = l__LockerTab__1.KILL_EFFECTS;
				return v56;
			end;
			if v5 ~= l__LockerTab__1.TITLES then
				local v59 = {};
				local v60 = {
					name = l__LobbyGadgetMeta__5[p1.store.Locker.selectedLobbyGadget].name
				};
				local v61 = l__getLobbyGadgetImage__6(p1.store.Locker.selectedLobbyGadget);
				if v61 == nil then
					v61 = "";
				end;
				v60.imageId = v61;
				v59.image = v60;
				v59.itemEnum = p1.store.Locker.selectedLobbyGadget;
				v59.type = l__LockerTab__1.LOBBY_GADGETS;
				return v59;
			end;
			local v62 = l__TitleMeta__4[p1.store.Locker.selectedTitle];
			local v63 = {};
			local v64 = {};
			local v65 = v62.name;
			if v65 == nil then
				v65 = v62.text;
			end;
			v64.name = v65;
			v64.imageId = "";
			v63.image = v64;
			local v66 = {};
			for v67, v68 in pairs(v62) do
				v66[v67] = v68;
			end;
			v63.title = v66;
			v63.itemEnum = p1.store.Locker.selectedTitle;
			v63.type = l__LockerTab__1.TITLES;
			return v63;
		end;
		l__useEffect__4(function()
			v8(u16());
			v10(u17());
		end, { v5 });
		l__useEffect__4(function()
			v10(u17());
		end, { p1.store.Locker });
		local v69 = {};
		local v70 = { u8.createElement(l__ScaleComponent__9, {
				MaximumSize = Vector2.new(1008, 660), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v71 = v7 and (v9 and u8.createElement(l__WidgetComponent__10, {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			Title = "Locker", 
			OnClose = function()
				l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
			end
		}, {
			RightFrame = u8.createElement("Frame", {
				Size = UDim2.new(0.75, -40, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.Y, 
				BackgroundTransparency = 1, 
				LayoutOrder = 3
			}, { u8.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 16)
				}), u8.createElement(l__LockerTabList__13, {
					Tab = v5, 
					ChangeTab = v6, 
					MinSize = 28, 
					MaxSize = 28
				}), u8.createElement(l__LockerItemsGrid__14, {
					Tab = v5, 
					store = p1.store, 
					MinSize = Vector2.new(0, 400), 
					MaxSize = Vector2.new(math.huge, 400), 
					Elements = v7, 
					EquippedElement = v9
				}) }),
			u8.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}), u8.createElement(l__LockerShowcase__11, {
				Size = UDim2.new(0.25, 0, 1, 0), 
				Element = v9, 
				Tab = v5
			}), (u8.createElement(l__DividerComponent__12, {
				LayoutOrder = 2, 
				Direction = "Y"
			}))
		}));
		if v71 then
			v70[#v70 + 1] = v71;
		end;
		v69[#v69 + 1] = u8.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(840, 550), 
			BackgroundTransparency = 1
		}, v70);
		return u8.createElement(l__SlideIn__15, {}, v69);
	end)
};

