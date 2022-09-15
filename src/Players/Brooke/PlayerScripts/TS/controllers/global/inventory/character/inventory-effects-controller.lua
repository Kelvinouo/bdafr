-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Controller__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v5 = setmetatable({}, {
	__tostring = function()
		return "InventoryEffectsController";
	end
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)

end;
local l__WatchCharacter__1 = v3.WatchCharacter;
local l__EntityUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__WatchPlayerCharacter__4 = v3.WatchPlayerCharacter;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__getItemMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__SoundManager__9 = v3.SoundManager;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v5.onStart(p2)
	l__WatchCharacter__1(function(p3, p4)
		local v7 = l__EntityUtil__2:getEntity(p4);
		if v7 then
			v7:getInstance():WaitForChild("HandInvItem");
			v7:getInstance().HandInvItem.Changed:Connect(function(p5)
				l__ClientSyncEvents__3.EntityChangeHeldItem:fire(v7, p5);
			end);
		end;
	end);
	l__WatchPlayerCharacter__4(l__Players__5.LocalPlayer, function(p6)
		local v8 = l__EntityUtil__2:getLocalPlayerEntity();
		if not v8 then
			return nil;
		end;
		v8:getInstance():WaitForChild("HandInvItem");
		local u11 = nil;
		v8:getInstance().HandInvItem.Changed:Connect(function()
			local l__Value__9 = v8:getInstance().HandInvItem.Value;
			if l__Value__9 == nil then
				u11 = nil;
				return nil;
			end;
			if l__Value__9 == u11 then
				return nil;
			end;
			u11 = l__Value__9;
			local v10 = l__GameSound__6.EQUIP_DEFAULT;
			local v11 = l__getItemMeta__8(l__Value__9.Name);
			if v11.sword then
				v10 = l__GameSound__6.EQUIP_SWORD;
			elseif not v11.breakBlock and (not v11.block and v11.projectileSource) then
				v10 = l__GameSound__6.EQUIP_BOW;
			end;
			if p2.activeSound then
				p2.activeSound:Stop();
			end;
			p2.activeSound = l__SoundManager__9:playSound(v10);
			if l__GameAnimationUtil__10.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__7.EQUIP_1, {
				fadeInTime = 0
			}) then

			end;
		end);
	end);
end;
l__Reflect__2.defineMetadata(v5, "identifier", "client/controllers/global/inventory/character/inventory-effects-controller@InventoryEffectsController");
l__Reflect__2.defineMetadata(v5, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v5, "$:flamework@Controller", l__Controller__4, { {} });
return {
	InventoryEffectsController = v5
};
