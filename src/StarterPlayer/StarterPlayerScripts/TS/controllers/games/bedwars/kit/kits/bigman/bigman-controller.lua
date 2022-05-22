-- Script Hash: d0c389122e7144abec45c0c4f89ac12ea35c8cdba55274e959bfa6d796da0b04b19768413a2e4b42029a3a021a27b700
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "BigmanController";
	end, 
	__index = l__KnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__KnitController__6;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BigmanController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__4 = v5.ReplicatedStorage;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__Workspace__6 = v5.Workspace;
local l__CollectionService__7 = v5.CollectionService;
local l__CollectionTagAdded__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__Maid__9 = v3.Maid;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__12 = v5.Players;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__17 = v5.TweenService;
function u1.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local v9 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("TreeOrb"):Clone();
		v9:SetPrimaryPartCFrame(CFrame.new(p3.position));
		v9:SetAttribute("TreeOrbSecret", p3.treeOrbSecret);
		for v10, v11 in ipairs(v9:GetDescendants()) do
			if v11:IsA("BasePart") then
				l__GameQueryUtil__5:setQueryIgnored(v11, true);
			end;
		end;
		v9.Parent = l__Workspace__6;
		l__CollectionService__7:AddTag(v9, "treeOrb");
		v1.Promise.delay(150):andThen(function()
			v9:Destroy();
		end);
	end);
	l__CollectionTagAdded__8("treeOrb", function(p4)
		local v12 = l__Maid__9.new();
		u10("ProximityPrompt", {
			ActionText = "Consume", 
			ObjectText = "Tree Orb", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__11.promptKeyboardKey, 
			Parent = p4, 
			RequiresLineOfSight = false
		}).Triggered:Connect(function(p5)
			if p5 == l__Players__12.LocalPlayer then
				l__GameAnimationUtil__13.playAnimation(p5, l__AnimationType__14.PUNCH);
				l__KnitClient__4.Controllers.ViewmodelController:playAnimation(l__AnimationType__14.FP_USE_ITEM);
				l__SoundManager__15:playSound(l__GameSound__16.CROP_HARVEST);
				if l__default__3.Client:Get("RemoteName"):CallServer({
					treeOrbSecret = p4:GetAttribute("TreeOrbSecret")
				}) then
					p4:Destroy();
				end;
			end;
		end);
		v1.Promise.defer(function()
			local v13 = Instance.new("CFrameValue");
			v13.Value = p4:GetPrimaryPartCFrame();
			v13.Changed:Connect(function(p6)
				if p4.PrimaryPart then
					p4:SetPrimaryPartCFrame(p6);
				end;
			end);
			while p4.PrimaryPart do
				local v14 = l__TweenService__17:Create(v13, TweenInfo.new(2), {
					Value = v13.Value + Vector3.new(0, 2, 0)
				});
				v14:Play();
				v14.Completed:Wait();
				local v15 = l__TweenService__17:Create(v13, TweenInfo.new(2), {
					Value = v13.Value + Vector3.new(0, -2, 0)
				});
				v15:Play();
				v15.Completed:Wait();			
			end;
		end);
		v12:GiveTask(p4.AncestryChanged:Connect(function(p7, p8)
			if p8 == nil then
				v12:DoCleaning();
			end;
		end));
	end);
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
