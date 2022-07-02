-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitClient__3 = v2.KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "EngineerTabletController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__HandKnitController__5;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "EngineerTabletController";
	p1.nextAllowActivation = -1;
	p1.maid = u3.new();
end;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__ClientStore__4.changed:connect(function(p3, p4)
		local l__selectedTurret__8 = p3.Game.selectedTurret;
		if l__selectedTurret__8 == nil and l__selectedTurret__8 ~= p4.Game.selectedTurret then
			l__ClientStore__4:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = 0
			});
		end;
	end);
end;
local l__EntityUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__CollectionService__6 = v4.CollectionService;
local l__TurretId__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local l__Players__8 = v4.Players;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__KnitClient__10 = v2.KnitClient;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__CreateRoduxApp__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local u14 = v1.import(script, script.Parent, "ui", "engineer-camera-view").EngineerCameraViewWrapper;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__default__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.attemptToActivate(p5)
	if time() < p5.nextAllowActivation then
		return false;
	end;
	p5.nextAllowActivation = time() + 1;
	if l__EntityUtil__5:getLocalPlayerEntity() == nil then
		warn("Could not find entity for localplayer");
		return false;
	end;
	local v9 = {};
	local v10 = 0;
	local v11, v12, v13 = ipairs((l__CollectionService__6:GetTagged(l__TurretId__7.VULCAN_TURRET)));
	while true do
		local v14, v15 = v11(v12, v13);
		if not v14 then
			break;
		end;
		if v15:GetAttribute("PlacedByUserId") == l__Players__8.LocalPlayer.UserId == true then
			v10 = v10 + 1;
			v9[v10] = v15;
		end;	
	end;
	if #v9 == 0 then
		l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
			message = "You do not have any turrets placed yet."
		});
		return false;
	end;
	local u17 = l__KnitClient__10.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		moveSpeedMultiplier = 0
	});
	p5.maid:GiveTask(function()
		u17.Destroy();
	end);
	local u18 = l__GameAnimationUtil__11.playAnimation(l__Players__8.LocalPlayer, l__AnimationType__12.USE_TABLET, {
		looped = true
	});
	p5.maid:GiveTask(function()
		if u18 ~= nil then
			u18:Stop();
		end;
	end);
	local u19 = l__KnitClient__3.Controllers.ViewmodelController:addDisabler();
	p5.maid:GiveTask(function()
		l__KnitClient__3.Controllers.ViewmodelController:removeDisabler(u19);
	end);
	p5:setupYield(function()
		local u20 = l__CreateRoduxApp__13("EngineerCameraView", u14);
		return function()
			u15.unmount(u20);
		end;
	end);
	p5:setupYield(function()
		local u21 = l__default__16.Client:Get("RemoteName"):Connect(function(p6)
			if l__Players__8.LocalPlayer.Character and p6.entityInstance == l__Players__8.LocalPlayer.Character then
				p5.maid:DoCleaning();
			end;
		end);
		return function()
			u21:Disconnect();
		end;
	end);
	return true;
end;
function u1.onEnable(p7)
	if p7:attemptToActivate() == false then
		l__ClientStore__4:dispatch({
			type = "InventorySelectHotbarSlot", 
			slot = 0
		});
	end;
end;
local l__ItemType__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p8, p9)
	return p9.itemType == l__ItemType__22.TABLET;
end;
function u1.onDisable(p10)
	p10.maid:DoCleaning();
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	EngineerTabletController = u2
};
return u1;
