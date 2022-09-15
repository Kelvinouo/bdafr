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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "IceQueenEffectsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__3 = v2.ReplicatedStorage;
local l__Players__4 = v2.Players;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v6 = l__EntityUtil__2:getEntity(p3.to);
		if v6 then
			local l__HumanoidRootPart__7 = v6:getInstance():FindFirstChild("HumanoidRootPart");
			if l__HumanoidRootPart__7 then
				local v8, v9, v10 = ipairs(l__ReplicatedStorage__3.Assets.Effects.IceQueenFreezeParticles:Clone():GetChildren());
				while true do
					v8(v9, v10);
					if not v8 then
						break;
					end;
					v10 = v8;
					if v9:IsA("ParticleEmitter") then
						v9.Parent = l__HumanoidRootPart__7;
						v9.Enabled = false;
						if p3.strong then
							local v11 = 20;
						else
							v11 = 15;
						end;
						v9:Emit(v11);
						task.delay(5, function()
							v9:Destroy();
						end);
					end;				
				end;
				local v12 = l__Players__4.LocalPlayer.Character == p3.to;
				if p3.strong then
					local v13 = l__GameSound__6.ICE_QUEEN_STRONG_PROC;
				else
					v13 = l__GameSound__6.ICE_QUEEN_PROC;
				end;
				local v14 = {};
				if v12 then
					local v15 = nil;
				else
					local v16 = p3.to.PrimaryPart;
					if v16 ~= nil then
						v16 = v16.Position;
					end;
					v15 = v16;
				end;
				v14.position = v15;
				if v12 then
					local v17 = nil;
				else
					v17 = p3.to.PrimaryPart;
				end;
				v14.parent = v17;
				l__SoundManager__5:playSound(v13, v14);
			end;
		end;
	end);
end;
local v18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
