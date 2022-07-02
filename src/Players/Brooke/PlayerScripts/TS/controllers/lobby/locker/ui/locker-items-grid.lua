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
				local v26 = -1;
				for v27, v28 in ipairs(v25) do
					if v28.itemEnum == p1.EquippedElement.itemEnum == true then
						v26 = v27 - 1;
						break;
					end;
				end;
				v25 = v26;
			end;
			local function u14(p4)
				if p1.Tab == l__LockerTab__2.EMOTES then
					if l__DeviceUtil__3.isHoarceKat() then
						l__ClientStore__4:dispatch({
							type = "LockerSetSpray", 
							spray = p4
						});
						return;
					else
						l__KnitClient__5.Controllers.LockerController:setSpray(p4);
						return;
					end;
				end;
				if p1.Tab == l__LockerTab__2.KILL_EFFECTS then
					if l__DeviceUtil__3.isHoarceKat() then
						l__ClientStore__4:dispatch({
							type = "LockerSetKillEffect", 
							killEffect = p4
						});
						return;
					else
						l__KnitClient__5.Controllers.LockerController:setKillEffect(p4);
						return;
					end;
				end;
				if p1.Tab == l__LockerTab__2.TITLES then
					if l__DeviceUtil__3.isHoarceKat() then
						l__ClientStore__4:dispatch({
							type = "LockerSetTitle", 
							title = p4
						});
						return;
					else
						l__KnitClient__5.Controllers.LockerController:setTitle(p4);
						return;
					end;
				end;
				if l__DeviceUtil__3.isHoarceKat() then
					l__ClientStore__4:dispatch({
						type = "LockerSetLobbyGadget", 
						lobbyGadget = p4
					});
					return;
				end;
				l__KnitClient__5.Controllers.LockerController:setLobbyGadget(p4);
			end;
			local function v29(p5, p6)
				local v30 = false;
				if p1.Tab == l__LockerTab__2.EMOTES then
					v30 = l__EmoteMeta__6[p5.id].animation ~= nil;
				end;
				local v31 = {
					Index = p6, 
					CurrentIndex = v25, 
					Image = p5.imageId, 
					TextElement = {
						Text = p5.alt, 
						TextColor3 = p5.altColor, 
						Font = p5.altFont
					}
				};
				function v31.OnClick()
					u14(p5.id);
				end;
				local v32 = {};
				local v33 = v30 and u7.createElement(l__EmoteShowcase__8, {
					Emote = p5.id
				});
				if v33 then
					v32[#v32 + 1] = v33;
				end;
				return u7.createElement(l__GridElement__9, v31, v32);
			end;
			local v34 = table.create(#v22);
			for v35, v36 in ipairs(v22) do
				v34[v35] = v29(v36, v35 - 1, v22);
			end;
			local v37 = {
				ElementSize = UDim2.new(0.187, 0, 0, 90), 
				DefaultElement = v25, 
				ScrollingFrameProps = {
					Size = UDim2.new(1, 0, 1, 0), 
					Position = UDim2.fromOffset(0, 45)
				}
			};
			local v38 = {};
			local v39 = #v38;
			for v40, v41 in ipairs(v34) do
				v38[v39 + v40] = v41;
			end;
			return u7.createFragment({
				[p1.Tab .. "List"] = u7.createElement(l__ElementGrid__10, v37, v38)
			});
		end, { v5 });
		local v42 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1
		};
		local v43 = { u7.createElement("UISizeConstraint", {
				MinSize = p1.MinSize, 
				MaxSize = p1.MaxSize
			}) };
		local v44 = #v43;
		local v45 = {
			Size = UDim2.new(1, 0, 0, 32)
		};
		local v46 = { u7.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.05, 0)
			}) };
		local v47 = #v46;
		local v48 = {
			Size = UDim2.new(0.4, 0, 0, 16), 
			BackgroundTransparency = 1
		};
		local v49 = p1.EquippedElement.image;
		if v49 ~= nil then
			v49 = v49.name;
		end;
		v48.Text = "<b>Equipped:</b> (" .. v49 .. ")";
		v48.TextXAlignment = Enum.TextXAlignment.Left;
		v48.TextColor3 = l__ColorUtil__11.WHITE;
		v48.RichText = true;
		v48.Font = Enum.Font.Roboto;
		v48.TextSize = 16;
		v46[v47 + 1] = u7.createElement("TextLabel", v48);
		local v50 = {
			Size = UDim2.new(0.55, 0, 1, 0)
		};
		local l__Elements__51 = p1.Elements;
		v3 = {};
		for v52 = 1, #l__Elements__51 do
			local l__name__53 = l__Elements__51[v52].image.name;
			if l__name__53 ~= "" and l__name__53 then
				table.insert(v3, l__name__53);
			end;
			v3 = v3;
		end;
		v50.Items = local v54;
		v50.InputText = v7;
		local function u15(p7, p8)
			if p7 == "" then
				return p1.Elements;
			end;
			local v55 = {};
			local v56 = 0;
			local v57, v58, v59 = ipairs(p1.Elements);
			while true do
				local v60, v61 = v57(v58, v59);
				if not v60 then
					break;
				end;
				if table.find(p8, v61.image.name) ~= nil == true then
					v56 = v56 + 1;
					v55[v56] = v61;
				end;			
			end;
			return v55;
		end;
		function v50.OnTextChange(p9, p10)
			v6((u15(p9, p10)));
			v8(p9);
		end;
		v50.PlaceHolderText = "Search " .. p1.Tab;
		v50.MaxCharLength = 30;
		v50.LayoutOrder = 2;
		v46[v47 + 2] = u7.createElement(l__AutoCompleteSearchbar__12, v50);
		v43[v44 + 1] = u7.createElement(l__Empty__13, v45, v46);
		v43[v44 + 2] = v9;
		return u7.createFragment({
			Items = u7.createElement("Frame", v42, v43)
		});
	end)
};
