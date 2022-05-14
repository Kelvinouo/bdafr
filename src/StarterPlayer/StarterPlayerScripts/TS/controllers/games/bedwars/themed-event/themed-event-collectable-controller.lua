-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
	local v9 = v8:GetDescendants();
	local function v10(p13)
		if p13:IsA("ProximityPrompt") then
			p13:Destroy();
		end;
	end;
	for v11, v12 in ipairs(v9) do
		v10(v12, v11 - 1, v9);
	end;
	v8.Parent = game.Workspace;
	if p12.PrimaryPart then
		l__KnitClient__7.Controllers.FireworkController:playFireworkEffect(v8:GetPrimaryPartCFrame().Position, l__FireworkType__8.SPARKS, {
			volumeMultiplier = 0.15, 
			sizeMultiplier = 0.35
		});
		local v13 = l__KnitClient__7.Controllers.PickupEffectController:playEffect(v8.PrimaryPart, p11.Character);
		if not v13 then
			v8:Destroy();
		end;
		if v13 ~= nil then
			v13:GiveTask(function()
				v8:Destroy();
			end);
		end;
	end;
	return nil;
end;
local l__RunService__9 = v3.RunService;
function v5.onCreatedEntity(p14, p15, p16, p17)
	local v14 = p14:getEntityMaid(p15);
	if not v14 then
		return nil;
	end;
	p17.PrimaryPart.Anchored = true;
	local u10 = 0;
	v14:GiveTask(l__RunService__9.RenderStepped:Connect(function(p18)
		u10 = u10 + p18;
		p17:SetPrimaryPartCFrame(CFrame.new(p17.PrimaryPart.Position) * CFrame.Angles(0, math.pi * 2 * u10 * 0.3, 0));
	end));
	return nil;
end;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__QuestProgressWrapper__12 = v1.import(script, script.Parent, "ui", "quest-progress-app").QuestProgressWrapper;
local l__Players__13 = v3.Players;
function v5.setupQuestHud(p19)
	local v15 = u11.mount(u11.createElement(l__QuestProgressWrapper__12), l__Players__13.LocalPlayer:WaitForChild("PlayerGui"));
end;
local l__ThemedCollectableType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types").ThemedCollectableType;
local u15 = v1.import(script, script.Parent, "ui", "quest-progress-notification").QuestProgressNotification;
function v5.displayQuestProgress(p20, p21, p22)
	local v16 = p20.activeQuestNotifications[p21];
	local v17 = u5[p21];
	local v18 = {
		ItemName = v17.name, 
		CurrentAmount = p22, 
		GoalAmount = v17.maxCollectAmount
	};
	if p21 == l__ThemedCollectableType__14.EASTER_EGG then
		v18.ItemName = "\240\159\165\154" .. v17.name;
	end;
	if v16 then
		local v19 = {};
		for v20, v21 in pairs(v18) do
			v19[v20] = v21;
		end;
		local v22 = u11.update(v16, u11.createElement(u15, v19));
		return;
	end;
	local v23 = {};
	for v24, v25 in pairs(v18) do
		v23[v24] = v25;
	end;
	local v26 = u11.mount(u11.createElement(u15, v23), l__Players__13.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("QuestProgressGui"):WaitForChild("QuestProgressContainer"));
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
