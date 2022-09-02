-- Decompiled with the Synapse X Luau decompiler.

local l__GuiService__1 = game:GetService("GuiService");
local l__UserInputService__2 = game:GetService("UserInputService");
local v3 = require(script.Postie);
local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
game:GetService("ScriptContext").Error:Connect(function(p1, p2, p3)
	if not p3 then
		return;
	end;
	local u2 = nil;
	local v4, v5 = pcall(function()
		u2 = p3:GetFullName();
	end);
	if not v4 then
		return;
	end;
	l__ReplicatedStorage__1.GameAnalyticsError:FireServer(p1, p2, u2);
end);
v3.SetCallback("getPlatform", function()
	if l__GuiService__1:IsTenFootInterface() then
		return "Console";
	end;
	if l__UserInputService__2.TouchEnabled and not l__UserInputService__2.MouseEnabled then
		return "Mobile";
	end;
	return "Desktop";
end);
