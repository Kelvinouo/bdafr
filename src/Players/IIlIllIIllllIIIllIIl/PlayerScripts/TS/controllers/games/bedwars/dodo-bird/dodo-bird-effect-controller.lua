-- Script Hash: 370bbfacd4a5f0ddb7a2b559c44885ccfa8072da62d0a9adf812bf6cddac77f4daa31305d1cfe61e483cd3394e823925
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "DodoBirdEffectController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "DodoBirdEffectController";
	p1.dodoBirdMountMaids = {};
end;
local l__CollectionTagAdded__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local l__Players__3 = v3.Players;
local l__Maid__4 = v2.Maid;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__7 = v3.CollectionService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("dodo-bird-mount", function(p3)
		local l__Parent__7 = p3.Parent;
		p3.RootPart.ParticleAttachment.FeatherParticles.Enabled = false;
		if l__Parent__7 ~= nil and l__Players__3:GetPlayerFromCharacter(l__Parent__7) ~= nil then
			local v8 = l__Maid__4.new();
			p2.dodoBirdMountMaids[p3] = v8;
			local u8 = 0;
			v8:GiveTask(l__Parent__7.Humanoid.StateChanged:Connect(function(p4, p5)
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
		local v9 = p2.dodoBirdMountMaids[p6];
		if v9 ~= nil then
			v9:DoCleaning();
		end;
		p2.dodoBirdMountMaids[p6] = nil;
	end);
end;
function v5.playSquawkSound(p7, p8)
	if math.random(0, 1) == 1 then
		local v10 = l__GameSound__6.DODO_BIRD_SQUAWK_2;
	else
		v10 = l__GameSound__6.DODO_BIRD_SQUAWK_1;
	end;
	l__SoundManager__5:playSound(v10, {
		position = p8:GetPrimaryPartCFrame().Position, 
		rollOffMaxDistance = 100
	});
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
