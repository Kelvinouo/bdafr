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
	p7.TextBoxConnections.TextBoxFocused = p8.Focused:connect(function()
		if not p7.UserHasChatOff then
			p7:CalculateSize();
			p9.Visible = false;
		end;
	end);
	p7.TextBoxConnections.TextBoxFocusLost = p8.FocusLost:connect(function(p14, p15)
		p7:CalculateSize();
		if p15 and p15.KeyCode == Enum.KeyCode.Escape then
			p8.Text = "";
		end;
		if p8.Text ~= "" then
			p9.Visible = false;
			return;
		end;
		p9.Visible = true;
	end);
end;
function v14.GetTextBox(p16)
	return p16.TextBox;
end;
function v14.GetMessageModeTextButton(p17)
	return p17.GuiObjects.MessageModeTextButton;
end;
function v14.GetMessageModeTextLabel(p18)
	return p18:GetMessageModeTextButton();
end;
function v14.IsFocused(p19)
	if p19.UserHasChatOff then
		return false;
	end;
	return p19:GetTextBox():IsFocused();
end;
function v14.GetVisible(p20)
	return p20.GuiObject.Visible;
end;
function v14.CaptureFocus(p21)
	if not p21.UserHasChatOff then
		p21:GetTextBox():CaptureFocus();
	end;
end;
function v14.ReleaseFocus(p22, p23)
	p22:GetTextBox():ReleaseFocus(p23);
end;
function v14.ResetText(p24)
	p24:GetTextBox().Text = "";
end;
function v14.SetText(p25, p26)
	p25:GetTextBox().Text = p26;
end;
function v14.GetEnabled(p27)
	return p27.GuiObject.Visible;
end;
function v14.SetEnabled(p28, p29)
	if p28.UserHasChatOff then
		p28.GuiObject.Visible = true;
		return;
	end;
	p28.GuiObject.Visible = p29;
end;
function v14.SetTextLabelText(p30, p31)
	if not p30.UserHasChatOff then
		p30.TextLabel.Text = p31;
	end;
end;
function v14.SetTextBoxText(p32, p33)
	p32.TextBox.Text = p33;
end;
function v14.GetTextBoxText(p34)
	return p34.TextBox.Text;
end;
function v14.ResetSize(p35)
	p35.TargetYSize = 0;
	p35:TweenToTargetYSize();
end;
function v14.CalculateSize(p36)
	if p36.CalculatingSizeLock then
		return;
	end;
	p36.CalculatingSizeLock = true;
	if p36:IsFocused() or p36.TextBox.Text ~= "" then
		local v24 = p36.TextBox.TextSize;
		local l__TextBox__25 = p36.TextBox;
		local v26 = l__TextService__5:GetTextSize(l__TextBox__25.Text, l__TextBox__25.TextSize, l__TextBox__25.Font, Vector2.new(l__TextBox__25.AbsoluteSize.X, 10000)).Y;
	else
		v24 = p36.TextLabel.TextSize;
		local l__TextLabel__27 = p36.TextLabel;
		v26 = l__TextService__5:GetTextSize(l__TextLabel__27.Text, l__TextLabel__27.TextSize, l__TextLabel__27.Font, Vector2.new(l__TextLabel__27.AbsoluteSize.X, 10000)).Y;
	end;
	local v28 = v26 - v24;
	if p36.TargetYSize ~= v28 then
		p36.TargetYSize = v28;
		p36:TweenToTargetYSize();
	end;
	p36.CalculatingSizeLock = false;
end;
function v14.TweenToTargetYSize(p37)
	local v29 = UDim2.new(1, 0, 1, p37.TargetYSize);
	p37.GuiObject.Size = v29;
	p37.GuiObject.Size = p37.GuiObject.Size;
	local u2 = math.min(1, math.abs(p37.GuiObject.AbsoluteSize.Y - p37.GuiObject.AbsoluteSize.Y) * (1 / p37.TweenPixelsPerSecond));
	if not pcall(function()
		p37.GuiObject:TweenSize(v29, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, u2, true);
	end) then
		p37.GuiObject.Size = v29;
	end;
