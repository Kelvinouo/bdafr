--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = false;
local v3, v4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService");
end);
if v3 then
	v2 = v4;
end;
local l__RunService__5 = game:GetService("RunService");
local l__ReplicatedStorage__6 = game:GetService("ReplicatedStorage");
local l__Chat__7 = game:GetService("Chat");
local l__StarterGui__8 = game:GetService("StarterGui");
local l__ContextActionService__9 = game:GetService("ContextActionService");
local v10 = l__ReplicatedStorage__6:WaitForChild("DefaultChatSystemChatEvents");
local v11 = l__ReplicatedStorage__6:WaitForChild("DefaultChatSystemChatEvents");
local l__ClientChatModules__12 = l__Chat__7:WaitForChild("ClientChatModules");
local v13 = require(l__ClientChatModules__12:WaitForChild("ChatConstants"));
local v14 = require(l__ClientChatModules__12:WaitForChild("ChatSettings"));
local v15 = require(l__ClientChatModules__12:WaitForChild("MessageCreatorModules"):WaitForChild("Util"));
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
local v16 = Instance.new("BindableEvent");
local u2 = {
	OnNewMessage = "RemoteEvent", 
	OnMessageDoneFiltering = "RemoteEvent", 
	OnNewSystemMessage = "RemoteEvent", 
	OnChannelJoined = "RemoteEvent", 
	OnChannelLeft = "RemoteEvent", 
	OnMuted = "RemoteEvent", 
	OnUnmuted = "RemoteEvent", 
	OnMainChannelSet = "RemoteEvent", 
	SayMessageRequest = "RemoteEvent", 
	GetInitDataRequest = "RemoteFunction"
};
local u3 = {};
local u4 = 10;
function TryRemoveChildWithVerifyingIsCorrectType(p4)
	if u2[p4.Name] then
		if p4:IsA(u2[p4.Name]) then
			u2[p4.Name] = nil;
			u3[p4.Name] = p4;
			u4 = u4 - 1;
		end;
	end;
end;
for v17, v18 in pairs(v11:GetChildren()) do
	TryRemoveChildWithVerifyingIsCorrectType(v18);
end;
if u4 > 0 then
	local v19 = v11.ChildAdded:connect(function(p5)
		TryRemoveChildWithVerifyingIsCorrectType(p5);
		if u4 < 1 then
			v16:Fire();
		end;
	end);
	v16.Event:wait();
	v19:disconnect();
	v16:Destroy();
end;
local l__UserInputService__20 = game:GetService("UserInputService");
local l__RunService__21 = game:GetService("RunService");
local l__Players__22 = game:GetService("Players");
local v23 = l__Players__22.LocalPlayer;
while not v23 do
	l__Players__22.ChildAdded:wait();
	v23 = l__Players__22.LocalPlayer;
end;
local v24 = 6;
if v14.ScreenGuiDisplayOrder ~= nil then
	v24 = v14.ScreenGuiDisplayOrder;
