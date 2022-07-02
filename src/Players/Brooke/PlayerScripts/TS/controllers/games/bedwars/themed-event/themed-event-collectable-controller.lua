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
local u1 = v4;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ThemedEventCollectableController";
	p1.remotes = l__default__2.Client:GetNamespace("ThemedEvent");
	p1.activeQuestNotifications = {};
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	p2.remotes:OnEvent("SendThemedEventQuestUpdate", function(p3)
		l__ClientStore__3:dispatch({
			type = "SetPteCollectable", 
			eventType = p3.eventType, 
			personalCollectable = p3.collectableType, 
			amountCollected = p3.totalAmountCollected
		});
		p2:displayQuestProgress(p3.collectableType, p3.totalAmountCollected);
	end);
	p2:setupQuestHud();
end;
local l__CollectableEntityType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
function v5.validCollectableEntityTypes(p4)
	return { l__CollectableEntityType__4.EASTER_EGG };
end;
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-meta").ThemedEventCollectableMeta;
local l__RandomUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).RandomUtil;
function v5.pickDisplayModel(p5, p6, p7)
	local v7 = u5[p6];
	return {
		repStorageModel = l__RandomUtil__6.randomArraySelectN(v7.models, 1)[1], 
		collectionTag = p6, 
		proximityPrompt = {
			name = v7.name
		}
	};
end;
local l__KnitClient__7 = v2.KnitClient;
local l__FireworkType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
function v5.onWillRemoveEntity(p8, p9, p10, p11, p12)
	if not p11 then
		return nil;
	end;
	if not p8:getEntityMaid(p9) then
		return nil;
	end;
	local v8 = p12:Clone();
	for v9, v10 in ipairs((v8:GetDescendants())) do
		if v10:IsA("ProximityPrompt") then
			v10:Destroy();
		end;
	end;
	v8.Parent = game.Workspace;
	if p12.PrimaryPart then
		l__KnitClient__7.Controllers.FireworkController:playFireworkEffect(v8:GetPrimaryPartCFrame().Position, l__FireworkType__8.SPARKS, {
			volumeMultiplier = 0.15, 
			sizeMultiplier = 0.35
		});
		local v11 = l__KnitClient__7.Controllers.PickupEffectController:playEffect(v8.PrimaryPart, p11.Character);
		if not v11 then
			v8:Destroy();
		end;
		if v11 ~= nil then
			v11:GiveTask(function()
				v8:Destroy();
			end);
		end;
	end;
	return nil;
end;
local l__RunService__9 = v3.RunService;
function v5.onCreatedEntity(p13, p14, p15, p16)
	local v12 = p13:getEntityMaid(p14);
	if not v12 then
		return nil;
	end;
	p16.PrimaryPart.Anchored = true;
	local u10 = 0;
	v12:GiveTask(l__RunService__9.RenderStepped:Connect(function(p17)
		u10 = u10 + p17;
		p16:SetPrimaryPartCFrame(CFrame.new(p16.PrimaryPart.Position) * CFrame.Angles(0, math.pi * 2 * u10 * 0.3, 0));
	end));
	return nil;
end;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__QuestProgressWrapper__12 = v1.import(script, script.Parent, "ui", "quest-progress-app").QuestProgressWrapper;
local l__Players__13 = v3.Players;
function v5.setupQuestHud(p18)
	local v13 = u11.mount(u11.createElement(l__QuestProgressWrapper__12), l__Players__13.LocalPlayer:WaitForChild("PlayerGui"));
end;
local l__ThemedCollectableType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types").ThemedCollectableType;
local u15 = v1.import(script, script.Parent, "ui", "quest-progress-notification").QuestProgressNotification;
function v5.displayQuestProgress(p19, p20, p21)
	local v14 = p19.activeQuestNotifications[p20];
	local v15 = u5[p20];
	local v16 = {
		ItemName = v15.name, 
		CurrentAmount = p21, 
		GoalAmount = v15.maxCollectAmount
	};
	if p20 == l__ThemedCollectableType__14.EASTER_EGG then
		v16.ItemName = "\240\159\165\154" .. v15.name;
	end;
	if v14 then
		local v17 = {};
		for v18, v19 in pairs(v16) do
			v17[v18] = v19;
		end;
		local v20 = u11.update(v14, u11.createElement(u15, v17));
		return;
	end;
	local v21 = {};
	for v22, v23 in pairs(v16) do
		v21[v22] = v23;
	end;
	local v24 = u11.mount(u11.createElement(u15, v21), l__Players__13.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("QuestProgressGui"):WaitForChild("QuestProgressContainer"));
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
