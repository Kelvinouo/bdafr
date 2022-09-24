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
local l__KnitClient__5 = v2.KnitClient;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__KnitClient__7 = v2.KnitClient;
local l__getItemMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
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
		local v11 = l__Players__2:GetPlayerFromCharacter(p3.entityInstance);
		local v12 = false;
		if v11 then
			v12 = l__KnitClient__5.Controllers.GlitchedEnchantingRelicController:onRelicTeam(v11);
		end;
		local v13, v14, v15 = ipairs(p3.rewards);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			local v16 = math.min(v14.amount, 5);
			local v17 = l__KnitClient__7.Controllers.ReceiveItemEffectController:cloneItemIntoModel((l__ReplicatedStorage__6:WaitForChild("Items"):WaitForChild(v14.itemType)));
			if v12 then
				p2:attachGlitchEffect(v17);
			end;
			local v18 = 0;
			local v19 = false;
			while true do
				if v19 then
					v18 = v18 + 1;
				else
					v19 = true;
				end;
				if not (v18 < math.ceil(v16)) then
					break;
				end;
				local u9 = v9;
				task.spawn(function()
					task.wait(math.random() * 0.2);
					l__KnitClient__7.Controllers.ReceiveItemEffectController:playEffect(v17, v10, function()
						return l__PrimaryPart__7.CFrame;
					end, 0.5 + math.random() * 0.2):andThen(function(p4)
						if p4 then
							local v20 = {};
							if v8 then
								local v21 = nil;
							else
								v21 = l__PrimaryPart__7.Position;
							end;
							v20.position = v21;
							v20.volumeMultiplier = 0.8;
							local v22 = l__SoundManager__3:playSound(l__GameSound__4.PICKUP_ITEM_DROP, v20);
							if v22 then
								u9 = u9 + 1;
								v22.PlaybackSpeed = 1 + u9 / 50;
							end;
							local l__pickUpOverlaySound__23 = l__getItemMeta__8(v14.itemType).pickUpOverlaySound;
							if l__pickUpOverlaySound__23 ~= "" and l__pickUpOverlaySound__23 then
								local v24 = {};
								if v8 then
									local v25 = nil;
								else
									v25 = l__PrimaryPart__7.Position;
								end;
								v24.position = v25;
								v24.volumeMultiplier = 0.9;
								local v26 = l__SoundManager__3:playSound(l__pickUpOverlaySound__23, v24);
								if v26 then
									u9 = u9 + 1;
									v26.PlaybackSpeed = 1 + u9 / 50;
								end;
							end;
						end;
					end);
				end);			
			end;		
		end;
	end);
end;
function v5.attachGlitchEffect(p5, p6)
	local l__PrimaryPart__27 = p6.PrimaryPart;
	if l__PrimaryPart__27 then
		l__KnitClient__5.Controllers.GlitchEffectsController:playGlitchExplosion(l__PrimaryPart__27.Position, {
			parent = l__PrimaryPart__27
		});
	end;
end;
local v28 = l__KnitClient__5.CreateController(v5.new());
return nil;