end;
local v25 = Instance.new("ScreenGui");
v25.Name = "Chat";
v25.ResetOnSpawn = false;
v25.DisplayOrder = v24;
v25.Parent = v23:WaitForChild("PlayerGui");
local v26 = require(script:WaitForChild("MessageLabelCreator"));
local v27 = require(script:WaitForChild("MessageLogDisplay"));
local v28 = require(script:WaitForChild("ChatChannel"));
local v29 = require(script:WaitForChild("ChatWindow")).new();
local v30 = require(script:WaitForChild("ChannelsBar")).new();
local v31 = v27.new();
local v32 = require(script:WaitForChild("CommandProcessor")).new();
local v33 = require(script:WaitForChild("ChatBar")).new(v32, v29);
v29:CreateGuiObjects(v25);
v29:RegisterChatBar(v33);
v29:RegisterChannelsBar(v30);
v29:RegisterMessageLogDisplay(v31);
v15:RegisterChatWindow(v29);
local v34 = require(script:WaitForChild("MessageSender"));
v34:RegisterSayMessageFunction(u3.SayMessageRequest);
if l__UserInputService__20.TouchEnabled then
	v33:SetTextLabelText(u1:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"));
else
	v33:SetTextLabelText(u1:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
end;
local l__script__5 = script;
spawn(function()
	local v35 = require(l__script__5:WaitForChild("CurveUtil"));
	local v36 = 1 / (v14.ChatAnimationFPS and 20);
	local v37 = tick();
	while true do
		local v38 = tick();
		local v39 = v35:DeltaTimeToTimescale(v38 - v37);
		if v39 ~= 0 then
			v29:Update(v39);
		end;
		v37 = v38;
		wait(v36);	
	end;
end);
function CheckIfPointIsInSquare(p6, p7, p8)
	local v40 = false;
	if p7.X <= p6.X then
		v40 = false;
		if p6.X <= p8.X then
			v40 = false;
			if p7.Y <= p6.Y then
				v40 = p6.Y <= p8.Y;
			end;
		end;
	end;
	return v40;
end;
local u6 = 0;
local u7 = false;
local u8 = Instance.new("BindableEvent");
function DoBackgroundFadeIn(p9)
	u6 = tick();
	u7 = false;
	u8:Fire();
	v29:FadeInBackground(p9 or v14.ChatDefaultFadeDuration);
	if v29:GetCurrentChannel() then
		local l__Scroller__41 = v31.Scroller;
		l__Scroller__41.ScrollingEnabled = true;
		l__Scroller__41.ScrollBarThickness = v27.ScrollBarThickness;
	end;
end;
function DoBackgroundFadeOut(p10)
	u6 = tick();
	u7 = true;
	u8:Fire();
	v29:FadeOutBackground(p10 or v14.ChatDefaultFadeDuration);
	if v29:GetCurrentChannel() then
		local l__Scroller__42 = v31.Scroller;
		l__Scroller__42.ScrollingEnabled = false;
		l__Scroller__42.ScrollBarThickness = 0;
	end;
end;
local u9 = 0;
local u10 = false;
function DoTextFadeIn(p11)
	u9 = tick();
	u10 = false;
	u8:Fire();
	v29:FadeInText((p11 or v14.ChatDefaultFadeDuration) * 0);
end;
function DoTextFadeOut(p12)
	u9 = tick();
	u10 = true;
	u8:Fire();
	v29:FadeOutText(p12 or v14.ChatDefaultFadeDuration);
end;
function DoFadeInFromNewInformation()
	DoTextFadeIn();
	if v14.ChatShouldFadeInFromNewInformation then
		DoBackgroundFadeIn();
	end;
end;
function InstantFadeIn()
	DoBackgroundFadeIn(0);
	DoTextFadeIn(0);
end;
function InstantFadeOut()
	DoBackgroundFadeOut(0);
	DoTextFadeOut(0);
end;
local u11 = nil;
local u12 = Instance.new("BindableEvent");
function UpdateFadingForMouseState(p13)
	u11 = p13;
	u12:Fire();
	if v33:IsFocused() then
		return;
	end;
	if p13 then

	else
		DoBackgroundFadeIn();
		return;
	end;
	DoBackgroundFadeIn();
	DoTextFadeIn();
end;
local u13 = Instance.new("BindableEvent");
spawn(function()
	while true do
		l__RunService__21.RenderStepped:wait();
		while not (not u11) or not (not v33:IsFocused()) do
			if u11 then
				u12.Event:wait();
			end;
			if v33:IsFocused() then
				u13.Event:wait();
			end;		
		end;
		if not u7 then
			if v14.ChatWindowBackgroundFadeOutTime < tick() - u6 then
				DoBackgroundFadeOut();
			end;
		elseif not u10 then
			if v14.ChatWindowTextFadeOutTime < tick() - u9 then
				DoTextFadeOut();
			end;
		else
			u8.Event:wait();
		end;	
	end;
end);
function getClassicChatEnabled()
	if v14.ClassicChatEnabled ~= nil then
		return v14.ClassicChatEnabled;
	end;
	return l__Players__22.ClassicChat;
end;
function getBubbleChatEnabled()
	if v14.BubbleChatEnabled ~= nil then
		return v14.BubbleChatEnabled;
	end;
	return l__Players__22.BubbleChat;
end;
function bubbleChatOnly()
	return not getClassicChatEnabled() and getBubbleChatEnabled();
end;
local u14 = {
	Visible = nil, 
	IsCoreGuiEnabled = nil, 
	TopbarEnabled = nil, 
	VisibilityStateChanged = nil
};
function UpdateMousePosition(p14)
	if u14.Visible then
		if u14.IsCoreGuiEnabled then
			if not u14.TopbarEnabled then
				if not v14.ChatOnWithTopBarOff then
					return;
				end;
			end;
		else
			return;
		end;
	else
		return;
	end;
	if bubbleChatOnly() then
		return;
	end;
	local l__AbsolutePosition__43 = v29.GuiObject.AbsolutePosition;
	local v44 = CheckIfPointIsInSquare(p14, l__AbsolutePosition__43, l__AbsolutePosition__43 + v29.GuiObject.AbsoluteSize);
	if v44 ~= u11 then
		UpdateFadingForMouseState(v44);
	end;
end;
l__UserInputService__20.InputChanged:connect(function(p15, p16)
	if p15.UserInputType == Enum.UserInputType.MouseMovement then
		UpdateMousePosition((Vector2.new(p15.Position.X, p15.Position.Y)));
	end;
end);
l__UserInputService__20.TouchTap:connect(function(p17, p18)
	UpdateMousePosition(p17[1]);
end);
l__UserInputService__20.TouchMoved:connect(function(p19, p20)
	UpdateMousePosition((Vector2.new(p19.Position.X, p19.Position.Y)));
end);
l__UserInputService__20.Changed:connect(function(p21)
	if p21 == "MouseBehavior" and l__UserInputService__20.MouseBehavior == Enum.MouseBehavior.LockCenter then
		local l__AbsolutePosition__45 = v29.GuiObject.AbsolutePosition;
		if CheckIfPointIsInSquare(v25.AbsoluteSize / 2, l__AbsolutePosition__45, l__AbsolutePosition__45 + v29.GuiObject.AbsoluteSize) then
			l__UserInputService__20.MouseBehavior = Enum.MouseBehavior.Default;
		end;
	end;
end);
UpdateFadingForMouseState(true);
UpdateFadingForMouseState(false);
local v46 = {
	Signal = function()
		local v47 = {};
		local u15 = nil;
		local u16 = nil;
		local u17 = Instance.new("BindableEvent");
		function v47.fire(p22, ...)
			u15 = { ... };
			u16 = select("#", ...);
			u17:Fire();
		end;
		function v47.connect(p23, p24)
			if not p24 then
				error("connect(nil)", 2);
			end;
			return u17.Event:connect(function()
				p24(unpack(u15, 1, u16));
			end);
		end;
		function v47.wait(p25)
			u17.Event:wait();
			assert(u15, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
			return unpack(u15, 1, u16);
		end;
		return v47;
	end
};
function SetVisibility(p26)
	v29:SetVisible(p26);
	u14.VisibilityStateChanged:fire(p26);
	u14.Visible = p26;
	if u14.IsCoreGuiEnabled then
		if p26 then

		else
			InstantFadeOut();
			return;
		end;
	else
		return;
	end;
	InstantFadeIn();
end;
v1 = nil;
u14.TopbarEnabled = true;
u14.MessageCount = 0;
u14.Visible = true;
u14.IsCoreGuiEnabled = true;
function u14.ToggleVisibility(p27)
	SetVisibility(not v29:GetVisible());
end;
function u14.SetVisible(p28, p29)
	if v29:GetVisible() ~= p29 then
		SetVisibility(p29);
	end;
end;
function u14.FocusChatBar(p30)
	v33:CaptureFocus();
end;
function u14.EnterWhisperState(p31, p32)
	v33:EnterWhisperState(p32);
end;
function u14.GetVisibility(p33)
	return v29:GetVisible();
end;
function u14.GetMessageCount(p34)
	return p34.MessageCount;
end;
function u14.TopbarEnabledChanged(p35, p36)
	p35.TopbarEnabled = p36;
	p35.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
end;
function u14.IsFocused(p37, p38)
	return v33:IsFocused();
end;
u14.ChatBarFocusChanged = v46.Signal();
u14.VisibilityStateChanged = v46.Signal();
u14.MessagesChanged = v46.Signal();
u14.MessagePosted = v46.Signal();
u14.CoreGuiEnabled = v46.Signal();
u14.ChatMakeSystemMessageEvent = v46.Signal();
u14.ChatWindowPositionEvent = v46.Signal();
u14.ChatWindowSizeEvent = v46.Signal();
u14.ChatBarDisabledEvent = v46.Signal();
function u14.fChatWindowPosition(p39)
	return v29.GuiObject.Position;
end;
function u14.fChatWindowSize(p40)
	return v29.GuiObject.Size;
end;
function u14.fChatBarDisabled(p41)
	return not v33:GetEnabled();
end;
if v2 then
	local u18 = true;
	l__ContextActionService__9:BindAction("ToggleChat", function(p42, p43, p44)
		if p42 == "ToggleChat" and p43 == Enum.UserInputState.Begin and u18 and p44.UserInputType == Enum.UserInputType.Keyboard then
			v1();
		end;
	end, true, Enum.KeyCode.Slash);
else
	local u19 = true;
	function u14.SpecialKeyPressed(p45, p46, p47)
		if p46 == Enum.SpecialKey.ChatHotkey and u19 then
			v1();
		end;
	end;
end;
u14.CoreGuiEnabled:connect(function(p48)
	u14.IsCoreGuiEnabled = p48;
	p48 = p48 and (u14.TopbarEnabled or v14.ChatOnWithTopBarOff);
	v29:SetCoreGuiEnabled(p48);
	if p48 then
		InstantFadeIn();
		return;
	end;
	v33:ReleaseFocus();
	InstantFadeOut();
end);
function trimTrailingSpaces(p49)
	local v48 = #p49;
	while true do
		if 0 < v48 then

		else
			break;
		end;
		if p49:find("^%s", v48) then

		else
			break;
		end;
		v48 = v48 - 1;	
	end;
	return p49:sub(1, v48);
end;
local u20 = false;
u14.ChatMakeSystemMessageEvent:connect(function(p50)
	if p50.Text and type(p50.Text) == "string" then
		while not u20 do
			wait();		
		end;
		local l__GeneralChannelName__49 = v14.GeneralChannelName;
		local v50 = v29:GetChannel(l__GeneralChannelName__49);
		if v50 then
			v50:AddMessageToChannel({
				ID = -1, 
				FromSpeaker = nil, 
				SpeakerUserId = 0, 
				OriginalChannel = l__GeneralChannelName__49, 
				IsFiltered = true, 
				MessageLength = string.len(p50.Text), 
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p50.Text)), 
				Message = trimTrailingSpaces(p50.Text), 
				MessageType = v13.MessageTypeSetCore, 
				Time = os.time(), 
				ExtraData = p50
			});
			v30:UpdateMessagePostedInChannel(l__GeneralChannelName__49);
			u14.MessageCount = u14.MessageCount + 1;
			u14.MessagesChanged:fire(u14.MessageCount);
		end;
	end;
end);
u14.ChatBarDisabledEvent:connect(function(p51)
	if u19 then
		v33:SetEnabled(not p51);
		if p51 then
			v33:ReleaseFocus();
		end;
	end;
end);
u14.ChatWindowSizeEvent:connect(function(p52)
	v29.GuiObject.Size = p52;
end);
u14.ChatWindowPositionEvent:connect(function(p53)
	v29.GuiObject.Position = p53;
end);
u13.Event:connect(function(p54)
	u14.ChatBarFocusChanged:fire(p54);
end);
function DoSwitchCurrentChannel(p55)
	if v29:GetChannel(p55) then
		v29:SwitchCurrentChannel(p55);
	end;
end;
function SendMessageToSelfInTargetChannel(p56, p57, p58)
	local v51 = v29:GetChannel(p57);
	if v51 then
		v51:AddMessageToChannel({
			ID = -1, 
			FromSpeaker = nil, 
			SpeakerUserId = 0, 
			OriginalChannel = p57, 
			IsFiltered = true, 
			MessageLength = string.len(p56), 
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p56)), 
			Message = trimTrailingSpaces(p56), 
			MessageType = v13.MessageTypeSystem, 
			Time = os.time(), 
			ExtraData = p58
		});
	end;
