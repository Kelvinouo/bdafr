-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MobileUiController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MobileUiController";
end;
local l__DeviceUtil__2 = v2.DeviceUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__4 = v2.MobileButton;
local l__BedwarsImageId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__Players__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ClientSyncEvents__12 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	if not l__DeviceUtil__2.isMobileControls() then
		return nil;
	end;
	local v6 = {};
	local v7 = {
		Image = l__BedwarsImageId__5.ATTACK_MOBILE, 
		Position = l__BedwarsUI__6:getSwordButtonPosition()
	};
	if l__DeviceUtil__2.isSmallScreen() then
		local v8 = UDim2.fromScale(0.18, 0.18);
	else
		v8 = UDim2.fromScale(0.15, 0.15);
	end;
	v7.Size = v8;
	function v7.OnPressDown()
		local function v9()
			l__KnitClient__8.Controllers.SwordController:bufferMobileAttack();
			l__ClientStore__7:dispatch({
				type = "InventorySelectHotbarItemGroup", 
				itemGroup = "sword"
			});
		end;
		if l__ClientStore__7:getState().Inventory.observedPlayer == l__Players__9.LocalPlayer then
			local v10 = l__EntityUtil__10:getLocalPlayerEntity();
			if not v10 then
				return nil;
			end;
			local v11 = v10:getItemInHandClient();
			if v11 == nil then
				v9();
				return nil;
			end;
			if not l__getItemMeta__11(v11.Name).sword then
				v9();
				return nil;
			end;
		end;
		l__KnitClient__8.Controllers.SwordController:mobileSwingPressed();
		l__ClientSyncEvents__12.MobileSwordButtonPressed:fire("down");
	end;
	function v7.OnPressUp()
		l__ClientSyncEvents__12.MobileSwordButtonPressed:fire("up");
		l__ClientSyncEvents__12.SwordSwingUp:fire();
	end;
	v6[1] = u3.createElement(l__MobileButton__4, v7);
	v6[2] = u3.createElement(l__MobileButton__4, {
		Image = l__BedwarsImageId__5.BUILD_MOBILE, 
		Position = l__BedwarsUI__6:getBuildButtonPosition(), 
		OnPressDown = function()
			l__ClientStore__7:dispatch({
				type = "InventorySelectHotbarItemGroup", 
				itemGroup = "block"
			});
		end, 
		OnPressUp = function()

		end
	});
	u3.mount(u3.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, v6), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
end;
u1 = l__KnitClient__8.CreateController;
u1 = u1(v4.new());
return nil;
