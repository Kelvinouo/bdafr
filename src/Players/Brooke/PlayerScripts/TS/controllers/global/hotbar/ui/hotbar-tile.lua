-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("HotbarTile");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.init(p1)
	p1.frameRef = v3.createRef();
	p1.positionMaid = u1.new();
end;
function v4.didMount(p2)
	p2:tweenPosition();
end;
function v4.didUpdate(p3, p4)
	if p4.Selected ~= p3.props.Selected then
		p3:tweenPosition();
	end;
end;
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v4.tweenPosition(p5)
	p5.positionMaid:DoCleaning();
	if p5.props.Selected then
		local v5 = l__TweenService__2:Create(p5.frameRef:getValue(), TweenInfo.new(0.12), {
			Position = UDim2.fromScale(0, -0.075)
		});
	else
		v5 = l__TweenService__2:Create(p5.frameRef:getValue(), TweenInfo.new(0.12), {
			Position = UDim2.fromScale(0, 0)
		});
	end;
	v5:Play();
	p5.positionMaid:GiveTask(function()
		v5:Cancel();
	end);
end;
local l__ColorUtil__3 = v2.ColorUtil;
local l__BedwarsAppIds__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__ItemToolTip__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip;
local l__ItemViewport__9 = v1.import(script, script.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local l__Empty__10 = v2.Empty;
function v4.render(p6)
	local v6 = {};
	local v7 = {
		[v3.Ref] = p6.frameRef, 
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		BackgroundColor3 = l__ColorUtil__3.hexColor(1909806)
	};
	if p6.props.Selected then
		local v8 = 0.2;
	else
		v8 = 0.4;
	end;
	v7.BackgroundTransparency = v8;
	v7.BorderMode = "Inset";
	if p6.props.Selected then
		local v9 = 1;
	else
		v9 = 1;
	end;
	v7.BorderSizePixel = v9;
	if p6.props.Selected then
		local v10 = Color3.fromRGB(255, 255, 255);
	else
		v10 = l__ColorUtil__3.hexColor(7503788);
	end;
	v7.BorderColor3 = v10;
	v7.LayoutOrder = p6.props.LayoutOrder;
	v7.Image = nil;
	v7.Selectable = table.find(p6.props.store.AppInfo.openApps, l__BedwarsAppIds__4.INVENTORY) ~= nil;
	v7[v3.Event.MouseButton1Click] = function()
		p6.props.OnClick();
	end;
	v7[v3.Event.MouseEnter] = function(p7)
		l__SoundManager__5:playSound(l__GameSound__6.UI_HOVER);
	end;
	v7[v3.Event.MouseButton1Down] = function()
		l__Flamework__7.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItem(p6.props.SlotNumber, true);
	end;
	v7[v3.Event.MouseButton1Up] = function()
		l__Flamework__7.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItemOntoSlot(p6.props.SlotNumber, true);
	end;
	local v11 = {};
	local v12 = {
		Text = "<b>" .. tostring(p6.props.SlotNumber + 1) .. "</b>", 
		Size = UDim2.fromScale(0.23, 0.23), 
		Position = UDim2.fromScale(0, 0)
	};
	if p6.props.Selected then
		local v13 = Color3.fromRGB(255, 255, 255);
	else
		v13 = l__ColorUtil__3.hexColor(7503788);
	end;
	v12.BackgroundColor3 = v13;
	v12.BorderSizePixel = 0;
	if p6.props.Selected then
		local v14 = Color3.fromRGB(0, 0, 0);
	else
		v14 = Color3.fromRGB(255, 255, 255);
	end;
	v12.TextColor3 = v14;
	v12.Font = "Roboto";
	v12.TextScaled = true;
	v12.RichText = true;
	v11[1] = v3.createElement("TextLabel", v12, { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		}), v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.15, 0), 
			PaddingBottom = UDim.new(0.15, 0)
		}) });
	v11[2] = v3.createElement(l__ItemToolTip__8, {
		item = p6.props.HotbarSlot.item
	});
	local v15 = false;
	if p6.props.HotbarSlot.item ~= nil then
		v15 = v3.createElement(l__ItemViewport__9, {
			ItemType = p6.props.HotbarSlot.item.itemType, 
			Amount = p6.props.HotbarSlot.item.amount, 
			Size = UDim2.fromScale(0.8, 0.8), 
			Position = UDim2.fromScale(0.5, 0.15), 
			AnchorPoint = Vector2.new(0.5, 0)
		});
	end;
	if v15 then
		v11[#v11 + 1] = v15;
	end;
	v6[#v6 + 1] = v3.createElement("ImageButton", v7, v11);
	return v3.createElement(l__Empty__10, {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY"
	}, v6);
end;
return {
	HotbarTile = v4
};
