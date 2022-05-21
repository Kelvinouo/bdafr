-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__PlayerGui__2 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
local l__Parent__3 = script.Parent;
local v4 = {};
v4.__index = v4;
local u1 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
local u2 = require(l__Parent__3:WaitForChild("MessageSender"));
function v4.CreateGuiObjects(p1, p2)
	local v5 = Instance.new("Frame");
	v5.Selectable = false;
	v5.Size = UDim2.new(1, 0, 1, 0);
	v5.BackgroundTransparency = 1;
	v5.Parent = p2;
	local v6 = Instance.new("Frame");
	v6.Selectable = false;
	v6.Name = "ScrollingBase";
	v6.BackgroundTransparency = 1;
	v6.ClipsDescendants = true;
	v6.Size = UDim2.new(1, 0, 1, 0);
	v6.Position = UDim2.new(0, 0, 0, 0);
	v6.Parent = v5;
	local v7 = Instance.new("Frame");
	v7.Selectable = false;
	v7.Name = "ScrollerSizer";
	v7.BackgroundTransparency = 1;
	v7.Size = UDim2.new(1, 0, 1, 0);
	v7.Position = UDim2.new(0, 0, 0, 0);
	v7.Parent = v6;
	local v8 = Instance.new("Frame");
	v8.Selectable = false;
	v8.Name = "ScrollerFrame";
	v8.BackgroundTransparency = 1;
	v8.Size = UDim2.new(1, 0, 1, 0);
	v8.Position = UDim2.new(0, 0, 0, 0);
	v8.Parent = v7;
	local v9 = Instance.new("Frame");
	v9.Selectable = false;
	v9.Size = UDim2.new(1, 0, 1, 0);
	v9.Position = UDim2.new(0, 0, 0, 0);
	v9.ClipsDescendants = true;
	v9.BackgroundTransparency = 1;
	v9.Parent = v5;
	local v10 = Instance.new("Frame");
	v10.Selectable = false;
	v10.Name = "LeaveConfirmationFrame";
	v10.Size = UDim2.new(1, 0, 1, 0);
	v10.Position = UDim2.new(0, 0, 1, 0);
	v10.BackgroundTransparency = 0.6;
	v10.BorderSizePixel = 0;
	v10.BackgroundColor3 = Color3.new(0, 0, 0);
	v10.Parent = v9;
	local v11 = Instance.new("TextButton");
	v11.Selectable = false;
	v11.Size = UDim2.new(1, 0, 1, 0);
	v11.BackgroundTransparency = 1;
	v11.Text = "";
	v11.Parent = v10;
	local v12 = Instance.new("TextButton");
	v12.Selectable = false;
	v12.Size = UDim2.new(0.25, 0, 1, 0);
	v12.BackgroundTransparency = 1;
	v12.Font = u1.DefaultFont;
	v12.TextSize = 18;
	v12.TextStrokeTransparency = 0.75;
	v12.Position = UDim2.new(0, 0, 0, 0);
	v12.TextColor3 = Color3.new(0, 1, 0);
	v12.Text = "Confirm";
	v12.Parent = v10;
	local v13 = v12:Clone();
	v13.Parent = v10;
	v13.Position = UDim2.new(0.75, 0, 0, 0);
	v13.TextColor3 = Color3.new(1, 0, 0);
	v13.Text = "Cancel";
	local v14 = Instance.new("TextLabel");
	v14.Selectable = false;
	v14.Size = UDim2.new(0.5, 0, 1, 0);
	v14.Position = UDim2.new(0.25, 0, 0, 0);
	v14.BackgroundTransparency = 1;
	v14.TextColor3 = Color3.new(1, 1, 1);
	v14.TextStrokeTransparency = 0.75;
	v14.Text = "Leave channel <XX>?";
	v14.Font = u1.DefaultFont;
	v14.TextSize = 18;
	v14.Parent = v10;
	local v15 = Instance.new("StringValue");
	v15.Name = "LeaveTarget";
	v15.Parent = v10;
	local l__Position__3 = v10.Position;
	v12.MouseButton1Click:connect(function()
		u2:SendMessage(string.format("/leave %s", v15.Value), nil);
		v10:TweenPosition(l__Position__3, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
	end);
	v13.MouseButton1Click:connect(function()
		v10:TweenPosition(l__Position__3, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
	end);
	local v16 = Instance.new("ImageButton", v5);
	v16.Selectable = u1.GamepadNavigationEnabled;
	v16.Name = "PageLeftButton";
	v16.SizeConstraint = Enum.SizeConstraint.RelativeYY;
	v16.Size = UDim2.new(0.7, 0, 0.7, 0);
	v16.BackgroundTransparency = 1;
	v16.Position = UDim2.new(0, 4, 0.15000000000000002, 0);
	v16.Visible = false;
	v16.Image = "rbxassetid://471630199";
	local v17 = Instance.new("ImageLabel", v16);
	v17.Name = "ArrowLabel";
	v17.BackgroundTransparency = 1;
	v17.Size = UDim2.new(0.4, 0, 0.4, 0);
	v17.Image = "rbxassetid://471630112";
	local v18 = Instance.new("Frame", v5);
	v18.Selectable = false;
	v18.BackgroundTransparency = 1;
	v18.Name = "PositionalHelper";
	v18.Size = v16.Size;
	v18.SizeConstraint = v16.SizeConstraint;
	v18.Position = UDim2.new(1, 0, 0.15000000000000002, 0);
	local v19 = v16:Clone();
	v19.Parent = v18;
	v19.Name = "PageRightButton";
	v19.Size = UDim2.new(1, 0, 1, 0);
	v19.SizeConstraint = Enum.SizeConstraint.RelativeXY;
	v19.Position = UDim2.new(-1, -4, 0, 0);
	local v20 = UDim2.new(0.05, 0, 0, 0);
	v19.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + v20;
	v16.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - v20;
	v16.ArrowLabel.Rotation = 180;
	p1.GuiObject = v5;
	p1.GuiObjects.BaseFrame = v5;
	p1.GuiObjects.ScrollerSizer = v7;
	p1.GuiObjects.ScrollerFrame = v8;
	p1.GuiObjects.PageLeftButton = v16;
	p1.GuiObjects.PageRightButton = v19;
	p1.GuiObjects.LeaveConfirmationFrame = v10;
	p1.GuiObjects.LeaveConfirmationNotice = v14;
	p1.GuiObjects.PageLeftButtonArrow = v16.ArrowLabel;
	p1.GuiObjects.PageRightButtonArrow = v19.ArrowLabel;
	p1:AnimGuiObjects();
	v16.MouseButton1Click:connect(function()
		p1:ScrollChannelsFrame(-1);
	end);
	v19.MouseButton1Click:connect(function()
		p1:ScrollChannelsFrame(1);
	end);
	p1:ScrollChannelsFrame(0);
end;
function v4.UpdateMessagePostedInChannel(p3, p4)
	local v21 = p3:GetChannelTab(p4);
	if v21 then
		v21:UpdateMessagePostedInChannel();
		return;
	end;
	warn("ChannelsTab '" .. p4 .. "' does not exist!");
end;
local u4 = require(l__Parent__3:WaitForChild("ChannelsTab"));
function v4.AddChannelTab(p5, p6)
	if p5:GetChannelTab(p6) then
		error("Channel tab '" .. p6 .. "'already exists!");
	end;
	local v22 = u4.new(p6);
	v22.GuiObject.Parent = p5.GuiObjects.ScrollerFrame;
	p5.ChannelTabs[p6:lower()] = v22;
	p5.NumTabs = p5.NumTabs + 1;
	p5:OrganizeChannelTabs();
	if u1.RightClickToLeaveChannelEnabled then
		v22.NameTag.MouseButton2Click:connect(function()
			p5.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", v22.ChannelName);
			p5.LeaveConfirmationFrame.LeaveTarget.Value = v22.ChannelName;
			p5.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true);
		end);
	end;
	return v22;
end;
function v4.RemoveChannelTab(p7, p8)
	if not p7:GetChannelTab(p8) then
		error("Channel tab '" .. p8 .. "'does not exist!");
	end;
	local v23 = p8:lower();
	p7.ChannelTabs[v23]:Destroy();
	p7.ChannelTabs[v23] = nil;
	p7.NumTabs = p7.NumTabs - 1;
	p7:OrganizeChannelTabs();
end;
function v4.GetChannelTab(p9, p10)
	return p9.ChannelTabs[p10:lower()];
end;
function v4.OrganizeChannelTabs(p11)
	local v24 = {};
	table.insert(v24, p11:GetChannelTab(u1.GeneralChannelName));
	table.insert(v24, p11:GetChannelTab("System"));
	for v25, v26 in pairs(p11.ChannelTabs) do
		if v26.ChannelName ~= u1.GeneralChannelName and v26.ChannelName ~= "System" then
			table.insert(v24, v26);
		end;
	end;
	for v27, v28 in pairs(v24) do
		v28.GuiObject.Position = UDim2.new(v27 - 1, 0, 0, 0);
	end;
	p11.GuiObjects.ScrollerSizer.Size = UDim2.new(1 / math.max(1, math.min(u1.ChannelsBarFullTabSize, p11.NumTabs)), 0, 1, 0);
	p11:ScrollChannelsFrame(0);
end;
function v4.ResizeChannelTabText(p12, p13)
	for v29, v30 in pairs(p12.ChannelTabs) do
		v30:SetTextSize(p13);
	end;
end;
function v4.ScrollChannelsFrame(p14, p15)
	if p14.ScrollChannelsFrameLock then
		return;
	end;
	p14.ScrollChannelsFrameLock = true;
	local l__ChannelsBarFullTabSize__31 = u1.ChannelsBarFullTabSize;
	local v32 = p14.CurPageNum + p15;
	if v32 < 0 then
		v32 = 0;
	elseif v32 > 0 and p14.NumTabs < v32 + l__ChannelsBarFullTabSize__31 then
		v32 = p14.NumTabs - l__ChannelsBarFullTabSize__31;
	end;
	p14.CurPageNum = v32;
	local v33 = UDim2.new(-p14.CurPageNum, 0, 0, 0);
	p14.GuiObjects.PageLeftButton.Visible = p14.CurPageNum > 0;
	p14.GuiObjects.PageRightButton.Visible = p14.CurPageNum + l__ChannelsBarFullTabSize__31 < p14.NumTabs;
	if p15 == 0 then
		p14.ScrollChannelsFrameLock = false;
		return;
	end;
	p14:WaitUntilParentedCorrectly();
	p14.GuiObjects.ScrollerFrame:TweenPosition(v33, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, function()
		p14.ScrollChannelsFrameLock = false;
	end);
end;
local u5 = require(l__Parent__3:WaitForChild("CurveUtil"));
function v4.FadeOutBackground(p16, p17)
	for v34, v35 in pairs(p16.ChannelTabs) do
		v35:FadeOutBackground(p17);
	end;
	p16.AnimParams.Background_TargetTransparency = 1;
	p16.AnimParams.Background_NormalizedExptValue = u5:NormalizedDefaultExptValueInSeconds(p17);
end;
function v4.FadeInBackground(p18, p19)
	for v36, v37 in pairs(p18.ChannelTabs) do
		v37:FadeInBackground(p19);
	end;
	p18.AnimParams.Background_TargetTransparency = 0.6;
	p18.AnimParams.Background_NormalizedExptValue = u5:NormalizedDefaultExptValueInSeconds(p19);
end;
function v4.FadeOutText(p20, p21)
	for v38, v39 in pairs(p20.ChannelTabs) do
		v39:FadeOutText(p21);
	end;
end;
function v4.FadeInText(p22, p23)
	for v40, v41 in pairs(p22.ChannelTabs) do
		v41:FadeInText(p23);
	end;
end;
function v4.AnimGuiObjects(p24)
	p24.GuiObjects.PageLeftButton.ImageTransparency = p24.AnimParams.Background_CurrentTransparency;
	p24.GuiObjects.PageRightButton.ImageTransparency = p24.AnimParams.Background_CurrentTransparency;
	p24.GuiObjects.PageLeftButtonArrow.ImageTransparency = p24.AnimParams.Background_CurrentTransparency;
	p24.GuiObjects.PageRightButtonArrow.ImageTransparency = p24.AnimParams.Background_CurrentTransparency;
end;
function v4.InitializeAnimParams(p25)
	p25.AnimParams.Background_TargetTransparency = 0.6;
	p25.AnimParams.Background_CurrentTransparency = 0.6;
	p25.AnimParams.Background_NormalizedExptValue = u5:NormalizedDefaultExptValueInSeconds(0);
end;
function v4.Update(p26, p27)
	for v42, v43 in pairs(p26.ChannelTabs) do
		v43:Update(p27);
	end;
	p26.AnimParams.Background_CurrentTransparency = u5:Expt(p26.AnimParams.Background_CurrentTransparency, p26.AnimParams.Background_TargetTransparency, p26.AnimParams.Background_NormalizedExptValue, p27);
	p26:AnimGuiObjects();
end;
function v4.WaitUntilParentedCorrectly(p28)
	while not p28.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p28.GuiObject.AncestryChanged:wait();	
	end;
end;
function v1.new()
	local v44 = setmetatable({}, v4);
	v44.GuiObject = nil;
	v44.GuiObjects = {};
	v44.ChannelTabs = {};
	v44.NumTabs = 0;
	v44.CurPageNum = 0;
	v44.ScrollChannelsFrameLock = false;
	v44.AnimParams = {};
	v44:InitializeAnimParams();
	u1.SettingsChanged:connect(function(p29, p30)
		if p29 == "ChatChannelsTabTextSize" then
			v44:ResizeChannelTabText(p30);
		end;
	end);
	return v44;
end;
return v1;
