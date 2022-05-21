-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__UserInputService__2 = game:GetService("UserInputService");
local l__RunService__3 = game:GetService("RunService");
local l__Players__4 = game:GetService("Players");
local l__TextService__5 = game:GetService("TextService");
local v6 = l__Players__4.LocalPlayer;
while not v6 do
	l__Players__4.PlayerAdded:wait();
	v6 = l__Players__4.LocalPlayer;
end;
local l__Chat__7 = game:GetService("Chat");
local l__ClientChatModules__8 = l__Chat__7:WaitForChild("ClientChatModules");
local l__Parent__9 = script.Parent;
local v10 = require(l__ClientChatModules__8:WaitForChild("ChatSettings"));
local v11 = require(l__Parent__9:WaitForChild("CurveUtil"));
local v12 = require(l__ClientChatModules__8:WaitForChild("CommandModules"):WaitForChild("Whisper"));
local v13 = require(l__Parent__9:WaitForChild("MessageSender"));
local u1 = nil;
pcall(function()
	u1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if u1 == nil then
	u1 = {
		Get = function(p1, p2, p3)
			return p3;
		end
	};
end;
local v14 = {};
v14.__index = v14;
function v14.CreateGuiObjects(p4, p5)
	p4.ChatBarParentFrame = p5;
	local v15 = Instance.new("Frame");
	v15.Selectable = false;
	v15.Size = UDim2.new(1, 0, 1, 0);
	v15.BackgroundTransparency = 0.6;
	v15.BorderSizePixel = 0;
	v15.BackgroundColor3 = v10.ChatBarBackGroundColor;
	v15.Parent = p5;
	local v16 = Instance.new("Frame");
	v16.Selectable = false;
	v16.Name = "BoxFrame";
	v16.BackgroundTransparency = 0.6;
	v16.BorderSizePixel = 0;
	v16.BackgroundColor3 = v10.ChatBarBoxColor;
	v16.Size = UDim2.new(1, -14, 1, -14);
	v16.Position = UDim2.new(0, 7, 0, 7);
	v16.Parent = v15;
	local v17 = Instance.new("Frame");
	v17.BackgroundTransparency = 1;
	v17.Size = UDim2.new(1, -10, 1, -10);
	v17.Position = UDim2.new(0, 5, 0, 5);
	v17.Parent = v16;
	local v18 = Instance.new("TextBox");
	v18.Selectable = v10.GamepadNavigationEnabled;
	v18.Name = "ChatBar";
	v18.BackgroundTransparency = 1;
	v18.Size = UDim2.new(1, 0, 1, 0);
	v18.Position = UDim2.new(0, 0, 0, 0);
	v18.TextSize = v10.ChatBarTextSize;
	v18.Font = v10.ChatBarFont;
	v18.TextColor3 = v10.ChatBarTextColor;
	v18.TextTransparency = 0.4;
	v18.TextStrokeTransparency = 1;
	v18.ClearTextOnFocus = false;
	v18.TextXAlignment = Enum.TextXAlignment.Left;
	v18.TextYAlignment = Enum.TextYAlignment.Top;
	v18.TextWrapped = true;
	v18.Text = "";
	v18.Parent = v17;
	local v19 = Instance.new("TextButton");
	v19.Selectable = false;
	v19.Name = "MessageMode";
	v19.BackgroundTransparency = 1;
	v19.Position = UDim2.new(0, 0, 0, 0);
	v19.TextSize = v10.ChatBarTextSize;
	v19.Font = v10.ChatBarFont;
	v19.TextXAlignment = Enum.TextXAlignment.Left;
	v19.TextWrapped = true;
	v19.Text = "";
	v19.Size = UDim2.new(0, 0, 0, 0);
	v19.TextYAlignment = Enum.TextYAlignment.Center;
	v19.TextColor3 = p4:GetDefaultChannelNameColor();
	v19.Visible = true;
	v19.Parent = v17;
	local v20 = Instance.new("TextLabel");
	v20.Selectable = false;
	v20.TextWrapped = true;
	v20.BackgroundTransparency = 1;
	v20.Size = v18.Size;
	v20.Position = v18.Position;
	v20.TextSize = v18.TextSize;
	v20.Font = v18.Font;
	v20.TextColor3 = v18.TextColor3;
	v20.TextTransparency = v18.TextTransparency;
	v20.TextStrokeTransparency = v18.TextStrokeTransparency;
	v20.TextXAlignment = v18.TextXAlignment;
	v20.TextYAlignment = v18.TextYAlignment;
	v20.Text = "...";
	v20.Parent = v17;
	p4.GuiObject = v15;
	p4.TextBox = v18;
	p4.TextLabel = v20;
	p4.GuiObjects.BaseFrame = v15;
	p4.GuiObjects.TextBoxFrame = v16;
	p4.GuiObjects.TextBox = v18;
	p4.GuiObjects.TextLabel = v20;
	p4.GuiObjects.MessageModeTextButton = v19;
	p4:AnimGuiObjects();
	p4:SetUpTextBoxEvents(v18, v20, v19);
	if p4.UserHasChatOff then
		p4:DoLockChatBar();
	end;
	p4.eGuiObjectsChanged:Fire();
end;
function v14.DoLockChatBar(p6)
	if p6.TextLabel then
		if v6.UserId > 0 then
			p6.TextLabel.Text = u1:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.");
		else
			p6.TextLabel.Text = u1:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.");
		end;
		p6:CalculateSize();
	end;
	if p6.TextBox then
		p6.TextBox.Active = false;
		p6.TextBox.Focused:connect(function()
			p6.TextBox:ReleaseFocus();
		end);
	end;
end;
function v14.SetUpTextBoxEvents(p7, p8, p9, p10)
	for v21, v22 in pairs(p7.TextBoxConnections) do
		v22:disconnect();
		p7.TextBoxConnections[v21] = nil;
	end;
	p7.TextBoxConnections.UserInputBegan = l__UserInputService__2.InputBegan:connect(function(p11, p12)
		if p11.KeyCode == Enum.KeyCode.Backspace and p7:IsFocused() and p8.Text == "" then
			p7:SetChannelTarget(v10.GeneralChannelName);
		end;
	end);
	p7.TextBoxConnections.TextBoxChanged = p8.Changed:connect(function(p13)
		local v23 = nil;
		if p13 == "AbsoluteSize" then
			p7:CalculateSize();
			return;
		end;
		if p13 ~= "Text" then
			return;
		end;
		p7:CalculateSize();
		if v10.MaximumMessageLength < utf8.len(utf8.nfcnormalize(p8.Text)) then
			p8.Text = p7.PreviousText;
		else
			p7.PreviousText = p8.Text;
		end;
		if not p7.InCustomState then
			v23 = p7.CommandProcessor:ProcessInProgressChatMessage(p8.Text, p7.ChatWindow, p7);
			if not v23 then
				return;
			end;
		else
			p7.CustomState:TextUpdated();
			return;
		end;
		p7.InCustomState = true;
		p7.CustomState = v23;
	end);
	p7.TextBoxConnections.MessageModeClick = p10.MouseButton1Click:connect(function()
		if p10.Text ~= "" then
			p7:SetChannelTarget(v10.GeneralChannelName);
		end;
	end);
	local function u2(p14)
		if not p14 and p8.Text == "" then
			p9.Visible = true;
			return;
		end;
		p9.Visible = false;
	end;
	p7.TextBoxConnections.TextBoxFocused = p8.Focused:connect(function()
		if not p7.UserHasChatOff then
			p7:CalculateSize();
			u2(true);
		end;
	end);
	p7.TextBoxConnections.TextBoxFocusLost = p8.FocusLost:connect(function(p15, p16)
		p7:CalculateSize();
		if p16 and p16.KeyCode == Enum.KeyCode.Escape then
			p8.Text = "";
		end;
		u2(false);
	end);
end;
function v14.GetTextBox(p17)
	return p17.TextBox;
end;
function v14.GetMessageModeTextButton(p18)
	return p18.GuiObjects.MessageModeTextButton;
end;
function v14.GetMessageModeTextLabel(p19)
	return p19:GetMessageModeTextButton();
end;
function v14.IsFocused(p20)
	if p20.UserHasChatOff then
		return false;
	end;
	return p20:GetTextBox():IsFocused();
end;
function v14.GetVisible(p21)
	return p21.GuiObject.Visible;
end;
function v14.CaptureFocus(p22)
	if not p22.UserHasChatOff then
		p22:GetTextBox():CaptureFocus();
	end;
end;
function v14.ReleaseFocus(p23, p24)
	p23:GetTextBox():ReleaseFocus(p24);
end;
function v14.ResetText(p25)
	p25:GetTextBox().Text = "";
end;
function v14.SetText(p26, p27)
	p26:GetTextBox().Text = p27;
end;
function v14.GetEnabled(p28)
	return p28.GuiObject.Visible;
end;
function v14.SetEnabled(p29, p30)
	if p29.UserHasChatOff then
		p29.GuiObject.Visible = true;
		return;
	end;
	p29.GuiObject.Visible = p30;
end;
function v14.SetTextLabelText(p31, p32)
	if not p31.UserHasChatOff then
		p31.TextLabel.Text = p32;
	end;
end;
function v14.SetTextBoxText(p33, p34)
	p33.TextBox.Text = p34;
end;
function v14.GetTextBoxText(p35)
	return p35.TextBox.Text;
end;
function v14.ResetSize(p36)
	p36.TargetYSize = 0;
	p36:TweenToTargetYSize();
end;
local function u3(p37)
	return l__TextService__5:GetTextSize(p37.Text, p37.TextSize, p37.Font, Vector2.new(p37.AbsoluteSize.X, 10000));
end;
function v14.CalculateSize(p38)
	if p38.CalculatingSizeLock then
		return;
	end;
	p38.CalculatingSizeLock = true;
	if p38:IsFocused() or p38.TextBox.Text ~= "" then
		local v24 = p38.TextBox.TextSize;
		local v25 = u3(p38.TextBox).Y;
	else
		v24 = p38.TextLabel.TextSize;
		v25 = u3(p38.TextLabel).Y;
	end;
	local v26 = v25 - v24;
	if p38.TargetYSize ~= v26 then
		p38.TargetYSize = v26;
		p38:TweenToTargetYSize();
	end;
	p38.CalculatingSizeLock = false;
end;
function v14.TweenToTargetYSize(p39)
	local v27 = UDim2.new(1, 0, 1, p39.TargetYSize);
	p39.GuiObject.Size = v27;
	p39.GuiObject.Size = p39.GuiObject.Size;
	local u4 = math.min(1, math.abs(p39.GuiObject.AbsoluteSize.Y - p39.GuiObject.AbsoluteSize.Y) * (1 / p39.TweenPixelsPerSecond));
	if not pcall(function()
		p39.GuiObject:TweenSize(v27, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, u4, true);
	end) then
		p39.GuiObject.Size = v27;
	end;
end;
function v14.SetTextSize(p40, p41)
	if not p40:IsInCustomState() then
		if p40.TextBox then
			p40.TextBox.TextSize = p41;
		end;
		if p40.TextLabel then
			p40.TextLabel.TextSize = p41;
		end;
	end;
end;
function v14.GetDefaultChannelNameColor(p42)
	if not v10.DefaultChannelNameColor then
		return Color3.fromRGB(35, 76, 142);
	end;
	return v10.DefaultChannelNameColor;
end;
function v14.SetChannelTarget(p43, p44)
	local l__MessageModeTextButton__28 = p43.GuiObjects.MessageModeTextButton;
	local l__TextBox__29 = p43.TextBox;
	local l__TextLabel__30 = p43.TextLabel;
	p43.TargetChannel = p44;
	if not p43:IsInCustomState() then
		if p44 == v10.GeneralChannelName then
			l__MessageModeTextButton__28.Text = "";
			l__MessageModeTextButton__28.Size = UDim2.new(0, 0, 0, 0);
			l__TextBox__29.Size = UDim2.new(1, 0, 1, 0);
			l__TextBox__29.Position = UDim2.new(0, 0, 0, 0);
			l__TextLabel__30.Size = UDim2.new(1, 0, 1, 0);
			l__TextLabel__30.Position = UDim2.new(0, 0, 0, 0);
			return;
		end;
	else
		return;
	end;
	l__MessageModeTextButton__28.Size = UDim2.new(0, 1000, 1, 0);
	local v31 = p44;
	if u1.tryLocalize then
		v31 = u1:tryLocalize(p44);
	end;
	l__MessageModeTextButton__28.Text = string.format("[%s] ", v31);
	local v32 = p43:GetChannelNameColor(p44);
	if v32 then
		l__MessageModeTextButton__28.TextColor3 = v32;
	else
		l__MessageModeTextButton__28.TextColor3 = p43:GetDefaultChannelNameColor();
	end;
	local l__X__33 = l__MessageModeTextButton__28.TextBounds.X;
	l__MessageModeTextButton__28.Size = UDim2.new(0, l__X__33, 1, 0);
	l__TextBox__29.Size = UDim2.new(1, -l__X__33, 1, 0);
	l__TextBox__29.Position = UDim2.new(0, l__X__33, 0, 0);
	l__TextLabel__30.Size = UDim2.new(1, -l__X__33, 1, 0);
	l__TextLabel__30.Position = UDim2.new(0, l__X__33, 0, 0);
end;
function v14.IsInCustomState(p45)
	return p45.InCustomState;
end;
function v14.ResetCustomState(p46)
	if p46.InCustomState then
		p46.CustomState:Destroy();
		p46.CustomState = nil;
		p46.InCustomState = false;
		p46.ChatBarParentFrame:ClearAllChildren();
		p46:CreateGuiObjects(p46.ChatBarParentFrame);
		p46:SetTextLabelText(u1:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
	end;
end;
function v14.EnterWhisperState(p47, p48)
	p47:ResetCustomState();
	if v12.CustomStateCreator then
		p47.CustomState = v12.CustomStateCreator(p48, p47.ChatWindow, p47, v10);
		p47.InCustomState = true;
	else
		if v10.PlayerDisplayNamesEnabled then
			local v34 = p48.DisplayName;
		else
			v34 = p48.Name;
		end;
		p47:SetText("/w " .. v34);
	end;
	p47:CaptureFocus();
end;
function v14.GetCustomMessage(p49)
	if not p49.InCustomState then
		return nil;
	end;
	return p49.CustomState:GetMessage();
end;
function v14.CustomStateProcessCompletedMessage(p50, p51)
	if not p50.InCustomState then
		return false;
	end;
	return p50.CustomState:ProcessCompletedMessage();
end;
function v14.FadeOutBackground(p52, p53)
	p52.AnimParams.Background_TargetTransparency = 1;
	p52.AnimParams.Background_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p53);
	p52:FadeOutText(p53);
end;
function v14.FadeInBackground(p54, p55)
	p54.AnimParams.Background_TargetTransparency = 0.6;
	p54.AnimParams.Background_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p55);
	p54:FadeInText(p55);
