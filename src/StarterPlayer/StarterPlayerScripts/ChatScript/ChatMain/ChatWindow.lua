-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__Players__2 = game:GetService("Players");
local l__Chat__3 = game:GetService("Chat");
local l__Chat__4 = game:GetService("Chat");
local l__Parent__5 = script.Parent;
local v6 = {};
v6.__index = v6;
local u1 = require(l__Chat__4:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
function getClassicChatEnabled()
	if u1.ClassicChatEnabled ~= nil then
		return u1.ClassicChatEnabled;
	end;
	return l__Players__2.ClassicChat;
end;
function getBubbleChatEnabled()
	if u1.BubbleChatEnabled ~= nil then
		return u1.BubbleChatEnabled;
	end;
	return l__Players__2.BubbleChat;
end;
function bubbleChatOnly()
	return not getClassicChatEnabled() and getBubbleChatEnabled();
end;
function mergeProps(p1, p2)
	if p1 then
		if not p2 then
			return;
		end;
	else
		return;
	end;
	local v7, v8, v9 = pairs(p1);
	while true do
		local v10, v11 = v7(v8, v9);
		if v10 then

		else
			break;
		end;
		v9 = v10;
		if p2[v10] ~= nil then
			p2[v10] = v11;
		end;	
	end;
end;
local l__PlayerGui__2 = l__Players__2.LocalPlayer:WaitForChild("PlayerGui");
function v6.CreateGuiObjects(p3, p4)
	local u3 = nil;
	pcall(function()
		u3 = l__Chat__4:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil);
	end);
	mergeProps(u3, u1);
	local v12 = Instance.new("Frame");
	v12.BackgroundTransparency = 1;
	v12.Active = u1.WindowDraggable;
	v12.Parent = p4;
	v12.AutoLocalize = false;
	local v13 = Instance.new("Frame");
	v13.Selectable = false;
	v13.Name = "ChatBarParentFrame";
	v13.BackgroundTransparency = 1;
	v13.Parent = v12;
	local v14 = Instance.new("Frame");
	v14.Selectable = false;
	v14.Name = "ChannelsBarParentFrame";
	v14.BackgroundTransparency = 1;
	v14.Position = UDim2.new(0, 0, 0, 0);
	v14.Parent = v12;
	local v15 = Instance.new("Frame");
	v15.Selectable = false;
	v15.Name = "ChatChannelParentFrame";
	v15.BackgroundTransparency = 1;
	v15.BackgroundColor3 = u1.BackGroundColor;
	v15.BackgroundTransparency = 0.6;
	v15.BorderSizePixel = 0;
	v15.Parent = v12;
	local v16 = Instance.new("ImageButton");
	v16.Selectable = false;
	v16.Image = "";
	v16.BackgroundTransparency = 0.6;
	v16.BorderSizePixel = 0;
	v16.Visible = false;
	v16.BackgroundColor3 = u1.BackGroundColor;
	v16.Active = true;
	if bubbleChatOnly() then
		v16.Position = UDim2.new(1, -v16.AbsoluteSize.X, 0, 0);
	else
		v16.Position = UDim2.new(1, -v16.AbsoluteSize.X, 1, -v16.AbsoluteSize.Y);
	end;
	v16.Parent = v12;
	local v17 = Instance.new("ImageLabel");
	v17.Selectable = false;
	v17.Size = UDim2.new(0.8, 0, 0.8, 0);
	v17.Position = UDim2.new(0.2, 0, 0.2, 0);
	v17.BackgroundTransparency = 1;
	v17.Image = "rbxassetid://261880743";
	v17.Parent = v16;
	local function v18()
		local v19 = v12;
		while v19 and not v19:IsA("ScreenGui") do
			v19 = v19.Parent;		
		end;
		return v19;
	end;
	local v20 = 3;
	local v21 = v18();
	if v21.AbsoluteSize.X <= 640 then
		v20 = 1;
	elseif v21.AbsoluteSize.X <= 1024 then
		v20 = 2;
	end;
	local u4 = false;
	local function u5()
		if u4 then
			return;
		end;
		u4 = true;
		if not v12:IsDescendantOf(l__PlayerGui__2) then
			return;
		end;
		local v22 = v18();
		local l__MinimumWindowSize__23 = u1.MinimumWindowSize;
		local l__MaximumWindowSize__24 = u1.MaximumWindowSize;
		local v25 = l__MinimumWindowSize__23.X.Scale * v22.AbsoluteSize.X + l__MinimumWindowSize__23.X.Offset;
		local v26 = math.max(l__MinimumWindowSize__23.Y.Scale * v22.AbsoluteSize.Y + l__MinimumWindowSize__23.Y.Offset, v14.AbsoluteSize.Y + v13.AbsoluteSize.Y);
		local v27 = l__MaximumWindowSize__24.X.Scale * v22.AbsoluteSize.X + l__MaximumWindowSize__24.X.Offset;
		local v28 = l__MaximumWindowSize__24.Y.Scale * v22.AbsoluteSize.Y + l__MaximumWindowSize__24.Y.Offset;
		local l__X__29 = v12.AbsoluteSize.X;
		local l__Y__30 = v12.AbsoluteSize.Y;
		if l__X__29 < v25 then
			v12.Size = v12.Size + UDim2.new(0, v25 - l__X__29, 0, 0);
		elseif v27 < l__X__29 then
			v12.Size = v12.Size + UDim2.new(0, v27 - l__X__29, 0, 0);
		end;
		if l__Y__30 < v26 then
			v12.Size = v12.Size + UDim2.new(0, 0, 0, v26 - l__Y__30);
		elseif v28 < l__Y__30 then
			v12.Size = v12.Size + UDim2.new(0, 0, 0, v28 - l__Y__30);
		end;
		v12.Size = UDim2.new(v12.AbsoluteSize.X / v22.AbsoluteSize.X, 0, v12.AbsoluteSize.Y / v22.AbsoluteSize.Y, 0);
		u4 = false;
	end;
	v12.Changed:connect(function(p5)
		if p5 == "AbsoluteSize" then
			u5();
		end;
	end);
	v16.DragBegin:connect(function(p6)
		v12.Draggable = false;
	end);
	v16.DragStopped:connect(function(p7, p8)
		v12.Draggable = u1.WindowDraggable;
	end);
	local u6 = false;
	local function u7(p9)
		if u1.WindowDraggable == false and u1.WindowResizable == false then
			return;
		end;
		local v31 = p9 - v12.AbsolutePosition + v16.AbsoluteSize;
		v12.Size = UDim2.new(0, v31.X, 0, v31.Y);
		if bubbleChatOnly() then
			v16.Position = UDim2.new(1, -v16.AbsoluteSize.X, 0, 0);
			return;
		end;
		v16.Position = UDim2.new(1, -v16.AbsoluteSize.X, 1, -v16.AbsoluteSize.Y);
	end;
	v16.Changed:connect(function(p10)
		if p10 == "AbsolutePosition" and not v12.Draggable then
			if u6 then
				return;
			end;
			u6 = true;
			u7(v16.AbsolutePosition);
			u6 = false;
		end;
	end);
	local function v32(p11)
		if v20 == 1 then
			p11 = p11 or u1.ChatBarTextSizePhone;
		else
			p11 = p11 or u1.ChatBarTextSize;
		end;
		return p11 + 14 + 10;
	end;
	if bubbleChatOnly() then
		v13.Position = UDim2.new(0, 0, 0, 0);
		v14.Visible = false;
		v14.Active = false;
		v15.Visible = false;
		v15.Active = false;
		local v33 = v18();
		if v20 == 1 then
			local v34 = u1.DefaultWindowSizePhone.X.Scale;
			local v35 = u1.DefaultWindowSizePhone.X.Offset;
		elseif v20 == 2 then
			v34 = u1.DefaultWindowSizeTablet.X.Scale;
			v35 = u1.DefaultWindowSizeTablet.X.Offset;
		else
			v34 = u1.DefaultWindowSizeDesktop.X.Scale;
			v35 = u1.DefaultWindowSizeDesktop.X.Offset;
		end;
		v12.Size = UDim2.new(v34, v35, 0, (v32()));
		v12.Position = u1.DefaultWindowPosition;
	else
		local v36 = v18();
		if v20 == 1 then
			v12.Size = u1.DefaultWindowSizePhone;
		elseif v20 == 2 then
			v12.Size = u1.DefaultWindowSizeTablet;
		else
			v12.Size = u1.DefaultWindowSizeDesktop;
		end;
		v12.Position = u1.DefaultWindowPosition;
	end;
	if v20 == 1 then
		u1.ChatWindowTextSize = u1.ChatWindowTextSizePhone;
		u1.ChatChannelsTabTextSize = u1.ChatChannelsTabTextSizePhone;
		u1.ChatBarTextSize = u1.ChatBarTextSizePhone;
	end;
	local function v37(p12)
		v12.Active = p12;
		v12.Draggable = p12;
	end;
	local function u8(p13)
		if v20 == 1 then
			p13 = p13 or u1.ChatChannelsTabTextSizePhone;
		else
			p13 = p13 or u1.ChatChannelsTabTextSize;
		end;
		return math.max(32, p13 + 8) + 2;
	end;
	local function u9()
		local v38 = nil;
		local v39 = u8();
		v38 = v32();
		if not u1.ShowChannelsBar then
			v15.Size = UDim2.new(1, 0, 1, -(v38 + 2 + 2));
			v15.Position = UDim2.new(0, 0, 0, 2);
			return;
		end;
		v15.Size = UDim2.new(1, 0, 1, -(v39 + v38 + 2 + 2));
		v15.Position = UDim2.new(0, 0, 0, v39 + 2);
	end;
	local function v40(p14)
		v14.Size = UDim2.new(1, 0, 0, (u8(p14)));
		u9();
	end;
	local function u10(p15)
		local v41 = nil;
		v16.Visible = p15;
		v16.Draggable = p15;
		v41 = v13.Size.Y.Offset;
		if p15 then
			v13.Size = UDim2.new(1, -v41 - 2, 0, v41);
			if bubbleChatOnly() then
				return;
			end;
		else
			v13.Size = UDim2.new(1, 0, 0, v41);
			if not bubbleChatOnly() then
				v13.Position = UDim2.new(0, 0, 1, -v41);
			end;
			return;
		end;
		v13.Position = UDim2.new(0, 0, 1, -v41);
	end;
	local function v42(p16)
		local v43 = v32(p16);
		v13.Size = UDim2.new(1, 0, 0, v43);
		if not bubbleChatOnly() then
			v13.Position = UDim2.new(0, 0, 1, -v43);
		end;
		v16.Size = UDim2.new(0, v43, 0, v43);
		v16.Position = UDim2.new(1, -v43, 1, -v43);
		u9();
		u10(u1.WindowResizable);
	end;
	local function v44(p17)
		v14.Visible = p17;
		u9();
	end;
	v40(u1.ChatChannelsTabTextSize);
	v42(u1.ChatBarTextSize);
	v37(u1.WindowDraggable);
	u10(u1.WindowResizable);
	v44(u1.ShowChannelsBar);
	u1.SettingsChanged:connect(function(p18, p19)
		if p18 == "WindowDraggable" then
			v37(p19);
			return;
		end;
		if p18 == "WindowResizable" then
			u10(p19);
			return;
		end;
		if p18 == "ChatChannelsTabTextSize" then
			v40(p19);
			return;
		end;
		if p18 == "ChatBarTextSize" then
			v42(p19);
			return;
		end;
		if p18 == "ShowChannelsBar" then
			v44(p19);
		end;
	end);
	p3.GuiObject = v12;
	p3.GuiObjects.BaseFrame = v12;
	p3.GuiObjects.ChatBarParentFrame = v13;
	p3.GuiObjects.ChannelsBarParentFrame = v14;
	p3.GuiObjects.ChatChannelParentFrame = v15;
	p3.GuiObjects.ChatResizerFrame = v16;
	p3.GuiObjects.ResizeIcon = v17;
	p3:AnimGuiObjects();
