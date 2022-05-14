-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	ClanProfilePageLayout = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = p1.Title ~= nil;
		if v3 then
			local v4 = { u1.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 10), 
					SortOrder = "LayoutOrder"
				}) };
			local v5 = { u1.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					Text = "<b>" .. p1.Title .. "</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__Theme__2.textPrimary, 
					TextXAlignment = "Left", 
					TextYAlignment = "Center", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 20
					}) }) };
			local v6 = p1.RightTitleElement and u1.createElement(l__Empty__3, {
				Size = UDim2.new(0.5, 0, 0, 20), 
				Position = UDim2.fromScale(1, 0.5), 
				AnchorPoint = Vector2.new(1, 0.5)
			}, { p1.RightTitleElement });
			if v6 then
				v5[#v5 + 1] = v6;
			end;
			v4[#v4 + 1] = u1.createElement(l__Empty__3, {
				Size = UDim2.new(1, 0, 0, 20)
			}, v5);
			v3 = u1.createFragment(v4);
		end;
		local v7 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v8 = {};
		if v3 then
			v8[#v8 + 1] = v3;
		end;
		local v9 = {};
		if p1.Title ~= nil then
			local v10 = UDim2.new(1, 0, 1, -36);
		else
			v10 = UDim2.fromScale(1, 1);
		end;
		v9.Size = v10;
		local v11 = {};
		local v12 = p1.PaddingBottom and u1.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 15)
		});
		if v12 then
			v11[#v11 + 1] = v12;
		end;
		local v13 = #v11;
		local v14 = p1[u1.Children];
		if v14 then
			local v15, v16, v17 = pairs(v14);
			while true do
				local v18 = nil;
				local v19 = nil;
				v19, v18 = v15(v16, v17);
				if not v19 then
					break;
				end;
				v17 = v19;
				if type(v19) == "number" then
					v11[v13 + v19] = v18;
				else
					v11[v19] = v18;
				end;			
			end;
		end;
		v8[#v8 + 1] = u1.createElement(l__Empty__3, v9, v11);
		return u1.createElement(l__Empty__3, v7, v8);
	end)
};
