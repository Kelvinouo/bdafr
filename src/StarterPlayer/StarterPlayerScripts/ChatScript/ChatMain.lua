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
local v5 = false;
local v6, v7 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient");
end);
if v6 then
	v5 = v7;
end;
local l__RunService__8 = game:GetService("RunService");
local l__ReplicatedStorage__9 = game:GetService("ReplicatedStorage");
local l__Chat__10 = game:GetService("Chat");
local l__StarterGui__11 = game:GetService("StarterGui");
local l__ContextActionService__12 = game:GetService("ContextActionService");
local v13 = l__ReplicatedStorage__9:WaitForChild("DefaultChatSystemChatEvents");
local v14 = l__ReplicatedStorage__9:WaitForChild("DefaultChatSystemChatEvents");
local l__ClientChatModules__15 = l__Chat__10:WaitForChild("ClientChatModules");
local v16 = require(l__ClientChatModules__15:WaitForChild("ChatConstants"));
local v17 = require(l__ClientChatModules__15:WaitForChild("ChatSettings"));
local v18 = require(l__ClientChatModules__15:WaitForChild("MessageCreatorModules"):WaitForChild("Util"));
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
local v19 = Instance.new("BindableEvent");
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
for v20, v21 in pairs(v14:GetChildren()) do
	TryRemoveChildWithVerifyingIsCorrectType(v21);
end;
if u4 > 0 then
	local v22 = v14.ChildAdded:connect(function(p5)
		TryRemoveChildWithVerifyingIsCorrectType(p5);
		if u4 < 1 then
			v19:Fire();
		end;
	end);
	v19.Event:wait();
	v22:disconnect();
	v19:Destroy();
end;
local l__UserInputService__23 = game:GetService("UserInputService");
local l__RunService__24 = game:GetService("RunService");
local l__Players__25 = game:GetService("Players");
local v26 = l__Players__25.LocalPlayer;
while not v26 do
	l__Players__25.ChildAdded:wait();
	v26 = l__Players__25.LocalPlayer;
end;
local v27 = 6;
if v17.ScreenGuiDisplayOrder ~= nil then
	v27 = v17.ScreenGuiDisplayOrder;
