-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__ClanUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClanCreateForm__5 = v1.import(script, script.Parent, "clan-create-form").ClanCreateForm;
local l__ClanCreatePurchase__6 = v1.import(script, script.Parent, "clan-create-purchase").ClanCreatePurchase;
return {
	ClanCreateTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = true;
		if not l__DeviceUtil__1.isHoarceKat() then
			v3 = p1.store.Clans.paid or l__ClanUtil__2.hasClanPass(l__Players__3.LocalPlayer);
		end;
		local v4 = {};
		if v3 then
			local v5 = u4.createElement(l__ClanCreateForm__5);
		else
			v5 = u4.createElement(l__ClanCreatePurchase__6);
		end;
		v4[1] = v5;
		return u4.createFragment(v4);
	end)
};
