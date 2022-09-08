-- Decompiled with the Synapse X Luau decompiler.

local v1 = false;
local v2, v3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService");
end);
if v2 then
	v1 = v3;
end;
local l__StarterGui__4 = game:GetService("StarterGui");
local l__GuiService__5 = game:GetService("GuiService");
local l__ReplicatedStorage__6 = game:GetService("ReplicatedStorage");
local v7 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
local v8, v9 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate3");
end);
function SetCoreGuiChatConnections(p1)
	local v10 = 0;
	while true do
		if v10 < 10 then

		else
			break;
		end;
		v10 = v10 + 1;
		local v11, v12 = pcall(function()
			l__StarterGui__4:SetCore("CoreGuiChatConnections", p1);
		end);
		if not v11 then

		else
			break;
		end;
		if not v11 then
			if v10 == 10 then
				error("Error calling SetCore CoreGuiChatConnections: " .. v12);
			end;
		end;
		wait();	
	end;
end;
function checkBothChatTypesDisabled()
	if v7.BubbleChatEnabled ~= nil then
		if v7.ClassicChatEnabled ~= nil then

		else
			return false;
		end;
	else
		return false;
	end;
	return not (v7.BubbleChatEnabled or v7.ClassicChatEnabled);
end;
if not l__GuiService__5:IsTenFootInterface() and (not game:GetService("UserInputService").VREnabled or (v8 or v9)) then
	if not checkBothChatTypesDisabled() then
		(function()
			local v13 = {
				ChatWindow = {}, 
				SetCore = {}, 
				GetCore = {}
			};
			v13.ChatWindow.ChatTypes = {};
			v13.ChatWindow.ChatTypes.BubbleChatEnabled = v7.BubbleChatEnabled;
			v13.ChatWindow.ChatTypes.ClassicChatEnabled = v7.ClassicChatEnabled;
			local u1 = require(script:WaitForChild("ChatMain"));
			local v14 = Instance.new("BindableEvent");
			v14.Name = "ToggleVisibility";
			v13.ChatWindow.ToggleVisibility = v14;
			local u2 = "ToggleVisibility";
			v14.Event:connect(function(...)
				u1[u2](u1, ...);
			end);
			local v15 = Instance.new("BindableEvent");
			v15.Name = "SetVisible";
			v13.ChatWindow.SetVisible = v15;
			u2 = "SetVisible";
			v15.Event:connect(function(...)
				u1[u2](u1, ...);
			end);
			local v16 = Instance.new("BindableEvent");
			v16.Name = "FocusChatBar";
			v13.ChatWindow.FocusChatBar = v16;
			u2 = "FocusChatBar";
			v16.Event:connect(function(...)
				u1[u2](u1, ...);
			end);
			local v17 = Instance.new("BindableEvent");
			v17.Name = "EnterWhisperState";
			v13.ChatWindow.EnterWhisperState = v17;
			u2 = "EnterWhisperState";
			v17.Event:connect(function(...)
				u1[u2](u1, ...);
			end);
			local v18 = Instance.new("BindableFunction");
			v18.Name = "GetVisibility";
			v13.ChatWindow.GetVisibility = v18;
			local u3 = "GetVisibility";
			function v18.OnInvoke(...)
				return u1[u3](u1, ...);
			end;
			local v19 = Instance.new("BindableFunction");
			v19.Name = "GetMessageCount";
			v13.ChatWindow.GetMessageCount = v19;
			u3 = "GetMessageCount";
			function v19.OnInvoke(...)
				return u1[u3](u1, ...);
			end;
			local v20 = Instance.new("BindableEvent");
			v20.Name = "TopbarEnabledChanged";
			v13.ChatWindow.TopbarEnabledChanged = v20;
			local l__Event__21 = v20.Event;
			u2 = "TopbarEnabledChanged";
			u3 = l__Event__21;
			l__Event__21.connect(u3, function(...)
				u1[u2](u1, ...);
			end);
			local v22 = Instance.new("BindableFunction");
			v22.Name = "IsFocused";
			v13.ChatWindow.IsFocused = v22;
			u3 = "IsFocused";
			function v22.OnInvoke(...)
				return u1[u3](u1, ...);
			end;
			local v23 = Instance.new("BindableEvent");
			v23.Name = "ChatBarFocusChanged";
			v13.ChatWindow.ChatBarFocusChanged = v23;
			local l__ChatBarFocusChanged__24 = u1.ChatBarFocusChanged;
			local u4 = v23;
			u3 = l__ChatBarFocusChanged__24;
			l__ChatBarFocusChanged__24.connect(u3, function(...)
				u4:Fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "VisibilityStateChanged";
			v13.ChatWindow.VisibilityStateChanged = u4;
			local l__VisibilityStateChanged__25 = u1.VisibilityStateChanged;
			u3 = l__VisibilityStateChanged__25;
			l__VisibilityStateChanged__25.connect(u3, function(...)
				u4:Fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "MessagesChanged";
			v13.ChatWindow.MessagesChanged = u4;
			local l__MessagesChanged__26 = u1.MessagesChanged;
			u3 = l__MessagesChanged__26;
			l__MessagesChanged__26.connect(u3, function(...)
				u4:Fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "MessagePosted";
			v13.ChatWindow.MessagePosted = u4;
			local l__MessagePosted__27 = u1.MessagePosted;
			u3 = l__MessagePosted__27;
			l__MessagePosted__27.connect(u3, function(...)
				u4:Fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "CoreGuiEnabled";
			v13.ChatWindow.CoreGuiEnabled = u4;
			local l__Event__28 = u4.Event;
			u2 = "CoreGuiEnabled";
			u3 = l__Event__28;
			l__Event__28.connect(u3, function(...)
				u1[u2]:fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "ChatMakeSystemMessage";
			v13.SetCore.ChatMakeSystemMessage = u4;
			local l__Event__29 = u4.Event;
			u2 = "ChatMakeSystemMessage";
			u3 = l__Event__29;
			l__Event__29.connect(u3, function(...)
				u1[u2 .. "Event"]:fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "ChatWindowPosition";
			v13.SetCore.ChatWindowPosition = u4;
			local l__Event__30 = u4.Event;
			u2 = "ChatWindowPosition";
			u3 = l__Event__30;
			l__Event__30.connect(u3, function(...)
				u1[u2 .. "Event"]:fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "ChatWindowSize";
			v13.SetCore.ChatWindowSize = u4;
			local l__Event__31 = u4.Event;
			u2 = "ChatWindowSize";
			u3 = l__Event__31;
			l__Event__31.connect(u3, function(...)
				u1[u2 .. "Event"]:fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableFunction");
			u4.Name = "ChatWindowPosition";
			v13.GetCore.ChatWindowPosition = u4;
			u3 = "ChatWindowPosition";
			function u4.OnInvoke(...)
				return u1["f" .. u3](...);
			end;
			u4 = Instance.new;
			u4 = u4("BindableFunction");
			u4.Name = "ChatWindowSize";
			v13.GetCore.ChatWindowSize = u4;
			u3 = "ChatWindowSize";
			function u4.OnInvoke(...)
				return u1["f" .. u3](...);
			end;
			u4 = Instance.new;
			u4 = u4("BindableEvent");
			u4.Name = "ChatBarDisabled";
			v13.SetCore.ChatBarDisabled = u4;
			local l__Event__32 = u4.Event;
			u2 = "ChatBarDisabled";
			u3 = l__Event__32;
			l__Event__32.connect(u3, function(...)
				u1[u2 .. "Event"]:fire(...);
			end);
			u4 = Instance.new;
			u4 = u4("BindableFunction");
			u4.Name = "ChatBarDisabled";
			v13.GetCore.ChatBarDisabled = u4;
			u3 = "ChatBarDisabled";
			function u4.OnInvoke(...)
				return u1["f" .. u3](...);
			end;
			u4 = v1;
			if not u4 then
				u4 = Instance.new;
				u4 = u4("BindableEvent");
				u4.Name = "SpecialKeyPressed";
				v13.ChatWindow.SpecialKeyPressed = u4;
				local l__Event__33 = u4.Event;
				u2 = "SpecialKeyPressed";
				u3 = l__Event__33;
				l__Event__33.connect(u3, function(...)
					u1[u2](u1, ...);
				end);
			end;
			u4 = SetCoreGuiChatConnections;
			u4(v13);
		end)();
	else
		local v34 = {
			ChatWindow = {}
		};
		v34.ChatWindow.ChatTypes = {};
		v34.ChatWindow.ChatTypes.BubbleChatEnabled = false;
		v34.ChatWindow.ChatTypes.ClassicChatEnabled = false;
		SetCoreGuiChatConnections(v34);
	end;
else
	l__ReplicatedStorage__6:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer();
end;
