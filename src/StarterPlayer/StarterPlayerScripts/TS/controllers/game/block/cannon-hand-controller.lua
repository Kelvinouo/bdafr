-- Script Hash: 21eed32fd5ca98957296dfc573a48f0ec5c0acf0a46033a9b9ec35e91b5551f97869dcd03c32e532f7b708123d2ffaeb
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "CannonHandController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__HandKnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CannonHandController";
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__3.TNT;
end;
function u1.onEnable(p5, p6)
	l__KnitClient__2.Controllers.CannonController:stopAiming();
	p5:updateAllCannonPrompts();
end;
function u1.onDisable(p7)
	p7:updateAllCannonPrompts();
end;
function u1.updateAllCannonPrompts(p8)
	local v6 = l__KnitClient__2.Controllers.CannonController:getCannons();
	local function v7(p9)
		p8:updateCannonPrompts(p9);
	end;
	for v8, v9 in ipairs(v6) do
		v7(v9, v8 - 1, v6);
	end;
end;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function u1.updateCannonPrompts(p10, p11)
	if l__KnitClient__2.Controllers.CannonController:isAiming() then
		p11.AimPrompt.Enabled = false;
		p11.StopAimingPrompt.Enabled = true;
		p11.FirePrompt.Enabled = false;
		p11.LaunchSelfPrompt.Enabled = false;
		return nil;
	end;
	if not p10:isEnabled() then
		p11.AimPrompt.Enabled = true;
		p11.LaunchSelfPrompt.Enabled = true;
		p11.StopAimingPrompt.Enabled = false;
		p11.FirePrompt.Enabled = false;
		return;
	end;
	p11.AimPrompt.Enabled = false;
	p11.StopAimingPrompt.Enabled = false;
	local v10 = p10:getHandItem();
	if v10 ~= nil then
		v10 = v10.itemType;
	end;
	if v10 then
		p11.FirePrompt.ObjectText = "Consumes " .. l__getItemMeta__4(v10).displayName;
	else
		p11.FirePrompt.ObjectText = "Consumes Ammo";
	end;
	p11.FirePrompt.Enabled = true;
	return nil;
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__BlockEngine__6 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
function u1.fireCannon(p12, p13)
	local v11 = p12:getHandItem();
	if not v11 then
		return nil;
	end;
	l__default__5.Client:Get("RemoteName"):SendToServer({
		cannonBlockPos = l__BlockEngine__6:getBlockPosition(p13.Position), 
		itemType = v11.itemType
	});
end;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function u1.launchSelf(p14, p15)
	if not l__default__5.Client:Get("RemoteName"):CallServer({
		cannonBlockPos = l__BlockEngine__6:getBlockPosition(p15.Position)
	}) then
		return nil;
	end;
	local v12 = l__Players__7.LocalPlayer.Character;
	if v12 ~= nil then
		v12 = v12.PrimaryPart;
	end;
	if not v12 then
		return nil;
	end;
	local v13 = p15:GetAttribute("LookVector");
	if not v13 then
		return nil;
	end;
	local v14 = l__Players__7.LocalPlayer.Character;
	if v14 ~= nil then
		v14 = v14.PrimaryPart;
		if v14 ~= nil then
			v14 = v14.AssemblyMass;
		end;
	end;
	local v15 = v14;
	if v15 == nil then
		v15 = 0;
	end;
	v12:ApplyImpulse(v13 * v15 * 200);
end;
u2 = l__KnitClient__2.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
