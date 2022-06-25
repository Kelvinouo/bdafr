-- Script Hash: 84ef973aab809a9e4a619da983999fa1bc845a359ea06a1d4438ac5d553e654fb0d878e895cb5ad46152e8de72df103b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = {};
v2.__index = v2;
local l__ClientChatModules__3 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l__CommandModules__4 = l__ClientChatModules__3:WaitForChild("CommandModules");
local l__Parent__5 = script.Parent;
local u1 = require(l__CommandModules__4:WaitForChild("Util"));
function v2.SetupCommandProcessors(p1)
	local v6 = l__CommandModules__4:GetChildren();
	for v7 = 1, #v6 do
		if v6[v7]:IsA("ModuleScript") and v6[v7].Name ~= "Util" then
			local v8 = nil;
			local v9 = require(v6[v7]);
			local v10 = v9[u1.KEY_COMMAND_PROCESSOR_TYPE];
			v8 = v9[u1.KEY_PROCESSOR_FUNCTION];
			if v10 == u1.IN_PROGRESS_MESSAGE_PROCESSOR then
				table.insert(p1.InProgressMessageProcessors, v8);
			elseif v10 == u1.COMPLETED_MESSAGE_PROCESSOR then
				table.insert(p1.CompletedMessageProcessors, v8);
			end;
		end;
	end;
end;
local u2 = require(l__ClientChatModules__3:WaitForChild("ChatSettings"));
function v2.ProcessCompletedChatMessage(p2, p3, p4)
	for v11 = 1, #p2.CompletedMessageProcessors do
		if p2.CompletedMessageProcessors[v11](p3, p4, u2) then
			return true;
		end;
	end;
	return false;
end;
function v2.ProcessInProgressChatMessage(p5, p6, p7, p8)
	for v12 = 1, #p5.InProgressMessageProcessors do
		local v13 = p5.InProgressMessageProcessors[v12](p6, p7, p8, u2);
		if v13 then
			return v13;
		end;
	end;
	return nil;
end;
function v1.new()
	local v14 = setmetatable({}, v2);
	v14.CompletedMessageProcessors = {};
	v14.InProgressMessageProcessors = {};
	v14:SetupCommandProcessors();
	return v14;
end;
return v1;
