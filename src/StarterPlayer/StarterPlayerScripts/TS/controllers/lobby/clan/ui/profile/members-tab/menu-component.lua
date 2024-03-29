-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ButtonComponent__2 = v2.ButtonComponent;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__4 = v2.Empty;
return {
	MenuComponent = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5 = {};
		for v6, v7 in pairs(p1) do
			v5[v6] = v7;
		end;
		v5.ButtonText = nil;
		v5.Items = nil;
		local v8, v9 = l__useState__3(false);
		local v10, v11 = l__useState__3(false);
		local v12 = {};
		for v13, v14 in pairs(v5) do
			v12[v13] = v14;
		end;
		local v15 = v8;
		if v15 then
			local l__Items__16 = p1.Items;
			local function u5(p3)
				local v17 = {
					Size = UDim2.new(1, 0, 0, 30), 
					BackgroundColor3 = l__Theme__3.backgroundTertiary, 
					Text = p3.Text
				};
				local l__OnClick__6 = p3.OnClick;
				function v17.OnClick()
					l__OnClick__6(v11, v9);
				end;
				v17.Loading = v10;
				v17.CornerRadius = UDim.new(0, 0);
				v17.ZIndex = 100;
				return u1.createElement(l__ButtonComponent__2, v17);
			end;
			local v18 = table.create(#l__Items__16);
			local v19, v20, v21 = ipairs(l__Items__16);
			while true do
				v19(v20, v21);
				if not v19 then
					break;
				end;
				v21 = v19;
				v18[v19] = u1.createElement(u5, {
					Text = v20.text, 
					OnClick = v20.callback
				});			
			end;
			local v22 = {
				Size = UDim2.new(1, 0, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.Y, 
				Position = UDim2.fromScale(0, 1.1), 
				AnchorPoint = Vector2.new(0, 0), 
				BackgroundTransparency = 1
			};
			local v23 = { u1.createElement("UIListLayout", {
					FillDirection = "Vertical"
				}) };
			local v24 = #v23;
			local v25, v26, v27 = ipairs(v18);
			while true do
				v25(v26, v27);
				if not v25 then
					break;
				end;
				v27 = v25;
				v23[v24 + v25] = v26;			
			end;
			v15 = u1.createFragment({
				Menu = u1.createElement("Frame", v22, v23)
			});
		end;
		local v28 = { u1.createElement(l__ButtonComponent__2, {
				Text = p1.ButtonText, 
				Size = UDim2.new(1, 0, 1, 0), 
				OnClick = function()
					v9(not v8);
				end
			}) };
		if v15 then
			v28[#v28 + 1] = v15;
		end;
		return u1.createElement(l__Empty__4, v12, v28);
	end)
};
