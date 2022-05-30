-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PlunderController";
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
	p1.Name = "PlunderController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v3.Players;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__KnitClient__7 = v2.KnitClient;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local l__PrimaryPart__7 = p3.entityInstance.PrimaryPart;
		if not l__PrimaryPart__7 then
			return nil;
		end;
		local v8 = p3.entityInstance == l__Players__3.LocalPlayer.Character;
		if v8 then
			l__SoundManager__4:playSound(l__GameSound__5.CONFETTI);
		end;
		local v9 = 0;
		local v10 = l__PrimaryPart__7.Position;
		if p3.stolenFromEntityInstance.PrimaryPart then
			v10 = p3.stolenFromEntityInstance.PrimaryPart.Position;
		end;
		for v11, v12 in ipairs(p3.rewards) do
			local v13 = math.min(v12.amount, 5);
			local v14 = l__KnitClient__7.Controllers.ReceiveItemEffectController:cloneItemIntoModel((l__ReplicatedStorage__6:WaitForChild("Items"):WaitForChild(v12.itemType)));
			local v15 = 0;
			local v16 = false;
			while true do
				if v16 then
					v15 = v15 + 1;
				else
					v16 = true;
				end;
				if not (v15 < math.ceil(v13)) then
					break;
				end;
				local u8 = v9;
				task.spawn(function()
					task.wait(math.random() * 0.2);
					l__KnitClient__7.Controllers.ReceiveItemEffectController:playEffect(v14, v10, function()
						return l__PrimaryPart__7.CFrame;
					end, 0.5 + math.random() * 0.2):andThen(function(p4)
						if p4 then
							local v17 = {};
							if v8 then
								local v18 = nil;
							else
								v18 = l__PrimaryPart__7.Position;
							end;
							v17.position = v18;
							v17.volumeMultiplier = 0.8;
							local v19 = l__SoundManager__4:playSound(l__GameSound__5.PICKUP_ITEM_DROP, v17);
							if v19 then
								u8 = u8 + 1;
								v19.PlaybackSpeed = 1 + u8 / 50;
							end;
						end;
					end);
				end);			
			end;
		end;
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
