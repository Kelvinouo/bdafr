-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "PlunderController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__2 = v3.Players;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__KnitClient__6 = v2.KnitClient;
local l__getItemMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local l__PrimaryPart__7 = p3.entityInstance.PrimaryPart;
		if not l__PrimaryPart__7 then
			return nil;
		end;
		local v8 = p3.entityInstance == l__Players__2.LocalPlayer.Character;
		if v8 then
			l__SoundManager__3:playSound(l__GameSound__4.CONFETTI);
		end;
		local v9 = 0;
		local v10 = l__PrimaryPart__7.Position;
		if p3.stolenFromEntityInstance.PrimaryPart then
			v10 = p3.stolenFromEntityInstance.PrimaryPart.Position;
		end;
		local v11, v12, v13 = ipairs(p3.rewards);
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
			local v14 = math.min(v12.amount, 5);
			local v15 = l__KnitClient__6.Controllers.ReceiveItemEffectController:cloneItemIntoModel((l__ReplicatedStorage__5:WaitForChild("Items"):WaitForChild(v12.itemType)));
			local v16 = 0;
			local v17 = false;
			while true do
				if v17 then
					v16 = v16 + 1;
				else
					v17 = true;
				end;
				if not (v16 < math.ceil(v14)) then
					break;
				end;
				local u8 = v9;
				task.spawn(function()
					task.wait(math.random() * 0.2);
					l__KnitClient__6.Controllers.ReceiveItemEffectController:playEffect(v15, v10, function()
						return l__PrimaryPart__7.CFrame;
					end, 0.5 + math.random() * 0.2):andThen(function(p4)
						if p4 then
							local v18 = {};
							if v8 then
								local v19 = nil;
							else
								v19 = l__PrimaryPart__7.Position;
							end;
							v18.position = v19;
							v18.volumeMultiplier = 0.8;
							local v20 = l__SoundManager__3:playSound(l__GameSound__4.PICKUP_ITEM_DROP, v18);
							if v20 then
								u8 = u8 + 1;
								v20.PlaybackSpeed = 1 + u8 / 50;
							end;
							local l__pickUpOverlaySound__21 = l__getItemMeta__7(v12.itemType).pickUpOverlaySound;
							if l__pickUpOverlaySound__21 ~= "" and l__pickUpOverlaySound__21 then
								local v22 = {};
								if v8 then
									local v23 = nil;
								else
									v23 = l__PrimaryPart__7.Position;
								end;
								v22.position = v23;
								v22.volumeMultiplier = 0.9;
								local v24 = l__SoundManager__3:playSound(l__pickUpOverlaySound__21, v22);
								if v24 then
									u8 = u8 + 1;
									v24.PlaybackSpeed = 1 + u8 / 50;
								end;
							end;
						end;
					end);
				end);			
			end;		
		end;
	end);
end;
local v25 = v2.KnitClient.CreateController(v5.new());
return nil;