end;
function v14.FadeOutText(p56, p57)
	p56.AnimParams.Text_TargetTransparency = 1;
	p56.AnimParams.Text_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p57);
end;
function v14.FadeInText(p58, p59)
	p58.AnimParams.Text_TargetTransparency = 0.4;
	p58.AnimParams.Text_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p59);
end;
function v14.AnimGuiObjects(p60)
	p60.GuiObject.BackgroundTransparency = p60.AnimParams.Background_CurrentTransparency;
	p60.GuiObjects.TextBoxFrame.BackgroundTransparency = p60.AnimParams.Background_CurrentTransparency;
	p60.GuiObjects.TextLabel.TextTransparency = p60.AnimParams.Text_CurrentTransparency;
	p60.GuiObjects.TextBox.TextTransparency = p60.AnimParams.Text_CurrentTransparency;
	p60.GuiObjects.MessageModeTextButton.TextTransparency = p60.AnimParams.Text_CurrentTransparency;
end;
function v14.InitializeAnimParams(p61)
	p61.AnimParams.Text_TargetTransparency = 0.4;
	p61.AnimParams.Text_CurrentTransparency = 0.4;
	p61.AnimParams.Text_NormalizedExptValue = 1;
	p61.AnimParams.Background_TargetTransparency = 0.6;
	p61.AnimParams.Background_CurrentTransparency = 0.6;
	p61.AnimParams.Background_NormalizedExptValue = 1;
