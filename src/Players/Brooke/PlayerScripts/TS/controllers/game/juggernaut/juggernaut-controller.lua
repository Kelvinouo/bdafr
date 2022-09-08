-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "JuggernautController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "JuggernautController";
end;
local l__CollectionTagAdded__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).CollectionTagAdded;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__CollectionTagAdded__1("juggernaut-crate", function(p3)
		local v5 = u3("ProximityPrompt", {
			KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
			HoldDuration = 3, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ActionText = "Open", 
			ObjectText = "Juggernaut Crate", 
			ClickablePrompt = false, 
			Parent = p3
		});
		local u9 = u2.new();
		p3.AncestryChanged:Connect(function(p4, p5)
			if p5 == nil then
				u9:DoCleaning();
			end;
		end);
		u9:GiveTask(l__default__5.Client:Get("RemoteName"):Connect(function(p6)
			if p6.entityInstance == l__Players__6.LocalPlayer.Character then
				v5:InputHoldEnd();
			end;
		end));
		v5.PromptButtonHoldBegan:Connect(function(p7)
			local v6 = u2.new();
			local u10 = l__GameAnimationUtil__7.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__8.OPEN_CRATE);
			v6:GiveTask(function()
				if u10 ~= nil then
					u10:Stop();
				end;
				if u10 ~= nil then
					u10:Destroy();
				end;
			end);
			v5.PromptButtonHoldEnded:Connect(function()
				v6:DoCleaning();
			end);
			v5.AncestryChanged:Connect(function(p8, p9)
				if p9 == nil then
					v6:DoCleaning();
				end;
			end);
		end);
		v5.Triggered:Connect(function(p10)
			l__default__5.Client:Get("RemoteName"):SendToServer({
				blockInstance = p3
			});
		end);
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
