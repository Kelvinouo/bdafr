-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "TripleShotProjectileController";
	end, 
	__index = v4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1, ...)
	v4.constructor(p1, ...);
	p1.Name = "TripleShotProjectileController";
	p1.Client = {};
	p1.chargeMaid = u1.new();
	p1.overchargeStartTime = 0;
end;
function v5.KnitStart(p2)
	v4.KnitStart(p2);
end;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__4 = v2.KnitClient;
local l__Players__5 = v3.Players;
local l__BedwarsKit__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
function v5.isRelevantItem(p3, p4)
	local v7 = l__getItemMeta__2(p4.itemType).projectileSource;
	if v7 ~= nil then
		v7 = v7.multiShot;
	end;
	local v8 = v7 == true;
	if not v8 then
		if p4.itemType ~= l__ItemType__3.WOOD_BOW then
			local v9 = false;
			if p4.itemType == l__ItemType__3.WOOD_CROSSBOW then
				v9 = l__KnitClient__4.Controllers.KitController:isUsingKit(l__Players__5.LocalPlayer, l__BedwarsKit__6.TRIPLE_SHOT);
			end;
		else
			v9 = l__KnitClient__4.Controllers.KitController:isUsingKit(l__Players__5.LocalPlayer, l__BedwarsKit__6.TRIPLE_SHOT);
		end;
		v8 = v9;
	end;
	return v8;
end;
function v5.onStartCharging(p5)
	p5.overchargeStartTime = 0;
end;
function v5.onStopCharging(p6)
	p6.chargeMaid:DoCleaning();
end;
local l__InventoryUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__KnitClient__8 = v2.KnitClient;
function v5.onLaunch(p7, p8)
	local v10 = p7:getChargeTime();
	local v11 = true;
	if v10 ~= 0 then
		v11 = false;
		if p7.overchargeStartTime ~= 0 then
			v11 = v10 <= tick() - p7.overchargeStartTime;
		end;
	end;
	if v11 then
		local v12 = p7:getHandItem();
		local v13 = p7:getAmmoType(v12.itemType);
		local v14 = 0;
		if v13 then
			local v15 = l__InventoryUtil__7.getToolFromInventory(l__Players__5.LocalPlayer, v13);
			if v15 ~= nil then
				v15 = v15.amount;
			end;
			local v16 = v15;
			if v16 == nil then
				v16 = 0;
			end;
			v14 = v16 - 1;
		end;
		local u9 = l__getItemMeta__2(v12.itemType);
		local u10 = v14;
		local l__projectileHandler__11 = p7.projectileHandler;
		local u12 = p7:getProjectileSource(v12);
		v1.Promise.defer(function()
			local v17 = u9.projectileSource;
			if v17 ~= nil then
				v17 = v17.multiShotCount;
			end;
			local v18 = v17;
			if v18 == 0 or v18 ~= v18 or not v18 then
				v18 = 3;
			end;
			local v19 = u9.projectileSource;
			if v19 ~= nil then
				v19 = v19.multiShotDelay;
			end;
			local v20 = v19;
			if v20 == 0 or v20 ~= v20 or not v20 then
				v20 = 0.1;
			end;
			local v21 = 0;
			local v22 = false;
			while true do
				if v22 then
					v21 = v21 + 1;
				else
					v22 = true;
				end;
				if not (v21 < v18 - 1) then
					break;
				end;
				wait(v20);
				if p8() then
					if v13 and u10 <= 0 then
						break;
					end;
					u10 = u10 - 1;
					l__KnitClient__8.Controllers.ProjectileController:launchProjectile(v12.itemType, v13, l__projectileHandler__11, v12.tool, u12);
				end;			
			end;
		end);
	end;
end;
function v5.onStartReload(p9)

end;
function v5.getChargeTime(p10)
	local v23 = p10:getHandItem();
	if v23 ~= nil then
		v23 = v23.itemType;
	end;
	if not v23 then
		return 0;
	end;
	local v24 = l__getItemMeta__2(v23);
	local v25 = v24.projectileSource;
	if v25 ~= nil then
		v25 = v25.multiShotChargeTime;
	end;
	if v25 == 0 or v25 ~= v25 or not v25 then
		return 0;
	end;
	local v26 = v24.projectileSource;
	if v26 ~= nil then
		v26 = v26.multiShotChargeTime;
	end;
	return v26;
end;
local l__SoundManager__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__15 = v3.CollectionService;
local u16 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TripleShotProgressBar__17 = v1.import(script, script.Parent, "triple-shot-progress-bar").TripleShotProgressBar;
function v5.onMaxCharge(p11)
	local v27 = p11:getChargeTime();
	if v27 == 0 then
		return nil;
	end;
	p11.overchargeStartTime = tick();
	l__SoundManager__13:playSound(l__GameSound__14.CHARGE_TRIPLE_SHOT);
	local u18 = true;
	p11.chargeMaid:GiveTask(function()
		u18 = false;
	end);
	task.delay(v27, function()
		if u18 then
			local v28, v29, v30 = ipairs((l__CollectionService__15:GetTagged("projectile-preview-beam")));
			while true do
				v28(v29, v30);
				if not v28 then
					break;
				end;
				v30 = v28;
				v29.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255));			
			end;
		end;
	end);
	local u19 = u16.mount(u16.createElement("ScreenGui", {}, { u16.createElement(l__TripleShotProgressBar__17, {
			chargeTime = v27, 
			title = "Triple Shot"
		}) }), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"), "ChargeMultiShot");
	p11.chargeMaid:GiveTask(function()
		u16.unmount(u19);
	end);
end;
local v31 = l__KnitClient__4.CreateController(v5.new());
return nil;
