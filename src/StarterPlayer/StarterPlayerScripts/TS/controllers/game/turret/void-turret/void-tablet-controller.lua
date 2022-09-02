-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VoidTabletController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__HandKnitController__4.constructor(p1);
	p1.Name = "VoidTabletController";
	p1.nextAllowActivation = -1;
	p1.maid = u2.new();
end;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
	l__ClientStore__3.changed:connect(function(p3, p4)
		local l__selectedTurret__7 = p3.Game.selectedTurret;
		if l__selectedTurret__7 == nil and l__selectedTurret__7 ~= p4.Game.selectedTurret then
			l__ClientStore__3:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = 0
			});
		end;
	end);
end;
local l__EntityUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__CollectionService__5 = v3.CollectionService;
local l__TurretId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local l__Players__7 = v3.Players;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__KnitClient__9 = v2.KnitClient;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__KnitClient__12 = v2.KnitClient;
local l__CreateRoduxApp__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__VoidTurretViewWrapper__14 = v1.import(script, script.Parent, "ui", "void-turret-view").VoidTurretViewWrapper;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__default__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.attemptToActivate(p5)
	if time() < p5.nextAllowActivation then
		return false;
	end;
	p5.nextAllowActivation = time() + 1;
	if l__EntityUtil__4:getLocalPlayerEntity() == nil then
		warn("Could not find entity for localplayer");
		return false;
	end;
	local v8 = {};
	local v9 = 0;
	local v10, v11, v12 = ipairs((l__CollectionService__5:GetTagged(l__TurretId__6.VOID_TURRET)));
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		if v11:GetAttribute("PlacedByUserId") == l__Players__7.LocalPlayer.UserId == true then
			v9 = v9 + 1;
			v8[v9] = v11;
		end;	
	end;
	if #v8 == 0 then
		l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
			message = "You do not have any void turrets placed yet."
		});
		return false;
	end;
	local u17 = l__KnitClient__9.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		moveSpeedMultiplier = 0
	});
	p5.maid:GiveTask(function()
		u17.Destroy();
	end);
	local u18 = l__GameAnimationUtil__10.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__11.USE_TABLET, {
		looped = true
	});
	p5.maid:GiveTask(function()
		if u18 ~= nil then
			u18:Stop();
		end;
	end);
	local u19 = l__KnitClient__12.Controllers.ViewmodelController:addDisabler();
	p5.maid:GiveTask(function()
		l__KnitClient__12.Controllers.ViewmodelController:removeDisabler(u19);
	end);
	p5:setupYield(function()
		local u20 = l__CreateRoduxApp__13("VoidCameraView", l__VoidTurretViewWrapper__14);
		return function()
			u15.unmount(u20);
		end;
	end);
	p5:setupYield(function()
		local u21 = l__default__16.Client:Get("RemoteName"):Connect(function(p6)
			if l__Players__7.LocalPlayer.Character and p6.entityInstance == l__Players__7.LocalPlayer.Character then
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
		l__ClientStore__3:dispatch({
			type = "InventorySelectHotbarSlot", 
			slot = 0
		});
	end;
end;
local l__ItemType__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p8, p9)
	return p9.itemType == l__ItemType__22.VOID_TURRET_TABLET;
end;
function u1.onDisable(p10)
	p10.maid:DoCleaning();
end;
u1 = l__KnitClient__12.CreateController;
u1 = u1(u1.new());
return {
	VoidTabletController = u1
};