end;
local v28 = Instance.new("ScreenGui");
v28.Name = "Chat";
v28.ResetOnSpawn = false;
v28.DisplayOrder = v27;
v28.Parent = v26:WaitForChild("PlayerGui");
local v29 = require(script:WaitForChild("MessageLabelCreator"));
local v30 = require(script:WaitForChild("MessageLogDisplay"));
local v31 = require(script:WaitForChild("ChatChannel"));
local v32 = require(script:WaitForChild("ChatWindow")).new();
local v33 = require(script:WaitForChild("ChannelsBar")).new();
local v34 = v30.new();
local v35 = require(script:WaitForChild("CommandProcessor")).new();
local v36 = require(script:WaitForChild("ChatBar")).new(v35, v32);
v32:CreateGuiObjects(v28);
v32:RegisterChatBar(v36);
v32:RegisterChannelsBar(v33);
v32:RegisterMessageLogDisplay(v34);
v18:RegisterChatWindow(v32);
local v37 = require(script:WaitForChild("MessageSender"));
v37:RegisterSayMessageFunction(u3.SayMessageRequest);
if l__UserInputService__23.TouchEnabled then
	v36:SetTextLabelText(u1:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"));
else
	v36:SetTextLabelText(u1:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
end;
local l__script__5 = script;
spawn(function()
	local v38 = require(l__script__5:WaitForChild("CurveUtil"));
	local v39 = 1 / (v17.ChatAnimationFPS and 20);
	local v40 = tick();
	while true do
		local v41 = tick();
		local v42 = v38:DeltaTimeToTimescale(v41 - v40);
		if v42 ~= 0 then
			v32:Update(v42);
		end;
		v40 = v41;
		wait(v39);	
	end;
end);
function CheckIfPointIsInSquare(p6, p7, p8)
	local v43 = false;
	if p7.X <= p6.X then
		v43 = false;
		if p6.X <= p8.X then
			v43 = false;
			if p7.Y <= p6.Y then
				v43 = p6.Y <= p8.Y;
			end;
		end;
	end;
	return v43;
end;
local u6 = 0;
local u7 = false;
local u8 = Instance.new("BindableEvent");
function DoBackgroundFadeIn(p9)
	u6 = tick();
	u7 = false;
	u8:Fire();
	v32:FadeInBackground(p9 or v17.ChatDefaultFadeDuration);
	if v32:GetCurrentChannel() then
		local l__Scroller__44 = v34.Scroller;
		l__Scroller__44.ScrollingEnabled = true;
		l__Scroller__44.ScrollBarThickness = v30.ScrollBarThickness;
	end;
end;
function DoBackgroundFadeOut(p10)
	u6 = tick();
	u7 = true;
	u8:Fire();
	v32:FadeOutBackground(p10 or v17.ChatDefaultFadeDuration);
	if v32:GetCurrentChannel() then
		local l__Scroller__45 = v34.Scroller;
		l__Scroller__45.ScrollingEnabled = false;
		l__Scroller__45.ScrollBarThickness = 0;
	end;
end;
local u9 = 0;
local u10 = false;
function DoTextFadeIn(p11)
	u9 = tick();
	u10 = false;
	u8:Fire();
	v32:FadeInText((p11 or v17.ChatDefaultFadeDuration) * 0);
end;
function DoTextFadeOut(p12)
	u9 = tick();
	u10 = true;
	u8:Fire();
	v32:FadeOutText(p12 or v17.ChatDefaultFadeDuration);
end;
function DoFadeInFromNewInformation()
	DoTextFadeIn();
	if v17.ChatShouldFadeInFromNewInformation then
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
	if v36:IsFocused() then
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
		l__RunService__24.RenderStepped:wait();
		while not (not u11) or not (not v36:IsFocused()) do
			if u11 then
				u12.Event:wait();
			end;
			if v36:IsFocused() then
				u13.Event:wait();
			end;		
		end;
		if not u7 then
			if v17.ChatWindowBackgroundFadeOutTime < tick() - u6 then
				DoBackgroundFadeOut();
			end;
		elseif not u10 then
			if v17.ChatWindowTextFadeOutTime < tick() - u9 then
				DoTextFadeOut();
			end;
		else
			u8.Event:wait();
		end;	
	end;
end);
function getClassicChatEnabled()
	if v17.ClassicChatEnabled ~= nil then
		return v17.ClassicChatEnabled;
	end;
	return l__Players__25.ClassicChat;
end;
function getBubbleChatEnabled()
	if v17.BubbleChatEnabled ~= nil then
		return v17.BubbleChatEnabled;
	end;
	return l__Players__25.BubbleChat;
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
				if not v17.ChatOnWithTopBarOff then
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
	local l__AbsolutePosition__46 = v32.GuiObject.AbsolutePosition;
	local v47 = CheckIfPointIsInSquare(p14, l__AbsolutePosition__46, l__AbsolutePosition__46 + v32.GuiObject.AbsoluteSize);
	if v47 ~= u11 then
		UpdateFadingForMouseState(v47);
	end;
end;
l__UserInputService__23.InputChanged:connect(function(p15, p16)
	if p15.UserInputType == Enum.UserInputType.MouseMovement then
		UpdateMousePosition((Vector2.new(p15.Position.X, p15.Position.Y)));
	end;
end);
l__UserInputService__23.TouchTap:connect(function(p17, p18)
	UpdateMousePosition(p17[1]);
end);
l__UserInputService__23.TouchMoved:connect(function(p19, p20)
	UpdateMousePosition((Vector2.new(p19.Position.X, p19.Position.Y)));
end);
l__UserInputService__23.Changed:connect(function(p21)
	if p21 == "MouseBehavior" and l__UserInputService__23.MouseBehavior == Enum.MouseBehavior.LockCenter then
		local l__AbsolutePosition__48 = v32.GuiObject.AbsolutePosition;
		if CheckIfPointIsInSquare(v28.AbsoluteSize / 2, l__AbsolutePosition__48, l__AbsolutePosition__48 + v32.GuiObject.AbsoluteSize) then
			l__UserInputService__23.MouseBehavior = Enum.MouseBehavior.Default;
		end;
	end;
end);
UpdateFadingForMouseState(true);
UpdateFadingForMouseState(false);
local v49 = {
	Signal = function()
		local v50 = {};
		local u15 = nil;
		local u16 = nil;
		local u17 = Instance.new("BindableEvent");
		function v50.fire(p22, ...)
			u15 = { ... };
			u16 = select("#", ...);
			u17:Fire();
		end;
		function v50.connect(p23, p24)
			if not p24 then
				error("connect(nil)", 2);
			end;
			return u17.Event:connect(function()
				p24(unpack(u15, 1, u16));
			end);
		end;
		function v50.wait(p25)
			u17.Event:wait();
			assert(u15, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
			return unpack(u15, 1, u16);
		end;
		return v50;
	end
};
function SetVisibility(p26)
	v32:SetVisible(p26);
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
	SetVisibility(not v32:GetVisible());
end;
function u14.SetVisible(p28, p29)
	if v32:GetVisible() ~= p29 then
		SetVisibility(p29);
	end;
end;
function u14.FocusChatBar(p30)
	v36:CaptureFocus();
end;
function u14.EnterWhisperState(p31, p32)
	v36:EnterWhisperState(p32);
end;
function u14.GetVisibility(p33)
	return v32:GetVisible();
end;
function u14.GetMessageCount(p34)
	return p34.MessageCount;
end;
function u14.TopbarEnabledChanged(p35, p36)
	p35.TopbarEnabled = p36;
	p35.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat));
