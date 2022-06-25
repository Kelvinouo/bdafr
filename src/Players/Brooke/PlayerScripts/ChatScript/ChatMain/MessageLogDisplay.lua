-- Script Hash: feb690316cbacef01aa273565758888720e9d325025db68096f46cf3803422e9c7db9e2a88f07e7d542e6b3b9a63a194
-- Decompiled with the Synapse X Luau decompiler.

local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
local v3 = {
	ScrollBarThickness = 4
};
local l__Parent__4 = script.Parent;
local v5 = {};
v5.__index = v5;
local u1 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
function v5.Destroy(p1)
	p1.GuiObject:Destroy();
	p1.Destroyed = true;
end;
function v5.SetActive(p2, p3)
	p2.GuiObject.Visible = p3;
end;
local u2 = v1 or v2;
function v5.UpdateMessageFiltered(p4, p5)
	local v6 = nil;
	local v7 = 1;
	local l__MessageObjectLog__8 = p4.MessageObjectLog;
	while v7 <= #l__MessageObjectLog__8 do
		local v9 = l__MessageObjectLog__8[v7];
		if v9.ID == p5.ID then
			v6 = v9;
			break;
		end;
		v7 = v7 + 1;	
	end;
	if v6 then
		if not u2 then
			v6.UpdateTextFunction(p5);
			p4:PositionMessageLabelInWindow(v6, v7);
			return;
		end;
	else
		return;
	end;
	if p5.Message == "" then
		p4:RemoveMessageAtIndex(v7);
		return;
	end;
	v6.UpdateTextFunction(p5);
	p4:PositionMessageLabelInWindow(v6, v7);
