-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "DinoTamerController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "DinoTamerController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__MountType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType;
local l__Players__3 = v3.Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AbilityId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__PlayerEntity__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local l__SoundManager__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__11 = v2.KnitClient;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__RunService__13 = v3.RunService;
local l__default__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__ClientSyncEvents__1.GenericMountMounted:connect(function(p3)
		if p3.mountType == l__MountType__2.DINO and p3.player == l__Players__3.LocalPlayer then
			p2.dinoMaid = u4.new();
			local u15 = l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__6.DINO_CHARGE, {
				text = "Dino Attack", 
				interactionKey = Enum.KeyCode.V, 
				gamepadInteractionKey = Enum.KeyCode.Y
			});
			p2.dinoMaid:GiveTask(function()
				u15.Destroy();
			end);
		end;
	end);
	l__ClientSyncEvents__1.GenericMountDismounted:connect(function(p4)
		local l__dinoMaid__7 = p2.dinoMaid;
		if l__dinoMaid__7 ~= nil then
			l__dinoMaid__7:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__1.AbilityUsed:connect(function(p5)
		local v8 = l__EntityUtil__7:getEntity(p5.userCharacter);
		if v8 == nil or not v1.instanceof(v8, l__PlayerEntity__8) then
			return nil;
		end;
		local v9 = v8:getPlayer();
		local v10 = p5.userCharacter:FindFirstChildOfClass("Humanoid");
		if v10 == nil then
			return nil;
		end;
		if p5.ability == l__AbilityId__6.DINO_CHARGE then
			local v11 = u4.new();
			local v12 = {};
			if v9 == l__Players__3.LocalPlayer then
				local v13 = nil;
			else
				v13 = v8:getInstance():GetPrimaryPartCFrame().Position;
			end;
			v12.position = v13;
			v12.rollOffMaxDistance = 150;
			l__SoundManager__9:playSound(l__GameSound__10.DINO_CHARGE_START, v12);
			local v14 = {};
			if v9 == l__Players__3.LocalPlayer then
				local v15 = nil;
			else
				v15 = v8:getInstance():GetPrimaryPartCFrame().Position;
			end;
			v14.position = v15;
			v14.parent = v8:getInstance().HumanoidRootPart;
			v14.rollOffMaxDistance = 150;
			v14.volumeMultiplier = 1.5;
			v14.looped = true;
			local u16 = l__SoundManager__9:playSound(l__GameSound__10.DINO_CHARGE_LOOP, v14);
			v11:GiveTask(function()
				if u16 ~= nil then
					u16:Destroy();
				end;
			end);
			v11:GiveTask(function()
				local v16 = {};
				if v9 == l__Players__3.LocalPlayer then
					local v17 = nil;
				else
					v17 = v8:getInstance():GetPrimaryPartCFrame().Position;
				end;
				v16.position = v17;
				v16.rollOffMaxDistance = 150;
				l__SoundManager__9:playSound(l__GameSound__10.DINO_CHARGE_STOP, v16);
			end);
			local v18 = l__KnitClient__11.Controllers.MountController:getActiveMounts()[v9];
			if v18 ~= nil then
				v18 = v18.model;
			end;
			if v18 then
				local v19 = l__KnitClient__11.Controllers.MountAnimationController:playAnimationInMount(v18, l__AnimationType__12.DINO_CHARGING);
				if v19 then
					v19.Priority = Enum.AnimationPriority.Action;
					v11:GiveTask(function()
						v19:Stop();
						v19:Destroy();
					end);
				end;
				v11:GiveTask(function()
					local v20 = l__KnitClient__11.Controllers.MountAnimationController:playAnimationInMount(v18, l__AnimationType__12.DINO_HIT);
					if v20 then
						v20.Priority = Enum.AnimationPriority.Action;
						v20.Looped = false;
					end;
				end);
			end;
			if v9 == l__Players__3.LocalPlayer then
				v11:GiveTask((l__KnitClient__11.Controllers.SprintController:getMovementStatusModifier():addModifier({
					blockSprint = true, 
					moveSpeedMultiplier = 3
				})));
				v11:GiveTask(l__RunService__13.RenderStepped:Connect(function()
					v10:Move(Vector3.new(0, 0, -1), true);
				end));
			end;
			v11:GiveTask(l__default__14.Client:Get("RemoteName"):Connect(function(p6)
				if p6.player == v9 then
					v11:DoCleaning();
				end;
			end));
			task.delay(10, function()
				v11:DoCleaning();
			end);
		end;
	end);
end;
local v21 = v2.KnitClient.CreateController(v5.new());
return nil;
