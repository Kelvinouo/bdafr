
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__Chat__2 = game:GetService("Chat");
local l__ClientChatModules__3 = l__Chat__2:WaitForChild("ClientChatModules");
local l__MessageCreatorModules__4 = l__ClientChatModules__3:WaitForChild("MessageCreatorModules");
local l__Parent__5 = script.Parent;
local v6 = require(l__ClientChatModules__3:WaitForChild("ChatSettings"));
local v7 = require(l__Parent__5:WaitForChild("MessageSender"));
local v8 = {};
v8.__index = v8;
function mergeProps(p1, p2)
	if not p1 then
		return;
	end;
	local v9, v10, v11 = pairs(p1);
	while true do
		local v12, v13 = v9(v10, v11);
		if v12 then

		else
			break;
		end;
		v11 = v12;
		p2[v12] = v13;	
	end;
end;
function ReturnToObjectPoolRecursive(p3, p4)
	local v14 = p3:GetChildren();
	local v15 = #v14;
	local v16 = 1 - 1;
	while true do
		ReturnToObjectPoolRecursive(v14[v16], p4);
		if 0 <= 1 then
			if v16 < v15 then

			else
				break;
			end;
		elseif v15 < v16 then

		else
			break;
		end;
		v16 = v16 + 1;	
	end;
	p3.Parent = nil;
	p4:ReturnInstance(p3);
end;
local u1 = require(l__MessageCreatorModules__4:WaitForChild("Util"));
function GetMessageCreators()
	local v17 = {};
	local v18 = l__MessageCreatorModules__4:GetChildren();
	local v19 = #v18;
	local v20 = 1 - 1;
	while true do
		if v18[v20]:IsA("ModuleScript") then
			if v18[v20].Name ~= "Util" then
				local v21 = require(v18[v20]);
				v17[v21[u1.KEY_MESSAGE_TYPE]] = v21[u1.KEY_CREATOR_FUNCTION];
			end;
		end;
		if 0 <= 1 then
			if v20 < v19 then

			else
				break;
			end;
		elseif v19 < v20 then

		else
			break;
		end;
		v20 = v20 + 1;	
	end;
	return v17;
end;
function v8.WrapIntoMessageObject(p5, p6, p7)
	local v22 = nil;
	if u1.KEY_BASE_MESSAGE then
		v22 = p7[u1.KEY_BASE_MESSAGE];
	end;
	return {
		ID = p6.ID, 
		BaseFrame = p7[u1.KEY_BASE_FRAME], 
		BaseMessage = v22, 
		UpdateTextFunction = p7[u1.KEY_UPDATE_TEXT_FUNC] or function()
			warn("NO MESSAGE RESIZE FUNCTION");
		end, 
		GetHeightFunction = p7[u1.KEY_GET_HEIGHT], 
		FadeInFunction = p7[u1.KEY_FADE_IN], 
		FadeOutFunction = p7[u1.KEY_FADE_OUT], 
		UpdateAnimFunction = p7[u1.KEY_UPDATE_ANIMATION], 
		ObjectPool = p5.ObjectPool, 
		Destroyed = false, 
		Destroy = function(p8)
			ReturnToObjectPoolRecursive(p8.BaseFrame, p8.ObjectPool);
			p8.Destroyed = true;
		end
	};
end;
function v8.CreateMessageLabel(p9, p10, p11)
	local v23 = nil;
	p10.Channel = p11;
	local u2 = nil;
	pcall(function()
		u2 = l__Chat__2:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p10);
	end);
	p10.ExtraData = p10.ExtraData or {};
	mergeProps(u2, p10.ExtraData);
	local l__MessageType__24 = p10.MessageType;
	if p9.MessageCreators[l__MessageType__24] then
		local v25 = p9.MessageCreators[l__MessageType__24](p10, p11);
		if v25 then
			return p9:WrapIntoMessageObject(p10, v25);
		else
			return;
		end;
	elseif p9.DefaultCreatorType then
		v23 = p9.MessageCreators[p9.DefaultCreatorType](p10, p11);
		if not v23 then
			return;
		end;
	else
		error("No message creator available for message type: " .. l__MessageType__24);
		return;
	end;
	return p9:WrapIntoMessageObject(p10, v23);
end;
local u3 = require(l__Parent__5:WaitForChild("ObjectPool"));
function v1.new()
	local v26 = setmetatable({}, v8);
	v26.ObjectPool = u3.new(50);
	v26.MessageCreators = GetMessageCreators();
	v26.DefaultCreatorType = u1.DEFAULT_MESSAGE_CREATOR;
	u1:RegisterObjectPool(v26.ObjectPool);
	return v26;
end;
function v1.GetStringTextBounds(p12, p13, p14, p15, p16)
	return u1:GetStringTextBounds(p13, p14, p15, p16);
end;
return v1;

