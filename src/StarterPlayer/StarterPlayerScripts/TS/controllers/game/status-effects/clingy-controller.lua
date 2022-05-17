
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
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
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ClingyController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__StatusEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__Workspace__5 = v3.Workspace;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__KnitClient__7 = v2.KnitClient;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__9 = v3.Players;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		if p3.effect ~= l__StatusEffectType__3.CLINGY_2 then
			return nil;
		end;
		l__SoundManager__4:playSound(p3.sound, {
			position = p3.position
		});
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p4)
		local v7 = p4.player.Character;
		if v7 ~= nil then
			v7 = v7.PrimaryPart;
		end;
		if v7 == nil then
			return nil;
		end;
		local v8 = not l__Workspace__5.CurrentCamera or (l__Workspace__5.CurrentCamera.CFrame - v7.Position).Position.Magnitude > 180;
		if v8 then
			return nil;
		end;
		for v9, v10 in ipairs(p4.items) do
			local v11 = math.min(math.floor(v10.amount / 100) + 1, 4);
			local v12 = l__KnitClient__7.Controllers.ReceiveItemEffectController:cloneItemIntoModel((l__ReplicatedStorage__6:WaitForChild("Items"):WaitForChild(v10.itemType)));
			local v13 = v7.Position + Vector3.new(0, 6, 0);
			local v14 = 0;
			local v15 = 0;
			local v16 = false;
			while true do
				if v16 then
					v15 = v15 + 1;
				else
					v16 = true;
				end;
				if not (v15 < v11) then
					break;
				end;
				local u10 = v14;
				task.spawn(function()
					v1.Promise.delay(math.random() * 0.2):await();
					l__KnitClient__7.Controllers.ReceiveItemEffectController:playEffect(v12, v13, function()
						return v7.CFrame;
					end, 0.5 + math.random() * 0.2):andThen(function(p5)
						if p5 then
							local v17 = {};
							if p4.player == l__Players__9.LocalPlayer then
								local v18 = nil;
							else
								v18 = v7.Position;
							end;
							v17.position = v18;
							v17.volumeMultiplier = 0.8;
							local v19 = l__SoundManager__4:playSound(l__GameSound__8.PICKUP_ITEM_DROP, v17);
							if v19 then
								u10 = u10 + 1;
								v19.PlaybackSpeed = 1 + u10 / 50;
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

