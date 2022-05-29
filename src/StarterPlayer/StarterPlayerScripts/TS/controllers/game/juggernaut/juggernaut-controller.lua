-- Script Hash: ef4057dae5ed295614be00e39f229e9559be5dc50d354d95da50a3978a9b503fd6c119c5e76ad4bacaace3c455bc99ec
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "JuggernautController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "JuggernautController";
end;
local l__CollectionTagAdded__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CollectionTagAdded;
local l__Maid__3 = v2.Maid;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("juggernaut-crate", function(p3)
		local v6 = u4("ProximityPrompt", {
			KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
			HoldDuration = 3, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ActionText = "Open", 
			ObjectText = "Juggernaut Crate", 
			ClickablePrompt = false, 
			Parent = p3
		});
		local u10 = l__Maid__3.new();
		p3.AncestryChanged:Connect(function(p4, p5)
			if p5 == nil then
				u10:DoCleaning();
			end;
		end);
		u10:GiveTask(l__default__6.Client:Get("RemoteName"):Connect(function(p6)
			if p6.entityInstance == l__Players__7.LocalPlayer.Character then
				v6:InputHoldEnd();
			end;
		end));
		v6.PromptButtonHoldBegan:Connect(function(p7)
			local v7 = l__Maid__3.new();
			local u11 = l__GameAnimationUtil__8.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__9.OPEN_CRATE);
			v7:GiveTask(function()
				if u11 ~= nil then
					u11:Stop();
				end;
				if u11 ~= nil then
					u11:Destroy();
				end;
			end);
			v6.PromptButtonHoldEnded:Connect(function()
				v7:DoCleaning();
			end);
			v6.AncestryChanged:Connect(function(p8, p9)
				if p9 == nil then
					v7:DoCleaning();
				end;
			end);
		end);
		v6.Triggered:Connect(function(p10)
			l__default__6.Client:Get("RemoteName"):SendToServer({
				blockInstance = p3
			});
		end);
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
