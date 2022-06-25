-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "CollectableEntityController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "CollectableEntityController";
	p1.entityMap = {};
	p1.entityMaidMap = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__CollectionService__4 = v3.CollectionService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if table.find(p2:validCollectableEntityTypes(), p4.entityType) == nil then
				return nil;
			end;
			p2.entityMap[p4.id] = p4.entityType;
			p2.entityMaidMap[p4.id] = u3.new();
			local v6 = p2:pickDisplayModel(p4.entityType, p4.model);
			local v7 = {};
			for v8, v9 in pairs(p4) do
				v7[v8] = v9;
			end;
			v7.tag = v6.collectionTag;
			v7.repStorageModel = v6.repStorageModel;
			v7.proximityPrompt = v6.proximityPrompt;
			p2:createLocalModel(v7);
		end);
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p5)
		if table.find(p2:validCollectableEntityTypes(), p5.entityType) == nil then
			return nil;
		end;
		local v10 = l__CollectionService__4:GetTagged(p5.entityType);
		local function v11(p6)
			return p6:GetAttribute("Id") == p5.id;
		end;
		local v12 = nil;
		for v13, v14 in ipairs(v10) do
			if v11(v14, v13 - 1, v10) == true then
				v12 = v14;
				break;
			end;
		end;
		if v12 then
			p2:onWillRemoveEntity(p5.id, p5.entityType, p5.collector, v12);
		end;
		p2.entityMap[p5.id] = nil;
		local v15 = p2.entityMaidMap[p5.id];
		if v15 ~= nil then
			v15:DoCleaning();
		end;
		p2.entityMaidMap[p5.id] = nil;
		if v12 ~= nil then
			v12:Destroy();
		end;
	end);
end;
local l__Workspace__5 = v3.Workspace;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__KnitClient__11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.createLocalModel(p7, p8)
	local v16 = p8.repStorageModel:Clone();
	v16.Parent = l__Workspace__5;
	v16:SetAttribute("Id", p8.id);
	v16:SetPrimaryPartCFrame(CFrame.new(p8.position));
	for v17, v18 in ipairs(p8.repStorageModel:GetDescendants()) do
		if v18:IsA("BasePart") then
			l__GameQueryUtil__6:setQueryIgnored(v18, true);
		end;
	end;
	v16.PrimaryPart.Anchored = true;
	v16.PrimaryPart.CanCollide = false;
	if p8.proximityPrompt then
		local v19 = {
			ActionText = "Pick Up", 
			ObjectText = p8.proximityPrompt.name, 
			HoldDuration = 0.07, 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Enabled = true, 
			MaxActivationDistance = 5
		};
		function v19.Triggered(p9)
			l__GameAnimationUtil__9.playAnimation(p9, l__AnimationType__10.PUNCH);
			l__KnitClient__11.Controllers.ViewmodelController:playAnimation(l__AnimationType__10.FP_USE_ITEM);
			l__SoundManager__12:playSound(l__GameSound__13.PICKUP_ITEM_DROP);
			if p8.proximityPrompt then
				p7:collectEntity(p9, v16, p8.proximityPrompt.name);
			end;
		end;
		v19.Parent = v16;
		u7("ProximityPrompt", v19);
	end;
	p7:onCreatedEntity(p8.id, p8.entityType, v16);
	l__CollectionService__4:AddTag(v16, p8.tag);
	return v16;
end;
local l__Players__14 = v3.Players;
function v5.collectEntity(p10, p11, p12, p13)
	if p11 == l__Players__14.LocalPlayer then
		l__default__2.Client:Get("RemoteName"):SendToServer({
			id = p12:GetAttribute("Id"), 
			collectableName = p13
		});
	end;
end;
function v5.getEntityMaid(p14, p15)
	return p14.entityMaidMap[p15];
end;
u1 = {
	CollectableEntityController = v5
};
return u1;
