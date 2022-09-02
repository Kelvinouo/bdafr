-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BounceController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "BounceController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function u1.KnitStart(p2)
	l__ClientSyncEvents__2.GroundTouch:connect(function(p3)
		local l__Character__5 = l__Players__3.LocalPlayer.Character;
		local v6 = nil;
		if p3.landingBlock then
			local l__block__7 = l__getItemMeta__4(p3.landingBlock.Name).block;
			if l__block__7 and l__block__7.elasticity and l__Character__5.PrimaryPart then
				v6 = l__block__7.elasticity;
			end;
		end;
		local v8 = v6 and v6.bounceSound;
		if v8 ~= "" and v8 then
			l__SoundManager__5:playSound(v6.bounceSound, {
				volumeMultiplier = 0.2 + 0.8 * math.min(p3.velocity.Y / 113, 1)
			});
		end;
		local v9 = v6;
		if v9 ~= nil then
			v9 = v9.elasticityPercent;
		end;
		local v10 = v9;
		if v10 == nil then
			v10 = 0;
		end;
		local v11 = p3.velocity.Y * l__Character__5.PrimaryPart.AssemblyMass * -(v10 + 0);
		if v11 > 0 then
			local u6 = Vector3.new(0, v11, 0);
			task.delay(0.1, function()
				local l__Character__12 = l__Players__3.LocalPlayer.Character;
				if l__Character__12 ~= nil then
					local l__PrimaryPart__13 = l__Character__12.PrimaryPart;
					if l__PrimaryPart__13 ~= nil then
						l__PrimaryPart__13:ApplyImpulse(u6);
					end;
				end;
			end);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	BounceController = u1
};
