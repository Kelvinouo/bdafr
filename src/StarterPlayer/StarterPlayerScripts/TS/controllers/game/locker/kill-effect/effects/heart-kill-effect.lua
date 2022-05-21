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
local l__ReplicatedStorage__1 = v3.ReplicatedStorage;
local l__GameQueryUtil__2 = v2.GameQueryUtil;
local l__Workspace__3 = v3.Workspace;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.onKill(p2, p3, p4, p5)
	local v7 = l__ReplicatedStorage__1:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HeartParticle"):Clone();
	l__GameQueryUtil__2:setQueryIgnored(v7, true);
	v7.Transparency = 1;
	v7.CFrame = p5;
	v7.Parent = l__Workspace__3;
	local l__Attachment__8 = v7:WaitForChild("Attachment");
	local l__Heart__9 = l__Attachment__8:WaitForChild("Heart");
	local l__Glow__10 = l__Attachment__8:WaitForChild("Glow");
	l__Heart__9.Enabled = false;
	l__Glow__10.Enabled = false;
	l__SoundManager__4:playSound(l__GameSound__5.HEART, {
		position = p5.Position
	});
	v1.Promise.defer(function()
		local v11 = 0;
		local v12 = false;
		while true do
			if v12 then
				v11 = v11 + 1;
			else
				v12 = true;
			end;
			if not (v11 < 5) then
				break;
			end;
			l__Heart__9:Emit(10);
			l__Glow__10:Emit(10);		
		end;
	end);
	v1.Promise.delay(4):andThen(function()
		v7:Destroy();
	end);
end;
return v5;
