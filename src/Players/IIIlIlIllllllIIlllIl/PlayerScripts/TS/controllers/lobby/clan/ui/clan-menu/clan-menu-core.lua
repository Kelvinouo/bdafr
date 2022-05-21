-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = {};
local v4 = setmetatable({}, {
	__index = v3
});
v4.INVITES = 1;
v3[1] = "INVITES";
v4.CREATE = 2;
v3[2] = "CREATE";
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ScaleComponent__2 = v2.ScaleComponent;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ColorUtil__5 = v2.ColorUtil;
local l__StringUtil__6 = v2.StringUtil;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Empty__9 = v2.Empty;
local l__DividerComponent__10 = v2.DividerComponent;
local l__ClanInvites__11 = v1.import(script, script.Parent, "invites", "clan-menu-invites").ClanInvites;
local l__ClanCreateTab__12 = v1.import(script, script.Parent, "create", "clan-create-tab").ClanCreateTab;
local l__WidgetComponent__13 = v2.WidgetComponent;
return {
	ClanMenu = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useEffect__5 = p2.useEffect;
		local v6, v7 = p2.useState(v4.INVITES);
		local v8 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(865, 545), 
			BackgroundTransparency = 1
		};
		local v9 = { u1.createElement(l__ScaleComponent__2, {
				MaximumSize = Vector2.new(605.5, 654), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v10 = {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = true, 
			Title = "Clan Menu"
		};
		function v10.OnClose()
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p1.AppId);
		end;
		local v11 = { u1.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 0), 
				HorizontalAlignment = "Center"
			}) };
		local v12 = #v11;
		local v13 = u4.entries(v4);
		local function v14(p3)
			local v15 = p3[1];
			local v16 = v6 == v4[v15];
			local v17 = {
				Size = UDim2.new(0.2, 0, 0, 30), 
				BackgroundColor3 = l__ColorUtil__5.BLACK
			};
			if v16 then
				local v18 = 0.7;
			else
				v18 = 1;
			end;
			v17.BackgroundTransparency = v18;
			v17.Font = "Roboto";
			v17.Text = "<b>" .. l__StringUtil__6.capitalizeFirstLetter(string.lower(v15)) .. "</b>";
			v17.TextColor3 = l__ColorUtil__5.WHITE;
			v17.TextScaled = true;
			v17.RichText = true;
			if v16 then
				local v19 = 0;
			else
				v19 = 0.3;
			end;
			v17.TextTransparency = v19;
			v17.TextXAlignment = "Center";
			v17.TextYAlignment = "Center";
			v17[u1.Event.Activated] = function()
				v7(v4[v15]);
				l__SoundManager__7:playSound(l__GameSound__8.UI_CLICK);
			end;
			v17.LayoutOrder = p3[2];
			return u1.createElement("TextButton", v17, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}), u1.createElement("UIPadding", {
					PaddingTop = UDim.new(0.15, 0), 
					PaddingBottom = UDim.new(0.15, 0), 
					PaddingLeft = UDim.new(0.15, 0), 
					PaddingRight = UDim.new(0.15, 0)
				}), u1.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) });
		end;
		local v20 = table.create(#v13);
		for v21, v22 in ipairs(v13) do
			v20[v21] = v14(v22, v21 - 1, v13);
		end;
		local v23 = {
			Size = UDim2.new(1, 0, 0, 30)
		};
		local v24 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 0), 
				HorizontalAlignment = "Center"
			}) };
		local v25 = #v24;
		for v26, v27 in ipairs(v20) do
			v24[v25 + v26] = v27;
		end;
		v11[v12 + 1] = u1.createElement(l__Empty__9, v23, v24);
		v11[v12 + 2] = u1.createElement(l__DividerComponent__10, {
			LengthScale = 0.7
		});
		local v28 = { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 15), 
				PaddingLeft = UDim.new(0.075, 0), 
				PaddingRight = UDim.new(0.075, 0)
			}) };
		local v29 = false;
		if v6 == v4.INVITES then
			v29 = u1.createElement(l__ClanInvites__11, {
				store = p1.store
			});
		end;
		if v29 then
			v28[#v28 + 1] = v29;
		end;
		local v30 = false;
		if v6 == v4.CREATE then
			v30 = u1.createElement(l__ClanCreateTab__12, {
				store = p1.store
			});
		end;
		if v30 then
			v28[#v28 + 1] = v30;
		end;
		v11[v12 + 3] = u1.createElement(l__Empty__9, {
			Size = UDim2.fromScale(1, 0.9), 
			LayoutOrder = 2, 
			BackgroundTransparency = 1
		}, v28);
		v9[#v9 + 1] = u1.createElement(l__WidgetComponent__13, v10, v11);
		return u1.createElement("Frame", v8, v9);
	end)
};