end;
function v14.SetTextSize(p38, p39)
	if not p38:IsInCustomState() then
		if p38.TextBox then
			p38.TextBox.TextSize = p39;
		end;
		if p38.TextLabel then
			p38.TextLabel.TextSize = p39;
		end;
	end;
end;
function v14.GetDefaultChannelNameColor(p40)
	if not v10.DefaultChannelNameColor then
		return Color3.fromRGB(35, 76, 142);
	end;
	return v10.DefaultChannelNameColor;
end;
function v14.SetChannelTarget(p41, p42)
	local l__MessageModeTextButton__30 = p41.GuiObjects.MessageModeTextButton;
	local l__TextBox__31 = p41.TextBox;
	local l__TextLabel__32 = p41.TextLabel;
	p41.TargetChannel = p42;
	if not p41:IsInCustomState() then
		if p42 == v10.GeneralChannelName then
			l__MessageModeTextButton__30.Text = "";
			l__MessageModeTextButton__30.Size = UDim2.new(0, 0, 0, 0);
			l__TextBox__31.Size = UDim2.new(1, 0, 1, 0);
			l__TextBox__31.Position = UDim2.new(0, 0, 0, 0);
			l__TextLabel__32.Size = UDim2.new(1, 0, 1, 0);
			l__TextLabel__32.Position = UDim2.new(0, 0, 0, 0);
			return;
		end;
	else
		return;
	end;
	l__MessageModeTextButton__30.Size = UDim2.new(0, 1000, 1, 0);
	local v33 = p42;
	if u1.tryLocalize then
		v33 = u1:tryLocalize(p42);
	end;
	l__MessageModeTextButton__30.Text = string.format("[%s] ", v33);
	local v34 = p41:GetChannelNameColor(p42);
	if v34 then
		l__MessageModeTextButton__30.TextColor3 = v34;
	else
		l__MessageModeTextButton__30.TextColor3 = p41:GetDefaultChannelNameColor();
	end;
	local l__X__35 = l__MessageModeTextButton__30.TextBounds.X;
	l__MessageModeTextButton__30.Size = UDim2.new(0, l__X__35, 1, 0);
	l__TextBox__31.Size = UDim2.new(1, -l__X__35, 1, 0);
	l__TextBox__31.Position = UDim2.new(0, l__X__35, 0, 0);
	l__TextLabel__32.Size = UDim2.new(1, -l__X__35, 1, 0);
	l__TextLabel__32.Position = UDim2.new(0, l__X__35, 0, 0);
end;
function v14.IsInCustomState(p43)
	return p43.InCustomState;
end;
function v14.ResetCustomState(p44)
	if p44.InCustomState then
		p44.CustomState:Destroy();
		p44.CustomState = nil;
		p44.InCustomState = false;
		p44.ChatBarParentFrame:ClearAllChildren();
		p44:CreateGuiObjects(p44.ChatBarParentFrame);
		p44:SetTextLabelText(u1:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
	end;
end;
function v14.EnterWhisperState(p45, p46)
	p45:ResetCustomState();
	if v12.CustomStateCreator then
		p45.CustomState = v12.CustomStateCreator(p46, p45.ChatWindow, p45, v10);
		p45.InCustomState = true;
	else
		if v10.PlayerDisplayNamesEnabled then
			local v36 = p46.DisplayName;
		else
			v36 = p46.Name;
		end;
		p45:SetText("/w " .. v36);
	end;
	p45:CaptureFocus();
end;
function v14.GetCustomMessage(p47)
	if not p47.InCustomState then
		return nil;
	end;
	return p47.CustomState:GetMessage();
end;
function v14.CustomStateProcessCompletedMessage(p48, p49)
	if not p48.InCustomState then
		return false;
	end;
	return p48.CustomState:ProcessCompletedMessage();
end;
function v14.FadeOutBackground(p50, p51)
	p50.AnimParams.Background_TargetTransparency = 1;
	p50.AnimParams.Background_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p51);
	p50:FadeOutText(p51);
