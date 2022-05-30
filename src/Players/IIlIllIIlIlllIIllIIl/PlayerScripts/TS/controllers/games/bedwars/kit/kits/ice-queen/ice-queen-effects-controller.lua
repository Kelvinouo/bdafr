-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "IceQueenEffectsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "IceQueenEffectsController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__Players__5 = v2.Players;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v6 = l__EntityUtil__3:getEntity(p3.to);
		if v6 then
			local l__HumanoidRootPart__7 = v6:getInstance():FindFirstChild("HumanoidRootPart");
			if l__HumanoidRootPart__7 then
				for v8, v9 in ipairs(l__ReplicatedStorage__4.Assets.Effects.IceQueenFreezeParticles:Clone():GetChildren()) do
					if v9:IsA("ParticleEmitter") then
						v9.Parent = l__HumanoidRootPart__7;
						v9.Enabled = false;
						if p3.strong then
							local v10 = 20;
						else
							v10 = 15;
						end;
						v9:Emit(v10);
						task.delay(5, function()
							v9:Destroy();
						end);
					end;
				end;
				local v11 = l__Players__5.LocalPlayer.Character == p3.to;
				if p3.strong then
					local v12 = l__GameSound__7.ICE_QUEEN_STRONG_PROC;
				else
					v12 = l__GameSound__7.ICE_QUEEN_PROC;
				end;
				local v13 = {};
				if v11 then
					local v14 = nil;
				else
					local v15 = p3.to.PrimaryPart;
					if v15 ~= nil then
						v15 = v15.Position;
					end;
					v14 = v15;
				end;
				v13.position = v14;
				if v11 then
					local v16 = nil;
				else
					v16 = p3.to.PrimaryPart;
				end;
				v13.parent = v16;
				l__SoundManager__6:playSound(v12, v13);
			end;
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
