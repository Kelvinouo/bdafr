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
	local v12 = nil;
	local u3 = nil;
	pcall(function()
		u3 = l__Chat__4:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil);
	end);
	mergeProps(u3, u1);
	local v13 = Instance.new("Frame");
	v13.BackgroundTransparency = 1;
	v13.Active = u1.WindowDraggable;
	v13.Parent = p4;
	v13.AutoLocalize = false;
	local v14 = Instance.new("Frame");
	v14.Selectable = false;
	v14.Name = "ChatBarParentFrame";
	v14.BackgroundTransparency = 1;
	v14.Parent = v13;
	local v15 = Instance.new("Frame");
	v15.Selectable = false;
	v15.Name = "ChannelsBarParentFrame";
	v15.BackgroundTransparency = 1;
	v15.Position = UDim2.new(0, 0, 0, 0);
	v15.Parent = v13;
	local v16 = Instance.new("Frame");
	v16.Selectable = false;
	v16.Name = "ChatChannelParentFrame";
	v16.BackgroundTransparency = 1;
	v16.BackgroundColor3 = u1.BackGroundColor;
	v16.BackgroundTransparency = 0.6;
	v16.BorderSizePixel = 0;
	v16.Parent = v13;
	local v17 = Instance.new("ImageButton");
	v17.Selectable = false;
	v17.Image = "";
	v17.BackgroundTransparency = 0.6;
	v17.BorderSizePixel = 0;
	v17.Visible = false;
	v17.BackgroundColor3 = u1.BackGroundColor;
	v17.Active = true;
	if bubbleChatOnly() then
		v17.Position = UDim2.new(1, -v17.AbsoluteSize.X, 0, 0);
	else
		v17.Position = UDim2.new(1, -v17.AbsoluteSize.X, 1, -v17.AbsoluteSize.Y);
	end;
	v17.Parent = v13;
	local v18 = Instance.new("ImageLabel");
	v18.Selectable = false;
	v18.Size = UDim2.new(0.8, 0, 0.8, 0);
	v18.Position = UDim2.new(0.2, 0, 0.2, 0);
	v18.BackgroundTransparency = 1;
	v18.Image = "rbxassetid://261880743";
	v18.Parent = v17;
	local v19 = 3;
	local v20 = v13;
	while v20 and not v20:IsA("ScreenGui") do
		v20 = v20.Parent;	
	end;
	if v20.AbsoluteSize.X <= 640 then
		v19 = 1;
	elseif v20.AbsoluteSize.X <= 1024 then
		v19 = 2;
	end;
	local u4 = false;
	local function u5()
		if u4 then
			return;
		end;
		u4 = true;
		if not v13:IsDescendantOf(l__PlayerGui__2) then
			return;
		end;
		local v21 = v13;
		while v21 and not v21:IsA("ScreenGui") do
			v21 = v21.Parent;		
		end;
		local l__MinimumWindowSize__22 = u1.MinimumWindowSize;
		local l__MaximumWindowSize__23 = u1.MaximumWindowSize;
		local v24 = l__MinimumWindowSize__22.X.Scale * v21.AbsoluteSize.X + l__MinimumWindowSize__22.X.Offset;
		local v25 = math.max(l__MinimumWindowSize__22.Y.Scale * v21.AbsoluteSize.Y + l__MinimumWindowSize__22.Y.Offset, v15.AbsoluteSize.Y + v14.AbsoluteSize.Y);
		local v26 = l__MaximumWindowSize__23.X.Scale * v21.AbsoluteSize.X + l__MaximumWindowSize__23.X.Offset;
		local v27 = l__MaximumWindowSize__23.Y.Scale * v21.AbsoluteSize.Y + l__MaximumWindowSize__23.Y.Offset;
		local l__X__28 = v13.AbsoluteSize.X;
		local l__Y__29 = v13.AbsoluteSize.Y;
		if l__X__28 < v24 then
			v13.Size = v13.Size + UDim2.new(0, v24 - l__X__28, 0, 0);
		elseif v26 < l__X__28 then
			v13.Size = v13.Size + UDim2.new(0, v26 - l__X__28, 0, 0);
		end;
		if l__Y__29 < v25 then
			v13.Size = v13.Size + UDim2.new(0, 0, 0, v25 - l__Y__29);
		elseif v27 < l__Y__29 then
			v13.Size = v13.Size + UDim2.new(0, 0, 0, v27 - l__Y__29);
		end;
		v13.Size = UDim2.new(v13.AbsoluteSize.X / v21.AbsoluteSize.X, 0, v13.AbsoluteSize.Y / v21.AbsoluteSize.Y, 0);
		u4 = false;
	end;
	v13.Changed:connect(function(p5)
		if p5 == "AbsoluteSize" then
			u5();
		end;
	end);
	v17.DragBegin:connect(function(p6)
		v13.Draggable = false;
	end);
	v17.DragStopped:connect(function(p7, p8)
		v13.Draggable = u1.WindowDraggable;
	end);
	local u6 = false;
	local function u7(p9)
		if u1.WindowDraggable == false and u1.WindowResizable == false then
			return;
		end;
		local v30 = p9 - v13.AbsolutePosition + v17.AbsoluteSize;
		v13.Size = UDim2.new(0, v30.X, 0, v30.Y);
		if bubbleChatOnly() then
			v17.Position = UDim2.new(1, -v17.AbsoluteSize.X, 0, 0);
			return;
		end;
		v17.Position = UDim2.new(1, -v17.AbsoluteSize.X, 1, -v17.AbsoluteSize.Y);
	end;
	v17.Changed:connect(function(p10)
		if p10 == "AbsolutePosition" and not v13.Draggable then
			if u6 then
				return;
			end;
			u6 = true;
			u7(v17.AbsolutePosition);
			u6 = false;
		end;
	end);
	if bubbleChatOnly() then
		local v31 = nil;
		v14.Position = UDim2.new(0, 0, 0, 0);
		v15.Visible = false;
		v15.Active = false;
		v16.Visible = false;
		v16.Active = false;
		local v32 = v13;
		while v32 and not v32:IsA("ScreenGui") do
			v32 = v32.Parent;		
		end;
		if v19 == 1 then
			local v33 = u1.DefaultWindowSizePhone.X.Scale;
			local v34 = u1.DefaultWindowSizePhone.X.Offset;
		elseif v19 == 2 then
			v33 = u1.DefaultWindowSizeTablet.X.Scale;
			v34 = u1.DefaultWindowSizeTablet.X.Offset;
		else
			v33 = u1.DefaultWindowSizeDesktop.X.Scale;
			v34 = u1.DefaultWindowSizeDesktop.X.Offset;
		end;
		v31 = nil;
		if v19 == 1 then
			local v35 = v31 or u1.ChatBarTextSizePhone;
		else
			v35 = v31 or u1.ChatBarTextSize;
		end;
		v13.Size = UDim2.new(v33, v34, 0, v35 + 14 + 10);
		v13.Position = u1.DefaultWindowPosition;
	else
		local v36 = v13;
		while v36 and not v36:IsA("ScreenGui") do
			v36 = v36.Parent;		
		end;
		if v19 == 1 then
			v13.Size = u1.DefaultWindowSizePhone;
		elseif v19 == 2 then
			v13.Size = u1.DefaultWindowSizeTablet;
		else
			v13.Size = u1.DefaultWindowSizeDesktop;
		end;
		v13.Position = u1.DefaultWindowPosition;
	end;
	if v19 == 1 then
		u1.ChatWindowTextSize = u1.ChatWindowTextSizePhone;
		u1.ChatChannelsTabTextSize = u1.ChatChannelsTabTextSizePhone;
		u1.ChatBarTextSize = u1.ChatBarTextSizePhone;
	end;
	local function u8()
		local v37 = nil;
		local v38 = nil;
		v37 = nil;
		if v19 == 1 then
			local v39 = v37 or u1.ChatChannelsTabTextSizePhone;
		else
			v39 = v37 or u1.ChatChannelsTabTextSize;
		end;
		local v40 = math.max(32, v39 + 8) + 2;
		v38 = nil;
		if v19 == 1 then
			local v41 = v38 or u1.ChatBarTextSizePhone;
		else
			v41 = v38 or u1.ChatBarTextSize;
		end;
		local v42 = v41 + 14 + 10;
		if not u1.ShowChannelsBar then
			v16.Size = UDim2.new(1, 0, 1, -(v42 + 2 + 2));
			v16.Position = UDim2.new(0, 0, 0, 2);
			return;
		end;
		v16.Size = UDim2.new(1, 0, 1, -(v40 + v42 + 2 + 2));
		v16.Position = UDim2.new(0, 0, 0, v40 + 2);
	end;
	local function u9(p11)
		local v43 = nil;
		v17.Visible = p11;
		v17.Draggable = p11;
		v43 = v14.Size.Y.Offset;
		if p11 then
			v14.Size = UDim2.new(1, -v43 - 2, 0, v43);
			if bubbleChatOnly() then
				return;
			end;
		else
			v14.Size = UDim2.new(1, 0, 0, v43);
			if not bubbleChatOnly() then
				v14.Position = UDim2.new(0, 0, 1, -v43);
			end;
			return;
		end;
		v14.Position = UDim2.new(0, 0, 1, -v43);
	end;
	local function v44(p12)
		local v45 = nil;
		v45 = p12;
		if v19 == 1 then
			local v46 = v45 or u1.ChatBarTextSizePhone;
		else
			v46 = v45 or u1.ChatBarTextSize;
		end;
		local v47 = v46 + 14 + 10;
		v14.Size = UDim2.new(1, 0, 0, v47);
		if not bubbleChatOnly() then
			v14.Position = UDim2.new(0, 0, 1, -v47);
		end;
		v17.Size = UDim2.new(0, v47, 0, v47);
		v17.Position = UDim2.new(1, -v47, 1, -v47);
		u8();
		u9(u1.WindowResizable);
	end;
	v12 = u1.ChatChannelsTabTextSize;
	if v19 == 1 then
		local v48 = v12 or u1.ChatChannelsTabTextSizePhone;
	else
		v48 = v12 or u1.ChatChannelsTabTextSize;
	end;
	v15.Size = UDim2.new(1, 0, 0, math.max(32, v48 + 8) + 2);
	u8();
	v44(u1.ChatBarTextSize);
	local l__WindowDraggable__49 = u1.WindowDraggable;
	v13.Active = l__WindowDraggable__49;
	v13.Draggable = l__WindowDraggable__49;
	u9(u1.WindowResizable);
	v15.Visible = u1.ShowChannelsBar;
	u8();
	u1.SettingsChanged:connect(function(p13, p14)
		local v50 = nil;
		if p13 == "WindowDraggable" then
			v13.Active = p14;
			v13.Draggable = p14;
			return;
		end;
		if p13 == "WindowResizable" then
			u9(p14);
			return;
		end;
		if p13 ~= "ChatChannelsTabTextSize" then
			if p13 == "ChatBarTextSize" then
				v44(p14);
				return;
			else
				if p13 == "ShowChannelsBar" then
					v15.Visible = p14;
					u8();
				end;
				return;
			end;
		end;
		v50 = p14;
		if v19 == 1 then
			local v51 = v50 or u1.ChatChannelsTabTextSizePhone;
		else
			v51 = v50 or u1.ChatChannelsTabTextSize;
		end;
		v15.Size = UDim2.new(1, 0, 0, math.max(32, v51 + 8) + 2);
		u8();
	end);
	p3.GuiObject = v13;
	p3.GuiObjects.BaseFrame = v13;
	p3.GuiObjects.ChatBarParentFrame = v14;
	p3.GuiObjects.ChannelsBarParentFrame = v15;
	p3.GuiObjects.ChatChannelParentFrame = v16;
	p3.GuiObjects.ChatResizerFrame = v17;
	p3.GuiObjects.ResizeIcon = v18;
	p3:AnimGuiObjects();
