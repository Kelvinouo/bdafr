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
		v4(v5, v6);
		if not v4 then
			break;
		end;
		p2:playEffect(v5, p4, p5);
		local v7 = p5;
		if v7 ~= nil then
			v7 = v7.destroyAfterSec;
		end;
		if v7 ~= nil then
			task.delay(p5.destroyAfterSec, function()
				v5:Destroy();
			end);
		end;	
	end;
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__CameraPerspective__2 = v1.import(script, script.Parent.Parent.Parent, "controllers", "global", "first-person", "camera-perspective").CameraPerspective;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__GameQueryUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
function v2.playEffect(p6, p7, p8, p9)
	local v8 = p9;
	if v8 ~= nil then
		v8 = v8.sizeMultiplier;
	end;
	if v8 ~= nil then
		local v9 = p9;
		if v9 ~= nil then
			v9 = v9.sizeMultiplier;
		end;
		p6:scaleInstance(p7, v9);
	end;
	local v10 = false;
	if l__KnitClient__1.Controllers.CameraPerspectiveController:getCameraPerspective() == l__CameraPerspective__2.FIRST_PERSON then
		v10 = p8 and l__Players__3.LocalPlayer.Character == p8;
	end;
	if p7:IsA("ParticleEmitter") then
		if v10 then
			return nil;
		end;
		local v11 = p7:GetAttribute("EmitCount");
		if v11 == nil then
			v11 = 1;
		end;
		local v12 = v11;
		local v13 = p9;
		if v13 ~= nil then
			v13 = v13.particleMultiplier;
		end;
		if v13 ~= 0 and v13 == v13 and v13 and v12 > 0 then
			v12 = math.max(1, v12 * p9.particleMultiplier);
		end;
		p7:Emit(v12);
	elseif p7:IsA("BasePart") then
		l__GameQueryUtil__4:setQueryIgnored(p7, true);
	elseif p7:IsA("Light") then
		local v14 = p7:GetAttribute("Duration");
		if v14 == nil then
			v14 = 0.12;
		end;
		task.delay(v14, function()
			p7.Enabled = false;
		end);
	end;
	local v15, v16, v17 = ipairs((p7:GetChildren()));
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		p6:playEffect(v16, p8, p9);	
	end;
end;
function v2.scaleEffect(p10, p11, p12)
	local v18, v19, v20 = ipairs(p11);
	while true do
		v18(v19, v20);
		if not v18 then
			break;
		end;
		v20 = v18;
		p10:scaleInstance(v19, p12);
		local v21, v22, v23 = ipairs((v19:GetDescendants()));
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			local v24 = p10:scaleInstance(v22, p12);		
		end;	
	end;
end;
function v2.scaleInstance(p13, p14, p15)
	if p14:IsA("ParticleEmitter") then
		local l__Keypoints__25 = p14.Size.Keypoints;
		local v26 = table.create(#l__Keypoints__25);
		local v27, v28, v29 = ipairs(l__Keypoints__25);
		while true do
			v27(v28, v29);
			if not v27 then
				break;
			end;
			v29 = v27;
			v26[v27] = NumberSequenceKeypoint.new(v28.Time, v28.Value * p15, v28.Envelope * p15);		
		end;
		p14.Size = NumberSequence.new(v26);
		p14.Speed = NumberRange.new(p14.Speed.Min * p15, p14.Speed.Max * p15);
	end;
end;
function v2.disableEffects(p16, p17)
	local v30, v31, v32 = ipairs(p17);
	while true do
		v30(v31, v32);
		if not v30 then
			break;
		end;
		v32 = v30;
		if v31:IsA("ParticleEmitter") then
			v31.Enabled = false;
		elseif v31:IsA("Light") then
			v31.Enabled = false;
		end;	
	end;
end;
function v2.enableEffects(p18, p19)
	local v33, v34, v35 = ipairs(p19);
	while true do
		v33(v34, v35);
		if not v33 then
			break;
		end;
		v35 = v33;
		if v34:IsA("ParticleEmitter") then
			v34.Enabled = true;
		elseif v34:IsA("Light") then
			v34.Enabled = true;
		end;	
	end;
end;
return {
	EffectUtil = v2
};
