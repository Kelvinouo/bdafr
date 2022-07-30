-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("HotbarTile");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.init(p1)
	p1.frameRef = v3.createRef();
	p1.positionMaid = u1.new();
	p1.maid = u1.new();
end;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.didMount(p2)
	p2:tweenPosition();
	local v5 = p2.frameRef:getValue();
	if v5 then
		p2.draggingScreenSinkInfo = l__Flamework__2.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):registerScreenSink(v5.AbsolutePosition, v5.AbsoluteSize, function(p3, p4)
			if p3 == "began" then
				l__Flamework__2.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItem(p2.props.SlotNumber, p4, true);
				return;
			end;
			if p3 == "ended" then
				l__Flamework__2.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItemOntoSlot(p2.props.SlotNumber, p4, true);
			end;
		end);
		if p2.draggingScreenSinkInfo then
			p2.maid:GiveTask(p2.draggingScreenSinkInfo.maid);
		end;
	end;
	local v6 = p2.frameRef:getValue();
	if v6 ~= nil then
		v6 = v6.Changed;
	end;
	p2.maid:GiveTask(v6:Connect(function(p5)
		if p5 == "AbsoluteSize" or p5 == "AbsolutePosition" then
			local v7 = p2.frameRef:getValue();
			if v7 and p2.draggingScreenSinkInfo then
				p2.draggingScreenSinkInfo.position = v7.AbsolutePosition;
				p2.draggingScreenSinkInfo.size = v7.AbsoluteSize;
				return;
			end;
		else
			return;
		end;
		return nil;
	end));
end;
function v4.willUnmount(p6)
	p6.maid:DoCleaning();
end;
function v4.didUpdate(p7, p8)
	if p8.Selected ~= p7.props.Selected then
		p7:tweenPosition();
	end;
end;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v4.tweenPosition(p9)
	p9.positionMaid:DoCleaning();
	if p9.props.Selected then
		local v8 = l__TweenService__3:Create(p9.frameRef:getValue(), TweenInfo.new(0.12), {
			Position = UDim2.fromScale(0, -0.075)
		});
	else
		v8 = l__TweenService__3:Create(p9.frameRef:getValue(), TweenInfo.new(0.12), {
			Position = UDim2.fromScale(0, 0)
		});
	end;
	v8:Play();
	p9.positionMaid:GiveTask(function()
		v8:Cancel();
	end);
end;
local l__ColorUtil__4 = v2.ColorUtil;
local l__BedwarsAppIds__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ItemToolTip__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip;
local l__ItemViewport__9 = v1.import(script, script.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local l__Empty__10 = v2.Empty;
function v4.render(p10)
	local v9 = {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY"
	};
	local v10 = {};
	local v11 = {
		[v3.Ref] = p10.frameRef, 
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		BackgroundColor3 = l__ColorUtil__4.hexColor(1909806)
	};
	if p10.props.Selected then
		local v12 = 0.2;
	else
		v12 = 0.4;
	end;
	v11.BackgroundTransparency = v12;
	v11.BorderMode = "Inset";
	if p10.props.Selected then
		local v13 = 1;
	else
		v13 = 1;
	end;
	v11.BorderSizePixel = v13;
	if p10.props.Selected then
		local v14 = Color3.fromRGB(255, 255, 255);
	else
		v14 = l__ColorUtil__4.hexColor(7503788);
	end;
	v11.BorderColor3 = v14;
	v11.LayoutOrder = p10.props.LayoutOrder;
	v11.Image = nil;
	v11.Selectable = table.find(p10.props.store.AppInfo.openApps, l__BedwarsAppIds__5.INVENTORY) ~= nil;
	v11[v3.Event.MouseButton1Click] = function()
		p10.props.OnClick();
	end;
	v11[v3.Event.MouseEnter] = function(p11)
		l__SoundManager__6:playSound(l__GameSound__7.UI_HOVER);
	end;
	local v15 = {};
	local v16 = {
		Text = "<b>" .. tostring(p10.props.SlotNumber + 1) .. "</b>", 
		Size = UDim2.fromScale(0.23, 0.23), 
		Position = UDim2.fromScale(0, 0)
	};
	if p10.props.Selected then
		local v17 = Color3.fromRGB(255, 255, 255);
	else
		v17 = l__ColorUtil__4.hexColor(7503788);
	end;
	v16.BackgroundColor3 = v17;
	v16.BorderSizePixel = 0;
	if p10.props.Selected then
		local v18 = Color3.fromRGB(0, 0, 0);
	else
		v18 = Color3.fromRGB(255, 255, 255);
	end;
	v16.TextColor3 = v18;
	v16.Font = "Roboto";
	v16.TextScaled = true;
	v16.RichText = true;
	v15[1] = v3.createElement("TextLabel", v16, { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		}), v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.15, 0), 
			PaddingBottom = UDim.new(0.15, 0)
		}) });
	local v19 = #v15;
	local v20 = {};
	local v21 = p10.props.HotbarSlot.item;
	if v21 ~= nil then
		v21 = v21.itemType;
	end;
	v20.item = v21;
	v15[v19 + 1] = v3.createElement(l__ItemToolTip__8, v20);
	local v22 = false;
	if p10.props.HotbarSlot.item ~= nil then
		v22 = v3.createElement(l__ItemViewport__9, {
			ItemType = p10.props.HotbarSlot.item.itemType, 
			Amount = p10.props.HotbarSlot.item.amount, 
			Size = UDim2.fromScale(0.8, 0.8), 
			Position = UDim2.fromScale(0.5, 0.15), 
			AnchorPoint = Vector2.new(0.5, 0)
		});
	end;
	if v22 then
		v15[v19 + 2] = v22;
	end;
	v10[#v10 + 1] = v3.createElement("ImageButton", v11, v15);
	return v3.createElement(l__Empty__10, v9, v10);
end;
return {
	HotbarTile = v4
};