end;
function v6.GetChatBar(p20)
	return p20.ChatBar;
end;
function v6.RegisterChatBar(p21, p22)
	p21.ChatBar = p22;
	p21.ChatBar:CreateGuiObjects(p21.GuiObjects.ChatBarParentFrame);
end;
function v6.RegisterChannelsBar(p23, p24)
	p23.ChannelsBar = p24;
	p23.ChannelsBar:CreateGuiObjects(p23.GuiObjects.ChannelsBarParentFrame);
end;
function v6.RegisterMessageLogDisplay(p25, p26)
	p25.MessageLogDisplay = p26;
	p25.MessageLogDisplay.GuiObject.Parent = p25.GuiObjects.ChatChannelParentFrame;
end;
local u11 = require(l__Parent__5:WaitForChild("ChatChannel"));
function v6.AddChannel(p27, p28)
	if p27:GetChannel(p28) then
		error("Channel '" .. p28 .. "' already exists!");
		return;
	end;
	local v45 = u11.new(p28, p27.MessageLogDisplay);
	p27.Channels[p28:lower()] = v45;
	v45:SetActive(false);
	local v46 = p27.ChannelsBar:AddChannelTab(p28);
	v46.NameTag.MouseButton1Click:connect(function()
		p27:SwitchCurrentChannel(p28);
	end);
	v45:RegisterChannelTab(v46);
	return v45;