end;
function chatBarFocused()
	if not u11 then
		DoBackgroundFadeIn();
		if u10 then
			DoTextFadeIn();
		end;
	end;
	u13:Fire(true);
end;
function chatBarFocusLost(p59, p60)
	DoBackgroundFadeIn();
	u13:Fire(false);
	if p59 then
		local v52 = v33:GetTextBox().Text;
		if v33:IsInCustomState() then
			local v53 = v33:GetCustomMessage();
			if v53 then
				v52 = v53;
			end;
			local v54 = v33:CustomStateProcessCompletedMessage(v52);
			v33:ResetCustomState();
			if v54 then
				return;
			end;
		end;
		v33:GetTextBox().Text = "";
		if v52 ~= "" then
			u14.MessagePosted:fire(v52);
			if not v32:ProcessCompletedChatMessage(v52, v29) then
				local v55 = nil;
				if v14.DisallowedWhiteSpace then
					local v56 = #v14.DisallowedWhiteSpace;
					local v57 = 1 - 1;
					while true do
						if v14.DisallowedWhiteSpace[v57] == "\t" then
							v52 = string.gsub(v52, v14.DisallowedWhiteSpace[v57], " ");
						else
							v52 = string.gsub(v52, v14.DisallowedWhiteSpace[v57], "");
						end;
						if 0 <= 1 then
							if v57 < v56 then

							else
								break;
							end;
						elseif v56 < v57 then

						else
							break;
						end;
						v57 = v57 + 1;					
					end;
				end;
				v55 = string.gsub(string.gsub(v52, "\n", ""), "[ ]+", " ");
				local v58 = v29:GetTargetMessageChannel();
				if v58 then
					v34:SendMessage(v55, v58);
					return;
				end;
				v34:SendMessage(v55, nil);
			end;
		end;
	end;
