-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__MapSaveUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-save-util").MapSaveUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__4 = v2.ColorUtil;
local l__TextInputComponent__5 = v2.TextInputComponent;
local l__Empty__6 = v2.Empty;
local l__ButtonComponent__7 = v2.ButtonComponent;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__DividerComponent__9 = v2.DividerComponent;
local l__MapSaveCard__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "custom-match", "host-panel", "map-tab", "map-save-card").MapSaveCard;
local l__AutoSizedText__11 = v2.AutoSizedText;
return {
	CustomMatchesMapSaves = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3("");
		local v6, v7 = l__useState__3(nil);
		local v8, v9 = l__useState__3(false);
		local v10, v11 = l__useState__3("");
		local v12, v13 = l__useState__3("");
		local v14 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = 4
		};
		local v15 = { (u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			})) };
		local v16 = {};
		local v17 = {
			TextBox = {
				Position = UDim2.fromOffset(0, 22), 
				Size = UDim2.fromOffset(130, 28), 
				PlaceholderText = "1234-ABCD-5678"
			}
		};
		function v17.OnFocusLost(p3)
			return v5(p3);
		end;
		v17.MaxCharacters = 18;
		v16[1] = u2.createElement("TextLabel", {
			Position = UDim2.fromOffset(0, 0), 
			Size = UDim2.new(1, 0, 0, 14), 
			BackgroundTransparency = 1, 
			Text = "<b>MAP CODE</b>", 
			TextXAlignment = Enum.TextXAlignment.Left, 
			RichText = true, 
			TextColor3 = Color3.new(1, 1, 1), 
			Font = Enum.Font.Roboto, 
			TextTransparency = 0.1, 
			TextSize = 14
		});
		v16[2] = u2.createElement(l__TextInputComponent__5, v17);
		local v18 = {};
		local v19 = {};
		if v8 then
			local v20 = "Creating Match...";
		else
			v20 = "Create Match";
		end;
		v19.Text = v20;
		function v19.OnClick()
			if v8 then
				return nil;
			end;
			if #v4 < 12 then
				v11("INVALID MAP CODE");
				v9(false);
				return nil;
			end;
			v9(true);
			l__KnitClient__8.Controllers.CustomMatchController:getMapDisplayInfo(v4):andThen(function(p4)
				local l__data__21 = p4.data;
				v11("");
				if not l__data__21 then
					v9(false);
					v11("INVALID MAP CODE");
					return;
				end;
				p1.OnCreateMatch(l__data__21.queueType, l__data__21.code):andThen(function(p5)
					v9(false);
				end);
			end);
		end;
		local v22 = {
			Size = UDim2.new(1, 0, 0, 10)
		};
		if v10 ~= "" then
			local v23 = "<b>" .. v10 .. "</b>";
		else
			v23 = "";
		end;
		v22.Text = v23;
		v22.TextScaled = true;
		v22.RichText = true;
		v22.TextColor3 = l__Theme__3.mcRed;
		v22.TextXAlignment = "Center";
		v22.TextTransparency = 0.1;
		v22.BackgroundTransparency = 1;
		v18[1] = u2.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0, 2), 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center"
		});
		v18[2] = u2.createElement(l__ButtonComponent__7, v19);
		v18[3] = u2.createElement("TextLabel", v22);
		v16.MapCodeInputSubmitForm = u2.createElement(l__Empty__6, {
			Size = UDim2.fromOffset(120, 38), 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.new(1, 0, 0, 22)
		}, v18);
		v15.JoinCodeSection = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 50), 
			BackgroundTransparency = 1, 
			LayoutOrder = 4
		}, v16);
		v15[2] = u2.createElement(l__DividerComponent__9, {
			Text = "OR", 
			LayoutOrder = 5
		});
		local v24 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			LayoutOrder = 6
		};
		local v25 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 8)
			}), u2.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 14), 
				BackgroundTransparency = 1, 
				Text = "<b>SELECT MAP SAVE</b>", 
				TextXAlignment = Enum.TextXAlignment.Left, 
				RichText = true, 
				TextColor3 = Color3.new(1, 1, 1), 
				Font = Enum.Font.Roboto, 
				TextTransparency = 0.1, 
				TextSize = 14
			}) };
		local v26 = #v25;
		local l__MapSaves__27 = p1.MapSaves;
		local function v28(p6, p7)
			local v29 = {
				MapSave = p6
			};
			function v29.OnClick()
				v7(p6);
			end;
			local u12 = v6 and v6.code == p6.code;
			function v29.OnHover(p8)
				if u12 then
					return nil;
				end;
				local v30 = p8:FindFirstChildWhichIsA("UIStroke");
				if v30 then
					v30.Enabled = true;
				end;
			end;
			function v29.OnHoverOut(p9)
				if u12 then
					return nil;
				end;
				local v31 = p9:FindFirstChildWhichIsA("UIStroke");
				if v31 then
					v31.Enabled = false;
				end;
			end;
			local v32 = {};
			local v33 = {};
			if u12 then
				local v34 = l__Theme__3.textPrimary;
			else
				v34 = l__ColorUtil__4.WHITE;
			end;
			v33.Color = v34;
			if u12 then
				local v35 = 2;
			else
				v35 = 1;
			end;
			v33.Thickness = v35;
			if u12 then
				local v36 = true;
			else
				v36 = false;
			end;
			v33.Enabled = v36;
			v32[1] = u2.createElement("UIStroke", v33);
			return u2.createElement(l__MapSaveCard__10, v29, v32);
		end;
		local v37 = table.create(#l__MapSaves__27);
		local v38, v39, v40 = ipairs(l__MapSaves__27);
		while true do
			v38(v39, v40);
			if not v38 then
				break;
			end;
			v40 = v38;
			v37[v38] = v28(v39, v38 - 1, l__MapSaves__27);		
		end;
		local v41 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v42 = { u2.createElement("UIGridLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				CellPadding = UDim2.new(0, 6, 0, 6), 
				CellSize = UDim2.new(0.33333, -6, 0, 150), 
				FillDirectionMaxCells = 3
			}) };
		local v43 = #v42;
		local v44, v45, v46 = ipairs(v37);
		while true do
			v44(v45, v46);
			if not v44 then
				break;
			end;
			v46 = v44;
			v42[v43 + v44] = v45;		
		end;
		local v47 = #v42;
		local v48, v49, v50 = ipairs(((function()
			local v51 = l__MapSaveUtil__1.MAX_MAP_SAVES - #p1.MapSaves;
			local v52 = {};
			local v53 = 0;
			local v54 = false;
			while true do
				if v54 then
					v53 = v53 + 1;
				else
					v54 = true;
				end;
				if not (v53 < v51) then
					break;
				end;
				table.insert(v52, (u2.createElement("Frame", {
					BackgroundColor3 = l__Theme__3.backgroundTertiary, 
					BorderSizePixel = 0
				}, { u2.createElement("TextLabel", {
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.fromScale(0.75, 0.3), 
						Text = "<b>EMPTY SAVE SLOT</b>", 
						RichText = true, 
						TextScaled = true, 
						TextColor3 = l__ColorUtil__4.hexColor(9541119), 
						TextTransparency = 0.5, 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}) })));			
			end;
			return v52;
		end)()));
		while true do
			v48(v49, v50);
			if not v48 then
				break;
			end;
			v50 = v48;
			v42[v47 + v48] = v49;		
		end;
		v25[v26 + 1] = u2.createElement(l__Empty__6, v41, v42);
		local v55 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v56 = { u2.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0, 4)
			}) };
		local v57 = #v56;
		local v58 = {};
		local v59 = v6;
		if v59 ~= nil then
			v59 = v59.name;
		end;
		local v60 = v59;
		if v60 == nil then
			v60 = "";
		end;
		v58.Text = v60;
		v58.TextSize = 14;
		v58.Font = Enum.Font.GothamBold;
		v56[v57 + 1] = u2.createElement(l__AutoSizedText__11, v58);
		local v61 = {};
		if v6 == nil then
			local v62 = "Select a Map";
		elseif v8 then
			v62 = "Creating Match...";
		else
			v62 = "Create Match";
		end;
		v61.Text = v62;
		function v61.OnClick()
			if v8 then
				return nil;
			end;
			if v6 then
				v9(true);
				local v63 = v6;
				if v63 ~= nil then
					v63 = v63.queueType;
				end;
				local v64 = v6;
				if v64 ~= nil then
					v64 = v64.code;
				end;
				p1.OnCreateMatch(v63, v64):andThen(function(p10)
					v9(false);
				end);
			end;
		end;
		v61.Disabled = v6 == nil;
		v56[v57 + 2] = u2.createElement(l__ButtonComponent__7, v61);
		v25[v26 + 2] = u2.createElement(l__Empty__6, v55, v56);
		v15[#v15 + 1] = u2.createElement(l__Empty__6, v24, v25);
		return u2.createFragment({
			CustomMatchesMapSaves = u2.createElement(l__Empty__6, v14, v15)
		});
	end)
};
