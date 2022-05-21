-- Script Hash: 05a9142fd0caa51969ea3a212223a0261addc789a72ac1d90ae096c61d8dbcb435aacf01b168992e073f4d2fa7e8ec93
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return {
	AnticheatRemotes = v2.Definitions.Create({
		ReportStatus = v2.Definitions.ClientToServerEvent()
	})
};
