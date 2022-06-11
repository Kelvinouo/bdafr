-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "CombatController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "CombatController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__5 = v4.Workspace;
local l__Players__6 = v4.Players;
local l__RandomUtil__7 = v2.RandomUtil;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__9 = v2.SoundManager;
function u1.KnitStart(p2)
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			debug.profilebegin("damage-highlight");
			local v8 = l__EntityUtil__4:getEntity(p4.entityInstance);
			if v8 then
				local v9 = v8:getInstance();
				if v9.PrimaryPart and (v9:GetPrimaryPartCFrame().Position - l__Workspace__5.CurrentCamera.CFrame.Position).Magnitude <= 200 then
					l__KnitClient__3.Controllers.EntityHighlightController:highlight(v8:getInstance(), {
						color = Color3.new(1, 0, 0), 
						duration = 0.2, 
						transparency = 0.75
					});
				end;
			end;
			debug.profileend();
		end);
	end);
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p5)
		p5:Connect(function(p6)
			local v10 = p6.entityInstance == l__Players__6.LocalPlayer.Character;
			local l__damageSoundId__11 = p6.damageSoundId;
			if l__damageSoundId__11 ~= "" and l__damageSoundId__11 then
				local v12 = p6.damageSoundId;
			else
				v12 = l__RandomUtil__7.fromList(l__GameSound__8.DAMAGE_1, l__GameSound__8.DAMAGE_2, l__GameSound__8.DAMAGE_3);
			end;
			local v13 = p6.additionalHitSounds or {};
			local v14 = { v12 };
			table.move(v13, 1, #v13, #v14 + 1, v14);
			for v15, v16 in ipairs(v14) do
				local v17 = {};
				if v10 then
					local v18 = nil;
				else
					local v19 = p6.entityInstance.PrimaryPart;
					if v19 ~= nil then
						v19 = v19.Position;
					end;
					v18 = v19;
				end;
				v17.position = v18;
				l__SoundManager__9:playSound(v16, v17);
			end;
		end);
	end);
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p7)
		p7:Connect(function(p8)
			if p8.fromEntity and p8.fromEntity == l__Players__6.LocalPlayer.Character then
				l__SoundManager__9:playSound(l__GameSound__8.KILL);
			end;
		end);
	end);
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	CombatController = u2
};
return u1;
