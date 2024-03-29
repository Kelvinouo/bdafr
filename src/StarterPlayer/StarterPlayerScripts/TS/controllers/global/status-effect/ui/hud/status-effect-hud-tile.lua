-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__StatusEffectMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	StatusEffectHudTile = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3, v4 = l__useState__2(false);
		if p1.ActiveStatusEffect.expireTime == nil then
			local v5 = -1;
		else
			v5 = math.max(0, p1.ActiveStatusEffect.expireTime - l__Workspace__1:GetServerTimeNow());
		end;
		local v6, v7 = l__useState__2(v5);
		local v8, v9 = l__useState__2(false);
		local v10 = l__StatusEffectMeta__2[p1.ActiveStatusEffect.statusEffect];
		local v11 = v10.image;
		if v10.item then
			local v12 = l__getItemMeta__3(v10.item);
			if v10.image == nil then
				v11 = v12.image;
			end;
		end;
		p2.useEffect(function()
			if p1.ActiveStatusEffect.expireTime ~= nil then
				local u7 = true;
				task.spawn(function()
					while true do
						local v13 = math.floor((math.max(0, p1.ActiveStatusEffect.expireTime - l__Workspace__1:GetServerTimeNow())));
						if u7 then
							v7(v13);
						end;
						local v14 = u7 and task.wait(1);
						if v14 == 0 then
							break;
						end;
						if v14 ~= v14 then
							break;
						end;
						if not v14 then
							break;
						end;					
					end;
				end);
			end;
			local u8 = true;
			return function()
				u8 = false;
			end;
		end, { p1.ActiveStatusEffect });
		local v15 = v6;
		if v8 then
			v15 = math.floor(v15 / 60);
		end;
		local v16 = v6 ~= -1;
		if v6 > 600 then
			v16 = false;
		end;
		local v17 = {
			Size = UDim2.new(1, 0, 1, 0), 
			SizeConstraint = "RelativeYY", 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 0.3, 
			BorderSizePixel = 0
		};
		v17[u4.Event.MouseEnter] = function()
			v4(true);
		end;
		v17[u4.Event.MouseLeave] = function()
			v4(false);
		end;
		local v18 = { u4.createElement("UICorner", {
				CornerRadius = UDim.new(0.05, 0)
			}), u4.createElement("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255), 
				Transparency = 0.5
			}), u4.createElement("ImageLabel", {
				Size = UDim2.new(0.75, 0, 0.75, 0), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 1, 
				Image = v11, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}) };
		local v19 = v16;
		if v19 then
			local v20 = {
				Position = UDim2.fromScale(0.6666666666666666, 0.6875), 
				Size = UDim2.fromScale(0.3, 0.25), 
				Text = tostring(v15)
			};
			if v8 then
				local v21 = l__ColorUtil__5.hexColor(16777215);
			else
				v21 = l__ColorUtil__5.hexColor(16754518);
			end;
			v20.TextColor3 = v21;
			v20.BackgroundTransparency = 1;
			v20.Font = "RobotoMono";
			v20.TextXAlignment = "Right";
			v20.TextYAlignment = "Bottom";
			v20.TextScaled = true;
			v19 = u4.createElement("TextLabel", v20);
		end;
		if v19 then
			v18[#v18 + 1] = v19;
		end;
		local v22 = p1.ActiveStatusEffect.stacks > 1 and u4.createElement("TextLabel", {
			Position = UDim2.fromScale(0.5, -0.25), 
			Size = UDim2.fromScale(0.75, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0), 
			Text = "<b>" .. tostring(p1.ActiveStatusEffect.stacks) .. "</b>", 
			TextColor3 = l__Theme__6.mcGold, 
			BackgroundTransparency = 1, 
			Font = "RobotoMono", 
			TextXAlignment = "Center", 
			TextYAlignment = "Top", 
			TextScaled = true, 
			RichText = true, 
			TextStrokeTransparency = 0
		});
		if v22 then
			v18[#v18 + 1] = v22;
		end;
		local v23 = v3 and u4.createElement("Frame", {
			Size = UDim2.new(2, 0, 0.3, 0), 
			AnchorPoint = Vector2.new(0.5, 0), 
			Position = UDim2.new(0.5, 0, 1.2, 0), 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 0.6
		}, { u4.createElement("TextLabel", {
				Size = UDim2.new(0.8, 0, 1, 0), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.new(0.5, 0, 0.5, 0), 
				TextXAlignment = "Center", 
				TextYAlignment = "Center", 
				TextScaled = true, 
				RichText = true, 
				BorderSizePixel = 0, 
				Font = "SourceSansBold", 
				Text = v10.displayName, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1
			}) });
		if v23 then
			v18[#v18 + 1] = v23;
		end;
		return u4.createElement("Frame", v17, v18);
	end)
};
