-- Script Hash: e0625ab5b207453a41dfbe2c08e97b8df65ab962db3b7b5756ed44cf759cec8925950b0994afc3423a0b2da29de022f9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__LobbyTitleDefaults__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").LobbyTitleDefaults;
local l__LockerTab__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EmoteShowcase__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local l__GridElement__9 = v2.GridElement;
local l__ElementGrid__10 = v2.ElementGrid;
local l__ColorUtil__11 = v2.ColorUtil;
local l__AutoCompleteSearchbar__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local l__Empty__13 = v2.Empty;
return {
	LockerItemsGrid = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u7)(function(p1, p2)
		local v3 = nil;
		local l__useState__4 = p2.useState;
		local v5, v6 = l__useState__4(p1.Elements);
		local v7, v8 = l__useState__4("");
		p2.useEffect(function()
			v6(p1.Elements);
			v8("");
		end, { p1.Elements });
		local v9 = p2.useMemo(function()
			local function v10(p3)
				local v11 = {
					id = p3.itemEnum, 
					imageId = p3.image.imageId, 
					alt = p3.image.name
				};
				local v12 = p3.title;
				if v12 then
					local v13 = p3.title;
					if v13 ~= nil then
						v13 = v13.name;
					end;
					v12 = v13 ~= "None";
				end;
				if v12 then
					local v14 = p3.title;
					if v14 ~= nil then
						v14 = v14.font;
					end;
					local v15 = v14;
					if v15 == nil then
						v15 = l__LobbyTitleDefaults__1.font;
					end;
					local v16 = v15;
				else
					v16 = nil;
				end;
				v11.altFont = v16;
				local v17 = p3.title;
				if v17 then
					local v18 = p3.title;
					if v18 ~= nil then
						v18 = v18.name;
					end;
					v17 = v18 ~= "None";
				end;
				if v17 then
					local v19 = p3.title;
					if v19 ~= nil then
						v19 = v19.color;
					end;
					local v20 = v19;
					if v20 == nil then
						v20 = l__LobbyTitleDefaults__1.color;
					end;
					local v21 = v20;
				else
					v21 = nil;
				end;
				v11.altColor = v21;
				return v11;
			end;
			local v22 = table.create(#v5);
			for v23, v24 in ipairs(v5) do
				v22[v23] = v10(v24, v23 - 1, v5);
			end;
			local v25 = p1.Elements;
			if v25 ~= nil then
				local function v26(p4)
					return p4.itemEnum == p1.EquippedElement.itemEnum;
				end;
				local v27 = -1;
				for v28, v29 in ipairs(v25) do
					if v26(v29, v28 - 1, v25) == true then
						v27 = v28 - 1;
						break;
					end;
				end;
				v25 = v27;
			end;
			local function u14(p5)
				if p1.Tab == l__LockerTab__2.EMOTES then
					if l__DeviceUtil__3.isHoarceKat() then
						l__ClientStore__4:dispatch({
							type = "LockerSetSpray", 
							spray = p5
						});
						return;
					else
						l__KnitClient__5.Controllers.LockerController:setSpray(p5);
						return;
					end;
				end;
				if p1.Tab == l__LockerTab__2.KILL_EFFECTS then
					if l__DeviceUtil__3.isHoarceKat() then
						l__ClientStore__4:dispatch({
							type = "LockerSetKillEffect", 
							killEffect = p5
						});
						return;
					else
						l__KnitClient__5.Controllers.LockerController:setKillEffect(p5);
						return;
					end;
				end;
				if p1.Tab == l__LockerTab__2.TITLES then
					if l__DeviceUtil__3.isHoarceKat() then
						l__ClientStore__4:dispatch({
							type = "LockerSetTitle", 
							title = p5
						});
						return;
					else
						l__KnitClient__5.Controllers.LockerController:setTitle(p5);
						return;
					end;
				end;
				if l__DeviceUtil__3.isHoarceKat() then
					l__ClientStore__4:dispatch({
						type = "LockerSetLobbyGadget", 
						lobbyGadget = p5
					});
					return;
				end;
				l__KnitClient__5.Controllers.LockerController:setLobbyGadget(p5);
			end;
			local function v30(p6, p7)
				local v31 = false;
				if p1.Tab == l__LockerTab__2.EMOTES then
					v31 = l__EmoteMeta__6[p6.id].animation ~= nil;
				end;
				local v32 = {
					Index = p7, 
					CurrentIndex = v25, 
					Image = p6.imageId, 
					TextElement = {
						Text = p6.alt, 
						TextColor3 = p6.altColor, 
						Font = p6.altFont
					}
				};
				function v32.OnClick()
					u14(p6.id);
				end;
				local v33 = {};
				local v34 = v31 and u7.createElement(l__EmoteShowcase__8, {
					Emote = p6.id
				});
				if v34 then
					v33[#v33 + 1] = v34;
				end;
				return u7.createElement(l__GridElement__9, v32, v33);
			end;
			local v35 = table.create(#v22);
			for v36, v37 in ipairs(v22) do
				v35[v36] = v30(v37, v36 - 1, v22);
			end;
			local v38 = {
				ElementSize = UDim2.new(0.187, 0, 0, 90), 
				DefaultElement = v25, 
				ScrollingFrameProps = {
					Size = UDim2.new(1, 0, 1, 0), 
					Position = UDim2.fromOffset(0, 45)
				}
			};
			local v39 = {};
			local v40 = #v39;
			for v41, v42 in ipairs(v35) do
				v39[v40 + v41] = v42;
			end;
			return u7.createFragment({
				[p1.Tab .. "List"] = u7.createElement(l__ElementGrid__10, v38, v39)
			});
		end, { v5 });
		local v43 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1
		};
		local v44 = { u7.createElement("UISizeConstraint", {
				MinSize = p1.MinSize, 
				MaxSize = p1.MaxSize
			}) };
		local v45 = #v44;
		local v46 = {
			Size = UDim2.new(1, 0, 0, 32)
		};
		local v47 = { u7.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.05, 0)
			}) };
		local v48 = #v47;
		local v49 = {
			Size = UDim2.new(0.4, 0, 0, 16), 
			BackgroundTransparency = 1
		};
		local v50 = p1.EquippedElement.image;
		if v50 ~= nil then
			v50 = v50.name;
		end;
		v49.Text = "<b>Equipped:</b> (" .. v50 .. ")";
		v49.TextXAlignment = Enum.TextXAlignment.Left;
		v49.TextColor3 = l__ColorUtil__11.WHITE;
		v49.RichText = true;
		v49.Font = Enum.Font.Roboto;
		v49.TextSize = 16;
		v47[v48 + 1] = u7.createElement("TextLabel", v49);
		local v51 = {
			Size = UDim2.new(0.55, 0, 1, 0)
		};
		local l__Elements__52 = p1.Elements;
		v3 = {};
		local function v53(p8, p9)
			local l__name__54 = p9.image.name;
			if l__name__54 ~= "" and l__name__54 then
				table.insert(p8, l__name__54);
			end;
			return p8;
		end;
		for v55 = 1, #l__Elements__52 do
			v3 = v53(v3, l__Elements__52[v55], v55 - 1, l__Elements__52);
		end;
		v51.Items = local v56;
		v51.InputText = v7;
		local function u15(p10, p11)
			if p10 == "" then
				return p1.Elements;
			end;
			local l__Elements__57 = p1.Elements;
			local function v58(p12, p13)
				return table.find(p11, p12.image.name) ~= nil;
			end;
			local v59 = {};
			local v60 = 0;
			for v61, v62 in ipairs(l__Elements__57) do
				if v58(v62, v61 - 1, l__Elements__57) == true then
					v60 = v60 + 1;
					v59[v60] = v62;
				end;
			end;
			return v59;
		end;
		function v51.OnTextChange(p14, p15)
			v6(u15(p14, p15));
			v8(p14);
		end;
		v51.PlaceHolderText = "Search " .. p1.Tab;
		v51.MaxCharLength = 30;
		v51.LayoutOrder = 2;
		v47[v48 + 2] = u7.createElement(l__AutoCompleteSearchbar__12, v51);
		v44[v45 + 1] = u7.createElement(l__Empty__13, v46, v47);
		v44[v45 + 2] = v9;
		return u7.createFragment({
			Items = u7.createElement("Frame", v43, v44)
		});
	end)
};