end;
local u3 = require(l__Parent__4:WaitForChild("MessageLabelCreator")).new();
function v5.AddMessage(p6, p7)
	p6:WaitUntilParentedCorrectly();
	local v10 = u3:CreateMessageLabel(p7, p6.CurrentChannelName);
	if v10 == nil then
		return;
	end;
	table.insert(p6.MessageObjectLog, v10);
	p6:PositionMessageLabelInWindow(v10, #p6.MessageObjectLog);
end;
function v5.RemoveMessageAtIndex(p8, p9)
	p8:WaitUntilParentedCorrectly();
	local v11 = p8.MessageObjectLog[p9];
	if v11 then
		v11:Destroy();
		table.remove(p8.MessageObjectLog, p9);
	end;
end;
function v5.AddMessageAtIndex(p10, p11, p12)
	local v12 = u3:CreateMessageLabel(p11, p10.CurrentChannelName);
	if v12 == nil then
		return;
	end;
	table.insert(p10.MessageObjectLog, p12, v12);
	p10:PositionMessageLabelInWindow(v12, p12);
end;
function v5.RemoveLastMessage(p13)
	p13:WaitUntilParentedCorrectly();
	p13.MessageObjectLog[1]:Destroy();
	table.remove(p13.MessageObjectLog, 1);
end;
function v5.IsScrolledDown(p14)
	local l__Offset__13 = p14.Scroller.CanvasSize.Y.Offset;
	local l__Y__14 = p14.Scroller.AbsoluteWindowSize.Y;
	local v15 = true;
	if not (l__Offset__13 < l__Y__14) then
		v15 = l__Offset__13 - p14.Scroller.CanvasPosition.Y <= l__Y__14 + 5;
	end;
	return v15;
end;
function v5.UpdateMessageTextHeight(p15, p16)
	local l__BaseFrame__16 = p16.BaseFrame;
	for v17 = 1, 10 do
		if p16.BaseMessage.TextFits then
			break;
		end;
		l__BaseFrame__16.Size = UDim2.new(1, 0, 0, p16.GetHeightFunction(p15.Scroller.AbsoluteSize.X - v17));
	end;
end;
function v5.PositionMessageLabelInWindow(p17, p18, p19)
	p17:WaitUntilParentedCorrectly();
	local l__BaseFrame__18 = p18.BaseFrame;
	local v19 = 1;
	if p17.MessageObjectLog[p19 - 1] then
		if p19 == #p17.MessageObjectLog then
			v19 = p17.MessageObjectLog[p19 - 1].BaseFrame.LayoutOrder + 1;
		else
			v19 = p17.MessageObjectLog[p19 - 1].BaseFrame.LayoutOrder;
		end;
	end;
	l__BaseFrame__18.LayoutOrder = v19;
	l__BaseFrame__18.Size = UDim2.new(1, 0, 0, p18.GetHeightFunction(p17.Scroller.AbsoluteSize.X));
	l__BaseFrame__18.Parent = p17.Scroller;
	if p18.BaseMessage then
		p17:UpdateMessageTextHeight(p18);
	end;
	if p17:IsScrolledDown() then
		p17.Scroller.CanvasPosition = Vector2.new(0, math.max(0, p17.Scroller.CanvasSize.Y.Offset - p17.Scroller.AbsoluteSize.Y));
	end;
end;
function v5.ReorderAllMessages(p20)
	p20:WaitUntilParentedCorrectly();
	if p20.GuiObject.AbsoluteSize.Y < 1 then
		return;
	end;
	for v20, v21 in pairs(p20.MessageObjectLog) do
		p20:UpdateMessageTextHeight(v21);
	end;
	if not p20:IsScrolledDown() then
		p20.Scroller.CanvasPosition = p20.Scroller.CanvasPosition;
		return;
	end;
	p20.Scroller.CanvasPosition = Vector2.new(0, math.max(0, p20.Scroller.CanvasSize.Y.Offset - p20.Scroller.AbsoluteSize.Y));
end;
function v5.Clear(p21)
	for v22, v23 in pairs(p21.MessageObjectLog) do
		v23:Destroy();
	end;
	p21.MessageObjectLog = {};
end;
function v5.SetCurrentChannelName(p22, p23)
	p22.CurrentChannelName = p23;
end;
function v5.FadeOutBackground(p24, p25)

end;
function v5.FadeInBackground(p26, p27)

end;
local u4 = require(l__Parent__4:WaitForChild("CurveUtil"));
function v5.FadeOutText(p28, p29)
	for v24 = 1, #p28.MessageObjectLog do
		if p28.MessageObjectLog[v24].FadeOutFunction then
			p28.MessageObjectLog[v24].FadeOutFunction(p29, u4);
		end;
	end;
end;
function v5.FadeInText(p30, p31)
	for v25 = 1, #p30.MessageObjectLog do
		if p30.MessageObjectLog[v25].FadeInFunction then
			p30.MessageObjectLog[v25].FadeInFunction(p31, u4);
		end;
	end;
end;
function v5.Update(p32, p33)
	for v26 = 1, #p32.MessageObjectLog do
		if p32.MessageObjectLog[v26].UpdateAnimFunction then
			p32.MessageObjectLog[v26].UpdateAnimFunction(p33, u4);
		end;
	end;
end;
function v5.WaitUntilParentedCorrectly(p34)
	while not p34.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p34.GuiObject.AncestryChanged:wait();	
	end;
end;
local function u5()
	local v27 = Instance.new("Frame");
	v27.Selectable = false;
	v27.Size = UDim2.new(1, 0, 1, 0);
	v27.BackgroundTransparency = 1;
	local v28 = Instance.new("ScrollingFrame");
	v28.Selectable = u1.GamepadNavigationEnabled;
	v28.Name = "Scroller";
	v28.BackgroundTransparency = 1;
	v28.BorderSizePixel = 0;
	v28.Position = UDim2.new(0, 0, 0, 3);
	v28.Size = UDim2.new(1, -4, 1, -6);
	v28.CanvasSize = UDim2.new(0, 0, 0, 0);
	v28.ScrollBarThickness = v3.ScrollBarThickness;
	v28.Active = true;
	v28.Parent = v27;
	local v29 = Instance.new("UIListLayout");
	v29.SortOrder = Enum.SortOrder.LayoutOrder;
	v29.Parent = v28;
	return v27, v28, v29;
end;
function v3.new()
	local v30 = setmetatable({}, v5);
	v30.Destroyed = false;
	local v31, v32, v33 = u5();
	v30.GuiObject = v31;
	v30.Scroller = v32;
	v30.Layout = v33;
	v30.MessageObjectLog = {};
	v30.Name = "MessageLogDisplay";
	v30.GuiObject.Name = "Frame_" .. v30.Name;
	v30.CurrentChannelName = "";
	v30.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		spawn(function()
			v30:ReorderAllMessages();
		end);
	end);
	local u6 = true;
	v30.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		local l__AbsoluteContentSize__34 = v30.Layout.AbsoluteContentSize;
		v30.Scroller.CanvasSize = UDim2.new(0, 0, 0, l__AbsoluteContentSize__34.Y);
		if u6 then
			v30.Scroller.CanvasPosition = Vector2.new(0, l__AbsoluteContentSize__34.Y - v30.Scroller.AbsoluteWindowSize.Y);
		end;
	end);
	v30.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		u6 = v30:IsScrolledDown();
	end);
	return v30;
end;
return v3;
