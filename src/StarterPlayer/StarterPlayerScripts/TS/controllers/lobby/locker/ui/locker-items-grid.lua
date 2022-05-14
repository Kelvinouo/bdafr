-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__LobbyTitleDefaults__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").LobbyTitleDefaults;
local l__LockerTab__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__EmoteMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EmoteShowcase__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local l__GridElement__9 = v2.GridElement;
local l__ElementGrid__10 = v2.ElementGrid;
local l__ColorUtil__11 = v2.ColorUtil;
return {
	LockerItemsGrid = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u7)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5 = p2.useMemo(function()
			local l__Elements__6 = p1.Elements;
			local function v7(p3)
				local v8 = {
					id = p3.itemEnum, 
					imageId = p3.image.imageId, 
					alt = p3.image.name
				};
				local v9 = p3.title;
				if v9 then
					local v10 = p3.title;
					if v10 ~= nil then
						v10 = v10.name;
					end;
					v9 = v10 ~= "None";
				end;
				if v9 then
					local v11 = p3.title;
					if v11 ~= nil then
						v11 = v11.font;
					end;
					local v12 = v11;
					if v12 == nil then
						v12 = l__LobbyTitleDefaults__1.font;
					end;
					local v13 = v12;
				else
					v13 = nil;
				end;
				v8.altFont = v13;
				local v14 = p3.title;
				if v14 then
					local v15 = p3.title;
					if v15 ~= nil then
						v15 = v15.name;
					end;
					v14 = v15 ~= "None";
				end;
				if v14 then
					local v16 = p3.title;
					if v16 ~= nil then
						v16 = v16.color;
					end;
					local v17 = v16;
					if v17 == nil then
						v17 = l__LobbyTitleDefaults__1.color;
					end;
					local v18 = v17;
				else
					v18 = nil;
				end;
				v8.altColor = v18;
				return v8;
			end;
			local v19 = table.create(#l__Elements__6);
			for v20, v21 in ipairs(l__Elements__6) do
				v19[v20] = v7(v21, v20 - 1, l__Elements__6);
			end;
			local v22 = p1.Elements;
			if v22 ~= nil then
				local function v23(p4)
					return p4.itemEnum == p1.EquippedElement.itemEnum;
				end;
				local v24 = -1;
				for v25, v26 in ipairs(v22) do
					if v23(v26, v25 - 1, v22) == true then
						v24 = v25 - 1;
						break;
					end;
				end;
				v22 = v24;
			end;
			local function u12(p5)
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
			local function v27(p6, p7)
				local v28 = false;
				if p1.Tab == l__LockerTab__2.EMOTES then
					v28 = l__EmoteMeta__6[p6.id].animation ~= nil;
				end;
				local v29 = {
					Index = p7, 
					CurrentIndex = v22, 
					Image = p6.imageId, 
					TextElement = {
						Text = p6.alt, 
						TextColor3 = p6.altColor, 
						Font = p6.altFont
					}
				};
				function v29.OnClick()
					u12(p6.id);
				end;
				local v30 = {};
				local v31 = v28 and u7.createElement(l__EmoteShowcase__8, {
					Emote = p6.id
				});
				if v31 then
					v30[#v30 + 1] = v31;
				end;
				return u7.createElement(l__GridElement__9, v29, v30);
			end;
			local v32 = table.create(#v19);
			for v33, v34 in ipairs(v19) do
				v32[v33] = v27(v34, v33 - 1, v19);
			end;
			local v35 = {
				Size = UDim2.new(1, 0, 1, 0), 
				Position = UDim2.fromOffset(0, 30), 
				ScrollingDirection = "Y", 
				ElementSize = UDim2.new(0.187, 0, 0, 90), 
				DefaultElement = v22
			};
			local v36 = {};
			local v37 = #v36;
			for v38, v39 in ipairs(v32) do
				v36[v37 + v38] = v39;
			end;
			return u7.createFragment({
				[p1.Tab .. "List"] = u7.createElement(l__ElementGrid__10, v35, v36)
			});
		end, { p1.Elements });
		local v40 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1
		};
		local v41 = { u7.createElement("UISizeConstraint", {
				MinSize = p1.MinSize, 
				MaxSize = p1.MaxSize
			}) };
		local v42 = #v41;
		local v43 = {
			Size = UDim2.new(1, 0, 0, 16), 
			BackgroundTransparency = 1
		};
		local v44 = p1.EquippedElement.image;
		if v44 ~= nil then
			v44 = v44.name;
		end;
		v43.Text = "<b>Equipped:</b> (" .. v44 .. ")";
		v43.TextXAlignment = Enum.TextXAlignment.Left;
		v43.TextColor3 = l__ColorUtil__11.WHITE;
		v43.RichText = true;
		v43.Font = Enum.Font.Roboto;
		v43.TextSize = 16;
		v41[v42 + 1] = u7.createElement("TextLabel", v43);
		v41[v42 + 2] = v5;
		return u7.createFragment({
			Items = u7.createElement("Frame", v40, v41)
		});
	end)
};
