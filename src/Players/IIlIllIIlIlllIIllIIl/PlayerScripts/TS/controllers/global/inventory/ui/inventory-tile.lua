-- Script Hash: cfed695ebcc513b0f0f135a9981a4a0c2f75b916ed0fe97c810354e719b8909c26a1ff124d852592530ac35d5b1c6592
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("InventoryTile");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ExpireList__2 = v2.ExpireList;
function v4.init(p1, p2)
	p1.maid = u1.new();
	p1.ref = v3.createRef();
	p1.hotbarSwapCooldown = l__ExpireList__2.new(0.1);
	p1:setState({
		hovered = false, 
		loading = false
	});
end;
local l__UserInputService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__HotbarKeyboardNumbers__4 = v1.import(script, script.Parent.Parent.Parent, "hotbar", "lib", "hotbar-keyboard-numbers").HotbarKeyboardNumbers;
local l__UIUtil__5 = v2.UIUtil;
function v4.didMount(p3)
	p3.maid:GiveTask(l__UserInputService__3.InputBegan:Connect(function(p4, p5)
		if p3.hotbarSwapCooldown:has("lock") then
			return nil;
		end;
		p3.hotbarSwapCooldown:add("lock");
		if p5 then
			return nil;
		end;
		if table.find(l__HotbarKeyboardNumbers__4, p4.KeyCode) ~= nil and table.find(l__HotbarKeyboardNumbers__4, p4.KeyCode) ~= nil and p3.state.hovered then
			p3.props.SendToHotbarSlot(p4.KeyCode.Value - 49);
		end;
	end));
	if l__UserInputService__3.GamepadEnabled and not l__UserInputService__3.MouseEnabled and p3.props.AutoSelect then
		l__UIUtil__5:selectGui(p3.ref:getValue());
	end;
end;
function v4.willUnmount(p6)
	p6.maid:DoCleaning();
end;
local l__ColorUtil__6 = v2.ColorUtil;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CircularProgress__9 = v2.CircularProgress;
local l__ItemViewport__10 = v1.import(script, script.Parent, "item-viewport").ItemViewport;
function v4.render(p7)
	local v5 = p7.props.TileColor or l__ColorUtil__6.hexColor(4016991);
	local v6 = {
		[v3.Ref] = p7.ref, 
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = v5, 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		LayoutOrder = p7.props.LayoutOrder, 
		Modal = true
	};
	v6[v3.Event.MouseButton1Click] = function()
		if p7.props.InvItem and p7.props.ItemClickLoadingProgress then
			p7:setState({
				loading = true
			});
			l__SoundManager__7:playSound(l__GameSound__8.UI_CLICK, {
				volumeMultiplier = 0.1
			});
		end;
		p7.props.OnClick():andThen(function(p8)
			p7:setState({
				loading = false
			});
		end);
	end;
	v6[v3.Event.MouseEnter] = function()
		l__SoundManager__7:playSound(l__GameSound__8.UI_HOVER);
		p7:setState({
			hovered = true
		});
	end;
	v6[v3.Event.MouseLeave] = function()
		p7:setState({
			hovered = false
		});
	end;
	local v7 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 3)
		}), v3.createElement("UIStroke", {
			Color = p7.props.TileBorderColor or l__ColorUtil__6.brighten(v5, 0.1), 
			Thickness = 1.5
		}) };
	local v8 = p7.state.loading and v3.createElement(l__CircularProgress__9, {
		Time = 0.2, 
		Transparency = 0.3, 
		Size = UDim2.fromScale(0.45, 0.45), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5)
	});
	if v8 then
		v7[#v7 + 1] = v8;
	end;
	local v9 = false;
	if p7.props.InvItem ~= nil then
		v9 = v3.createElement(l__ItemViewport__10, {
			ItemType = p7.props.InvItem.itemType, 
			Amount = p7.props.InvItem.amount, 
			Size = UDim2.fromScale(0.8, 0.8), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		});
	end;
	if v9 then
		v7[#v7 + 1] = v9;
	end;
	return v3.createElement("ImageButton", v6, v7);
end;
return {
	InventoryTile = v4
};