end;
local u21 = {};
function setupChatBarConnections()
	local v59 = #u21;
	local v60 = 1 - 1;
	while true do
		u21[v60]:Disconnect();
		if 0 <= 1 then
			if v60 < v59 then

			else
				break;
			end;
		elseif v59 < v60 then

		else
			break;
		end;
		v60 = v60 + 1;	
	end;
	u21 = {};
	table.insert(u21, (v33:GetTextBox().FocusLost:connect(chatBarFocusLost)));
	table.insert(u21, (v33:GetTextBox().Focused:connect(chatBarFocused)));
end;
setupChatBarConnections();
v33.GuiObjectsChanged:connect(setupChatBarConnections);
function getEchoMessagesInGeneral()
	if v14.EchoMessagesInGeneralChannel == nil then
		return true;
	end;
	return v14.EchoMessagesInGeneralChannel;
end;
u3.OnMessageDoneFiltering.OnClientEvent:connect(function(p61)
	if not v14.ShowUserOwnFilteredMessage and p61.FromSpeaker == v23.Name then
		return;
	end;
	local l__OriginalChannel__61 = p61.OriginalChannel;
	local v62 = v29:GetChannel(l__OriginalChannel__61);
	if v62 then
		v62:UpdateMessageFiltered(p61);
	end;
	if getEchoMessagesInGeneral() and v14.GeneralChannelName and l__OriginalChannel__61 ~= v14.GeneralChannelName then
		local v63 = v29:GetChannel(v14.GeneralChannelName);
		if v63 then
			v63:UpdateMessageFiltered(p61);
		end;
	end;
end);
u3.OnNewMessage.OnClientEvent:connect(function(p62, p63)
	local v64 = v29:GetChannel(p63);
	if v64 then
		v64:AddMessageToChannel(p62);
		if p62.FromSpeaker ~= v23.Name then
			v30:UpdateMessagePostedInChannel(p63);
		end;
		if getEchoMessagesInGeneral() and v14.GeneralChannelName and p63 ~= v14.GeneralChannelName then
			local v65 = v29:GetChannel(v14.GeneralChannelName);
			if v65 then
				v65:AddMessageToChannel(p62);
			end;
		end;
		u14.MessageCount = u14.MessageCount + 1;
		u14.MessagesChanged:fire(u14.MessageCount);
		DoFadeInFromNewInformation();
	end;
end);
u3.OnNewSystemMessage.OnClientEvent:connect(function(p64, p65)
	p65 = p65 and "System";
	local v66 = v29:GetChannel(p65);
	if v66 then
		v66:AddMessageToChannel(p64);
		v30:UpdateMessagePostedInChannel(p65);
		u14.MessageCount = u14.MessageCount + 1;
		u14.MessagesChanged:fire(u14.MessageCount);
		DoFadeInFromNewInformation();
		if getEchoMessagesInGeneral() and v14.GeneralChannelName and p65 ~= v14.GeneralChannelName then
			local v67 = v29:GetChannel(v14.GeneralChannelName);
			if v67 then
				v67:AddMessageToChannel(p64);
				return;
			end;
		end;
	else
		warn(string.format("Just received system message for channel I'm not in [%s]", p65));
	end;
end);
function HandleChannelJoined(p66, p67, p68, p69, p70, p71)
	if v29:GetChannel(p66) then
		v29:RemoveChannel(p66);
	end;
	if p66 == v14.GeneralChannelName then
		u20 = true;
	end;
	if p69 then
		v33:SetChannelNameColor(p66, p69);
	end;
	local v68 = v29:AddChannel(p66);
	if v68 then
		if p66 == v14.GeneralChannelName then
			DoSwitchCurrentChannel(p66);
		end;
		if p68 then
			local v69 = 1;
			if v14.MessageHistoryLengthPerChannel < #p68 then
				v69 = #p68 - v14.MessageHistoryLengthPerChannel;
			end;
			local v70 = #p68;
			local v71 = v69 - 1;
			while true do
				v68:AddMessageToChannel(p68[v71]);
				if 0 <= 1 then
					if v71 < v70 then

					else
						break;
					end;
				elseif v70 < v71 then

				else
					break;
				end;
				v71 = v71 + 1;			
			end;
			if getEchoMessagesInGeneral() then
				if p70 then
					if v14.GeneralChannelName then
						if p66 ~= v14.GeneralChannelName then
							local v72 = v29:GetChannel(v14.GeneralChannelName);
							if v72 then
								v72:AddMessagesToChannelByTimeStamp(p68, v69);
							end;
						end;
					end;
				end;
			end;
		end;
		if p67 ~= "" then
			local v73 = {
				ID = -1, 
				FromSpeaker = nil, 
				SpeakerUserId = 0, 
				OriginalChannel = p66, 
				IsFiltered = true, 
				MessageLength = string.len(p67), 
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p67)), 
				Message = trimTrailingSpaces(p67), 
				MessageType = v13.MessageTypeWelcome, 
				Time = os.time(), 
				ExtraData = nil
			};
			v68:AddMessageToChannel(v73);
			if getEchoMessagesInGeneral() then
				if p71 then
					if not v14.ShowChannelsBar then
						if p66 ~= v14.GeneralChannelName then
							local v74 = v29:GetChannel(v14.GeneralChannelName);
							if v74 then
								v74:AddMessageToChannel(v73);
							end;
						end;
					end;
				end;
			end;
		end;
		DoFadeInFromNewInformation();
	end;
