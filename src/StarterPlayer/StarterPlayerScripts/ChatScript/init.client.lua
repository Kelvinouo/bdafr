
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
			local function v9(p2)
				local v10 = Instance.new("BindableEvent");
				v10.Name = p2;
				v8.ChatWindow[p2] = v10;
				v10.Event:connect(function(...)
					u3[p2](u3, ...);
				end);
			end;
			local function v11(p3)
				local v12 = Instance.new("BindableFunction");
				v12.Name = p3;
				v8.ChatWindow[p3] = v12;
				function v12.OnInvoke(...)
					return u3[p3](u3, ...);
				end;
			end;
			local function v13(p4)
				local v14 = Instance.new("BindableEvent");
				v14.Name = p4;
				v8.ChatWindow[p4] = v14;
				u3[p4]:connect(function(...)
					v14:Fire(...);
				end);
			end;
			local function v15(p5)
				local v16 = Instance.new("BindableEvent");
				v16.Name = p5;
				v8.SetCore[p5] = v16;
				v16.Event:connect(function(...)
					u3[p5 .. "Event"]:fire(...);
				end);
			end;
			local function v17(p6)
				local v18 = Instance.new("BindableFunction");
				v18.Name = p6;
				v8.GetCore[p6] = v18;
				function v18.OnInvoke(...)
					return u3["f" .. p6](...);
				end;
			end;
			v9("ToggleVisibility");
			v9("SetVisible");
			v9("FocusChatBar");
			v9("EnterWhisperState");
			v11("GetVisibility");
			v11("GetMessageCount");
			v9("TopbarEnabledChanged");
			v11("IsFocused");
			v13("ChatBarFocusChanged");
			v13("VisibilityStateChanged");
			v13("MessagesChanged");
			v13("MessagePosted");
			(function(p7)
				local v19 = Instance.new("BindableEvent");
				v19.Name = p7;
				v8.ChatWindow[p7] = v19;
				v19.Event:connect(function(...)
					u3[p7]:fire(...);
				end);
			end)("CoreGuiEnabled");
			v15("ChatMakeSystemMessage");
			v15("ChatWindowPosition");
			v15("ChatWindowSize");
			v17("ChatWindowPosition");
			v17("ChatWindowSize");
			v15("ChatBarDisabled");
			v17("ChatBarDisabled");
			if not v1 then
				v9("SpecialKeyPressed");
			end;
			SetCoreGuiChatConnections(v8);
		end)();
	else
		local v20 = {
			ChatWindow = {}
		};
		v20.ChatWindow.ChatTypes = {};
		v20.ChatWindow.ChatTypes.BubbleChatEnabled = false;
		v20.ChatWindow.ChatTypes.ClassicChatEnabled = false;
		SetCoreGuiChatConnections(v20);
	end;
else
	l__ReplicatedStorage__4:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer();
end;

