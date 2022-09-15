-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GhostKillEffect";
	end, 
	__index = l__KillEffect__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, p2)
	l__KillEffect__3.constructor(p1, p2);
	l__KillEffect__3.setPlayDefaultKillEffect(p1, false);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__2 = v2.Workspace;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__5 = v2.TweenService;
local u6 = Color3.fromRGB(115, 192, 144);
local l__ReplicatedStorage__7 = v2.ReplicatedStorage;
local u8 = Color3.fromRGB(48, 117, 87);
local l__default__9 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__10 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).OutExpo;
function v4.onKill(p3, p4, p5, p6)
	local v6 = u1.new();
	print("statue character:", p5);
	p5.Archivable = true;
	local v7 = p5:Clone();
	v7.Parent = l__Workspace__2;
	v6:GiveTask(v7);
	l__KillEffect__3.hideCharacter(p3, p5);
	l__SoundManager__3:playSound(l__GameSound__4.GHOST_VACUUM_SUCKING_LOOP, {
		position = v7:GetPrimaryPartCFrame().Position
	});
	local v8 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
	local v9 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);
	local v10, v11, v12 = ipairs(v7:GetDescendants());
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		if v11:IsA("BasePart") then
			l__TweenService__5:Create(v11, v8, {
				Transparency = 1
			}):Play();
			l__TweenService__5:Create(v11, v9, {
				Color = u6
			}):Play();
			if v11.Name == "LeftHand" or v11.Name == "LeftFoot" or v11.Name == "RightHand" or v11.Name == "RightFoot" or v11.Name == "UpperTorso" or v11.Name == "Head" then
				local v13, v14, v15 = ipairs(l__ReplicatedStorage__7.Assets.Effects.GhostSmokeEffect:Clone():GetChildren());
				while true do
					v13(v14, v15);
					if not v13 then
						break;
					end;
					v15 = v13;
					v14.Parent = v11;
					v14.Enabled = true;
					v14.LockedToPart = false;
					v14.Acceleration = Vector3.new(0, 0.1, 0);
					v14.Rate = 25;				
				end;
			end;
		elseif v11:IsA("Texture") or v11:IsA("Clothing") then
			if v11:IsA("Texture") then
				l__TweenService__5:Create(v11, v8, {
					Transparency = 0.45
				}):Play();
			end;
			l__TweenService__5:Create(v11, v9, {
				Color3 = u8
			}):Play();
		end;	
	end;
	local u11 = v7:GetPivot();
	task.delay(0.75, function()
		l__default__9(1.5, l__OutExpo__10, function(p7)
			return v7:PivotTo(p7);
		end, v7:GetPivot(), u11 * CFrame.new(0, 15, 0)):Play();
	end);
	task.delay(2.25, function()
		v6:DoCleaning();
	end);
	return v6;
end;
return v4;
