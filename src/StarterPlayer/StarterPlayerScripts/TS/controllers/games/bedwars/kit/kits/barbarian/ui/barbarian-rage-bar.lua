-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("BarbarianRageBar");
function v5.init(p1)
	p1.progressRef = v3.createRef();
end;
local l__BarbarianKit__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local l__Players__2 = v4.Players;
local l__TweenService__3 = v4.TweenService;
function v5.updateFill(p2)
	local v6 = l__BarbarianKit__1.getSwordProgress(l__Players__2.LocalPlayer);
	local v7 = v6.prev;
	local v8 = v6.next;
	if v8 == nil then
		v7 = l__BarbarianKit__1.SwordProgression[#l__BarbarianKit__1.SwordProgression - 2 + 1];
		v8 = l__BarbarianKit__1.SwordProgression[#l__BarbarianKit__1.SwordProgression - 1 + 1];
	end;
	local v9 = math.clamp((p2.props.store.Kit.barbarianRage + 20 - v7.rage) / (v8.rage - v7.rage), 0.02, 1);
	local v10 = p2.progressRef:getValue();
	if v10 then
		l__TweenService__3:Create(v10, TweenInfo.new(0.3), {
			Size = UDim2.fromScale(v9, 0.25)
		}):Play();
	end;
end;
function v5.didMount(p3)
	p3:updateFill();
end;
function v5.didUpdate(p4, p5)
	if p5.store.Kit.barbarianRage ~= p4.props.store.Kit.barbarianRage then
		p4:updateFill();
	end;
end;
local l__UIUtil__4 = v2.UIUtil;
local l__ItemViewport__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__Empty__6 = v2.Empty;
local l__ColorUtil__7 = v2.ColorUtil;
function v5.render(p6)
	local v11 = l__BarbarianKit__1.getSwordProgress(l__Players__2.LocalPlayer);
	local v12 = v11.prev;
	local v13 = v11.next;
	if v13 == nil then
		v12 = l__BarbarianKit__1.SwordProgression[#l__BarbarianKit__1.SwordProgression - 2 + 1];
		v13 = l__BarbarianKit__1.SwordProgression[#l__BarbarianKit__1.SwordProgression - 1 + 1];
	end;
	return v3.createElement("Frame", {
		Position = l__UIUtil__4:getActionBarPosition(), 
		AnchorPoint = Vector2.new(0.5, 1), 
		Size = UDim2.fromScale(0.35, 0.04), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 12.441176470588236
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center"
		}), v3.createElement(l__ItemViewport__5, {
			ItemType = v12.item, 
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY"
		}), v3.createElement(l__Empty__6, {
			Size = UDim2.fromScale(10.441176470588236, 1), 
			SizeConstraint = "RelativeYY"
		}, { v3.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0)
			}), v3.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.25), 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5), 
				BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
				BackgroundTransparency = 0.5, 
				BorderSizePixel = 0
			}), v3.createElement("Frame", {
				[v3.Ref] = p6.progressRef, 
				Size = UDim2.fromScale(0, 0.25), 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5), 
				BorderSizePixel = 0
			}, { v3.createElement("UIGradient", {
					Color = ColorSequence.new(l__ColorUtil__7.hexColor(16578693), l__ColorUtil__7.hexColor(16433185)), 
					Rotation = 90
				}) }) }), v3.createElement(l__ItemViewport__5, {
			ItemType = v13.item, 
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY"
		}) });
end;
return {
	BarbarianRageBarWrapper = function(p7)
		return v3.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { v3.createElement(v5, {
				store = p7.store
			}) });
	end, 
	BarbarianRageBar = v5
};
