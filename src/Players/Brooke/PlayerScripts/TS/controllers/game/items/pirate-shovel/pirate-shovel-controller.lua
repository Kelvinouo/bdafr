-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local l__BalanceFile__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PirateShovelController";
	end, 
	__index = l__KnitController__3
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "PirateShovelController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__GameAnimationUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__PIRATE_SHOVEL_IRON__4 = l__BalanceFile__4.PIRATE_SHOVEL_IRON;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__PIRATE_SHOVEL_DIAMOND__7 = l__BalanceFile__4.PIRATE_SHOVEL_DIAMOND;
local l__ReplicatedStorage__8 = v2.ReplicatedStorage;
local l__Workspace__9 = v2.Workspace;
function v5.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		local v7 = p3.player.Character;
		if v7 ~= nil then
			v7 = v7:GetPrimaryPartCFrame().Position;
		end;
		if not v7 then
			return nil;
		end;
		l__GameAnimationUtil__2.playAnimation(p3.player, l__AnimationType__3.SHOVEL_DIG);
		if p3.diceNumber < l__PIRATE_SHOVEL_IRON__4 then
			l__SoundManager__5:playSound(l__GameSound__6.PIRATE_SHOVEL_DIG, {
				position = v7, 
				rollOffMaxDistance = 45, 
				volumeMultiplier = 0.5
			});
			return;
		end;
		local v8 = l__SoundManager__5:playSound(l__GameSound__6.PIRATE_SHOVEL_DIG_TREASURE_HIT, {
			position = v7, 
			rollOffMaxDistance = 45, 
			volumeMultiplier = 0.5
		});
		if p3.diceNumber < l__PIRATE_SHOVEL_IRON__4 then
			return nil;
		end;
		p2:playEffect(v7, p3.player, p3.diceNumber);
		if v8 ~= nil then
			local v9 = v8.Ended:Connect(function()
				if l__PIRATE_SHOVEL_DIAMOND__7 <= p3.diceNumber then
					local v10 = l__ReplicatedStorage__8.Assets.Effects.PirateShovelEffect:Clone();
					v10:SetPrimaryPartCFrame(CFrame.new(p3.treasurePosition));
					v10.Parent = l__Workspace__9;
					l__SoundManager__5:playSound(l__GameSound__6.PIRATE_SHOVEL_DIG_TREASURE_FOUND, {
						position = v7, 
						rollOffMaxDistance = 45, 
						volumeMultiplier = 0.5
					});
					task.delay(1, function()
						v10:Destroy();
					end);
				end;
			end);
		end;
	end);
end;
local l__ItemType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__PIRATE_SHOVEL_EMERALD__11 = l__BalanceFile__4.PIRATE_SHOVEL_EMERALD;
local l__KnitClient__12 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__13 = v2.Players;
function v5.playEffect(p4, p5, p6, p7)
	local v11 = {};
	if l__PIRATE_SHOVEL_IRON__4 < p7 then
		table.insert(v11, {
			itemType = l__ItemType__10.IRON, 
			amount = 2
		});
	end;
	if l__PIRATE_SHOVEL_DIAMOND__7 < p7 then
		table.insert(v11, {
			itemType = l__ItemType__10.DIAMOND, 
			amount = 1
		});
	end;
	if l__PIRATE_SHOVEL_EMERALD__11 < p7 then
		table.insert(v11, {
			itemType = l__ItemType__10.EMERALD, 
			amount = 1
		});
	end;
	local v12 = p6;
	if v12 ~= nil then
		v12 = v12.Character;
	end;
	if p6 == l__Players__13.LocalPlayer then
		local v13 = "PlayLocally";
	else
		v13 = "PlayGlobally";
	end;
	l__KnitClient__12.Controllers.ReceiveItemEffectController:playEffectForItems(v11, p5, function()
		local l__Character__14 = p6.Character;
		if l__Character__14 ~= v12 then
			return nil;
		end;
		local v15 = l__Character__14;
		if v15 ~= nil then
			v15 = v15.PrimaryPart;
			if v15 ~= nil then
				v15 = v15.CFrame;
			end;
		end;
		return v15;
	end, v13);
end;
local v16 = l__KnitClient__12.CreateController(v5.new());
return nil;
