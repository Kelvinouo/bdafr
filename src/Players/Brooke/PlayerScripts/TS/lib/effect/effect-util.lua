-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "EffectUtil";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1)

end;
function v2.playEffects(p2, p3, p4, p5)
	local v4, v5, v6 = ipairs(p3);
	while true do
		local v7, v8 = v4(v5, v6);
		if not v7 then
			break;
		end;
		p2:playEffect(v8, p4, p5);
		local v9 = p5;
		if v9 ~= nil then
			v9 = v9.destroyAfterSec;
		end;
		if v9 ~= nil then
			task.delay(p5.destroyAfterSec, function()
				v8:Destroy();
			end);
		end;	
	end;
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__CameraPerspective__2 = v1.import(script, script.Parent.Parent.Parent, "controllers", "global", "first-person", "camera-perspective").CameraPerspective;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameQueryUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
function v2.playEffect(p6, p7, p8, p9)
	local v10 = p9;
	if v10 ~= nil then
		v10 = v10.sizeMultiplier;
	end;
	if v10 ~= nil then
		local v11 = p9;
		if v11 ~= nil then
			v11 = v11.sizeMultiplier;
		end;
		p6:scaleInstance(p7, v11);
	end;
	local v12 = false;
	if l__KnitClient__1.Controllers.CameraPerspectiveController:getCameraPerspective() == l__CameraPerspective__2.FIRST_PERSON then
		v12 = p8 and l__Players__3.LocalPlayer.Character == p8;
	end;
	if p7:IsA("ParticleEmitter") then
		if v12 then
			return nil;
		end;
		local v13 = p7:GetAttribute("EmitCount");
		if v13 == nil then
			v13 = 1;
		end;
		local v14 = v13;
		local v15 = p9;
		if v15 ~= nil then
			v15 = v15.particleMultiplier;
		end;
		if v15 ~= 0 and v15 == v15 and v15 and v14 > 0 then
			v14 = math.max(1, v14 * p9.particleMultiplier);
		end;
		p7:Emit(v14);
	elseif p7:IsA("BasePart") then
		l__GameQueryUtil__4:setQueryIgnored(p7, true);
	elseif p7:IsA("Light") then
		local v16 = p7:GetAttribute("Duration");
		if v16 == nil then
			v16 = 0.12;
		end;
		task.delay(v16, function()
			p7.Enabled = false;
		end);
	end;
	for v17, v18 in ipairs((p7:GetChildren())) do
		p6:playEffect(v18, p8, p9);
	end;
end;
function v2.scaleEffect(p10, p11, p12)
	for v19, v20 in ipairs(p11) do
		p10:scaleInstance(v20, p12);
		for v21, v22 in ipairs((v20:GetDescendants())) do
			local v23 = p10:scaleInstance(v22, p12);
		end;
	end;
end;
function v2.scaleInstance(p13, p14, p15)
	if p14:IsA("ParticleEmitter") then
		local l__Keypoints__24 = p14.Size.Keypoints;
		local v25 = table.create(#l__Keypoints__24);
		for v26, v27 in ipairs(l__Keypoints__24) do
			v25[v26] = NumberSequenceKeypoint.new(v27.Time, v27.Value * p15, v27.Envelope * p15);
		end;
		p14.Size = NumberSequence.new(v25);
		p14.Speed = NumberRange.new(p14.Speed.Min * p15, p14.Speed.Max * p15);
	end;
end;
return {
	EffectUtil = v2
};
