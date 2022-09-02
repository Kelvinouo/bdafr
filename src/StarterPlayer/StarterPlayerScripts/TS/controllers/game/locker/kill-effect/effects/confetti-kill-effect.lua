-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "Anonymous";
	end, 
	__index = l__KillEffect__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, ...)
	l__KillEffect__4.constructor(p1, ...);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v3.Workspace;
local l__GameQueryUtil__3 = v2.GameQueryUtil;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.onKill(p2, p3, p4, p5)
	local v7 = u1("Part", {
		Size = Vector3.new(1, 1, 1), 
		CFrame = p5, 
		Transparency = 1, 
		Anchored = true, 
		CanCollide = false, 
		Parent = l__Workspace__2
	});
	l__GameQueryUtil__3:setQueryIgnored(v7, true);
	local v8 = l__ReplicatedStorage__4:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("ConfettiParticle"):Clone();
	v8.Enabled = false;
	v8.Parent = v7;
	l__SoundManager__5:playSound(l__GameSound__6.CONFETTI, {
		position = p5.Position
	});
	v1.Promise.defer(function()
		local v9 = 0;
		local v10 = false;
		while true do
			if v10 then
				v9 = v9 + 1;
			else
				v10 = true;
			end;
			if not (v9 < 5) then
				break;
			end;
			v8:Emit(20);		
		end;
	end);
	v1.Promise.delay(4):andThen(function()
		v7:Destroy();
	end);
end;
return v5;
