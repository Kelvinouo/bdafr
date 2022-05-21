-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "AngelEffectsController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "AngelEffectsController";
	p1.random = Random.new();
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Workspace__3 = v4.Workspace;
local u4 = v2.ConstantManager.registerConstants(script, {
	P1XRange = NumberRange.new(-30, 30), 
	P1YRange = NumberRange.new(-15, 15), 
	P1ZRange = NumberRange.new(-15, 15)
});
local l__AngelType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit").AngelType;
local l__ReplicatedStorage__6 = v4.ReplicatedStorage;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__9 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutQuad__10 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutQuad;
local l__WatchPlayer__11 = v2.WatchPlayer;
local l__KnitClient__12 = v3.KnitClient;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v8 = l__Workspace__3:GetServerTimeNow() - p3.timeStarted;
		local l__Character__9 = p3.target.Character;
		local l__Character__10 = p3.from.Character;
		if l__Character__9 ~= nil and l__Character__9.PrimaryPart ~= nil and l__Character__10 ~= nil and l__Character__10.PrimaryPart ~= nil then
			local l__Position__11 = l__Character__10:GetPrimaryPartCFrame().Position;
			local l__Position__12 = (l__Character__10:GetPrimaryPartCFrame() * CFrame.new(p2.random:NextNumber(u4.P1XRange.Min, u4.P1XRange.Max), p2.random:NextNumber(u4.P1YRange.Min, u4.P1YRange.Max), p2.random:NextNumber(u4.P1ZRange.Min, u4.P1ZRange.Max))):Lerp(l__Character__9:GetPrimaryPartCFrame(), 0.5).Position;
			if p3.type == l__AngelType__5.LIGHT then
				local v13 = l__ReplicatedStorage__6.Assets.Effects.AngelLightOrb:Clone();
			else
				v13 = l__ReplicatedStorage__6.Assets.Effects.AngelVoidOrb:Clone();
			end;
			v13.Parent = l__Workspace__3;
			if p3.type == l__AngelType__5.LIGHT then
				local v14 = l__GameSound__8.ANGEL_LIGHT_ORB_CREATE;
			else
				v14 = l__GameSound__8.ANGEL_VOID_ORB_CREATE;
			end;
			l__SoundManager__7:playSound(v14, {
				position = l__Position__11, 
				rollOffMaxDistance = 100
			});
			l__default__9(p3.duration - v8, l__InOutQuad__10, function(p4)
				if l__Character__9.PrimaryPart == nil then
					return nil;
				end;
				v13:SetPrimaryPartCFrame(CFrame.new((l__Position__11:Lerp(l__Position__12, p4):Lerp(l__Position__12:Lerp(l__Character__9:GetPrimaryPartCFrame().Position, p4), p4))) * CFrame.Angles(0, math.pi * 2 * p4, 0));
			end, v8, 1):Wait();
			v13:Destroy();
			if p3.type == l__AngelType__5.LIGHT then
				local v15 = l__GameSound__8.ANGEL_LIGHT_ORB_HEAL;
				local v16 = l__ReplicatedStorage__6.Assets.Effects.AngelLightParticles;
			else
				v15 = l__GameSound__8.ANGEL_VOID_ORB_HEAL;
				v16 = l__ReplicatedStorage__6.Assets.Effects.AngelVoidParticles;
			end;
			l__SoundManager__7:playSound(v15, {
				position = l__Character__9.PrimaryPart.Position, 
				rollOffMaxDistance = 100
			});
			for v17, v18 in ipairs(v16:GetChildren()) do
				if v18:IsA("ParticleEmitter") then
					local v19 = v18:Clone();
					v19.Parent = l__Character__9.PrimaryPart;
					v19.Enabled = true;
					task.delay(0.5, function()
						v19.Enabled = false;
						task.wait(3);
						v19:Destroy();
					end);
				end;
			end;
			return;
		end;
		return nil;
	end);
	l__WatchPlayer__11(function(p5, p6)
		p6:GiveTask(p5:GetAttributeChangedSignal("AngelType"):Connect(function()
			local v20 = p5:GetAttribute("AngelType");
			if v20 ~= nil then
				local v21 = p5.Character;
				if v21 ~= nil then
					v21 = v21:GetPrimaryPartCFrame().Position;
				end;
				if v21 == nil then
					return nil;
				end;
				l__SoundManager__7:playSound(l__GameSound__8.SPIRIT_EXPLODE, {
					position = v21, 
					rollOffMaxDistance = 150
				});
				local v22 = {
					position = v21, 
					radius = 20, 
					randomSizeOffset = 0, 
					randomPositionOffset = 0, 
					inDuration = 0.5, 
					outDuration = 1
				};
				if v20 == l__AngelType__5.LIGHT then
					local v23 = l__ReplicatedStorage__6.Assets.Effects.AngelLightExplosion;
				else
					v23 = l__ReplicatedStorage__6.Assets.Effects.AngelVoidExplosion;
				end;
				v22.model = v23;
				l__KnitClient__12.Controllers.FancyExplosionController:createExplosion(v22);
			end;
		end));
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