end;
function v6.GetChatBar(p15)
	return p15.ChatBar;
end;
function v6.RegisterChatBar(p16, p17)
	p16.ChatBar = p17;
	p16.ChatBar:CreateGuiObjects(p16.GuiObjects.ChatBarParentFrame);
end;
function v6.RegisterChannelsBar(p18, p19)
	p18.ChannelsBar = p19;
	p18.ChannelsBar:CreateGuiObjects(p18.GuiObjects.ChannelsBarParentFrame);
end;
function v6.RegisterMessageLogDisplay(p20, p21)
	p20.MessageLogDisplay = p21;
	p20.MessageLogDisplay.GuiObject.Parent = p20.GuiObjects.ChatChannelParentFrame;
end;
local u10 = require(l__Parent__5:WaitForChild("ChatChannel"));
function v6.AddChannel(p22, p23)
	if p22:GetChannel(p23) then
		error("Channel '" .. p23 .. "' already exists!");
		return;
	end;
	local v52 = u10.new(p23, p22.MessageLogDisplay);
	p22.Channels[p23:lower()] = v52;
	v52:SetActive(false);
	local v53 = p22.ChannelsBar:AddChannelTab(p23);
	v53.NameTag.MouseButton1Click:connect(function()
		p22:SwitchCurrentChannel(p23);
	end);
	v52:RegisterChannelTab(v53);
	return v52;