end;
function u14.IsFocused(p37, p38)
	return v36:IsFocused();
end;
u14.ChatBarFocusChanged = v49.Signal();
u14.VisibilityStateChanged = v49.Signal();
u14.MessagesChanged = v49.Signal();
u14.MessagePosted = v49.Signal();
u14.CoreGuiEnabled = v49.Signal();
u14.ChatMakeSystemMessageEvent = v49.Signal();
u14.ChatWindowPositionEvent = v49.Signal();
u14.ChatWindowSizeEvent = v49.Signal();
u14.ChatBarDisabledEvent = v49.Signal();
function u14.fChatWindowPosition(p39)
	return v32.GuiObject.Position;
end;
function u14.fChatWindowSize(p40)
	return v32.GuiObject.Size;
end;
function u14.fChatBarDisabled(p41)
	return not v36:GetEnabled();
end;
if v2 then
	local u18 = true;
	l__ContextActionService__12:BindAction("ToggleChat", function(p42, p43, p44)
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
	p48 = p48 and (u14.TopbarEnabled or v17.ChatOnWithTopBarOff);
	v32:SetCoreGuiEnabled(p48);
	if p48 then
		InstantFadeIn();
		return;
	end;
	v36:ReleaseFocus();
	InstantFadeOut();
end);
function trimTrailingSpaces(p49)
	local v51 = #p49;
	while true do
		if 0 < v51 then

		else
			break;
		end;
		if p49:find("^%s", v51) then

		else
			break;
		end;
		v51 = v51 - 1;	
	end;
	return p49:sub(1, v51);
end;
local u20 = false;
u14.ChatMakeSystemMessageEvent:connect(function(p50)
	if p50.Text and type(p50.Text) == "string" then
		while not u20 do
			wait();		
		end;
		local l__GeneralChannelName__52 = v17.GeneralChannelName;
		local v53 = v32:GetChannel(l__GeneralChannelName__52);
		if v53 then
			v53:AddMessageToChannel({
				ID = -1, 
				FromSpeaker = nil, 
				SpeakerUserId = 0, 
				OriginalChannel = l__GeneralChannelName__52, 
				IsFiltered = true, 
				MessageLength = string.len(p50.Text), 
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p50.Text)), 
				Message = trimTrailingSpaces(p50.Text), 
				MessageType = v16.MessageTypeSetCore, 
				Time = os.time(), 
				ExtraData = p50
			});
			v33:UpdateMessagePostedInChannel(l__GeneralChannelName__52);
			u14.MessageCount = u14.MessageCount + 1;
			u14.MessagesChanged:fire(u14.MessageCount);
		end;
	end;
end);
u14.ChatBarDisabledEvent:connect(function(p51)
	if u19 then
		v36:SetEnabled(not p51);
		if p51 then
			v36:ReleaseFocus();
		end;
	end;
end);
u14.ChatWindowSizeEvent:connect(function(p52)
	v32.GuiObject.Size = p52;
end);
u14.ChatWindowPositionEvent:connect(function(p53)
	v32.GuiObject.Position = p53;
end);
u13.Event:connect(function(p54)
	u14.ChatBarFocusChanged:fire(p54);
end);
function DoSwitchCurrentChannel(p55)
	if v32:GetChannel(p55) then
		v32:SwitchCurrentChannel(p55);
	end;
