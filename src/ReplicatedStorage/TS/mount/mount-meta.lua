-- Script Hash: ca82a97e73a99b224f2f7061084fbb9f95f4cd11d165c4bc24bffa5617ad906a4fae09bb7630ed99395bf6b5420a9d32
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__AnimationType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__MountType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType;
return {
	MountMeta = {
		[l__MountType__3.DODO_BIRD] = {
			model = "dodo_bird", 
			displayName = "Dodo Bird", 
			animations = {
				jump = l__AnimationType__2.DODO_BIRD_FLUTTER, 
				fall = l__AnimationType__2.DODO_BIRD_FALL, 
				walk = l__AnimationType__2.DODO_BIRD_WALK, 
				idle = l__AnimationType__2.DODO_BIRD_IDLE
			}, 
			controlBoneCallback = function(p1)
				return p1.RootPart.master.torso["torso.001"];
			end
		}, 
		[l__MountType__3.DINO] = {
			model = "dino", 
			displayName = "Dino", 
			animations = {
				jump = l__AnimationType__2.DINO_JUMP, 
				fall = l__AnimationType__2.DINO_FALLING, 
				walk = l__AnimationType__2.DINO_WALKING, 
				idle = l__AnimationType__2.DINO_IDLE
			}, 
			controlBoneCallback = function(p2)
				return p2.HumanoidRootPart.master_bone.torso["torso.001"];
			end
		}
	}
};