end;
function v6.GetFirstChannel(p29)
	local v47, v48, v49 = pairs(p29.Channels);
	local v50, v51 = v47(v48, v49);
	if not v50 then
		return nil;
	end;
	return v51;
end;
function v6.RemoveChannel(p30, p31)
	if not p30:GetChannel(p31) then
		error("Channel '" .. p31 .. "' does not exist!");
	end;
	local v52 = p31:lower();
	local v53 = false;
	if p30.Channels[v52] == p30:GetCurrentChannel() then
		v53 = true;
		p30:SwitchCurrentChannel(nil);
	end;
	p30.Channels[v52]:Destroy();
	p30.Channels[v52] = nil;
	p30.ChannelsBar:RemoveChannelTab(p31);
	if v53 then
		if p30:GetChannel(u1.GeneralChannelName) ~= nil and v52 ~= u1.GeneralChannelName:lower() then
			local v54 = u1.GeneralChannelName;
		else
			local v55 = p30:GetFirstChannel();
			v54 = v55 and v55.Name or nil;
		end;
		p30:SwitchCurrentChannel(v54);
	end;
	if not u1.ShowChannelsBar and p30.ChatBar.TargetChannel == p31 then
		p30.ChatBar:SetChannelTarget(u1.GeneralChannelName);
	end;
