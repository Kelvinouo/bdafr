-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__StarterGui__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).StarterGui;
v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default.Client:OnEvent("RemoteName", function(p1)
	l__StarterGui__1:SetCore("ChatMakeSystemMessage", p1);
end);
return nil;