end;
function v14.FadeInBackground(p52, p53)
	p52.AnimParams.Background_TargetTransparency = 0.6;
	p52.AnimParams.Background_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p53);
	p52:FadeInText(p53);
end;
function v14.FadeOutText(p54, p55)
	p54.AnimParams.Text_TargetTransparency = 1;
	p54.AnimParams.Text_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p55);
end;
function v14.FadeInText(p56, p57)
	p56.AnimParams.Text_TargetTransparency = 0.4;
	p56.AnimParams.Text_NormalizedExptValue = v11:NormalizedDefaultExptValueInSeconds(p57);
end;
function v14.AnimGuiObjects(p58)
	p58.GuiObject.BackgroundTransparency = p58.AnimParams.Background_CurrentTransparency;
	p58.GuiObjects.TextBoxFrame.BackgroundTransparency = p58.AnimParams.Background_CurrentTransparency;
	p58.GuiObjects.TextLabel.TextTransparency = p58.AnimParams.Text_CurrentTransparency;
	p58.GuiObjects.TextBox.TextTransparency = p58.AnimParams.Text_CurrentTransparency;
	p58.GuiObjects.MessageModeTextButton.TextTransparency = p58.AnimParams.Text_CurrentTransparency;
end;
function v14.InitializeAnimParams(p59)
	p59.AnimParams.Text_TargetTransparency = 0.4;
	p59.AnimParams.Text_CurrentTransparency = 0.4;
	p59.AnimParams.Text_NormalizedExptValue = 1;
	p59.AnimParams.Background_TargetTransparency = 0.6;
	p59.AnimParams.Background_CurrentTransparency = 0.6;
	p59.AnimParams.Background_NormalizedExptValue = 1;
end;
function v14.Update(p60, p61)
	p60.AnimParams.Text_CurrentTransparency = v11:Expt(p60.AnimParams.Text_CurrentTransparency, p60.AnimParams.Text_TargetTransparency, p60.AnimParams.Text_NormalizedExptValue, p61);
	p60.AnimParams.Background_CurrentTransparency = v11:Expt(p60.AnimParams.Background_CurrentTransparency, p60.AnimParams.Background_TargetTransparency, p60.AnimParams.Background_NormalizedExptValue, p61);
	p60:AnimGuiObjects();
end;
function v14.SetChannelNameColor(p62, p63, p64)
	p62.ChannelNameColors[p63] = p64;
	if p62.GuiObjects.MessageModeTextButton.Text == p63 then
		p62.GuiObjects.MessageModeTextButton.TextColor3 = p64;
	end;
end;
function v14.GetChannelNameColor(p65, p66)
	return p65.ChannelNameColors[p66];
end;
function v1.new(p67, p68)
	local v37 = setmetatable({}, v14);
	v37.GuiObject = nil;
	v37.ChatBarParentFrame = nil;
	v37.TextBox = nil;
	v37.TextLabel = nil;
	v37.GuiObjects = {};
	v37.eGuiObjectsChanged = Instance.new("BindableEvent");
	v37.GuiObjectsChanged = v37.eGuiObjectsChanged.Event;
	v37.TextBoxConnections = {};
	v37.PreviousText = "";
	v37.InCustomState = false;
	v37.CustomState = nil;
	v37.TargetChannel = nil;
	v37.CommandProcessor = p67;
	v37.ChatWindow = p68;
	v37.TweenPixelsPerSecond = 500;
	v37.TargetYSize = 0;
	v37.AnimParams = {};
	v37.CalculatingSizeLock = false;
	v37.ChannelNameColors = {};
	v37.UserHasChatOff = false;
	v37:InitializeAnimParams();
	v10.SettingsChanged:connect(function(p69, p70)
		if p69 == "ChatBarTextSize" then
			v37:SetTextSize(p70);
		end;
	end);
	coroutine.wrap(function()
		local v38, v39 = pcall(function()
			return l__Chat__7:CanUserChatAsync(v6.UserId);
		end);
		if (v38 and (l__RunService__3:IsStudio() and v39)) == false then
			v37.UserHasChatOff = true;
			v37:DoLockChatBar();
		end;
	end)();
	return v37;
end;
return v1;
