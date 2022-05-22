-- Script Hash: 8edebff7373bb2ce92c5afc455fc0e050c444135b5603619c5e6b8f22e3a9035f0ac40cf25018fdef0d375b0aac20b3f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("HotbarKitButton");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
function v4.init(p1)
	p1.bgRef = v3.createRef();
	p1.hoverMaid = l__Maid__1.new();
end;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.openKitShop(p2)
	l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__3.KIT_SHOP, {
		SelectedKit = l__ClientStore__4:getState().Bedwars.kit
	});
end;
local l__Empty__5 = v2.Empty;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__8 = v2.ColorUtil;
local l__ImageId__9 = v2.ImageId;
function v4.render(p3)
	local v5 = {};
	local v6 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = l__Theme__6.backgroundPrimary, 
		BorderSizePixel = 0
	};
	v6[v3.Event.MouseEnter] = function(p4)
		p3.hoverMaid:DoCleaning();
		local v7 = l__TweenService__7:Create(p3.bgRef:getValue(), TweenInfo.new(0.12), {
			BackgroundTransparency = 0.9
		});
		v7:Play();
		p3.hoverMaid:GiveTask(function()
			v7:Cancel();
		end);
	end;
	v6[v3.Event.MouseLeave] = function(p5)
		p3.hoverMaid:DoCleaning();
		local v8 = l__TweenService__7:Create(p3.bgRef:getValue(), TweenInfo.new(0.12), {
			BackgroundTransparency = 1
		});
		v8:Play();
		p3.hoverMaid:GiveTask(function()
			v8:Cancel();
		end);
	end;
	v6[v3.Event.MouseButton1Click] = function()
		p3:openKitShop();
	end;
	v6.AutoButtonColor = false;
	v5[1] = v3.createElement("UIAspectRatioConstraint", {
		AspectRatio = 3.061224489795918
	});
	v5[2] = v3.createElement("ImageButton", v6, { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		}), v3.createElement("Frame", {
			[v3.Ref] = p3.bgRef, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__ColorUtil__8.WHITE, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0.05, 0)
			}) }), v3.createElement(l__Empty__5, {
			Size = UDim2.fromScale(1, 1)
		}, { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center"
			}), v3.createElement(l__Empty__5, {
				Size = UDim2.fromScale(0.5, 0), 
				SizeConstraint = "RelativeYY"
			}), v3.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.6, 0.6), 
				SizeConstraint = "RelativeYY", 
				Image = l__ImageId__9.SHIELD, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}), v3.createElement("TextLabel", {
				Text = "<b>Kit</b>", 
				Size = UDim2.fromScale(1.611224489795918, 0.55), 
				SizeConstraint = "RelativeYY", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__8.WHITE, 
				RichText = true, 
				TextScaled = true
			}), v3.createElement(l__Empty__5, {
				Size = UDim2.fromScale(0.2, 0), 
				SizeConstraint = "RelativeYY"
			}) }) });
	return v3.createElement(l__Empty__5, {
		Size = UDim2.fromScale(0.3, 0.5), 
		LayoutOrder = p3.props.LayoutOrder
	}, v5);
end;
return {
	HotbarKitButton = v4
};
