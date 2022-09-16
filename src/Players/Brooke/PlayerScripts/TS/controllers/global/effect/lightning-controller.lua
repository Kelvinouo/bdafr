-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LightningController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "LightningController";
	p1.random = Random.new();
end;
local u1 = {
	default = Color3.fromRGB(62, 214, 255)
};
function v4.updateColor(p2, p3, p4)
	local v6 = u1[p4];
	if v6 then
		local v7, v8, v9 = ipairs(p3:GetDescendants());
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			local v10 = v8:IsA("ParticleEmitter") and v8:GetAttribute("ColorType");
			if v10 ~= 0 and v10 == v10 and v10 ~= "" and v10 then
				v8.Color = ColorSequence.new(v6);
			end;		
		end;
	end;
end;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Workspace__3 = v2.Workspace;
local l__EffectUtil__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__GameWorldUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "lightning-beams").src);
function v4.playDefaultExplosion(p5, p6)
	local l__Value__11 = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value;
	local l__colorType__12 = p6.colorType;
	local v13 = p6.sparkCount;
	local v14 = l__ReplicatedStorage__2.Assets.Effects.DefaultLightningImpact:Clone();
	if l__colorType__12 ~= "" and l__colorType__12 then
		p5:updateColor(v14, l__colorType__12);
	end;
	local l__Attachment__15 = v14:FindFirstChild("Attachment");
	v14.Position = p6.position;
	v14.Parent = l__Workspace__3;
	l__EffectUtil__4:playEffects({ v14 }, nil);
	if l__Attachment__15 ~= nil and l__Attachment__15:IsA("Attachment") and Enum.SavedQualitySetting.QualityLevel2.Value <= l__Value__11 and (v13 == 0 or v13 ~= v13 or not v13 or v13 > 0) then
		if v13 == 0 or v13 ~= v13 or not v13 then
			v13 = p5.random:NextNumber(5, 7);
		end;
		local v16 = 0;
		local v17 = false;
		while true do
			if v17 then
				v16 = v16 + 1;
			else
				v17 = true;
			end;
			if not (v16 < v13) then
				break;
			end;
			local v18 = l__Attachment__15.WorldPosition + l__GameWorldUtil__5.randomUnitVector(Vector3.new(0, 1, 0), 1.5707963267948966) * 20;
			local v19 = u6.new(l__Attachment__15, {
				WorldPosition = v18, 
				WorldAxis = (l__Attachment__15.WorldPosition - v18).Unit
			}, 7);
			v19.Thickness = 1;
			v19.MinThicknessMultiplier = 1;
			v19.MaxThicknessMultiplier = 1;
			v19.AnimationSpeed = 1;
			v19.FadeLength = 0.1;
			v19.PulseSpeed = p5.random:NextNumber(6, 9);
			v19.Color = ColorSequence.new(Color3.fromRGB(179, 232, 255), Color3.fromRGB(62, 214, 255));
			v19.PulseLength = 0.6;		
		end;
	end;
	task.delay(3, function()
		v14:Destroy();
	end);
end;
function v4.playSpearExplosion(p7, p8)
	local l__Value__20 = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value;
	local l__colorType__21 = p8.colorType;
	local v22 = p8.sparkCount;
	local v23 = l__ReplicatedStorage__2.Assets.Effects.SpearLightningImpact:Clone();
	if l__colorType__21 ~= "" and l__colorType__21 then
		p7:updateColor(v23, l__colorType__21);
	end;
	local l__Attachment__24 = v23:FindFirstChild("Attachment");
	v23.Position = p8.position;
	v23.Parent = l__Workspace__3;
	l__EffectUtil__4:playEffects({ v23 }, nil);
	if l__Attachment__24 ~= nil and l__Attachment__24:IsA("Attachment") and Enum.SavedQualitySetting.QualityLevel2.Value <= l__Value__20 and (v22 == 0 or v22 ~= v22 or not v22 or v22 > 0) then
		if v22 == 0 or v22 ~= v22 or not v22 then
			v22 = p7.random:NextNumber(5, 7);
		end;
		local v25 = 0;
		local v26 = false;
		while true do
			if v26 then
				v25 = v25 + 1;
			else
				v26 = true;
			end;
			if not (v25 < v22) then
				break;
			end;
			local v27 = l__Attachment__24.WorldPosition + l__GameWorldUtil__5.randomUnitVector(Vector3.new(0, 1, 0), 2.0943951023931953) * p7.random:NextNumber(3, 7);
			local v28 = u6.new(l__Attachment__24, {
				WorldPosition = v27, 
				WorldAxis = (l__Attachment__24.WorldPosition - v27).Unit
			}, 7);
			v28.Thickness = 0.25;
			v28.MinThicknessMultiplier = 1;
			v28.MaxThicknessMultiplier = 1;
			v28.AnimationSpeed = 3;
			v28.FadeLength = 0.1;
			v28.PulseSpeed = p7.random:NextNumber(5, 7);
			v28.Color = ColorSequence.new(Color3.fromRGB(179, 232, 255), Color3.fromRGB(62, 214, 255));
			v28.PulseLength = 0.45;		
		end;
	end;
	task.delay(3, function()
		v23:Destroy();
	end);
end;
function v4.KnitStart(p9)
	l__KnitController__3.KnitStart(p9);
end;
function v4.createLightningStike(p10, p11)
	p10:createExplosion(p11.explosionData);
end;
function v4.createExplosion(p12, p13)
	if p13.explosionType == "spearExplosion" then
		p12:playSpearExplosion(p13);
		return;
	end;
	p12:playDefaultExplosion(p13);
end;
local v29 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
