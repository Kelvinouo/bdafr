-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "MobileUiController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MobileUiController";
end;
local l__DeviceUtil__2 = v2.DeviceUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__4 = v2.MobileButton;
local l__BedwarsImageId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__9 = v3.Players;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ClientSyncEvents__12 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Workspace__13 = v3.Workspace;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	if not l__DeviceUtil__2.isMobileControls() then
		return nil;
	end;
	local v7 = {};
	local v8 = {
		Image = l__BedwarsImageId__5.ATTACK_MOBILE, 
		Position = l__BedwarsUI__6:getSwordButtonPosition()
	};
	if l__DeviceUtil__2.isSmallScreen() then
		local v9 = UDim2.fromScale(0.18, 0.18);
	else
		v9 = UDim2.fromScale(0.15, 0.15);
	end;
	v8.Size = v9;
	function v8.OnPressDown()
		if l__ClientStore__7:getState().Inventory.observedPlayer == l__Players__9.LocalPlayer then
			local v10 = l__EntityUtil__10:getLocalPlayerEntity();
			if not v10 then
				return nil;
			end;
			local v11 = v10:getItemInHandClient();
			if v11 == nil then
				l__KnitClient__8.Controllers.SwordController:bufferMobileAttack();
				l__ClientStore__7:dispatch({
					type = "InventorySelectHotbarItemGroup", 
					itemGroup = "sword"
				});
				return nil;
			end;
			if not l__getItemMeta__11(v11.Name).sword then
				l__KnitClient__8.Controllers.SwordController:bufferMobileAttack();
				l__ClientStore__7:dispatch({
					type = "InventorySelectHotbarItemGroup", 
					itemGroup = "sword"
				});
				return nil;
			end;
		end;
		if not l__ClientSyncEvents__12.MobileSwordButtonPressed:fire("down"):isCancelled() then
			l__KnitClient__8.Controllers.SwordController:mobileSwingPressed();
		end;
	end;
	function v8.OnPressUp()
		l__ClientSyncEvents__12.MobileSwordButtonPressed:fire("up");
		l__ClientSyncEvents__12.SwordSwingUp:fire();
	end;
	v7[1] = u3.createElement(l__MobileButton__4, v8);
	v7[2] = u3.createElement(l__MobileButton__4, {
		Image = l__BedwarsImageId__5.BUILD_MOBILE, 
		Position = l__BedwarsUI__6:getBuildButtonPosition(), 
		OnPressDown = function()
			l__ClientStore__7:dispatch({
				type = "InventorySelectHotbarItemGroup", 
				itemGroup = "block"
			});
			local v12 = true;
			if l__Workspace__13:GetServerTimeNow() - l__KnitClient__8.Controllers.KnockbackController:getLastKnockbackTime() < 0.2 then
				v12 = false;
			end;
			local v13 = l__KnitClient__8.Controllers.BlockPlacementController:getBlockPlacer();
			if v13 ~= nil then
				v13:autoBridge(v12);
			end;
		end, 
		OnPressUp = function()

		end
	});
	u3.mount(u3.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, v7), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
end;
u1 = l__KnitClient__8.CreateController;
u1 = u1(v5.new());
return nil;
