-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PirateHatController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "PirateHatController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__2 = v3.Players;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCharacter__5 = v2.WatchCharacter;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v7, v8, v9 = ipairs(p3.players);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			p2:equipPirateHat(v8);
			if l__Players__2.LocalPlayer == v8 then
				l__SoundManager__3:playSound(l__GameSound__4.HANNAH_UNSHEATH_SWORD, {});
			end;		
		end;
	end);
	l__WatchCharacter__5(function(p4, p5)
		if p4:GetAttribute("HasPirateUnlock") == true then
			p2:equipPirateHat(p4);
		end;
	end);
end;
local l__EntityUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__7 = v3.ReplicatedStorage;
local l__WeldUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v5.equipPirateHat(p6, p7)
	local l__Character__10 = p7.Character;
	if not l__Character__10 then
		return nil;
	end;
	local v11 = l__EntityUtil__6:getEntity(p7);
	if not v11 then
		return nil;
	end;
	local v12 = v11:getHumanoid();
	if not v12 then
		return nil;
	end;
	local v13 = {};
	local v14, v15, v16 = ipairs(l__Character__10:GetChildren());
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		v16 = v14;
		if v15:IsA("Accessory") and v15.Name == "HatAttachment" and table.find(v13, v15) == nil then
			table.insert(v13, v15);
			v15:Destroy();
		end;	
	end;
	local v17 = l__ReplicatedStorage__7.Assets.Misc.PirateHat:Clone();
	v17:SetAttribute("IsPirateHat", true);
	v17:SetAttribute("NoArmorHide", true);
	v12:AddAccessory(v17);
	local v18 = l__ReplicatedStorage__7.Assets.Misc.Parrot:Clone();
	v18:SetAttribute("IsParrot", true);
	v18:SetAttribute("NoArmorHide", true);
	v12:AddAccessory(v18);
	v17.Destroying:Connect(function()
		local v19, v20, v21 = ipairs(v13);
		while true do
			v19(v20, v21);
			if not v19 then
				break;
			end;
			v21 = v19;
			v12:AddAccessory(v20);
			l__WeldUtil__8:weldCharacterAccessories(l__Character__10);		
		end;
	end);
	l__WeldUtil__8:weldCharacterAccessories(l__Character__10);
end;
local v22 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