end;
function v6.GetFirstChannel(p24)
	local v54, v55, v56 = pairs(p24.Channels);
	local v57, v58 = v54(v55, v56);
	if not v57 then
		return nil;
	end;
	return v58;
end;
function v6.RemoveChannel(p25, p26)
	if not p25:GetChannel(p26) then
		error("Channel '" .. p26 .. "' does not exist!");
	end;
	local v59 = p26:lower();
	local v60 = false;
	if p25.Channels[v59] == p25:GetCurrentChannel() then
		v60 = true;
		p25:SwitchCurrentChannel(nil);
	end;
	p25.Channels[v59]:Destroy();
	p25.Channels[v59] = nil;
	p25.ChannelsBar:RemoveChannelTab(p26);
	if v60 then
		if p25:GetChannel(u1.GeneralChannelName) ~= nil and v59 ~= u1.GeneralChannelName:lower() then
			local v61 = u1.GeneralChannelName;
		else
			local v62 = p25:GetFirstChannel();
			v61 = v62 and v62.Name or nil;
		end;
		p25:SwitchCurrentChannel(v61);
	end;
	if not u1.ShowChannelsBar and p25.ChatBar.TargetChannel == p26 then
		p25.ChatBar:SetChannelTarget(u1.GeneralChannelName);
	end;
