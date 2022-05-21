-- Decompiled with the Synapse X Luau decompiler.

local l__BPRewardDisplayType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "battle-pass-reward-display-type").BPRewardDisplayType;
return {
	BPRewardDisplayMeta = {
		[l__BPRewardDisplayType__1.KIT] = {
			name = "Kit", 
			borderColor = Color3.fromRGB(222, 125, 0), 
			backgroundColor = Color3.fromRGB(204, 99, 0), 
			frameSize = UDim2.new(0, 75, 0.85, 0), 
			frameShine = true
		}, 
		[l__BPRewardDisplayType__1.KILL_EFFECT] = {
			name = "Kill Effect", 
			borderColor = Color3.fromRGB(66, 235, 204), 
			backgroundColor = Color3.fromRGB(0, 204, 158), 
			frameSize = UDim2.new(0, 75, 0.85, 0), 
			frameShine = true
		}, 
		[l__BPRewardDisplayType__1.LOBBY_GADGET] = {
			name = "Lobby Gadget", 
			borderColor = Color3.fromRGB(237, 66, 122), 
			backgroundColor = Color3.fromRGB(242, 48, 112), 
			frameSize = UDim2.new(0, 75, 0.85, 0), 
			frameShine = true
		}, 
		[l__BPRewardDisplayType__1.KIT_SKIN] = {
			name = "Kit Skin", 
			borderColor = Color3.fromRGB(237, 66, 166), 
			backgroundColor = Color3.fromRGB(237, 66, 186), 
			frameSize = UDim2.new(0, 75, 0.85, 0), 
			frameShine = true
		}
	}
};
