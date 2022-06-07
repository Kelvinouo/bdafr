-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "BigmanController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BigmanController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__4 = v4.ReplicatedStorage;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__Workspace__6 = v4.Workspace;
local l__CollectionService__7 = v4.CollectionService;
local l__CollectionTagAdded__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__12 = v4.Players;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__17 = v4.TweenService;
function u1.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local v8 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("TreeOrb"):Clone();
		v8:SetPrimaryPartCFrame(CFrame.new(p3.position));
		v8:SetAttribute("TreeOrbSecret", p3.treeOrbSecret);
		for v9, v10 in ipairs(v8:GetDescendants()) do
			if v10:IsA("BasePart") then
				l__GameQueryUtil__5:setQueryIgnored(v10, true);
			end;
		end;
		v8.Parent = l__Workspace__6;
		l__CollectionService__7:AddTag(v8, "treeOrb");
		v1.Promise.delay(150):andThen(function()
			v8:Destroy();
		end);
	end);
	l__CollectionTagAdded__8("treeOrb", function(p4)
		local v11 = u9.new();
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
				l__KnitClient__3.Controllers.ViewmodelController:playAnimation(l__AnimationType__14.FP_USE_ITEM);
				l__SoundManager__15:playSound(l__GameSound__16.CROP_HARVEST);
				if l__default__3.Client:Get("RemoteName"):CallServer({
					treeOrbSecret = p4:GetAttribute("TreeOrbSecret")
				}) then
					p4:Destroy();
				end;
			end;
		end);
		v1.Promise.defer(function()
			local v12 = Instance.new("CFrameValue");
			v12.Value = p4:GetPrimaryPartCFrame();
			v12.Changed:Connect(function(p6)
				if p4.PrimaryPart then
					p4:SetPrimaryPartCFrame(p6);
				end;
			end);
			while p4.PrimaryPart do
				local v13 = l__TweenService__17:Create(v12, TweenInfo.new(2), {
					Value = v12.Value + Vector3.new(0, 2, 0)
				});
				v13:Play();
				v13.Completed:Wait();
				local v14 = l__TweenService__17:Create(v12, TweenInfo.new(2), {
					Value = v12.Value + Vector3.new(0, -2, 0)
				});
				v14:Play();
				v14.Completed:Wait();			
			end;
		end);
		v11:GiveTask(p4.AncestryChanged:Connect(function(p7, p8)
			if p8 == nil then
				v11:DoCleaning();
			end;
		end));
	end);
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
