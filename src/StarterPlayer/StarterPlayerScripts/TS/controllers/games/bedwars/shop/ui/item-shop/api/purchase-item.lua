
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "inspect").inspect);
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__resolve__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src.Knit.Util.Promise).resolve;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
return {
	shopPurchaseItem = function(p1)
		print("Purchasing " .. u1(p1));
		local function v2()

		end;
		if l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[p1.itemType] ~= nil then
			v2();
			return l__resolve__3(false);
		end;
		return l__default__4.Client:Get("RemoteName"):CallServerAsync({
			shopItem = p1
		}):andThen(function(p2)
			if not p2 then
				v2();
				return false;
			end;
			l__SoundManager__5:playSound(l__GameSound__6.BEDWARS_PURCHASE_ITEM);
			l__ClientStore__7:dispatch({
				type = "BedwarsAddItemPurchased", 
				itemType = p1.itemType
			});
			return true;
		end);
	end
};

