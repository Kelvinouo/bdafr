-- Script Hash: 3fabd78c8e04d52cfbf236d6cc4fc459ff430b1bcfdcb7f7cbc39e533b9e274d30f127d7db41e6f30cb5d1297deca6fa
-- Decompiled with the Synapse X Luau decompiler.

local l__BPRewardDisplayType__1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-type").BPRewardDisplayType;
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
		}, 
		[l__BPRewardDisplayType__1.EMOTE] = {
			name = "Animated Emote", 
			borderColor = Color3.fromRGB(66, 107, 237), 
			backgroundColor = Color3.fromRGB(66, 140, 237), 
			frameSize = UDim2.new(0, 75, 0.85, 0), 
			frameShine = true
		}
	}
};
