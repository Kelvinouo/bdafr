-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("BountyHunterPoster");
function v4.init(p1)

end;
local l__ColorUtil__1 = v2.ColorUtil;
local l__SlideIn__2 = v2.SlideIn;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__CornerFiller__5 = v2.CornerFiller;
local l__Empty__6 = v2.Empty;
local l__AvatarUpper__7 = v1.import(script, script.Parent, "avatar-upper").AvatarUpper;
function v4.render(p2)
	local l__bountyHunterTarget__5 = p2.props.store.Kit.bountyHunterTarget;
	if l__bountyHunterTarget__5 == nil then
		return nil;
	end;
	local v6 = nil;
	local v7, v8, v9 = ipairs(p2.props.store.Game.teams);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		local v10 = l__bountyHunterTarget__5.Team;
		if v10 ~= nil then
			v10 = v10.Name;
		end;
		if v8.name == v10 == true then
			v6 = v8;
			break;
		end;	
	end;
	local v11 = v6;
	if v11 ~= nil then
		v11 = v11.color;
	end;
	local v12 = v11;
	if v12 == nil then
		v12 = Color3.fromRGB(255, 255, 255);
	end;
	local v13 = {};
	local v14 = {
		AnchorPoint = Vector2.new(0, 0.5)
	};
	if l__DeviceUtil__3.isSmallScreen() then
		local v15 = 0.4;
	else
		v15 = 0.5;
	end;
	v14.Position = UDim2.new(0, 16, v15, 0);
	v14.Size = UDim2.fromScale(0.35, 0.35);
	v14.BorderSizePixel = 0;
	v14.BackgroundColor3 = l__Theme__4.backgroundSecondary;
	v13.BountyHunterPoster = v3.createElement("Frame", v14, {
		Header = v3.createElement("Frame", {
			ZIndex = 2, 
			Size = UDim2.new(1, 0, 0.15, 0), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			LayoutOrder = 1
		}, { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0, 4)
			}), v3.createElement(l__CornerFiller__5, {
				BottomLeft = true, 
				BottomRight = true
			}), v3.createElement("TextLabel", {
				ZIndex = 3, 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5), 
				Size = UDim2.fromScale(1, 0.6), 
				BackgroundTransparency = 1, 
				Font = "Roboto", 
				Text = "<b>Target:</b> <b><font face=\"RobotoMono\" color=\"" .. l__ColorUtil__1.richTextColor(v12) .. "\">" .. l__bountyHunterTarget__5.DisplayName .. "</font></b>", 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextScaled = true, 
				RichText = true, 
				AutoLocalize = false
			}) }), 
		Background = v3.createElement(l__Empty__6, {
			Size = UDim2.new(1, 0, 0.86, 0), 
			LayoutOrder = 2
		}, {
			Avatar = v3.createElement(l__AvatarUpper__7, {
				store = p2.props.store, 
				player = l__bountyHunterTarget__5, 
				AnchorPoint = Vector2.new(0.5, 0), 
				Size = UDim2.fromScale(0.9, 0.7), 
				BackgroundColor3 = l__Theme__4.backgroundTertiary, 
				LayoutOrder = 1
			}, { v3.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}) }), 
			TextSection = v3.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0), 
				Size = UDim2.fromScale(0.9, 0.2), 
				BackgroundColor3 = l__Theme__4.backgroundTertiary, 
				LayoutOrder = 2
			}, { v3.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}), v3.createElement("TextLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromScale(0.9, 0.9), 
					BackgroundTransparency = 1, 
					Font = "SourceSansSemibold", 
					Text = "Eliminate to receive rewards.", 
					RichText = true, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					TextScaled = true
				}) }),
			(v3.createElement("UIListLayout", {
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center", 
				FillDirection = "Vertical", 
				Padding = UDim.new(0.03, 0), 
				SortOrder = "LayoutOrder"
			}))
		}),
		v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 0.8432601880877743
		}), v3.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(269, 319)
		}), v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder"
		}), (v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 4)
		}))
	});
	return v3.createElement(l__SlideIn__2, {}, v13);
end;
function v4.shouldUpdate(p3, p4)
	return p3.props.store.Kit.bountyHunterTarget ~= p4.store.Kit.bountyHunterTarget;
end;
return {
	BountyHunterPosterWrapper = function(p5)
		return v3.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { v3.createElement(v4, {
				store = p5.store
			}) });
	end, 
	BountyHunterPoster = v4
};
