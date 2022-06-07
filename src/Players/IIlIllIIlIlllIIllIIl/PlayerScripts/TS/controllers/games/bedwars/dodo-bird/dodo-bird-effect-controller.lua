-- Script Hash: 55bd08c9d2d962f284a44462b0586435ec64798844028ff9dbc68d8a17ba80ad3da63e6062f1f5d9f296ff74fe57bdb4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DodoBirdEffectController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "DodoBirdEffectController";
	p1.dodoBirdMountMaids = {};
end;
local l__CollectionTagAdded__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__Players__3 = v2.Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__7 = v2.CollectionService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("dodo-bird-mount", function(p3)
		local l__Parent__6 = p3.Parent;
		p3.RootPart.ParticleAttachment.FeatherParticles.Enabled = false;
		if l__Parent__6 ~= nil and l__Players__3:GetPlayerFromCharacter(l__Parent__6) ~= nil then
			local v7 = u4.new();
			p2.dodoBirdMountMaids[p3] = v7;
			local u8 = 0;
			v7:GiveTask(l__Parent__6.Humanoid.StateChanged:Connect(function(p4, p5)
				if p4 == Enum.HumanoidStateType.Freefall and p5 == Enum.HumanoidStateType.Jumping and time() - u8 > 0.2 then
					u8 = time();
					p3.RootPart.ParticleAttachment.FeatherParticles:Emit(8);
					if math.random(0, 1) == 1 then
						l__SoundManager__5:playSound(l__GameSound__6.DODO_BIRD_DOUBLE_JUMP, {
							position = p3:GetPrimaryPartCFrame().Position
						});
						return;
					end;
					l__SoundManager__5:playSound(l__GameSound__6.DODO_BIRD_JUMP, {
						position = p3:GetPrimaryPartCFrame().Position
					});
				end;
			end));
		end;
	end);
	l__CollectionService__7:GetInstanceRemovedSignal("dodo-bird-mount"):Connect(function(p6)
		local v8 = p2.dodoBirdMountMaids[p6];
		if v8 ~= nil then
			v8:DoCleaning();
		end;
		p2.dodoBirdMountMaids[p6] = nil;
	end);
end;
function v4.playSquawkSound(p7, p8)
	if math.random(0, 1) == 1 then
		local v9 = l__GameSound__6.DODO_BIRD_SQUAWK_2;
	else
		v9 = l__GameSound__6.DODO_BIRD_SQUAWK_1;
	end;
	l__SoundManager__5:playSound(v9, {
		position = p8:GetPrimaryPartCFrame().Position, 
		rollOffMaxDistance = 100
	});
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
