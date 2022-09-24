-- Decompiled with the Synapse X Luau decompiler.

return {
	ABTestConfig = {
		[require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "ab-tests", "ab-test-ids").ABTestId.SHIFT_LOCK_DEFAULT] = {
			values = { true, false }, 
			ratios = { 0.5, 0.5 }
		}
	}
};
