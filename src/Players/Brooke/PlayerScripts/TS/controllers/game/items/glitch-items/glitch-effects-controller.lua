-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GlitchEffectsController";
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
	p1.Name = "GlitchEffectsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Workspace__3 = v2.Workspace;
local l__GameQueryUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__scalePart__5 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scalePart;
local l__Debris__6 = v2.Debris;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			local v6 = l__ReplicatedStorage__2.Assets.Effects.GlitchExplosion:Clone();
			v6.Position = p4.position;
			v6.Parent = l__Workspace__3;
			l__GameQueryUtil__4:setQueryIgnored(v6, true);
			l__scalePart__5(v6, p4.scale);
			local v7, v8, v9 = ipairs((v6:GetDescendants()));
			while true do
				v7(v8, v9);
				if not v7 then
					break;
				end;
				v9 = v7;
				if v8:IsA("ParticleEmitter") then
					v8:Emit(p4.numberParticles);
				end;			
			end;
			l__Debris__6:AddItem(v6, p4.duration);
		end);
	end);
end;
local v10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
