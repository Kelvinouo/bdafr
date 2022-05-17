
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "StaticController";
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
	p1.Name = "StaticController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v2.Players;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__TweenService__7 = v2.TweenService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		print("static hit:", p3);
		local v6 = {};
		for v7, v8 in ipairs(p3.hitEntities) do
			v6[v8] = {};
		end;
		local v9 = {};
		if l__Players__3.LocalPlayer.Character == p3.originEntity then
			local v10 = nil;
		else
			local v11 = p3.originEntity.PrimaryPart;
			if v11 ~= nil then
				v11 = v11.Position;
			end;
			v10 = v11;
		end;
		v9.position = v10;
		v9.rollOffMaxDistance = 80;
		l__SoundManager__4:playSound(l__GameSound__5.STATIC_HIT, v9);
		local v12, v13, v14 = ipairs(p3.hitEntities);
		while true do
			local v15, v16 = v12(v13, v14);
			if not v15 then
				break;
			end;
			local v17 = v16:FindFirstChild("UpperTorso");
			if v17 ~= nil then
				v17 = v17:FindFirstChild("BodyFrontAttachment");
			end;
			if v17 then
				p2:playHitSpark(v16);
				for v18, v19 in ipairs(p3.hitEntities) do
					if v19 ~= v16 and v6[v16][v19] == nil and v6[v19][v16] == nil then
						v6[v16][v19] = true;
						local v20 = v19:FindFirstChild("UpperTorso");
						if v20 ~= nil then
							v20 = v20:FindFirstChild("BodyFrontAttachment");
						end;
						if v20 then
							local l__StaticConnection__21 = l__ReplicatedStorage__6.Assets.Effects.StaticConnection;
							local v22 = l__StaticConnection__21.Beam1:Clone();
							local v23 = l__StaticConnection__21.Beam2:Clone();
							local v24 = l__StaticConnection__21.PointLight:Clone();
							v22.Parent = v17;
							v22.Attachment0 = v17;
							v22.Attachment1 = v20;
							v23.Parent = v17;
							v23.Attachment0 = v17;
							v23.Attachment1 = v20;
							v24.Parent = v17;
							task.delay(0.24, function()
								l__TweenService__7:Create(v22, TweenInfo.new(0.12), {
									Width0 = 0, 
									Width1 = 0
								}):Play();
								l__TweenService__7:Create(v23, TweenInfo.new(0.12), {
									Width0 = 0, 
									Width1 = 0
								}):Play();
								task.wait(0.12);
								v22:Destroy();
								v23:Destroy();
								v24:Destroy();
							end);
						end;
					end;
				end;
			end;		
		end;
	end);
end;
local l__Workspace__8 = v2.Workspace;
local l__EffectUtil__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.playHitSpark(p4, p5)
	local l__UpperTorso__25 = p5:FindFirstChild("UpperTorso");
	if not l__UpperTorso__25 then
		return nil;
	end;
	local v26 = l__ReplicatedStorage__6.Assets.Effects.StaticHit:Clone();
	v26.Parent = l__Workspace__8;
	v26.Anchored = false;
	v26.CFrame = l__UpperTorso__25.CFrame;
	v26.Lightning.Anchored = false;
	v26.Lightning.CFrame = l__UpperTorso__25.CFrame;
	l__EffectUtil__9:playEffects(v26:GetChildren(), p5);
	task.delay(0.2, function()
		v26.Attachment.PointLight.Enabled = false;
	end);
	task.delay(5, function()
		v26:Destroy();
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