end;
u3.OnChannelJoined.OnClientEvent:connect(function(p72, p73, p74, p75)
	HandleChannelJoined(p72, p73, p74, p75, false, true);
end);
u3.OnChannelLeft.OnClientEvent:connect(function(p76)
	v29:RemoveChannel(p76);
	DoFadeInFromNewInformation();
end);
u3.OnMuted.OnClientEvent:connect(function(p77)

end);
u3.OnUnmuted.OnClientEvent:connect(function(p78)

end);
u3.OnMainChannelSet.OnClientEvent:connect(function(p79)
	DoSwitchCurrentChannel(p79);
end);
coroutine.wrap(function()
	local l__ChannelNameColorUpdated__75 = v10:WaitForChild("ChannelNameColorUpdated", 5);
	if l__ChannelNameColorUpdated__75 then
		l__ChannelNameColorUpdated__75.OnClientEvent:connect(function(p80, p81)
			v33:SetChannelNameColor(p80, p81);
		end);
	end;
end)();
local u22 = nil;
local u23 = nil;
local u24 = nil;
local u25 = nil;
pcall(function()
	u22 = l__StarterGui__8:GetCore("PlayerBlockedEvent");
	u23 = l__StarterGui__8:GetCore("PlayerMutedEvent");
	u24 = l__StarterGui__8:GetCore("PlayerUnblockedEvent");
	u25 = l__StarterGui__8:GetCore("PlayerUnmutedEvent");
end);
function SendSystemMessageToSelf(p82)
	local v76 = v29:GetCurrentChannel();
	if v76 then
		v76:AddMessageToChannel({
			ID = -1, 
			FromSpeaker = nil, 
			SpeakerUserId = 0, 
			OriginalChannel = v76.Name, 
			IsFiltered = true, 
			MessageLength = string.len(p82), 
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p82)), 
			Message = trimTrailingSpaces(p82), 
			MessageType = v13.MessageTypeSystem, 
			Time = os.time(), 
			ExtraData = nil
		});
	end;
