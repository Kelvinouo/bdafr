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
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "BeeController";
	local v7 = u2("Part", {
		Name = "Root", 
		Size = Vector3.new(1, 1, 1), 
		Anchored = false, 
		CanCollide = false
	});
	p1.beelessModel = u2("Model", {
		PrimaryPart = v7, 
		Children = { v7 }, 
		Parent = l__ReplicatedStorage__3
	});
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__5 = v3.CollectionService;
function u1.KnitStart(p2)
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local v8 = {
			id = p3.beeId, 
			origin = p3.position, 
			maxDistanceFromOrigin = 8
		};
		if p3.useBeeModel then
			local v9 = l__ReplicatedStorage__3.Assets.Effects.Bee:Clone();
		else
			v9 = p2.beelessModel:Clone();
		end;
		v8.beeModel = v9;
		v8.includeProximityPrompt = true;
		p2:createLocalBee(v8);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p4)
		local v10 = nil;
		local v11, v12, v13 = ipairs((l__CollectionService__5:GetTagged("bee")));
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
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
local l__Workspace__6 = v3.Workspace;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__KnitClient__8 = v2.KnitClient;
local l__GameQueryUtil__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.createLocalBee(p5, p6)
	local v14 = p6.beeModel:Clone();
	v14:SetPrimaryPartCFrame(CFrame.new(p6.origin));
	local l__Root__15 = v14.Root;
	u2("BodyVelocity", {
		Parent = l__Root__15
	});
	u2("BodyForce", {
		Parent = l__Root__15, 
		Force = Vector3.new(0, l__Root__15:GetMass() * l__Workspace__6.Gravity, 0)
	});
	u2("BodyGyro", {
		MaxTorque = Vector3.new(400000, 400000, 400000), 
		D = 600, 
		Parent = l__Root__15
	});
	if p6.includeProximityPrompt then
		local v16 = {
			ActionText = "Pick Up", 
			ObjectText = "Bee", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__7.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Enabled = false
		};
		function v16.Triggered(p7)
			l__KnitClient__8.Controllers.BeeNetController:trigger(p7, v14);
		end;
		v16.Parent = l__Root__15;
		u2("ProximityPrompt", v16);
	end;
	v14.Parent = l__Workspace__6;
	v14:SetAttribute("BeeId", p6.id);
	v14:SetAttribute("BeeOrigin", p6.origin);
	v14:SetAttribute("MaxDistanceFromOrigin", p6.maxDistanceFromOrigin);
	v14:SetAttribute("NextUpdateDirection", -1);
	local v17, v18, v19 = ipairs(v14:GetDescendants());
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		if v18:IsA("BasePart") then
			l__GameQueryUtil__9:setQueryIgnored(v18, true);
		end;	
	end;
	local v20 = v14:FindFirstChildOfClass("AnimationController");
	if v20 ~= nil then
		local v21 = v20:LoadAnimation(l__GameAnimationUtil__10.getAnimation(l__AnimationType__11.BEE_FLAP));
		v21.Looped = true;
		v21:Play();
	end;
	l__CollectionService__5:AddTag(v14, "bee");
	return v14;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
