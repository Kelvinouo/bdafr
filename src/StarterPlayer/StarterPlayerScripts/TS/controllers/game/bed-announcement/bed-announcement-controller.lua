-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "BedAnnouncementController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BedAnnouncementController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__5 = v3.KnitClient;
local l__ReplicatedStorage__6 = v4.ReplicatedStorage;
local l__BlockEngine__7 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__8 = v4.Workspace;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.AnnouncementBegan:connect(function(p3)
		local l__metadata__8 = p3.announcement.metadata;
		if l__metadata__8.bedPosition ~= nil then
			l__SoundManager__3:playSound(l__GameSound__4.BED_BREAK);
			l__KnitClient__5.Controllers.ScreenParticlesController:emitParticlesOnScreen({
				particleEmitter = { l__ReplicatedStorage__6.Assets.Effects.BedBreakParticles }, 
				cleanupAfter = 1
			});
			local v9 = l__ReplicatedStorage__6.Assets.Effects.BedBreakWorld:Clone();
			v9.CFrame = CFrame.new(l__BlockEngine__7:getWorldPosition(l__metadata__8.bedPosition));
			v9.Parent = l__Workspace__8;
			l__GameQueryUtil__9:setQueryIgnored(v9, true);
			v9.CanCollide = false;
			for v10, v11 in ipairs(v9:GetDescendants()) do
				if v11:IsA("ParticleEmitter") then
					local v12 = v11:GetAttribute("EmitCount");
					if v12 ~= 0 and v12 == v12 and v12 then
						v11:Emit(v12);
					end;
				end;
			end;
			task.delay(5, function()
				v9:Destroy();
			end);
		end;
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