end;
function MutePlayer(p83)
	local l__MutePlayerRequest__77 = v10:FindFirstChild("MutePlayerRequest");
	if l__MutePlayerRequest__77 then

	else
		return false;
	end;
	return l__MutePlayerRequest__77:InvokeServer(p83.Name);
end;
if u22 then
	u22.Event:connect(function(p84)
		if MutePlayer(p84) then
			if v14.PlayerDisplayNamesEnabled then
				local v78 = p84.DisplayName;
			else
				v78 = p84.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker '%s' has been blocked.", v78), {
				RBX_NAME = v78
			}));
		end;
	end);
end;
if u23 then
	u23.Event:connect(function(p85)
		if MutePlayer(p85) then
			if v14.PlayerDisplayNamesEnabled then
				local v79 = p85.DisplayName;
			else
				v79 = p85.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", v79), {
				RBX_NAME = v79
			}));
		end;
	end);
end;
function UnmutePlayer(p86)
	local l__UnMutePlayerRequest__80 = v10:FindFirstChild("UnMutePlayerRequest");
	if l__UnMutePlayerRequest__80 then

	else
		return false;
	end;
	return l__UnMutePlayerRequest__80:InvokeServer(p86.Name);
end;
if u24 then
	u24.Event:connect(function(p87)
		if UnmutePlayer(p87) then
			if v14.PlayerDisplayNamesEnabled then
				local v81 = p87.DisplayName;
			else
				v81 = p87.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker '%s' has been unblocked.", v81), {
				RBX_NAME = v81
			}));
		end;
	end);
