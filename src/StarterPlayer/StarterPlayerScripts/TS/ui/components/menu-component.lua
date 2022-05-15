
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ButtonComponent__2 = v2.ButtonComponent;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__4 = v2.Empty;
return {
	MenuComponent = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v3 = {};
		for v4, v5 in pairs(p1) do
			v3[v4] = v5;
		end;
		v3.ButtonText = nil;
		v3.Items = nil;
		local v6, v7 = p2.useState(false);
		local v8 = {};
		for v9, v10 in pairs(v3) do
			v8[v9] = v10;
		end;
		v8.ZIndex = 100;
		local v11 = v6;
		if v11 then
			local l__Items__12 = p1.Items;
			local function u5(p3)
				return u1.createElement(l__ButtonComponent__2, {
					Size = UDim2.new(1, 0, 0, 30), 
					BackgroundColor3 = l__Theme__3.backgroundTertiary, 
					Text = p3.Text, 
					OnClick = p3.OnClick, 
					ZIndex = 100
				});
			end;
			local function v13(p4)
				return u1.createElement(u5, {
					Text = p4.text, 
					OnClick = p4.callback
				});
			end;
			local v14 = table.create(#l__Items__12);
			for v15, v16 in ipairs(l__Items__12) do
				v14[v15] = v13(v16, v15 - 1, l__Items__12);
			end;
			local v17 = {
				Size = UDim2.new(1, 0, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.Y, 
				Position = UDim2.fromScale(0, 1.1), 
				AnchorPoint = Vector2.new(0, 0), 
				BackgroundColor3 = l__Theme__3.backgroundTertiary, 
				BorderSizePixel = 0, 
				ZIndex = 100
			};
			local v18 = { u1.createElement("UIListLayout", {
					FillDirection = "Vertical"
				}) };
			local v19 = #v18;
			for v20, v21 in ipairs(v14) do
				v18[v19 + v20] = v21;
			end;
			v11 = u1.createFragment({
				Menu = u1.createElement("Frame", v17, v18)
			});
		end;
		local v22 = { u1.createElement(l__ButtonComponent__2, {
				Text = p1.ButtonText, 
				Size = UDim2.new(1, 0, 1, 0), 
				OnClick = function()
					v7(not v6);
				end
			}) };
		if v11 then
			v22[#v22 + 1] = v11;
		end;
		return u1.createElement(l__Empty__4, v8, v22);
	end)
};