end;
function v14.Update(p62, p63)
	p62.AnimParams.Text_CurrentTransparency = v11:Expt(p62.AnimParams.Text_CurrentTransparency, p62.AnimParams.Text_TargetTransparency, p62.AnimParams.Text_NormalizedExptValue, p63);
	p62.AnimParams.Background_CurrentTransparency = v11:Expt(p62.AnimParams.Background_CurrentTransparency, p62.AnimParams.Background_TargetTransparency, p62.AnimParams.Background_NormalizedExptValue, p63);
	p62:AnimGuiObjects();
end;
function v14.SetChannelNameColor(p64, p65, p66)
	p64.ChannelNameColors[p65] = p66;
	if p64.GuiObjects.MessageModeTextButton.Text == p65 then
		p64.GuiObjects.MessageModeTextButton.TextColor3 = p66;
	end;
end;
function v14.GetChannelNameColor(p67, p68)
	return p67.ChannelNameColors[p68];
end;
function v1.new(p69, p70)
	local v35 = setmetatable({}, v14);
	v35.GuiObject = nil;
	v35.ChatBarParentFrame = nil;
	v35.TextBox = nil;
	v35.TextLabel = nil;
	v35.GuiObjects = {};
	v35.eGuiObjectsChanged = Instance.new("BindableEvent");
	v35.GuiObjectsChanged = v35.eGuiObjectsChanged.Event;
	v35.TextBoxConnections = {};
	v35.PreviousText = "";
	v35.InCustomState = false;
	v35.CustomState = nil;
	v35.TargetChannel = nil;
	v35.CommandProcessor = p69;
	v35.ChatWindow = p70;
	v35.TweenPixelsPerSecond = 500;
	v35.TargetYSize = 0;
	v35.AnimParams = {};
	v35.CalculatingSizeLock = false;
	v35.ChannelNameColors = {};
	v35.UserHasChatOff = false;
	v35:InitializeAnimParams();
	v10.SettingsChanged:connect(function(p71, p72)
		if p71 == "ChatBarTextSize" then
			v35:SetTextSize(p72);
		end;
	end);
	coroutine.wrap(function()
		local v36, v37 = pcall(function()
			return l__Chat__7:CanUserChatAsync(v6.UserId);
		end);
		if (v36 and (l__RunService__3:IsStudio() and v37)) == false then
			v35.UserHasChatOff = true;
			v35:DoLockChatBar();
		end;
	end)();
	return v35;
end;
return v1;
