-- Script Hash: ddf2c4cd6bdbf1ce544d044340cc5bf4bcea5e7bef7856392066bd9d5e92034e3fee540547a93f73d9e5e26ff02158d8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "CollectableEntityController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = l__KnitController__5;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "CollectableEntityController";
	p1.entityMap = {};
	p1.entityMaidMap = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Maid__3 = v3.Maid;
local l__CollectionService__4 = v4.CollectionService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if table.find(p2:validCollectableEntityTypes(), p4.entityType) == nil then
				return nil;
			end;
			p2.entityMap[p4.id] = p4.entityType;
			p2.entityMaidMap[p4.id] = l__Maid__3.new();
			local v7 = p2:pickDisplayModel(p4.entityType, p4.model);
			local v8 = {};
			for v9, v10 in pairs(p4) do
				v8[v9] = v10;
			end;
			v8.tag = v7.collectionTag;
			v8.repStorageModel = v7.repStorageModel;
			v8.proximityPrompt = v7.proximityPrompt;
			p2:createLocalModel(v8);
		end);
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p5)
		if table.find(p2:validCollectableEntityTypes(), p5.entityType) == nil then
			return nil;
		end;
		local v11 = l__CollectionService__4:GetTagged(p5.entityType);
		local function v12(p6)
			return p6:GetAttribute("Id") == p5.id;
		end;
		local v13 = nil;
		for v14, v15 in ipairs(v11) do
			if v12(v15, v14 - 1, v11) == true then
				v13 = v15;
				break;
			end;
		end;
		if v13 then
			p2:onWillRemoveEntity(p5.id, p5.entityType, p5.collector, v13);
		end;
		p2.entityMap[p5.id] = nil;
		local v16 = p2.entityMaidMap[p5.id];
		if v16 ~= nil then
			v16:DoCleaning();
		end;
		p2.entityMaidMap[p5.id] = nil;
		if v13 ~= nil then
			v13:Destroy();
		end;
	end);
end;
local l__Workspace__5 = v4.Workspace;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__KnitClient__11 = v3.KnitClient;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.createLocalModel(p7, p8)
	local v17 = p8.repStorageModel:Clone();
	v17.Parent = l__Workspace__5;
	v17:SetAttribute("Id", p8.id);
	v17:SetPrimaryPartCFrame(CFrame.new(p8.position));
	for v18, v19 in ipairs(p8.repStorageModel:GetDescendants()) do
		if v19:IsA("BasePart") then
			l__GameQueryUtil__6:setQueryIgnored(v19, true);
		end;
	end;
	v17.PrimaryPart.Anchored = true;
	v17.PrimaryPart.CanCollide = false;
	if p8.proximityPrompt then
		local v20 = {
			ActionText = "Pick Up", 
			ObjectText = p8.proximityPrompt.name, 
			HoldDuration = 0.07, 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Enabled = true, 
			MaxActivationDistance = 5
		};
		function v20.Triggered(p9)
			l__GameAnimationUtil__9.playAnimation(p9, l__AnimationType__10.PUNCH);
			l__KnitClient__11.Controllers.ViewmodelController:playAnimation(l__AnimationType__10.FP_USE_ITEM);
			l__SoundManager__12:playSound(l__GameSound__13.PICKUP_ITEM_DROP);
			if p8.proximityPrompt then
				p7:collectEntity(p9, v17, p8.proximityPrompt.name);
			end;
		end;
		v20.Parent = v17;
		u7("ProximityPrompt", v20);
	end;
	p7:onCreatedEntity(p8.id, p8.entityType, v17);
	l__CollectionService__4:AddTag(v17, p8.tag);
	return v17;
end;
local l__Players__14 = v4.Players;
function v6.collectEntity(p10, p11, p12, p13)
	if p11 == l__Players__14.LocalPlayer then
		l__default__2.Client:Get("RemoteName"):SendToServer({
			id = p12:GetAttribute("Id"), 
			collectableName = p13
		});
	end;
end;
function v6.getEntityMaid(p14, p15)
	return p14.entityMaidMap[p15];
end;
u1 = {
	CollectableEntityController = v6
};
return u1;
