-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__HandKnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "CannonHandController";
	end, 
	__index = l__HandKnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__HandKnitController__2.constructor(p1);
	p1.Name = "CannonHandController";
end;
function u1.KnitStart(p2)
	l__HandKnitController__2.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.TNT;
end;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function u1.onEnable(p5, p6)
	l__KnitClient__3.Controllers.CannonController:stopAiming();
	p5:updateAllCannonPrompts();
end;
function u1.onDisable(p7)
	p7:updateAllCannonPrompts();
end;
function u1.updateAllCannonPrompts(p8)
	local v5, v6, v7 = ipairs((l__KnitClient__3.Controllers.CannonController:getCannons()));
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
		p8:updateCannonPrompts(v6);	
	end;
end;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.updateCannonPrompts(p9, p10)
	if l__KnitClient__3.Controllers.CannonController:isAiming() then
		p10.AimPrompt.Enabled = false;
		p10.StopAimingPrompt.Enabled = true;
		p10.FirePrompt.Enabled = false;
		p10.LaunchSelfPrompt.Enabled = false;
		return nil;
	end;
	if not p9:isEnabled() then
		p10.AimPrompt.Enabled = true;
		p10.LaunchSelfPrompt.Enabled = true;
		p10.StopAimingPrompt.Enabled = false;
		p10.FirePrompt.Enabled = false;
		return;
	end;
	p10.AimPrompt.Enabled = false;
	p10.StopAimingPrompt.Enabled = false;
	local v8 = p9:getHandItem();
	if v8 ~= nil then
		v8 = v8.itemType;
	end;
	if v8 then
		p10.FirePrompt.ObjectText = "Consumes " .. l__getItemMeta__4(v8).displayName;
	else
		p10.FirePrompt.ObjectText = "Consumes Ammo";
	end;
	p10.FirePrompt.Enabled = true;
	return nil;
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__BlockEngine__6 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
function u1.fireCannon(p11, p12)
	local v9 = p11:getHandItem();
	if not v9 then
		return nil;
	end;
	l__default__5.Client:Get("RemoteName"):SendToServer({
		cannonBlockPos = l__BlockEngine__6:getBlockPosition(p12.Position), 
		itemType = v9.itemType
	});
end;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function u1.launchSelf(p13, p14)
	if not l__default__5.Client:Get("RemoteName"):CallServer({
		cannonBlockPos = l__BlockEngine__6:getBlockPosition(p14.Position)
	}) then
		return nil;
	end;
	local v10 = l__Players__7.LocalPlayer.Character;
	if v10 ~= nil then
		v10 = v10.PrimaryPart;
	end;
	if not v10 then
		return nil;
	end;
	local v11 = p14:GetAttribute("LookVector");
	if not v11 then
		return nil;
	end;
	local v12 = l__Players__7.LocalPlayer.Character;
	if v12 ~= nil then
		v12 = v12.PrimaryPart;
		if v12 ~= nil then
			v12 = v12.AssemblyMass;
		end;
	end;
	local v13 = v12;
	if v13 == nil then
		v13 = 0;
	end;
	v10:ApplyImpulse(v11 * v13 * 200);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(u1.new());
return nil;
