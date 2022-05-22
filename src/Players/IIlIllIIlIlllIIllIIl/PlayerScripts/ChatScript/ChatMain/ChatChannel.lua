-- Script Hash: 7c51704117ceae2d4b93eac00b5772dc60251ad1eb9427f19eec83c2bebf39aa247068ff15ca67a58a6dbd433018dd34
-- Decompiled with the Synapse X Luau decompiler.

local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagRemoveMessageFromMessageLog");
end);
local v3 = {};
local l__ClientChatModules__4 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l__Parent__5 = script.Parent;
local v6 = {};
v6.__index = v6;
function v6.Destroy(p1)
	p1.Destroyed = true;
end;
function v6.SetActive(p2, p3)
	if p3 == p2.Active then
		return;
	end;
	if p3 == false then
		p2.MessageLogDisplay:Clear();
	else
		p2.MessageLogDisplay:SetCurrentChannelName(p2.Name);
		for v7 = 1, #p2.MessageLog do
			p2.MessageLogDisplay:AddMessage(p2.MessageLog[v7]);
		end;
	end;
	p2.Active = p3;
end;
local u1 = v1 or v2;
function v6.UpdateMessageFiltered(p4, p5)
	local v8 = 1;
	local l__MessageLog__9 = p4.MessageLog;
	local v10 = nil;
	while v8 <= #l__MessageLog__9 do
		local v11 = l__MessageLog__9[v8];
		if v11.ID == p5.ID then
			v10 = v11;
			break;
		end;
		v8 = v8 + 1;	
	end;
	if v10 then
		v10.Message = p5.Message;
		v10.IsFiltered = true;
		if not p4.Active then
			return;
		end;
	else
		p4:AddMessageToChannelByTimeStamp(p5);
		return;
	end;
	if u1 and v10.Message == "" then
		table.remove(p4.MessageLog, v8);
	end;
	p4.MessageLogDisplay:UpdateMessageFiltered(v10);
end;
local u2 = require(l__ClientChatModules__4:WaitForChild("ChatSettings"));
function v6.AddMessageToChannel(p6, p7)
	table.insert(p6.MessageLog, p7);
	if p6.Active then
		p6.MessageLogDisplay:AddMessage(p7);
	end;
	if u2.MessageHistoryLengthPerChannel < #p6.MessageLog then
		p6:RemoveLastMessageFromChannel();
	end;
end;
function v6.InternalAddMessageAtTimeStamp(p8, p9)
	for v12 = 1, #p8.MessageLog do
		if p9.Time < p8.MessageLog[v12].Time then
			table.insert(p8.MessageLog, v12, p9);
			return;
		end;
	end;
	table.insert(p8.MessageLog, p9);
end;
function v6.AddMessagesToChannelByTimeStamp(p10, p11, p12)
	for v13 = p12, #p11 do
		p10:InternalAddMessageAtTimeStamp(p11[v13]);
	end;
	while u2.MessageHistoryLengthPerChannel < #p10.MessageLog do
		table.remove(p10.MessageLog, 1);	
	end;
	if p10.Active then
		p10.MessageLogDisplay:Clear();
		for v14 = 1, #p10.MessageLog do
			p10.MessageLogDisplay:AddMessage(p10.MessageLog[v14]);
		end;
	end;
end;
function v6.AddMessageToChannelByTimeStamp(p13, p14)
	if not (#p13.MessageLog >= 1) then
		p13:AddMessageToChannel(p14);
		return;
	end;
	if p14.Time < p13.MessageLog[1].Time then
		return;
	end;
	if p13.MessageLog[#p13.MessageLog].Time <= p14.Time then
		p13:AddMessageToChannel(p14);
		return;
	end;
	for v15 = 1, #p13.MessageLog do
		if p14.Time < p13.MessageLog[v15].Time then
			table.insert(p13.MessageLog, v15, p14);
			if u2.MessageHistoryLengthPerChannel < #p13.MessageLog then
				p13:RemoveLastMessageFromChannel();
			end;
			if p13.Active then
				p13.MessageLogDisplay:AddMessageAtIndex(p14, v15);
			end;
			return;
		end;
	end;
end;
function v6.RemoveLastMessageFromChannel(p15)
	table.remove(p15.MessageLog, 1);
	if p15.Active then
		p15.MessageLogDisplay:RemoveLastMessage();
	end;
end;
function v6.ClearMessageLog(p16)
	p16.MessageLog = {};
	if p16.Active then
		p16.MessageLogDisplay:Clear();
	end;
end;
function v6.RegisterChannelTab(p17, p18)
	p17.ChannelTab = p18;
end;
function v3.new(p19, p20)
	local v16 = setmetatable({}, v6);
	v16.Destroyed = false;
	v16.Active = false;
	v16.MessageLog = {};
	v16.MessageLogDisplay = p20;
	v16.ChannelTab = nil;
	v16.Name = p19;
	return v16;
end;
return v3;
