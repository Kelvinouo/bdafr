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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "StaticController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__2 = v2.Players;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__TweenService__6 = v2.TweenService;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		print("static hit:", p3);
		local v6 = {};
		local v7, v8, v9 = ipairs(p3.hitEntities);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			v6[v8] = {};		
		end;
		local v10 = {};
		if l__Players__2.LocalPlayer.Character == p3.originEntity then
			local v11 = nil;
		else
			local v12 = p3.originEntity.PrimaryPart;
			if v12 ~= nil then
				v12 = v12.Position;
			end;
			v11 = v12;
		end;
		v10.position = v11;
		v10.rollOffMaxDistance = 80;
		l__SoundManager__3:playSound(l__GameSound__4.STATIC_HIT, v10);
		local v13, v14, v15 = ipairs(p3.hitEntities);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			local v16 = v14:FindFirstChild("UpperTorso");
			if v16 ~= nil then
				v16 = v16:FindFirstChild("BodyFrontAttachment");
			end;
			if v16 then
				p2:playHitSpark(v14);
				local v17, v18, v19 = ipairs(p3.hitEntities);
				while true do
					v17(v18, v19);
					if not v17 then
						break;
					end;
					v19 = v17;
					if v18 ~= v14 and v6[v14][v18] == nil and v6[v18][v14] == nil then
						v6[v14][v18] = true;
						local v20 = v18:FindFirstChild("UpperTorso");
						if v20 ~= nil then
							v20 = v20:FindFirstChild("BodyFrontAttachment");
						end;
						if v20 then
							local l__StaticConnection__21 = l__ReplicatedStorage__5.Assets.Effects.StaticConnection;
							local v22 = l__StaticConnection__21.Beam1:Clone();
							local v23 = l__StaticConnection__21.Beam2:Clone();
							local v24 = l__StaticConnection__21.PointLight:Clone();
							v22.Parent = v16;
							v22.Attachment0 = v16;
							v22.Attachment1 = v20;
							v23.Parent = v16;
							v23.Attachment0 = v16;
							v23.Attachment1 = v20;
							v24.Parent = v16;
							task.delay(0.24, function()
								l__TweenService__6:Create(v22, TweenInfo.new(0.12), {
									Width0 = 0, 
									Width1 = 0
								}):Play();
								l__TweenService__6:Create(v23, TweenInfo.new(0.12), {
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
local l__Workspace__7 = v2.Workspace;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.playHitSpark(p4, p5)
	local l__UpperTorso__25 = p5:FindFirstChild("UpperTorso");
	if not l__UpperTorso__25 then
		return nil;
	end;
	local v26 = l__ReplicatedStorage__5.Assets.Effects.StaticHit:Clone();
	v26.Parent = l__Workspace__7;
	v26.Anchored = false;
	v26.CFrame = l__UpperTorso__25.CFrame;
	v26.Lightning.Anchored = false;
	v26.Lightning.CFrame = l__UpperTorso__25.CFrame;
	l__EffectUtil__8:playEffects(v26:GetChildren(), p5);
	task.delay(0.2, function()
		v26.Attachment.PointLight.Enabled = false;
	end);
	task.delay(5, function()
		v26:Destroy();
	end);
end;
local v27 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
