
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
	l__default__5.Client:OnEvent("BeeSpawn", function(p3)
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
	l__default__5.Client:OnEvent("BeeRemoved", function(p4)
		local v10 = l__CollectionService__6:GetTagged("bee");
		local function v11(p5)
			return p5:GetAttribute("BeeId") == p4.beeId;
		end;
		local v12 = nil;
		for v13, v14 in ipairs(v10) do
			if v11(v14, v13 - 1, v10) == true then
				v12 = v14;
				break;
			end;
		end;
		if v12 ~= nil then
			v12:Destroy();
		end;
	end);
end;
local l__Workspace__7 = v3.Workspace;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__KnitClient__9 = v2.KnitClient;
local l__GameQueryUtil__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.createLocalBee(p6, p7)
	local v15 = p7.beeModel:Clone();
	v15:SetPrimaryPartCFrame(CFrame.new(p7.origin));
	local l__Root__16 = v15.Root;
	u3("BodyVelocity", {
		Parent = l__Root__16
	});
	u3("BodyForce", {
		Parent = l__Root__16, 
		Force = Vector3.new(0, l__Root__16:GetMass() * l__Workspace__7.Gravity, 0)
	});
	u3("BodyGyro", {
		MaxTorque = Vector3.new(400000, 400000, 400000), 
		D = 600, 
		Parent = l__Root__16
	});
	if p7.includeProximityPrompt then
		local v17 = {
			ActionText = "Pick Up", 
			ObjectText = "Bee", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Enabled = false
		};
		function v17.Triggered(p8)
			l__KnitClient__9.Controllers.BeeNetController:trigger(p8, v15);
		end;
		v17.Parent = l__Root__16;
		u3("ProximityPrompt", v17);
	end;
	v15.Parent = l__Workspace__7;
	v15:SetAttribute("BeeId", p7.id);
	v15:SetAttribute("BeeOrigin", p7.origin);
	v15:SetAttribute("MaxDistanceFromOrigin", p7.maxDistanceFromOrigin);
	v15:SetAttribute("NextUpdateDirection", -1);
	for v18, v19 in ipairs(v15:GetDescendants()) do
		if v19:IsA("BasePart") then
			l__GameQueryUtil__10:setQueryIgnored(v19, true);
		end;
	end;
	local v20 = v15:FindFirstChildOfClass("AnimationController");
	if v20 ~= nil then
		local v21 = v20:LoadAnimation(l__GameAnimationUtil__11.getAnimation(l__AnimationType__12.BEE_FLAP));
		v21.Looped = true;
		v21:Play();
	end;
	l__CollectionService__6:AddTag(v15, "bee");
	return v15;
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;