end;
function SendMessageToSelfInTargetChannel(p56, p57, p58)
	local v54 = v32:GetChannel(p57);
	if v54 then
		v54:AddMessageToChannel({
			ID = -1, 
			FromSpeaker = nil, 
			SpeakerUserId = 0, 
			OriginalChannel = p57, 
			IsFiltered = true, 
			MessageLength = string.len(p56), 
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p56)), 
			Message = trimTrailingSpaces(p56), 
			MessageType = v16.MessageTypeSystem, 
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
		local v55 = v36:GetTextBox().Text;
		if v36:IsInCustomState() then
			local v56 = v36:GetCustomMessage();
			if v56 then
				v55 = v56;
			end;
			local v57 = v36:CustomStateProcessCompletedMessage(v55);
			v36:ResetCustomState();
			if v57 then
				return;
			end;
		end;
		v36:GetTextBox().Text = "";
		if v55 ~= "" then
			u14.MessagePosted:fire(v55);
			if not v35:ProcessCompletedChatMessage(v55, v32) then
				local v58 = nil;
				if v17.DisallowedWhiteSpace then
					local v59 = #v17.DisallowedWhiteSpace;
					local v60 = 1 - 1;
					while true do
						if v17.DisallowedWhiteSpace[v60] == "\t" then
							v55 = string.gsub(v55, v17.DisallowedWhiteSpace[v60], " ");
						else
							v55 = string.gsub(v55, v17.DisallowedWhiteSpace[v60], "");
						end;
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
				end;
				v58 = string.gsub(string.gsub(v55, "\n", ""), "[ ]+", " ");
				local v61 = v32:GetTargetMessageChannel();
				if v61 then
					v37:SendMessage(v58, v61);
					return;
				end;
				v37:SendMessage(v58, nil);
			end;
		end;
	end;
end;
local u21 = {};
function setupChatBarConnections()
	local v62 = #u21;
	local v63 = 1 - 1;
	while true do
		u21[v63]:Disconnect();
		if 0 <= 1 then
			if v63 < v62 then

			else
				break;
			end;
		elseif v62 < v63 then

		else
			break;
		end;
		v63 = v63 + 1;	
	end;
	u21 = {};
	table.insert(u21, (v36:GetTextBox().FocusLost:connect(chatBarFocusLost)));
	table.insert(u21, (v36:GetTextBox().Focused:connect(chatBarFocused)));
end;
setupChatBarConnections();
v36.GuiObjectsChanged:connect(setupChatBarConnections);
function getEchoMessagesInGeneral()
	if v17.EchoMessagesInGeneralChannel == nil then
		return true;
	end;
	return v17.EchoMessagesInGeneralChannel;
