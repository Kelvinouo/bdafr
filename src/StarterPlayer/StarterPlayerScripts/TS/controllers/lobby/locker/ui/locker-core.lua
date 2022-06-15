-- Script Hash: eb0de8ab3ac4487fb3684c2e1eba901b7894fa62ba1c3141b4a1bb229af6844ea8af4630303fece6126bc5837bb334ef
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
				for v19, v20 in ipairs(l__sprays__11) do
					local v21 = v12(v20, v19 - 1, l__sprays__11);
					if v21 ~= nil then
						v18 = v18 + 1;
						v17[v18] = v21;
					end;
				end;
				return v17;
			end;
			if v5 == l__LockerTab__1.KILL_EFFECTS then
				local l__killEffects__22 = p1.store.Locker.killEffects;
				local function v23(p4)
					local v24 = l__KillEffectMeta__3[p4];
					local v25 = {};
					local v26 = {
						name = v24.name
					};
					local v27 = v24.image;
					if v27 == nil then
						v27 = "";
					end;
					v26.imageId = v27;
					v25.image = v26;
					v25.itemEnum = p4;
					v25.type = l__LockerTab__1.KILL_EFFECTS;
					return v25;
				end;
				local v28 = table.create(#l__killEffects__22);
				for v29, v30 in ipairs(l__killEffects__22) do
					v28[v29] = v23(v30, v29 - 1, l__killEffects__22);
				end;
				return v28;
			end;
			if v5 == l__LockerTab__1.TITLES then
				local l__titles__31 = p1.store.Locker.titles;
				local function v32(p5)
					local v33 = l__TitleMeta__4[p5];
					local v34 = v33.text;
					if v33.name == "None" then
						v34 = "None";
					end;
					local v35 = {
						image = {
							name = v34, 
							imageId = ""
						}
					};
					local v36 = {};
					for v37, v38 in pairs(v33) do
						v36[v37] = v38;
					end;
					v35.title = v36;
					v35.itemEnum = p5;
					v35.type = l__LockerTab__1.TITLES;
					return v35;
				end;
				local v39 = table.create(#l__titles__31);
				for v40, v41 in ipairs(l__titles__31) do
					v39[v40] = v32(v41, v40 - 1, l__titles__31);
				end;
				return v39;
			end;
			local l__lobbyGadgets__42 = p1.store.Locker.lobbyGadgets;
			local function v43(p6)
				local v44 = l__LobbyGadgetMeta__5[p6];
				local v45 = nil;
				if v44.items then
					local v46 = l__getLobbyGadgetImage__6(p6);
					if v46 == nil then
						v46 = "";
					end;
					v45 = v46;
				end;
				local v47 = {};
				local v48 = {
					name = v44.name
				};
				local v49 = v44.image;
				if v49 == nil then
					v49 = v45;
					if v49 == nil then
						v49 = "";
					end;
				end;
				v48.imageId = v49;
				v47.image = v48;
				v47.itemEnum = p6;
				v47.type = l__LockerTab__1.LOBBY_GADGETS;
				return v47;
			end;
			local v50 = table.create(#l__lobbyGadgets__42);
			for v51, v52 in ipairs(l__lobbyGadgets__42) do
				v50[v51] = v43(v52, v51 - 1, l__lobbyGadgets__42);
			end;
			return v50;
		end;
		local function u17()
			if v5 == l__LockerTab__1.EMOTES then
				local v53 = l__EmoteMeta__2[p1.store.Locker.selectedSpray];
				local v54 = {};
				local v55 = {
					name = v53.name
				};
				local v56 = v53.image;
				if v56 == nil then
					v56 = "";
				end;
				v55.imageId = v56;
				v54.image = v55;
				v54.itemEnum = p1.store.Locker.selectedSpray;
				v54.type = l__LockerTab__1.EMOTES;
				return v54;
			end;
			if v5 == l__LockerTab__1.KILL_EFFECTS then
				local v57 = l__KillEffectMeta__3[p1.store.Locker.selectedKillEffect];
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
				v58.itemEnum = p1.store.Locker.selectedKillEffect;
				v58.type = l__LockerTab__1.KILL_EFFECTS;
				return v58;
			end;
			if v5 ~= l__LockerTab__1.TITLES then
				local v61 = {};
				local v62 = {
					name = l__LobbyGadgetMeta__5[p1.store.Locker.selectedLobbyGadget].name
				};
				local v63 = l__getLobbyGadgetImage__6(p1.store.Locker.selectedLobbyGadget);
				if v63 == nil then
					v63 = "";
				end;
				v62.imageId = v63;
				v61.image = v62;
				v61.itemEnum = p1.store.Locker.selectedLobbyGadget;
				v61.type = l__LockerTab__1.LOBBY_GADGETS;
				return v61;
			end;
			local v64 = l__TitleMeta__4[p1.store.Locker.selectedTitle];
			local v65 = {};
			local v66 = {};
			local v67 = v64.name;
			if v67 == nil then
				v67 = v64.text;
			end;
			v66.name = v67;
			v66.imageId = "";
			v65.image = v66;
			local v68 = {};
			for v69, v70 in pairs(v64) do
				v68[v69] = v70;
			end;
			v65.title = v68;
			v65.itemEnum = p1.store.Locker.selectedTitle;
			v65.type = l__LockerTab__1.TITLES;
			return v65;
		end;
		l__useEffect__4(function()
			v8(u16());
			v10(u17());
		end, { v5 });
		l__useEffect__4(function()
			v10(u17());
		end, { p1.store.Locker });
		local v71 = {};
		local v72 = { u8.createElement(l__ScaleComponent__9, {
				MaximumSize = Vector2.new(1008, 660), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v73 = v7 and (v9 and u8.createElement(l__WidgetComponent__10, {
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
		if v73 then
			v72[#v72 + 1] = v73;
		end;
		v71[#v71 + 1] = u8.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(840, 550), 
			BackgroundTransparency = 1
		}, v72);
		return u8.createElement(l__SlideIn__15, {}, v71);
	end)
};