end;
function v6.GetChannel(p27, p28)
	return p28 and p27.Channels[p28:lower()] or nil;
end;
function v6.GetTargetMessageChannel(p29)
	if not u1.ShowChannelsBar then
		return p29.ChatBar.TargetChannel;
	end;
	local v63 = p29:GetCurrentChannel();
	return v63 and v63.Name;
end;
function v6.GetCurrentChannel(p30)
	return p30.CurrentChannel;
end;
function v6.SwitchCurrentChannel(p31, p32)
	if not u1.ShowChannelsBar then
		local v64 = p31:GetChannel(p32);
		if v64 then
			p31.ChatBar:SetChannelTarget(v64.Name);
		end;
		p32 = u1.GeneralChannelName;
	end;
	local v65 = p31:GetCurrentChannel();
	local v66 = p31:GetChannel(p32);
	if v66 == nil then
		error(string.format("Channel '%s' does not exist.", p32));
	end;
	if v66 ~= v65 then
		if v65 then
			v65:SetActive(false);
			p31.ChannelsBar:GetChannelTab(v65.Name):SetActive(false);
		end;
		if v66 then
			v66:SetActive(true);
			p31.ChannelsBar:GetChannelTab(v66.Name):SetActive(true);
		end;
		p31.CurrentChannel = v66;
	end;