end;
u3.OnMessageDoneFiltering.OnClientEvent:connect(function(p61)
	if not v17.ShowUserOwnFilteredMessage and p61.FromSpeaker == v26.Name then
		return;
	end;
	local l__OriginalChannel__64 = p61.OriginalChannel;
	local v65 = v32:GetChannel(l__OriginalChannel__64);
	if v65 then
		v65:UpdateMessageFiltered(p61);
	end;
	if getEchoMessagesInGeneral() and v17.GeneralChannelName and l__OriginalChannel__64 ~= v17.GeneralChannelName then
		local v66 = v32:GetChannel(v17.GeneralChannelName);
		if v66 then
			v66:UpdateMessageFiltered(p61);
		end;
	end;
end);
u3.OnNewMessage.OnClientEvent:connect(function(p62, p63)
	local v67 = v32:GetChannel(p63);
	if v67 then
		v67:AddMessageToChannel(p62);
		if p62.FromSpeaker ~= v26.Name then
			v33:UpdateMessagePostedInChannel(p63);
		end;
		if getEchoMessagesInGeneral() and v17.GeneralChannelName and p63 ~= v17.GeneralChannelName then
			local v68 = v32:GetChannel(v17.GeneralChannelName);
			if v68 then
				v68:AddMessageToChannel(p62);
			end;
		end;
		u14.MessageCount = u14.MessageCount + 1;
		u14.MessagesChanged:fire(u14.MessageCount);
		DoFadeInFromNewInformation();
	end;
end);
u3.OnNewSystemMessage.OnClientEvent:connect(function(p64, p65)
	p65 = p65 and "System";
	local v69 = v32:GetChannel(p65);
	if v69 then
		v69:AddMessageToChannel(p64);
		v33:UpdateMessagePostedInChannel(p65);
		u14.MessageCount = u14.MessageCount + 1;
		u14.MessagesChanged:fire(u14.MessageCount);
		DoFadeInFromNewInformation();
		if getEchoMessagesInGeneral() and v17.GeneralChannelName and p65 ~= v17.GeneralChannelName then
			local v70 = v32:GetChannel(v17.GeneralChannelName);
			if v70 then
				v70:AddMessageToChannel(p64);
				return;
			end;
		end;
	else
		warn(string.format("Just received system message for channel I'm not in [%s]", p65));
	end;
end);
function HandleChannelJoined(p66, p67, p68, p69, p70, p71)
	if v32:GetChannel(p66) then
		v32:RemoveChannel(p66);
	end;
	if p66 == v17.GeneralChannelName then
		u20 = true;
	end;
	if p69 then
		v36:SetChannelNameColor(p66, p69);
	end;
	local v71 = v32:AddChannel(p66);
	if v71 then
		if p66 == v17.GeneralChannelName then
			DoSwitchCurrentChannel(p66);
		end;
		if p68 then
			local v72 = 1;
			if v17.MessageHistoryLengthPerChannel < #p68 then
				v72 = #p68 - v17.MessageHistoryLengthPerChannel;
			end;
			local v73 = #p68;
			local v74 = v72 - 1;
			while true do
				v71:AddMessageToChannel(p68[v74]);
				if 0 <= 1 then
					if v74 < v73 then

					else
						break;
					end;
				elseif v73 < v74 then

				else
					break;
				end;
				v74 = v74 + 1;			
			end;
			if getEchoMessagesInGeneral() then
				if p70 then
					if v17.GeneralChannelName then
						if p66 ~= v17.GeneralChannelName then
							local v75 = v32:GetChannel(v17.GeneralChannelName);
							if v75 then
								v75:AddMessagesToChannelByTimeStamp(p68, v72);
							end;
						end;
					end;
				end;
			end;
		end;
		if p67 ~= "" then
			local v76 = {
				ID = -1, 
				FromSpeaker = nil, 
				SpeakerUserId = 0, 
				OriginalChannel = p66, 
				IsFiltered = true, 
				MessageLength = string.len(p67), 
				MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p67)), 
				Message = trimTrailingSpaces(p67), 
				MessageType = v16.MessageTypeWelcome, 
				Time = os.time(), 
				ExtraData = nil
			};
			v71:AddMessageToChannel(v76);
			if getEchoMessagesInGeneral() then
				if p71 then
					if not v17.ShowChannelsBar then
						if p66 ~= v17.GeneralChannelName then
							local v77 = v32:GetChannel(v17.GeneralChannelName);
							if v77 then
								v77:AddMessageToChannel(v76);
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
	v32:RemoveChannel(p76);
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
	local l__ChannelNameColorUpdated__78 = v13:WaitForChild("ChannelNameColorUpdated", 5);
	if l__ChannelNameColorUpdated__78 then
		l__ChannelNameColorUpdated__78.OnClientEvent:connect(function(p80, p81)
			v36:SetChannelNameColor(p80, p81);
		end);
	end;
end)();
local u22 = nil;
local u23 = nil;
local u24 = nil;
local u25 = nil;
pcall(function()
	u22 = l__StarterGui__11:GetCore("PlayerBlockedEvent");
	u23 = l__StarterGui__11:GetCore("PlayerMutedEvent");
	u24 = l__StarterGui__11:GetCore("PlayerUnblockedEvent");
	u25 = l__StarterGui__11:GetCore("PlayerUnmutedEvent");
end);
function SendSystemMessageToSelf(p82)
	local v79 = v32:GetCurrentChannel();
	if v79 then
		v79:AddMessageToChannel({
			ID = -1, 
			FromSpeaker = nil, 
			SpeakerUserId = 0, 
			OriginalChannel = v79.Name, 
			IsFiltered = true, 
			MessageLength = string.len(p82), 
			MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p82)), 
			Message = trimTrailingSpaces(p82), 
			MessageType = v16.MessageTypeSystem, 
			Time = os.time(), 
			ExtraData = nil
		});
	end;
