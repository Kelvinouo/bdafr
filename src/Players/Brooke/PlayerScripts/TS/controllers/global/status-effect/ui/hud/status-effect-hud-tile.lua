-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__StatusEffectMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ColorUtil__4 = v2.ColorUtil;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__AutoSizedText__6 = v2.AutoSizedText;
local l__TooltipContainer__7 = v2.TooltipContainer;
return {
	StatusEffectHudTile = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3(false);
		if p1.ActiveStatusEffect.expireTime == nil then
			local v6 = -1;
		else
			v6 = math.max(0, p1.ActiveStatusEffect.expireTime - l__Workspace__1:GetServerTimeNow());
		end;
		local v7, v8 = l__useState__3(v6);
		local v9, v10 = l__useState__3(false);
		local v11 = l__StatusEffectMeta__2[p1.ActiveStatusEffect.statusEffect];
		local v12 = v11.image;
		if v11.item then
			local v13 = l__getItemMeta__3(v11.item);
			if v11.image == nil then
				v12 = v13.image;
			end;
		end;
		p2.useEffect(function()
			if p1.ActiveStatusEffect.expireTime ~= nil then
				local u8 = true;
				task.spawn(function()
					while true do
						local v14 = math.floor((math.max(0, p1.ActiveStatusEffect.expireTime - l__Workspace__1:GetServerTimeNow())));
						if u8 then
							v8(v14);
						end;
						local v15 = u8 and task.wait(1);
						if v15 == 0 then
							break;
						end;
						if v15 ~= v15 then
							break;
						end;
						if not v15 then
							break;
						end;					
					end;
				end);
			end;
			local u9 = true;
			return function()
				u9 = false;
			end;
		end, { p1.ActiveStatusEffect });
		local v16 = v7;
		if v9 then
			v16 = math.floor(v16 / 60);
		end;
		local v17 = v7 ~= -1;
		if v7 > 600 then
			v17 = false;
		end;
		local v18 = {
			Size = UDim2.new(1, 0, 1, 0), 
			SizeConstraint = "RelativeYY", 
			BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 0.2, 
			BorderSizePixel = 0
		};
		v18[u5.Event.MouseEnter] = function()
			v5(true);
		end;
		v18[u5.Event.MouseLeave] = function()
			v5(false);
		end;
		local v19 = { u5.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), u5.createElement("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255), 
				Thickness = 2, 
				Transparency = 0.5
			}), u5.createElement("ImageLabel", {
				Size = UDim2.new(0.75, 0, 0.75, 0), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 1, 
				Image = v12, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}) };
		local v20 = v17 and u5.createElement("TextLabel", {
			AnchorPoint = Vector2.new(1, 1), 
			Position = UDim2.fromScale(0.925, 0.925), 
			Size = UDim2.fromScale(0.5, 0.35), 
			Text = "<b>" .. tostring(v16) .. "</b>", 
			TextColor3 = (function()
				if v16 >= 60 then
					return l__ColorUtil__4.hexColor(16777215);
				end;
				if v16 >= 10 then
					return l__ColorUtil__4.hexColor(16754518);
				end;
				if v16 >= 0 then
					return Color3.fromRGB(255, 41, 41);
				end;
				return l__ColorUtil__4.hexColor(16777215);
			end)(), 
			BackgroundTransparency = 1, 
			Font = "RobotoMono", 
			TextXAlignment = "Right", 
			TextYAlignment = "Bottom", 
			RichText = true, 
			TextScaled = true
		});
		if v20 then
			v19[#v19 + 1] = v20;
		end;
		local v21 = p1.ActiveStatusEffect.stacks >= 1 and u5.createElement("TextLabel", {
			Position = UDim2.fromScale(0.5, -0.25), 
			Size = UDim2.fromScale(0.75, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0), 
			Text = "<b>" .. tostring(p1.ActiveStatusEffect.stacks) .. "</b>", 
			TextColor3 = l__ColorUtil__4.WHITE, 
			BackgroundTransparency = 1, 
			Font = "RobotoMono", 
			TextXAlignment = "Center", 
			TextYAlignment = "Top", 
			TextScaled = true, 
			RichText = true, 
			TextStrokeTransparency = 0
		});
		if v21 then
			v19[#v19 + 1] = v21;
		end;
		local v22 = { u5.createElement(l__AutoSizedText__6, {
				Text = v11.displayName, 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) };
		local v23 = false;
		if v11.description ~= nil then
			v23 = u5.createElement(l__AutoSizedText__6, {
				Text = v11.description, 
				Font = Enum.Font.SourceSans, 
				TextSize = 14, 
				Limits = Vector2.new(300, 60)
			});
		end;
		if v23 then
			v22[#v22 + 1] = v23;
		end;
		v19[#v19 + 1] = u5.createElement(l__TooltipContainer__7, {}, v22);
		return u5.createElement("ImageLabel", v18, v19);
	end)
};
