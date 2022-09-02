-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TntWarsBalloonController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v2.Workspace;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "TntWarsBalloonController";
	p1.TNTBalloonModelFolder = u1("Folder", {
		Name = "TNTBalloons", 
		Parent = l__Workspace__2
	});
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__TweenService__6 = v2.TweenService;
local l__BalanceFile__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__RunService__8 = v2.RunService;
local l__Players__9 = v2.Players;
local l__SoundManager__10 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__EffectUtil__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v4.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local v6 = u4.new();
		local v7 = l__ReplicatedStorage__5.Assets.Misc.TNTWarsBalloon:Clone();
		v7.Parent = l__Workspace__2;
		local l__originVector3__8 = p3.originVector3;
		v7:PivotTo(CFrame.new(l__originVector3__8));
		local v9, v10, v11 = ipairs(v7:GetDescendants());
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			task.spawn(function()
				if v10:IsA("BasePart") then
					v10.Transparency = 1;
					l__TweenService__6:Create(v10, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
						Transparency = 0
					}):Play();
				end;
			end);		
		end;
		v6:GiveTask(function()
			print("cleaning up models");
			if v7 then
				v7:Destroy();
			end;
		end);
		local u13 = 0;
		local u14 = l__BalanceFile__7.TNT_WARS_BALLOON_TRAVEL_TIME;
		local l__targetVector3__15 = p3.targetVector3;
		v6:GiveTask(l__RunService__8.Heartbeat:Connect(function(p4)
			if v7.Parent == nil then
				v6:DoCleaning();
				return nil;
			end;
			if v7.PrimaryPart == nil then
				v6:DoCleaning();
				return nil;
			end;
			u13 = u13 + p4;
			local v12 = math.clamp(u13 / u14, 0, 1);
			v7:PivotTo(CFrame.new((l__originVector3__8:Lerp(l__targetVector3__15, v12))) * CFrame.Angles(0, 2 * math.pi * l__BalanceFile__7.TNT_WARS_BALLOON_NUMBER_ROTATIONS * v12, 0));
			if not (u14 <= u13) then
				return;
			end;
			v6:DoCleaning();
			return nil;
		end));
		p3.hitbox.AncestryChanged:Connect(function()
			v6:DoCleaning();
			return nil;
		end);
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p5)
		local l__poppedVector3__13 = p5.poppedVector3;
		if p5.shooter.Character == l__Players__9.LocalPlayer.Character then
			l__SoundManager__10:playSound(l__GameSound__11.ARROW_HIT, {
				position = l__poppedVector3__13, 
				volumeMultiplier = 0.7
			});
		end;
		l__SoundManager__10:playSound(l__GameSound__11.BALLOON_POP, {
			position = nil, 
			volumeMultiplier = 3, 
			playbackSpeedMultiplier = 0.9
		});
		local v14 = l__ReplicatedStorage__5.Assets.Effects.PopEffectRed:Clone();
		v14:PivotTo(CFrame.new(l__poppedVector3__13 + Vector3.new(0, 10, 0)));
		l__EffectUtil__12:playEffects({ v14 }, nil, {
			particleMultiplier = 2
		});
		task.delay(2, function()
			v14:Destroy();
		end);
	end);
end;
local v15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
