-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v4 = {};
local v5 = setmetatable({}, {
	__index = v4
});
v5.ICE = "ice";
v4.ice = "ICE";
v5.FIRE = "fire";
v4.fire = "FIRE";
v5.NATURE = "nature";
v4.nature = "NATURE";
local l__EntityUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u3 = {};
local l__StatusEffectUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
function u3.getUnlockedMageElements(p1)
	local v6 = l__EntityUtil__1:getEntity(p1);
	if v6 ~= nil then
		v6 = v6:getInstance();
	end;
	if not v6 then
		return {};
	end;
	local v7 = {};
	local v8, v9, v10 = ipairs(u2.values(v5));
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		if l__StatusEffectUtil__4:isActive(v6, (u3.getMageStatusEffect(v9))) then
			table.insert(v7, v9);
		end;	
	end;
	return v7;
end;
function u3.hasUnlockedMageElement(p2, p3)
	if table.find(u3.getUnlockedMageElements(p2), p3) ~= nil then
		return true;
	end;
	return false;
end;
local l__StatusEffectType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function u3.getMageStatusEffect(p4)
	if p4 == v5.FIRE then
		return l__StatusEffectType__5.MAGE_FIRE_ELEMENT;
	end;
	if p4 == v5.ICE then
		return l__StatusEffectType__5.MAGE_ICE_ELEMENT;
	end;
	if p4 ~= v5.NATURE then
		return;
	end;
	return l__StatusEffectType__5.MAGE_NATURE_ELEMENT;
end;
local v11 = {
	BASE = {
		hatName = "MageHatBase", 
		color = Color3.fromRGB(255, 255, 255)
	}, 
	[v5.FIRE] = {
		learnSound = l__GameSound__3.MAGE_LEARN_FIRE, 
		icon = l__BedwarsImageId__2.FIRE_ELEMENT, 
		hatName = "MageHatFire", 
		color = Color3.fromRGB(247, 120, 74), 
		particleEffect = "MageFireEffect"
	}, 
	[v5.ICE] = {
		learnSound = l__GameSound__3.MAGE_LEARN_ICE, 
		icon = "rbxassetid://", 
		hatName = "MageHatIce", 
		color = Color3.fromRGB(105, 204, 247), 
		particleEffect = "MageIceEffect"
	}, 
	[v5.NATURE] = {
		learnSound = l__GameSound__3.MAGE_LEARN_NATURE, 
		icon = l__BedwarsImageId__2.LIFE_STEAL_ELEMENT, 
		hatName = "MageHatNature", 
		color = Color3.fromRGB(150, 250, 87), 
		particleEffect = "MageNatureEffect", 
		colorSequence = ColorSequence.new(Color3.fromRGB(158, 237, 135), Color3.fromRGB(92, 189, 61))
	}
};
u3.MageElementVisualizations = v11;
local u6 = {};
local l__ReplicatedStorage__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
local l__WeldUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function u3.changeMageKitAppearance(p5, p6, p7)
	local v12 = v11[p7];
	local v13 = l__EntityUtil__1:getEntity(p5);
	if v13 ~= nil then
		v13 = v13:getHumanoid();
	end;
	local v14 = u6[p6];
	local v15 = v14;
	if v15 ~= nil then
		v15 = v15.Name;
	end;
	if v15 ~= v12.hatName then
		if v14 ~= nil then
			v14:Destroy();
		end;
		local v16 = l__ReplicatedStorage__7.Assets.Misc:FindFirstChild(v12.hatName);
		if v16 ~= nil then
			v16 = v16:Clone();
		end;
		if v16 then
			u6[p6] = v16;
			if v13 ~= nil then
				v13:AddAccessory(v16);
			end;
		end;
		l__WeldUtil__8:weldCharacterAccessories(p6);
	end;
	local v17, v18, v19 = ipairs(p6:GetDescendants());
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		if v18:IsA("BasePart") and v18.Name == "Neon" then
			v18.Color = v12.color;
		end;	
	end;
end;
return {
	MageElement = v5, 
	MAGE_ELEMENT_CYCLE_INDEX = "MageElementIndex", 
	MageKitUtil = u3
};
