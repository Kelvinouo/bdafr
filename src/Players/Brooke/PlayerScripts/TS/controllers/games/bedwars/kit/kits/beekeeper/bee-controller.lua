-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BeeController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BeeController";
	local v7 = u3("Part", {
		Name = "Root", 
		Size = Vector3.new(1, 1, 1), 
		Anchored = false, 
		CanCollide = false
	});
	p1.beelessModel = u3("Model", {
		PrimaryPart = v7, 
		Children = { v7 }, 
		Parent = l__ReplicatedStorage__4
	});
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__6 = v3.CollectionService;
function u1.KnitStart(p2)
	l__default__5.Client:OnEvent("RemoteName", function(p3)
		local v8 = {
			id = p3.beeId, 
			origin = p3.position, 
			maxDistanceFromOrigin = 8
		};
		if p3.useBeeModel then
			local v9 = l__ReplicatedStorage__4.Assets.Effects.Bee:Clone();
		else
			v9 = p2.beelessModel:Clone();
		end;
		v8.beeModel = v9;
		v8.includeProximityPrompt = true;
		p2:createLocalBee(v8);
	end);
	l__default__5.Client:OnEvent("RemoteName", function(p4)
		local v10 = nil;
		for v11, v12 in ipairs((l__CollectionService__6:GetTagged("bee"))) do
			if v12:GetAttribute("BeeId") == p4.beeId == true then
				v10 = v12;
				break;
			end;
		end;
		if v10 ~= nil then
			v10:Destroy();
		end;
	end);
end;
local l__Workspace__7 = v3.Workspace;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__KnitClient__9 = v2.KnitClient;
local l__GameQueryUtil__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.createLocalBee(p5, p6)
	local v13 = p6.beeModel:Clone();
	v13:SetPrimaryPartCFrame(CFrame.new(p6.origin));
	local l__Root__14 = v13.Root;
	u3("BodyVelocity", {
		Parent = l__Root__14
	});
	u3("BodyForce", {
		Parent = l__Root__14, 
		Force = Vector3.new(0, l__Root__14:GetMass() * l__Workspace__7.Gravity, 0)
	});
	u3("BodyGyro", {
		MaxTorque = Vector3.new(400000, 400000, 400000), 
		D = 600, 
		Parent = l__Root__14
	});
	if p6.includeProximityPrompt then
		local v15 = {
			ActionText = "Pick Up", 
			ObjectText = "Bee", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Enabled = false
		};
		function v15.Triggered(p7)
			l__KnitClient__9.Controllers.BeeNetController:trigger(p7, v13);
		end;
		v15.Parent = l__Root__14;
		u3("ProximityPrompt", v15);
	end;
	v13.Parent = l__Workspace__7;
	v13:SetAttribute("BeeId", p6.id);
	v13:SetAttribute("BeeOrigin", p6.origin);
	v13:SetAttribute("MaxDistanceFromOrigin", p6.maxDistanceFromOrigin);
	v13:SetAttribute("NextUpdateDirection", -1);
	for v16, v17 in ipairs(v13:GetDescendants()) do
		if v17:IsA("BasePart") then
			l__GameQueryUtil__10:setQueryIgnored(v17, true);
		end;
	end;
	local v18 = v13:FindFirstChildOfClass("AnimationController");
	if v18 ~= nil then
		local v19 = v18:LoadAnimation(l__GameAnimationUtil__11.getAnimation(l__AnimationType__12.BEE_FLAP));
		v19.Looped = true;
		v19:Play();
	end;
	l__CollectionService__6:AddTag(v13, "bee");
	return v13;
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