end;
function v6.GetChannel(p32, p33)
	return p33 and p32.Channels[p33:lower()] or nil;
end;
function v6.GetTargetMessageChannel(p34)
	if not u1.ShowChannelsBar then
		return p34.ChatBar.TargetChannel;
	end;
	local v56 = p34:GetCurrentChannel();
	return v56 and v56.Name;
end;
function v6.GetCurrentChannel(p35)
	return p35.CurrentChannel;
end;
function v6.SwitchCurrentChannel(p36, p37)
	if not u1.ShowChannelsBar then
		local v57 = p36:GetChannel(p37);
		if v57 then
			p36.ChatBar:SetChannelTarget(v57.Name);
		end;
		p37 = u1.GeneralChannelName;
	end;
	local v58 = p36:GetCurrentChannel();
	local v59 = p36:GetChannel(p37);
	if v59 == nil then
		error(string.format("Channel '%s' does not exist.", p37));
	end;
	if v59 ~= v58 then
		if v58 then
			v58:SetActive(false);
			p36.ChannelsBar:GetChannelTab(v58.Name):SetActive(false);
		end;
		if v59 then
			v59:SetActive(true);
			p36.ChannelsBar:GetChannelTab(v59.Name):SetActive(true);
		end;
		p36.CurrentChannel = v59;
	end;