end;
function MutePlayer(p83)
	local l__MutePlayerRequest__80 = v13:FindFirstChild("MutePlayerRequest");
	if l__MutePlayerRequest__80 then

	else
		return false;
	end;
	return l__MutePlayerRequest__80:InvokeServer(p83.Name);
end;
if u22 then
	u22.Event:connect(function(p84)
		if MutePlayer(p84) then
			if v17.PlayerDisplayNamesEnabled then
				local v81 = p84.DisplayName;
			else
				v81 = p84.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker '%s' has been blocked.", v81), {
				RBX_NAME = v81
			}));
		end;
	end);
end;
if v5 then
	if v17.ShowFriendJoinNotification ~= nil then
		local v82 = v17.ShowFriendJoinNotification;
	else
		v82 = false;
	end;
	if v82 then
		l__Players__25.PlayerAdded:Connect(function(p85)
			local v83, v84 = pcall(function()
				return p85:IsFriendsWith(v26.UserId);
			end);
			if v83 and v84 then
				local v85 = p85.Name;
				if v17.PlayerDisplayNamesEnabled then
					v85 = p85.DisplayName;
				end;
				SendSystemMessageToSelf((u1:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", v85), "RBX_NAME", v85)));
			end;
		end);
	end;
end;
if u23 then
	u23.Event:connect(function(p86)
		if MutePlayer(p86) then
			if v17.PlayerDisplayNamesEnabled then
				local v86 = p86.DisplayName;
			else
				v86 = p86.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker '%s' has been muted.", v86), {
				RBX_NAME = v86
			}));
		end;
	end);
end;
function UnmutePlayer(p87)
	local l__UnMutePlayerRequest__87 = v13:FindFirstChild("UnMutePlayerRequest");
	if l__UnMutePlayerRequest__87 then

	else
		return false;
	end;
	return l__UnMutePlayerRequest__87:InvokeServer(p87.Name);
end;
if u24 then
	u24.Event:connect(function(p88)
		if UnmutePlayer(p88) then
			if v17.PlayerDisplayNamesEnabled then
				local v88 = p88.DisplayName;
			else
				v88 = p88.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker '%s' has been unblocked.", v88), {
				RBX_NAME = v88
			}));
		end;
	end);
end;
if u25 then
	u25.Event:connect(function(p89)
		if UnmutePlayer(p89) then
			if v17.PlayerDisplayNamesEnabled then
				local v89 = p89.DisplayName;
			else
				v89 = p89.Name;
			end;
			SendSystemMessageToSelf(u1:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker '%s' has been unmuted.", v89), {
				RBX_NAME = v89
			}));
		end;
	end);
end;
spawn(function()
	if v26.UserId > 0 then
		pcall(function()
			local v90 = l__StarterGui__11:GetCore("GetBlockedUserIds");
			if #v90 > 0 then
				local l__SetBlockedUserIdsRequest__91 = v13:FindFirstChild("SetBlockedUserIdsRequest");
				if l__SetBlockedUserIdsRequest__91 then
					l__SetBlockedUserIdsRequest__91:FireServer(v90);
				end;
			end;
		end);
	end;
end);
spawn(function()
	local v92, v93 = pcall(function()
		return l__Chat__10:CanUserChatAsync(v26.UserId);
	end);
	if v92 then
		u19 = l__RunService__24:IsStudio() and v93;
	end;
end);
local v94 = u3.GetInitDataRequest:InvokeServer();
for v95, v96 in pairs(v94.Channels) do
	if v96[1] == v17.GeneralChannelName then
		HandleChannelJoined(v96[1], v96[2], v96[3], v96[4], true, false);
	end;
end;
for v97, v98 in pairs(v94.Channels) do
	if v98[1] ~= v17.GeneralChannelName then
		HandleChannelJoined(v98[1], v98[2], v98[3], v98[4], true, false);
	end;
end;
return u14;
