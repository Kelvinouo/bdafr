-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__LockerTab__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ButtonComponent__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ButtonComponent;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	LockerTabList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v2 = u1.entries(l__LockerTab__2);
		local function v3(p3)
			local v4 = p3[1];
			local v5 = {
				Text = p3[2], 
				Active = p1.Tab == l__LockerTab__2[v4]
			};
			function v5.OnClick()
				p1.ChangeTab(l__LockerTab__2[v4]);
			end;
			v5.CornerRadius = UDim.new(0, 0);
			v5.BackgroundColor3 = l__Theme__5.backgroundTertiary;
			return u3.createElement(l__ButtonComponent__4, v5);
		end;
		local v6 = table.create(#v2);
		local v7, v8, v9 = ipairs(v2);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			v6[v7] = v3(v8, v7 - 1, v2);		
		end;
		local v10 = {
			Size = UDim2.fromScale(1, 0.08), 
			BackgroundTransparency = 1
		};
		local v11 = { u3.createElement("UISizeConstraint", {
				MinSize = Vector2.new(0, p1.MinSize), 
				MaxSize = Vector2.new(math.huge, p1.MaxSize)
			}), u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0, 10)
			}) };
		local v12 = #v11;
		local v13, v14, v15 = ipairs(v6);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			v11[v12 + v13] = v14;		
		end;
		return u3.createFragment({
			Tabs = u3.createElement("Frame", v10, v11)
		});
	end)
};
