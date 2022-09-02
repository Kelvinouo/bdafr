-- Decompiled with the Synapse X Luau decompiler.

local v1 = false;
local v2, v3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService");
end);
if v2 then
	v1 = v3;
end;
local l__ReplicatedStorage__4 = game:GetService("ReplicatedStorage");
local u1 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"));
local l__StarterGui__2 = game:GetService("StarterGui");
function SetCoreGuiChatConnections(p1)
	local v5 = 0;
	while true do
		if v5 < 10 then

		else
			break;
		end;
		v5 = v5 + 1;
		local v6, v7 = pcall(function()
			l__StarterGui__2:SetCore("CoreGuiChatConnections", p1);
		end);
		if not v6 then

		else
			break;
		end;
		if not v6 then
			if v5 == 10 then
				error("Error calling SetCore CoreGuiChatConnections: " .. v7);
			end;
		end;
		wait();	
	end;
end;
function checkBothChatTypesDisabled()
	if u1.BubbleChatEnabled ~= nil then
		if u1.ClassicChatEnabled ~= nil then

		else
			return false;
		end;
	else
		return false;
	end;
	return not (u1.BubbleChatEnabled or u1.ClassicChatEnabled);
end;
if not game:GetService("GuiService"):IsTenFootInterface() and not game:GetService("UserInputService").VREnabled then
	if not checkBothChatTypesDisabled() then
		(function()
			local v8 = {
				ChatWindow = {}, 
				SetCore = {}, 
				GetCore = {}
			};
			v8.ChatWindow.ChatTypes = {};
			v8.ChatWindow.ChatTypes.BubbleChatEnabled = u1.BubbleChatEnabled;
			v8.ChatWindow.ChatTypes.ClassicChatEnabled = u1.ClassicChatEnabled;
			local u3 = require(script:WaitForChild("ChatMain"));
			local v9 = Instance.new("BindableEvent");
			v9.Name = "ToggleVisibility";
			v8.ChatWindow.ToggleVisibility = v9;
			local u4 = "ToggleVisibility";
			v9.Event:connect(function(...)
				u3[u4](u3, ...);
			end);
			local v10 = Instance.new("BindableEvent");
			v10.Name = "SetVisible";
			v8.ChatWindow.SetVisible = v10;
			u4 = "SetVisible";
			v10.Event:connect(function(...)
				u3[u4](u3, ...);
			end);
			local v11 = Instance.new("BindableEvent");
			v11.Name = "FocusChatBar";
			v8.ChatWindow.FocusChatBar = v11;
			u4 = "FocusChatBar";
			v11.Event:connect(function(...)
				u3[u4](u3, ...);
			end);
			local v12 = Instance.new("BindableEvent");
			v12.Name = "EnterWhisperState";
			v8.ChatWindow.EnterWhisperState = v12;
			u4 = "EnterWhisperState";
			v12.Event:connect(function(...)
				u3[u4](u3, ...);
			end);
			local v13 = Instance.new("BindableFunction");
			v13.Name = "GetVisibility";
			v8.ChatWindow.GetVisibility = v13;
			local u5 = "GetVisibility";
			function v13.OnInvoke(...)
				return u3[u5](u3, ...);
			end;
			local v14 = Instance.new("BindableFunction");
			v14.Name = "GetMessageCount";
			v8.ChatWindow.GetMessageCount = v14;
			u5 = "GetMessageCount";
			function v14.OnInvoke(...)
				return u3[u5](u3, ...);
			end;
			local v15 = Instance.new("BindableEvent");
			v15.Name = "TopbarEnabledChanged";
			v8.ChatWindow.TopbarEnabledChanged = v15;
			local l__Event__16 = v15.Event;
			u4 = "TopbarEnabledChanged";
			u5 = l__Event__16;
			l__Event__16.connect(u5, function(...)
				u3[u4](u3, ...);
			end);
			local v17 = Instance.new("BindableFunction");
			v17.Name = "IsFocused";
			v8.ChatWindow.IsFocused = v17;
			u5 = "IsFocused";
			function v17.OnInvoke(...)
				return u3[u5](u3, ...);
			end;
			local v18 = Instance.new("BindableEvent");
			v18.Name = "ChatBarFocusChanged";
			v8.ChatWindow.ChatBarFocusChanged = v18;
			local l__ChatBarFocusChanged__19 = u3.ChatBarFocusChanged;
			local u6 = v18;
			u5 = l__ChatBarFocusChanged__19;
			l__ChatBarFocusChanged__19.connect(u5, function(...)
				u6:Fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "VisibilityStateChanged";
			v8.ChatWindow.VisibilityStateChanged = u6;
			local l__VisibilityStateChanged__20 = u3.VisibilityStateChanged;
			u5 = l__VisibilityStateChanged__20;
			l__VisibilityStateChanged__20.connect(u5, function(...)
				u6:Fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "MessagesChanged";
			v8.ChatWindow.MessagesChanged = u6;
			local l__MessagesChanged__21 = u3.MessagesChanged;
			u5 = l__MessagesChanged__21;
			l__MessagesChanged__21.connect(u5, function(...)
				u6:Fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "MessagePosted";
			v8.ChatWindow.MessagePosted = u6;
			local l__MessagePosted__22 = u3.MessagePosted;
			u5 = l__MessagePosted__22;
			l__MessagePosted__22.connect(u5, function(...)
				u6:Fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "CoreGuiEnabled";
			v8.ChatWindow.CoreGuiEnabled = u6;
			local l__Event__23 = u6.Event;
			u4 = "CoreGuiEnabled";
			u5 = l__Event__23;
			l__Event__23.connect(u5, function(...)
				u3[u4]:fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "ChatMakeSystemMessage";
			v8.SetCore.ChatMakeSystemMessage = u6;
			local l__Event__24 = u6.Event;
			u4 = "ChatMakeSystemMessage";
			u5 = l__Event__24;
			l__Event__24.connect(u5, function(...)
				u3[u4 .. "Event"]:fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "ChatWindowPosition";
			v8.SetCore.ChatWindowPosition = u6;
			local l__Event__25 = u6.Event;
			u4 = "ChatWindowPosition";
			u5 = l__Event__25;
			l__Event__25.connect(u5, function(...)
				u3[u4 .. "Event"]:fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "ChatWindowSize";
			v8.SetCore.ChatWindowSize = u6;
			local l__Event__26 = u6.Event;
			u4 = "ChatWindowSize";
			u5 = l__Event__26;
			l__Event__26.connect(u5, function(...)
				u3[u4 .. "Event"]:fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableFunction");
			u6.Name = "ChatWindowPosition";
			v8.GetCore.ChatWindowPosition = u6;
			u5 = "ChatWindowPosition";
			function u6.OnInvoke(...)
				return u3["f" .. u5](...);
			end;
			u6 = Instance.new;
			u6 = u6("BindableFunction");
			u6.Name = "ChatWindowSize";
			v8.GetCore.ChatWindowSize = u6;
			u5 = "ChatWindowSize";
			function u6.OnInvoke(...)
				return u3["f" .. u5](...);
			end;
			u6 = Instance.new;
			u6 = u6("BindableEvent");
			u6.Name = "ChatBarDisabled";
			v8.SetCore.ChatBarDisabled = u6;
			local l__Event__27 = u6.Event;
			u4 = "ChatBarDisabled";
			u5 = l__Event__27;
			l__Event__27.connect(u5, function(...)
				u3[u4 .. "Event"]:fire(...);
			end);
			u6 = Instance.new;
			u6 = u6("BindableFunction");
			u6.Name = "ChatBarDisabled";
			v8.GetCore.ChatBarDisabled = u6;
			u5 = "ChatBarDisabled";
			function u6.OnInvoke(...)
				return u3["f" .. u5](...);
			end;
			u6 = v1;
			if not u6 then
				u6 = Instance.new;
				u6 = u6("BindableEvent");
				u6.Name = "SpecialKeyPressed";
				v8.ChatWindow.SpecialKeyPressed = u6;
				local l__Event__28 = u6.Event;
				u4 = "SpecialKeyPressed";
				u5 = l__Event__28;
				l__Event__28.connect(u5, function(...)
					u3[u4](u3, ...);
				end);
			end;
			u6 = SetCoreGuiChatConnections;
			u6(v8);
		end)();
	else
		local v29 = {
			ChatWindow = {}
		};
		v29.ChatWindow.ChatTypes = {};
		v29.ChatWindow.ChatTypes.BubbleChatEnabled = false;
		v29.ChatWindow.ChatTypes.ClassicChatEnabled = false;
		SetCoreGuiChatConnections(v29);
	end;
else
	l__ReplicatedStorage__4:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer();
end;
