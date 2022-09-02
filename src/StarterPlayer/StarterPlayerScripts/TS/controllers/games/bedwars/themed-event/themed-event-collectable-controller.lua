-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, script.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ThemedEventCollectableController";
	end, 
	__index = v4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.constructor(p1)
	v4.constructor(p1);
	p1.Name = "ThemedEventCollectableController";
	p1.remotes = l__default__1.Client:GetNamespace("ThemedEvent");
	p1.activeQuestNotifications = {};
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.KnitStart(p2)
	v4.KnitStart(p2);
	p2.remotes:OnEvent("SendThemedEventQuestUpdate", function(p3)
		l__ClientStore__2:dispatch({
			type = "SetPteCollectable", 
			eventType = p3.eventType, 
			personalCollectable = p3.collectableType, 
			amountCollected = p3.totalAmountCollected
		});
		p2:displayQuestProgress(p3.collectableType, p3.totalAmountCollected);
	end);
	p2:setupQuestHud();
end;
local l__CollectableEntityType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
function v5.validCollectableEntityTypes(p4)
	return { l__CollectableEntityType__3.EASTER_EGG };
end;
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-meta").ThemedEventCollectableMeta;
local l__RandomUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).RandomUtil;
function v5.pickDisplayModel(p5, p6, p7)
	local v7 = u4[p6];
	return {
		repStorageModel = l__RandomUtil__5.randomArraySelectN(v7.models, 1)[1], 
		collectionTag = p6, 
		proximityPrompt = {
			name = v7.name
		}
	};
end;
local l__KnitClient__6 = v2.KnitClient;
local l__FireworkType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
function v5.onWillRemoveEntity(p8, p9, p10, p11, p12)
	if not p11 then
		return nil;
	end;
	if not p8:getEntityMaid(p9) then
		return nil;
	end;
	local v8 = p12:Clone();
	local v9, v10, v11 = ipairs((v8:GetDescendants()));
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		if v10:IsA("ProximityPrompt") then
			v10:Destroy();
		end;	
	end;
	v8.Parent = game.Workspace;
	if p12.PrimaryPart then
		l__KnitClient__6.Controllers.FireworkController:playFireworkEffect(v8:GetPrimaryPartCFrame().Position, l__FireworkType__7.SPARKS, {
			volumeMultiplier = 0.15, 
			sizeMultiplier = 0.35
		});
		local v12 = l__KnitClient__6.Controllers.PickupEffectController:playEffect(v8.PrimaryPart, p11.Character);
		if not v12 then
			v8:Destroy();
		end;
		if v12 ~= nil then
			v12:GiveTask(function()
				v8:Destroy();
			end);
		end;
	end;
	return nil;
end;
local l__RunService__8 = v3.RunService;
function v5.onCreatedEntity(p13, p14, p15, p16)
	local v13 = p13:getEntityMaid(p14);
	if not v13 then
		return nil;
	end;
	p16.PrimaryPart.Anchored = true;
	local u9 = 0;
	v13:GiveTask(l__RunService__8.RenderStepped:Connect(function(p17)
		u9 = u9 + p17;
		p16:SetPrimaryPartCFrame(CFrame.new(p16.PrimaryPart.Position) * CFrame.Angles(0, math.pi * 2 * u9 * 0.3, 0));
	end));
	return nil;
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__QuestProgressWrapper__11 = v1.import(script, script.Parent, "ui", "quest-progress-app").QuestProgressWrapper;
local l__Players__12 = v3.Players;
function v5.setupQuestHud(p18)
	local v14 = u10.mount(u10.createElement(l__QuestProgressWrapper__11), l__Players__12.LocalPlayer:WaitForChild("PlayerGui"));
end;
local l__ThemedCollectableType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types").ThemedCollectableType;
local u14 = v1.import(script, script.Parent, "ui", "quest-progress-notification").QuestProgressNotification;
function v5.displayQuestProgress(p19, p20, p21)
	local v15 = p19.activeQuestNotifications[p20];
	local v16 = u4[p20];
	local v17 = {
		ItemName = v16.name, 
		CurrentAmount = p21, 
		GoalAmount = v16.maxCollectAmount
	};
	if p20 == l__ThemedCollectableType__13.EASTER_EGG then
		v17.ItemName = "\240\159\165\154" .. v16.name;
	end;
	if v15 then
		local v18 = {};
		for v19, v20 in pairs(v17) do
			v18[v19] = v20;
		end;
		local v21 = u10.update(v15, u10.createElement(u14, v18));
		return;
	end;
	local v22 = {};
	for v23, v24 in pairs(v17) do
		v22[v23] = v24;
	end;
	local v25 = u10.mount(u10.createElement(u14, v22), l__Players__12.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("QuestProgressGui"):WaitForChild("QuestProgressContainer"));
end;
local v26 = v2.KnitClient.CreateController(v5.new());
return nil;
