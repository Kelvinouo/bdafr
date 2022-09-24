-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__5 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v6 = setmetatable({}, {
	__tostring = function()
		return "KnifeRainKillEffect";
	end, 
	__index = l__KillEffect__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1, p2)
	l__KillEffect__5.constructor(p1, p2);
	l__KillEffect__5.setPlayDefaultKillEffect(p1, false);
end;
local u1 = Random.new();
local l__Workspace__2 = v4.Workspace;
function v6.getTargetCFrame(p3, p4, p5)
	local v8 = nil;
	while v8 == nil and 0 < 20 do
		local v9 = RaycastParams.new();
		v9.FilterType = Enum.RaycastFilterType.Whitelist;
		v9.FilterDescendantsInstances = { p4 };
		local v10 = l__Workspace__2:Raycast(p5, ((p4:GetPivot() * CFrame.new(u1:NextNumber(-2, 2), u1:NextNumber(-3, 3), 0)).Position - p5).Unit * 40, v9);
		local v11 = v10;
		if v11 ~= nil then
			v11 = v11.Instance;
		end;
		if v11 then
			v8 = CFrame.new(v10.Position);
		end;	
	end;
	return v8;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__6 = v4.ReplicatedStorage;
local l__GameWorldUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local l__GameQueryUtil__8 = v2.GameQueryUtil;
local l__RandomUtil__9 = v2.RandomUtil;
local l__default__10 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutSine__11 = v3.OutSine;
local l__Linear__12 = v3.Linear;
function v6.onKill(p6, p7, p8, p9)
	local v12 = u3.new();
	p8.Archivable = true;
	local v13 = p8:Clone();
	v13.HumanoidRootPart.Anchored = true;
	v13:SetPrimaryPartCFrame(p9);
	v13.Parent = l__Workspace__2;
	l__KillEffect__5.hideCharacter(p6, p8);
	v12:GiveTask(v13);
	l__SoundManager__4:playSound(l__GameSound__5.KNIFE_RAIN_EFFECT, {
		position = p9.Position, 
		rollOffMaxDistance = 100
	});
	local v14 = { l__ReplicatedStorage__6.Assets.Misc.KillEffectKnives.KillEffectKnife, l__ReplicatedStorage__6.Assets.Misc.KillEffectKnives.KillEffectRod };
	local v15 = {};
	local v16 = 0;
	while 0 < 5 and v16 < 100 do
		local v17 = p9.Position + l__GameWorldUtil__7.randomUnitVector(p9.LookVector * -1, 1.2217304763960306) * u1:NextNumber(13, 25);
		v16 = v16 + 1;
		if not ((p9.Position - v17).Unit.Y > 0) then
			local v18 = p6:getTargetCFrame(v13, v17);
			if v18 ~= nil then
				local v19 = l__ReplicatedStorage__6.Assets.Misc.KillEffectKnives.KillEffectSpear:Clone();
				v19:PivotTo(CFrame.lookAt(v17, v18.Position));
				v19.Parent = l__Workspace__2;
				l__GameQueryUtil__8:setQueryIgnored(v19, true);
				v15[{
					model = v19, 
					origin = v17, 
					targetPosition = v18.Position, 
					angle = u1:NextNumber(0, 360)
				}] = true;
				local v20 = 0;
				local v21 = false;
				while true do
					if v21 then
						v20 = v20 + 1;
					else
						v21 = true;
					end;
					if not (v20 < 4) then
						break;
					end;
					local v22 = Vector3.new(u1:NextNumber(-2.5, 2.5), u1:NextNumber(-2.5, 2.5), u1:NextNumber(-2.5, 2.5));
					local v23 = p6:getTargetCFrame(v13, v17 + v22);
					if v23 ~= nil then
						local v24 = l__RandomUtil__9.fromList(unpack(v14)):Clone();
						v24:PivotTo(CFrame.lookAt(v17 + v22, v23.Position));
						v24.Parent = l__Workspace__2;
						l__GameQueryUtil__8:setQueryIgnored(v24, true);
						v15[{
							model = v24, 
							origin = v24:GetPivot().Position, 
							angle = u1:NextNumber(0, 360), 
							targetPosition = v23.Position
						}] = true;
					end;				
				end;
			end;
		end;	
	end;
	for v25 in pairs(v15) do
		task.spawn(function()
			local v26 = 0.7 + u1:NextNumber(0.1, 0.35);
			local v27 = l__default__10(v26, l__OutSine__11, function(p10)
				v25.model:PivotTo(CFrame.lookAt(v25.origin:Lerp(v25.origin + (v25.targetPosition - v25.origin).Unit * 3, p10), v25.targetPosition) * CFrame.Angles(0, 0, math.rad(v25.angle)));
			end, 0, 1);
			task.wait(v26 - u1:NextNumber(0.1, 0.2));
			v27:Cancel();
			local l__Position__13 = v25.model:GetPivot().Position;
			local u14 = l__default__10(u1:NextNumber(0.1, 0.15), l__Linear__12, function(p11)
				if v25.model.PrimaryPart then
					local v28 = v25.model.PrimaryPart.Size.Z / 2 - 0.3;
				else
					v28 = 1.3;
				end;
				local l__Unit__29 = (v25.targetPosition - v25.origin).Unit;
				v25.model:PivotTo(CFrame.lookAt(l__Position__13:Lerp(v25.targetPosition - l__Unit__29 * v28, p11), v25.targetPosition + l__Unit__29 * 0.1) * CFrame.Angles(0, 0, math.rad(v25.angle)));
			end, 0, 1);
			v12:GiveTask(function()
				u14:Cancel();
			end);
		end);
	end;
	v12:GiveTask(function()
		for v30 in pairs(v15) do
			v30.model:Destroy();
		end;
	end);
	task.delay(2.5, function()
		v12:DoCleaning();
	end);
	return v12;
end;
return v6;
