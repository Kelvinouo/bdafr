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
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "CollectableEntityController";
	p1.entityMap = {};
	p1.entityMaidMap = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__CollectionService__3 = v3.CollectionService;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			if table.find(p2:validCollectableEntityTypes(), p4.entityType) == nil then
				return nil;
			end;
			p2.entityMap[p4.id] = p4.entityType;
			p2.entityMaidMap[p4.id] = u2.new();
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
	l__default__1.Client:OnEvent("RemoteName", function(p5)
		if table.find(p2:validCollectableEntityTypes(), p5.entityType) == nil then
			return nil;
		end;
		local v10 = nil;
		local v11, v12, v13 = ipairs((l__CollectionService__3:GetTagged(p5.entityType)));
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
			if v12:GetAttribute("Id") == p5.id == true then
				v10 = v12;
				break;
			end;		
		end;
		if v10 then
			p2:onWillRemoveEntity(p5.id, p5.entityType, p5.collector, v10);
		end;
		p2.entityMap[p5.id] = nil;
		local v14 = p2.entityMaidMap[p5.id];
		if v14 ~= nil then
			v14:DoCleaning();
		end;
		p2.entityMaidMap[p5.id] = nil;
		if v10 ~= nil then
			v10:Destroy();
		end;
	end);
end;
local l__Workspace__4 = v3.Workspace;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__KnitClient__10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__11 = v2.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.createLocalModel(p6, p7)
	local v15 = p7.repStorageModel:Clone();
	v15.Parent = l__Workspace__4;
	v15:SetAttribute("Id", p7.id);
	v15:SetPrimaryPartCFrame(CFrame.new(p7.position));
	local v16, v17, v18 = ipairs(p7.repStorageModel:GetDescendants());
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		if v17:IsA("BasePart") then
			l__GameQueryUtil__5:setQueryIgnored(v17, true);
		end;	
	end;
	v15.PrimaryPart.Anchored = true;
	v15.PrimaryPart.CanCollide = false;
	if p7.proximityPrompt then
		local v19 = {
			ActionText = "Pick Up", 
			ObjectText = p7.proximityPrompt.name, 
			HoldDuration = 0.07, 
			KeyboardKeyCode = l__Theme__7.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			Enabled = true, 
			MaxActivationDistance = 5
		};
		function v19.Triggered(p8)
			l__GameAnimationUtil__8.playAnimation(p8, l__AnimationType__9.PUNCH);
			l__KnitClient__10.Controllers.ViewmodelController:playAnimation(l__AnimationType__9.FP_USE_ITEM);
			l__SoundManager__11:playSound(l__GameSound__12.PICKUP_ITEM_DROP);
			if p7.proximityPrompt then
				p6:collectEntity(p8, v15, p7.proximityPrompt.name);
			end;
		end;
		v19.Parent = v15;
		u6("ProximityPrompt", v19);
	end;
	p6:onCreatedEntity(p7.id, p7.entityType, v15);
	l__CollectionService__3:AddTag(v15, p7.tag);
	return v15;
end;
local l__Players__13 = v3.Players;
function v5.collectEntity(p9, p10, p11, p12)
	if p10 == l__Players__13.LocalPlayer then
		l__default__1.Client:Get("RemoteName"):SendToServer({
			id = p11:GetAttribute("Id"), 
			collectableName = p12
		});
	end;
end;
function v5.getEntityMaid(p13, p14)
	return p13.entityMaidMap[p14];
end;
return {
	CollectableEntityController = v5
};