end;
if u25 then
	u25.Event:connect(function(p88)
		if UnmutePlayer(p88) then
			if v14.PlayerDisplayNamesEnabled then
				local v82 = p88.DisplayName;
			else
				v82 = p88.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", v82), {
				RBX_NAME = v82
			}));
		end;
	end);
end;
spawn(function()
	if v23.UserId > 0 then
		pcall(function()
			local v83 = l__StarterGui__8:GetCore("GetBlockedUserIds");
			if #v83 > 0 then
				local l__SetBlockedUserIdsRequest__84 = v10:FindFirstChild("SetBlockedUserIdsRequest");
				if l__SetBlockedUserIdsRequest__84 then
					l__SetBlockedUserIdsRequest__84:FireServer(v83);
				end;
			end;
		end);
	end;
end);
spawn(function()
	local v85, v86 = pcall(function()
		return l__Chat__7:CanUserChatAsync(v23.UserId);
	end);
	if v85 then
		u19 = l__RunService__21:IsStudio() and v86;
	end;
end);
local v87 = u3.GetInitDataRequest:InvokeServer();
for v88, v89 in pairs(v87.Channels) do
	if v89[1] == v14.GeneralChannelName then
		HandleChannelJoined(v89[1], v89[2], v89[3], v89[4], true, false);
	end;
end;
for v90, v91 in pairs(v87.Channels) do
	if v91[1] ~= v14.GeneralChannelName then
		HandleChannelJoined(v91[1], v91[2], v91[3], v91[4], true, false);
	end;
end;
return u14;
