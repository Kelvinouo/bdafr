-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "PirateTelescopeService";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__HandKnitController__3.constructor(p1);
	p1.Name = "PirateTelescopeService";
	p1.abilityMaid = u1.new();
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p2, p3)
	return p3.itemType == l__ItemType__2.PIRATE_TELESCOPE;
end;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__AbilityId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
function v4.onEnable(p4, p5, p6)
	local u5 = l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(l__AbilityId__4.PIRATE_TELESCOPE, {
		text = "Use Telescope", 
		interactionKey = Enum.KeyCode.F, 
		gamepadInteractionKey = Enum.KeyCode.F
	});
	p4.abilityMaid:GiveTask(function()
		u5.Destroy();
	end);
end;
function v4.onDisable(p7)
	p7.abilityMaid:DoCleaning();
end;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__7 = v2.Players;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__AnimationUtil__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AnimationUtil;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.KnitStart(p8)
	l__HandKnitController__3.KnitStart(p8);
	l__ClientSyncEvents__6.AbilityUsed:connect(function(p9)
		local v6 = false;
		if p9.ability == l__AbilityId__4.PIRATE_TELESCOPE and p9.userCharacter == l__Players__7.LocalPlayer.Character then
			v6 = l__default__8.Client:Get("RemoteName"):CallServer();
		end;
		if v6 then
			local v7 = l__Players__7:GetPlayerFromCharacter(p9.userCharacter);
			if v7 then
				local u12 = l__AnimationUtil__9.playAnimation(v7, l__GameAnimationUtil__10.getAssetId(l__AnimationType__11.BOBA_BLASTER_IDLE));
				task.delay(1, function()
					if u12 ~= nil then
						u12:Stop();
					end;
					if u12 ~= nil then
						u12:Destroy();
					end;
				end);
			end;
		end;
	end);
	l__default__8.Client:Get("RemoteName"):Connect(function(p10)
		p8:createRadius(p10.player);
	end);
end;
local l__EntityUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__14 = v2.Workspace;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__RunService__16 = v2.RunService;
local l__TweenService__17 = v2.TweenService;
local u18 = TweenInfo.new(0.8, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
local l__PIRATE_TELESCOPE_RANGE__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile.PIRATE_TELESCOPE_RANGE;
local u20 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
function v4.createRadius(p11, p12)
	local v8 = p12.Team;
	if v8 ~= nil then
		v8 = v8.TeamColor.Color;
	end;
	local v9 = p12.Character;
	if v9 ~= nil then
		v9 = v9:GetPrimaryPartCFrame().Position;
	end;
	if not v9 then
		return nil;
	end;
	local u21 = u15("Part", {
		Parent = l__Workspace__14, 
		Size = Vector3.new(0.2, 0, 0), 
		CFrame = CFrame.new(v9) - Vector3.new(0, 2, 0), 
		Orientation = Vector3.new(0, 0, 90), 
		Shape = Enum.PartType.Cylinder, 
		Color = v8, 
		Transparency = 0, 
		CastShadow = false, 
		Material = Enum.Material.ForceField, 
		Reflectance = 0, 
		Anchored = true, 
		CanCollide = false, 
		CanTouch = false, 
		CanQuery = false
	});
	local u22 = l__EntityUtil__13:getEntity(p12);
	l__RunService__16.Heartbeat:Connect(function()
		local v10 = u21;
		if v10 then
			local v11 = u22;
			if v11 ~= nil then
				v11 = v11:isAlive();
			end;
			v10 = v11 and u22:getInstance():GetPrimaryPartCFrame().Position;
		end;
		if not v10 then
			print("RADIUS DESTROYED");
			return nil;
		end;
		u21.Position = u22:getInstance():GetPrimaryPartCFrame().Position - Vector3.new(0, 2, 0);
	end);
	local v12 = l__TweenService__17:Create(u21, u18, {
		Size = Vector3.new(0.2, l__PIRATE_TELESCOPE_RANGE__19, l__PIRATE_TELESCOPE_RANGE__19)
	});
	v12:Play();
	local u23 = nil;
	u23 = v12.Completed:Connect(function()
		l__TweenService__17:Create(u21, u20, {
			Size = Vector3.new(0.2, l__PIRATE_TELESCOPE_RANGE__19, l__PIRATE_TELESCOPE_RANGE__19), 
			Position = Vector3.new(u21.Position.X, u21.Position.Y + 0.1 + 0.1, u21.Position.Z)
		}):Play();
		u23:Disconnect();
		u21:Destroy();
	end);
end;
local v13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