end;
function v6.UpdateFrameVisibility(p38)
	p38.GuiObject.Visible = p38.Visible and p38.CoreGuiEnabled;
end;
function v6.GetVisible(p39)
	return p39.Visible;
end;
function v6.SetVisible(p40, p41)
	p40.Visible = p41;
	p40:UpdateFrameVisibility();
end;
function v6.GetCoreGuiEnabled(p42)
	return p42.CoreGuiEnabled;
end;
function v6.SetCoreGuiEnabled(p43, p44)
	p43.CoreGuiEnabled = p44;
	p43:UpdateFrameVisibility();
end;
function v6.EnableResizable(p45)
	p45.GuiObjects.ChatResizerFrame.Active = true;
end;
function v6.DisableResizable(p46)
	p46.GuiObjects.ChatResizerFrame.Active = false;
end;
local u12 = require(l__Parent__5:WaitForChild("CurveUtil"));
function v6.FadeOutBackground(p47, p48)
	p47.ChannelsBar:FadeOutBackground(p48);
	p47.MessageLogDisplay:FadeOutBackground(p48);
	p47.ChatBar:FadeOutBackground(p48);
	p47.AnimParams.Background_TargetTransparency = 1;
	p47.AnimParams.Background_NormalizedExptValue = u12:NormalizedDefaultExptValueInSeconds(p48);
end;
function v6.FadeInBackground(p49, p50)
	p49.ChannelsBar:FadeInBackground(p50);
	p49.MessageLogDisplay:FadeInBackground(p50);
	p49.ChatBar:FadeInBackground(p50);
	p49.AnimParams.Background_TargetTransparency = 0.6;
	p49.AnimParams.Background_NormalizedExptValue = u12:NormalizedDefaultExptValueInSeconds(p50);
end;
function v6.FadeOutText(p51, p52)
	p51.MessageLogDisplay:FadeOutText(p52);
	p51.ChannelsBar:FadeOutText(p52);
end;
function v6.FadeInText(p53, p54)
	p53.MessageLogDisplay:FadeInText(p54);
	p53.ChannelsBar:FadeInText(p54);
end;
function v6.AnimGuiObjects(p55)
	p55.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = p55.AnimParams.Background_CurrentTransparency;
	p55.GuiObjects.ChatResizerFrame.BackgroundTransparency = p55.AnimParams.Background_CurrentTransparency;
	p55.GuiObjects.ResizeIcon.ImageTransparency = p55.AnimParams.Background_CurrentTransparency;
end;
function v6.InitializeAnimParams(p56)
	p56.AnimParams.Background_TargetTransparency = 0.6;
	p56.AnimParams.Background_CurrentTransparency = 0.6;
	p56.AnimParams.Background_NormalizedExptValue = u12:NormalizedDefaultExptValueInSeconds(0);
end;
function v6.Update(p57, p58)
	p57.ChatBar:Update(p58);
	p57.ChannelsBar:Update(p58);
	p57.MessageLogDisplay:Update(p58);
	p57.AnimParams.Background_CurrentTransparency = u12:Expt(p57.AnimParams.Background_CurrentTransparency, p57.AnimParams.Background_TargetTransparency, p57.AnimParams.Background_NormalizedExptValue, p58);
	p57:AnimGuiObjects();
end;
function v1.new()
	local v60 = setmetatable({}, v6);
	v60.GuiObject = nil;
	v60.GuiObjects = {};
	v60.ChatBar = nil;
	v60.ChannelsBar = nil;
	v60.MessageLogDisplay = nil;
	v60.Channels = {};
	v60.CurrentChannel = nil;
	v60.Visible = true;
	v60.CoreGuiEnabled = true;
	v60.AnimParams = {};
	v60:InitializeAnimParams();
	return v60;
end;
return v1;
