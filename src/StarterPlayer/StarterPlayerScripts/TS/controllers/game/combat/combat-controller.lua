-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "CombatController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "CombatController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__4 = v3.Workspace;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Players__6 = v3.Players;
local l__RandomUtil__7 = v2.RandomUtil;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__9 = v2.SoundManager;
function u1.KnitStart(p2)
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			debug.profilebegin("damage-highlight");
			local v7 = l__EntityUtil__3:getEntity(p4.entityInstance);
			if v7 then
				local v8 = v7:getInstance();
				if v8.PrimaryPart and (v8:GetPrimaryPartCFrame().Position - l__Workspace__4.CurrentCamera.CFrame.Position).Magnitude <= 200 then
					l__KnitClient__5.Controllers.EntityHighlightController:highlight(v7:getInstance(), {
						color = Color3.new(1, 0, 0), 
						duration = 0.2, 
						transparency = 0.75
					});
				end;
			end;
			debug.profileend();
		end);
	end);
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p5)
		p5:Connect(function(p6)
			local v9 = p6.entityInstance == l__Players__6.LocalPlayer.Character;
			local l__damageSoundId__10 = p6.damageSoundId;
			if l__damageSoundId__10 ~= "" and l__damageSoundId__10 then
				local v11 = p6.damageSoundId;
			else
				v11 = l__RandomUtil__7.fromList(l__GameSound__8.DAMAGE_1, l__GameSound__8.DAMAGE_2, l__GameSound__8.DAMAGE_3);
			end;
			local v12 = p6.additionalHitSounds or {};
			local v13 = { v11 };
			table.move(v12, 1, #v12, #v13 + 1, v13);
			local v14, v15, v16 = ipairs(v13);
			while true do
				v14(v15, v16);
				if not v14 then
					break;
				end;
				v16 = v14;
				local v17 = {};
				if v9 then
					local v18 = nil;
				else
					local v19 = p6.entityInstance.PrimaryPart;
					if v19 ~= nil then
						v19 = v19.Position;
					end;
					v18 = v19;
				end;
				v17.position = v18;
				l__SoundManager__9:playSound(v15, v17);			
			end;
		end);
	end);
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p7)
		p7:Connect(function(p8)
			if p8.fromEntity and p8.fromEntity == l__Players__6.LocalPlayer.Character then
				l__SoundManager__9:playSound(l__GameSound__8.KILL);
			end;
		end);
	end);
end;
u1 = l__KnitClient__5.CreateController;
u1 = u1(u1.new());
return {
	CombatController = u1
};
