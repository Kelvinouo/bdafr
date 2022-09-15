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
					if not v13 then
						return nil;
					end;
					if v13.disabled then
						return nil;
					end;
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
				local v17 = {};
				local v18 = 0;
				local v19, v20, v21 = ipairs(l__sprays__11);
				while true do
					v19(v20, v21);
					if not v19 then
						break;
					end;
					v21 = v19;
					local v22 = v12(v20, v19 - 1, l__sprays__11);
					if v22 ~= nil then
						v18 = v18 + 1;
						v17[v18] = v22;
					end;				
				end;
				return v17;
			end;
			if v5 == l__LockerTab__1.KILL_EFFECTS then
				local l__killEffects__23 = p1.store.Locker.killEffects;
				local function v24(p4)
					local v25 = l__KillEffectMeta__3[p4];
					local v26 = {};
					local v27 = {
						name = v25.name
					};
					local v28 = v25.image;
					if v28 == nil then
						v28 = "";
					end;
					v27.imageId = v28;
					v26.image = v27;
					v26.itemEnum = p4;
					v26.type = l__LockerTab__1.KILL_EFFECTS;
					return v26;
				end;
				local v29 = table.create(#l__killEffects__23);
				local v30, v31, v32 = ipairs(l__killEffects__23);
				while true do
					v30(v31, v32);
					if not v30 then
						break;
					end;
					v32 = v30;
					v29[v30] = v24(v31, v30 - 1, l__killEffects__23);				
				end;
				return v29;
			end;
			if v5 == l__LockerTab__1.TITLES then
				local l__titles__33 = p1.store.Locker.titles;
				local function v34(p5)
					local v35 = l__TitleMeta__4[p5];
					local v36 = v35.text;
					if v35.name == "None" then
						v36 = "None";
					end;
					local v37 = {
						image = {
							name = v36, 
							imageId = ""
						}
					};
					local v38 = {};
					for v39, v40 in pairs(v35) do
						v38[v39] = v40;
					end;
					v37.title = v38;
					v37.itemEnum = p5;
					v37.type = l__LockerTab__1.TITLES;
					return v37;
				end;
				local v41 = table.create(#l__titles__33);
				local v42, v43, v44 = ipairs(l__titles__33);
				while true do
					v42(v43, v44);
					if not v42 then
						break;
					end;
					v44 = v42;
					v41[v42] = v34(v43, v42 - 1, l__titles__33);				
				end;
				return v41;
			end;
			local l__lobbyGadgets__45 = p1.store.Locker.lobbyGadgets;
			local function v46(p6)
				local v47 = l__LobbyGadgetMeta__5[p6];
				local v48 = nil;
				if v47.items then
					local v49 = l__getLobbyGadgetImage__6(p6);
					if v49 == nil then
						v49 = "";
					end;
					v48 = v49;
				end;
				local v50 = {};
				local v51 = {
					name = v47.name
				};
				local v52 = v47.image;
				if v52 == nil then
					v52 = v48;
					if v52 == nil then
						v52 = "";
					end;
				end;
				v51.imageId = v52;
				v50.image = v51;
				v50.itemEnum = p6;
				v50.type = l__LockerTab__1.LOBBY_GADGETS;
				return v50;
			end;
			local v53 = table.create(#l__lobbyGadgets__45);
			local v54, v55, v56 = ipairs(l__lobbyGadgets__45);
			while true do
				v54(v55, v56);
				if not v54 then
					break;
				end;
				v56 = v54;
				v53[v54] = v46(v55, v54 - 1, l__lobbyGadgets__45);			
			end;
			return v53;
		end;
		local function u17()
			if v5 == l__LockerTab__1.EMOTES then
				local v57 = l__EmoteMeta__2[p1.store.Locker.selectedSpray];
				local v58 = {};
				local v59 = {
					name = v57.name
				};
				local v60 = v57.image;
				if v60 == nil then
					v60 = "";
				end;
				v59.imageId = v60;
				v58.image = v59;
				v58.itemEnum = p1.store.Locker.selectedSpray;
				v58.type = l__LockerTab__1.EMOTES;
				return v58;
			end;
			if v5 == l__LockerTab__1.KILL_EFFECTS then
				local v61 = l__KillEffectMeta__3[p1.store.Locker.selectedKillEffect];
				local v62 = {};
				local v63 = {
					name = v61.name
				};
				local v64 = v61.image;
				if v64 == nil then
					v64 = "";
				end;
				v63.imageId = v64;
				v62.image = v63;
				v62.itemEnum = p1.store.Locker.selectedKillEffect;
				v62.type = l__LockerTab__1.KILL_EFFECTS;
				return v62;
			end;
			if v5 ~= l__LockerTab__1.TITLES then
				local v65 = {};
				local v66 = {
					name = l__LobbyGadgetMeta__5[p1.store.Locker.selectedLobbyGadget].name
				};
				local v67 = l__getLobbyGadgetImage__6(p1.store.Locker.selectedLobbyGadget);
				if v67 == nil then
					v67 = "";
				end;
				v66.imageId = v67;
				v65.image = v66;
				v65.itemEnum = p1.store.Locker.selectedLobbyGadget;
				v65.type = l__LockerTab__1.LOBBY_GADGETS;
				return v65;
			end;
			local v68 = l__TitleMeta__4[p1.store.Locker.selectedTitle];
			local v69 = {};
			local v70 = {};
			local v71 = v68.name;
			if v71 == nil then
				v71 = v68.text;
			end;
			v70.name = v71;
			v70.imageId = "";
			v69.image = v70;
			local v72 = {};
			for v73, v74 in pairs(v68) do
				v72[v73] = v74;
			end;
			v69.title = v72;
			v69.itemEnum = p1.store.Locker.selectedTitle;
			v69.type = l__LockerTab__1.TITLES;
			return v69;
		end;
		l__useEffect__4(function()
			v8((u16()));
			v10((u17()));
		end, { v5 });
		l__useEffect__4(function()
			v10((u17()));
		end, { p1.store.Locker });
		local v75 = {};
		local v76 = { u8.createElement(l__ScaleComponent__9, {
				MaximumSize = Vector2.new(1008, 660), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v77 = v7 and (v9 and u8.createElement(l__WidgetComponent__10, {
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
		if v77 then
			v76[#v76 + 1] = v77;
		end;
		v75[#v75 + 1] = u8.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(840, 550), 
			BackgroundTransparency = 1
		}, v76);
		return u8.createElement(l__SlideIn__15, {}, v75);
	end)
};
