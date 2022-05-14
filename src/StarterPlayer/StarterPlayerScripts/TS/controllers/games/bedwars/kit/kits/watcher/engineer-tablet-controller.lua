-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local l__Maid__3 = v2.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "EngineerTabletController";
	p1.nextAllowActivation = -1;
	p1.maid = l__Maid__3.new();
end;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__ClientStore__4.changed:connect(function(p3, p4)
		local l__engineerSelectedTurret__8 = p3.Kit.engineerSelectedTurret;
		if l__engineerSelectedTurret__8 == nil and l__engineerSelectedTurret__8 ~= p4.Kit.engineerSelectedTurret then
			l__ClientStore__4:dispatch({
				type = "InventorySelectHotbarSlot", 
				slot = 0
			});
		end;
	end);
end;
local l__EntityUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__CollectionService__6 = v4.CollectionService;
local l__Players__7 = v4.Players;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__KnitClient__9 = v2.KnitClient;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__CreateRoduxApp__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local u13 = v1.import(script, script.Parent, "ui", "engineer-camera-view").EngineerCameraViewWrapper;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__default__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.attemptToActivate(p5)
	if time() < p5.nextAllowActivation then
		return false;
	end;
	p5.nextAllowActivation = time() + 1;
	if l__EntityUtil__5:getLocalPlayerEntity() == nil then
		warn("Could not find entity for localplayer");
		return false;
	end;
	local v9 = l__CollectionService__6:GetTagged("engineer-turret");
	local function v10(p6)
		return p6:GetAttribute("PlacedByUserId") == l__Players__7.LocalPlayer.UserId;
	end;
	local v11 = {};
	local v12 = 0;
	for v13, v14 in ipairs(v9) do
		if v10(v14, v13 - 1, v9) == true then
			v12 = v12 + 1;
			v11[v12] = v14;
		end;
	end;
	if #v11 == 0 then
		l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
			message = "You do not have any turrets placed yet."
		});
		return false;
	end;
	local u16 = l__KnitClient__9.Controllers.SprintController:getMovementStatusModifier():addModifier({
		blockSprint = true, 
		moveSpeedMultiplier = 0
	});
	p5.maid:GiveTask(function()
		u16.Destroy();
	end);
	local u17 = l__GameAnimationUtil__10.playAnimation(l__Players__7.LocalPlayer, l__AnimationType__11.USE_TABLET, {
		looped = true
	});
	p5.maid:GiveTask(function()
		if u17 ~= nil then
			u17:Stop();
		end;
	end);
	local u18 = l__KnitClient__3.Controllers.ViewmodelController:addDisabler();
	p5.maid:GiveTask(function()
		l__KnitClient__3.Controllers.ViewmodelController:removeDisabler(u18);
	end);
	p5:setupYield(function()
		local u19 = l__CreateRoduxApp__12("EngineerCameraView", u13);
		return function()
			u14.unmount(u19);
		end;
	end);
	p5:setupYield(function()
		local u20 = l__default__15.Client:Get("EntityDamageEvent"):Connect(function(p7)
			if l__Players__7.LocalPlayer.Character and p7.entityInstance == l__Players__7.LocalPlayer.Character then
				p5.maid:DoCleaning();
			end;
		end);
		return function()
			u20:Disconnect();
		end;
	end);
	return true;
end;
function u1.onEnable(p8)
	if p8:attemptToActivate() == false then
		l__ClientStore__4:dispatch({
			type = "InventorySelectHotbarSlot", 
			slot = 0
		});
	end;
end;
local l__ItemType__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p9, p10)
	return p10.itemType == l__ItemType__21.TABLET;
end;
function u1.onDisable(p11)
	p11.maid:DoCleaning();
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	EngineerTabletController = u2
};
return u1;
