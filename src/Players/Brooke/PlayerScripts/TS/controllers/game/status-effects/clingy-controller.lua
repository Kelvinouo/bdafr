-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ClingyController";
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
	p1.Name = "ClingyController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__Workspace__4 = v3.Workspace;
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__KnitClient__6 = v2.KnitClient;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__8 = v3.Players;
local l__getItemMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		if p3.effect ~= l__StatusEffectType__2.CLINGY_2 then
			return nil;
		end;
		l__SoundManager__3:playSound(p3.sound, {
			position = p3.position
		});
	end);
	l__default__1.Client:OnEvent("RemoteName", function(p4)
		local v7 = p4.player.Character;
		if v7 ~= nil then
			v7 = v7.PrimaryPart;
		end;
		if v7 == nil then
			return nil;
		end;
		local v8 = not l__Workspace__4.CurrentCamera or (l__Workspace__4.CurrentCamera.CFrame - v7.Position).Position.Magnitude > 180;
		if v8 then
			return nil;
		end;
		local v9, v10, v11 = ipairs(p4.items);
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			local v12 = math.min(math.floor(v10.amount / 100) + 1, 4);
			local v13 = l__KnitClient__6.Controllers.ReceiveItemEffectController:cloneItemIntoModel((l__ReplicatedStorage__5:WaitForChild("Items"):WaitForChild(v10.itemType)));
			local v14 = v7.Position + Vector3.new(0, 6, 0);
			local v15 = 0;
			local v16 = 0;
			local v17 = false;
			while true do
				if v17 then
					v16 = v16 + 1;
				else
					v17 = true;
				end;
				if not (v16 < v12) then
					break;
				end;
				local u10 = v15;
				task.spawn(function()
					v1.Promise.delay(math.random() * 0.2):await();
					l__KnitClient__6.Controllers.ReceiveItemEffectController:playEffect(v13, v14, function()
						return v7.CFrame;
					end, 0.5 + math.random() * 0.2):andThen(function(p5)
						if p5 then
							local v18 = {};
							if p4.player == l__Players__8.LocalPlayer then
								local v19 = nil;
							else
								v19 = v7.Position;
							end;
							v18.position = v19;
							v18.volumeMultiplier = 0.8;
							local v20 = l__SoundManager__3:playSound(l__GameSound__7.PICKUP_ITEM_DROP, v18);
							if v20 then
								u10 = u10 + 1;
								v20.PlaybackSpeed = 1 + u10 / 50;
							end;
							local l__pickUpOverlaySound__21 = l__getItemMeta__9(v10.itemType).pickUpOverlaySound;
							if l__pickUpOverlaySound__21 ~= "" and l__pickUpOverlaySound__21 then
								local v22 = {};
								if p4.player == l__Players__8.LocalPlayer then
									local v23 = nil;
								else
									v23 = v7.Position;
								end;
								v22.position = v23;
								v22.volumeMultiplier = 0.9;
								local v24 = l__SoundManager__3:playSound(l__pickUpOverlaySound__21, v22);
								if v24 then
									u10 = u10 + 1;
									v24.PlaybackSpeed = 1 + u10 / 50;
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