end;
function v6.UpdateFrameVisibility(p33)
	p33.GuiObject.Visible = p33.Visible and p33.CoreGuiEnabled;
end;
function v6.GetVisible(p34)
	return p34.Visible;
end;
function v6.SetVisible(p35, p36)
	p35.Visible = p36;
	p35:UpdateFrameVisibility();
end;
function v6.GetCoreGuiEnabled(p37)
	return p37.CoreGuiEnabled;
end;
function v6.SetCoreGuiEnabled(p38, p39)
	p38.CoreGuiEnabled = p39;
	p38:UpdateFrameVisibility();
end;
function v6.EnableResizable(p40)
	p40.GuiObjects.ChatResizerFrame.Active = true;
end;
function v6.DisableResizable(p41)
	p41.GuiObjects.ChatResizerFrame.Active = false;
end;
local u11 = require(l__Parent__5:WaitForChild("CurveUtil"));
function v6.FadeOutBackground(p42, p43)
	p42.ChannelsBar:FadeOutBackground(p43);
	p42.MessageLogDisplay:FadeOutBackground(p43);
	p42.ChatBar:FadeOutBackground(p43);
	p42.AnimParams.Background_TargetTransparency = 1;
	p42.AnimParams.Background_NormalizedExptValue = u11:NormalizedDefaultExptValueInSeconds(p43);
end;
function v6.FadeInBackground(p44, p45)
	p44.ChannelsBar:FadeInBackground(p45);
	p44.MessageLogDisplay:FadeInBackground(p45);
	p44.ChatBar:FadeInBackground(p45);
	p44.AnimParams.Background_TargetTransparency = 0.6;
	p44.AnimParams.Background_NormalizedExptValue = u11:NormalizedDefaultExptValueInSeconds(p45);
end;
function v6.FadeOutText(p46, p47)
	p46.MessageLogDisplay:FadeOutText(p47);
	p46.ChannelsBar:FadeOutText(p47);
end;
function v6.FadeInText(p48, p49)
	p48.MessageLogDisplay:FadeInText(p49);
	p48.ChannelsBar:FadeInText(p49);
end;
function v6.AnimGuiObjects(p50)
	p50.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = p50.AnimParams.Background_CurrentTransparency;
	p50.GuiObjects.ChatResizerFrame.BackgroundTransparency = p50.AnimParams.Background_CurrentTransparency;
	p50.GuiObjects.ResizeIcon.ImageTransparency = p50.AnimParams.Background_CurrentTransparency;
end;
function v6.InitializeAnimParams(p51)
	p51.AnimParams.Background_TargetTransparency = 0.6;
	p51.AnimParams.Background_CurrentTransparency = 0.6;
	p51.AnimParams.Background_NormalizedExptValue = u11:NormalizedDefaultExptValueInSeconds(0);
end;
function v6.Update(p52, p53)
	p52.ChatBar:Update(p53);
	p52.ChannelsBar:Update(p53);
	p52.MessageLogDisplay:Update(p53);
	p52.AnimParams.Background_CurrentTransparency = u11:Expt(p52.AnimParams.Background_CurrentTransparency, p52.AnimParams.Background_TargetTransparency, p52.AnimParams.Background_NormalizedExptValue, p53);
	p52:AnimGuiObjects();
end;
function v1.new()
	local v67 = setmetatable({}, v6);
	v67.GuiObject = nil;
	v67.GuiObjects = {};
	v67.ChatBar = nil;
	v67.ChannelsBar = nil;
	v67.MessageLogDisplay = nil;
	v67.Channels = {};
	v67.CurrentChannel = nil;
	v67.Visible = true;
	v67.CoreGuiEnabled = true;
	v67.AnimParams = {};
	v67:InitializeAnimParams();
	return v67;
end;
return v1;
