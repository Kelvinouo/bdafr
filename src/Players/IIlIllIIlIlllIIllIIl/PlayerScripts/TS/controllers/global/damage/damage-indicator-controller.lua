-- Script Hash: f66e837ef7b3dbc4e7f0b04d70a9da35c61873c6830b32f10eb48b684f9f0f73b3d9355317e1233d30bb7711697c2c9b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "DamageIndicatorController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "DamageIndicatorController";
end;
local l__ReplicatedStorage__3 = v4.ReplicatedStorage;
local l__Workspace__4 = v4.Workspace;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__7 = v4.Players;
local l__DamageType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__EffectUtil__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function u1.KnitStart(p2)
	task.spawn(function()
		l__ReplicatedStorage__3:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HitEffect");
		p2.hitEffectPart = l__ReplicatedStorage__3.Assets.Effects.HitEffect:Clone();
		p2.hitEffectPart.Anchored = true;
		p2.hitEffectPart.Parent = l__Workspace__4;
		l__GameQueryUtil__5:setQueryIgnored(p2.hitEffectPart, true);
	end);
	l__default__6.Client:OnEvent("RemoteName", function(p3)
		if p3.entityInstance.PrimaryPart then
			local v8 = l__Workspace__4.CurrentCamera;
			if v8 then
				v8 = (l__Workspace__4.CurrentCamera.CFrame.Position - p3.entityInstance:GetPrimaryPartCFrame().Position).Magnitude >= 60;
				if v8 then
					local v9 = false;
					if p3.entityInstance ~= l__Players__7.LocalPlayer.Character then
						v9 = p3.fromEntity ~= l__Players__7.LocalPlayer.Character;
					end;
					v8 = v9;
				end;
			end;
			if v8 then
				return nil;
			end;
			local v10 = p3.entityInstance:GetPrimaryPartCFrame().Position + Vector3.new(0, 2.5, 0);
			local v11 = p3.fromEntity == l__Players__7.LocalPlayer.Character;
			local v12 = p3.damage;
			if p3.extraDamageIndicators then
				for v13, v14 in ipairs(p3.extraDamageIndicators) do
					v12 = v12 - v14.damage;
					p2:spawnDamageIndicator(v10, v14.damage, {
						damageType = p3.damageType, 
						infiniteRange = v11
					});
				end;
			end;
			local v15 = p3.customDamageIndicator;
			if v15 ~= nil then
				v15 = v15.damage;
			end;
			local v16 = v15;
			if v16 == nil then
				v16 = p3.damage;
			end;
			local v17 = {
				damageType = p3.damageType, 
				shieldHit = p3.shieldHit
			};
			local v18 = p3.customDamageIndicator;
			if v18 ~= nil then
				v18 = v18.color;
			end;
			v17.color = v18;
			local v19 = p3.customDamageIndicator;
			if v19 ~= nil then
				v19 = v19.image;
			end;
			v17.image = v19;
			local v20 = p3.customDamageIndicator;
			if v20 ~= nil then
				v20 = v20.imageColor;
			end;
			v17.imageColor = v20;
			local v21 = p3.customDamageIndicator;
			if v21 ~= nil then
				v21 = v21.gradientRotation;
			end;
			v17.gradientRotation = v21;
			v17.infiniteRange = v11;
			p2:spawnDamageIndicator(v10, v16, v17);
			if (p3.damageType == l__DamageType__8.SWORD or p3.damageType == l__DamageType__8.PROJECTILE) and p2.hitEffectPart then
				p2.hitEffectPart.CFrame = p3.entityInstance.PrimaryPart.CFrame;
				l__EffectUtil__9:playEffects({ p2.hitEffectPart }, p3.entityInstance);
			end;
		end;
	end);
	l__default__6.Client:OnEvent("RemoteName", function(p4)
		if p4.noHealIndicator then
			return nil;
		end;
		if p4.entityInstance.PrimaryPart then
			p2:spawnDamageIndicator(p4.entityInstance:GetPrimaryPartCFrame().Position + Vector3.new(0, 2.5, 0), p4.healAmount, {
				heal = true
			});
		end;
	end);
end;
local u10 = v2.ConstantManager.registerConstants(script, {
	velX = 5, 
	velY = 9, 
	velZ = 5, 
	gravityDamage = 0.9, 
	gravityHeal = 0.98, 
	textSize = 28, 
	blowUpCompleteDuration = 0.05, 
	blowUpDuration = 0.125, 
	blowUpSize = 76, 
	anchoredDuration = 0.4, 
	strokeThickness = 1.5, 
	baseColor = Color3.fromRGB(255, 81, 68)
});
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ColorUtil__12 = v2.ColorUtil;
local l__Theme__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HEALTHBAR_SHIELD_COLOR__14 = v1.import(script, script.Parent.Parent, "hotbar", "ui", "healthbar", "shield").HEALTHBAR_SHIELD_COLOR;
local l__default__15 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__16 = v3.Linear;
local l__TweenService__17 = v4.TweenService;
local l__OutQuad__18 = v3.OutQuad;
local l__Debris__19 = v4.Debris;
function u1.spawnDamageIndicator(p5, p6, p7, p8)
	local v22 = (l__Workspace__4.CurrentCamera.CFrame.Position - p6).Magnitude > 200;
	if v22 then
		local v23 = p8;
		if v23 ~= nil then
			v23 = v23.infiniteRange;
		end;
		v22 = not v23;
	end;
	if v22 then
		return nil;
	end;
	p7 = math.ceil(p7);
	local v24 = p8;
	if v24 ~= nil then
		v24 = v24.heal;
	end;
	local v25 = v24;
	if v25 == nil then
		v25 = false;
	end;
	local v26 = Instance.new("Part");
	v26.Size = Vector3.new(1, 1, 1);
	v26.Transparency = 1;
	v26.CanCollide = false;
	v26.CFrame = CFrame.new(p6);
	v26.Anchored = true;
	task.delay(u10.anchoredDuration, function()
		v26.Anchored = false;
	end);
	local v27 = Instance.new("BodyForce");
	if p7 < 0 then
		local v28 = u10.gravityHeal;
	else
		v28 = u10.gravityDamage;
	end;
	v27.Force = Vector3.new(0, v26:GetMass() * l__Workspace__4.Gravity * v28, 0);
	v27.Parent = v26;
	v26.Velocity = Vector3.new(math.random(-50, 50) / 100 * u10.velX, 0, math.random(-50, 50) / 100 * u10.velZ);
	local v29 = Instance.new("BillboardGui");
	local v30 = 2.1 + 0.7 * (math.min(p7, 100) / 100);
	v29.Size = UDim2.new(v30 * 2.1, 0, v30, 0);
	v29.AlwaysOnTop = true;
	local v31 = p8;
	if v31 ~= nil then
		v31 = v31.infiniteRange;
	end;
	if v31 then
		local v32 = math.huge;
	else
		v32 = 100;
	end;
	v29.MaxDistance = v32;
	local v33 = u11("Frame", {
		Size = UDim2.fromScale(1, 1), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1, 
		Parent = v29
	});
	local v34 = nil;
	local v35 = p8;
	if v35 ~= nil then
		v35 = v35.image;
	end;
	if v35 ~= "" and v35 then
		local v36 = {
			BackgroundTransparency = 1
		};
		local v37 = p8;
		if v37 ~= nil then
			v37 = v37.image;
		end;
		v36.Image = v37;
		v36.ImageColor3 = p8.imageColor;
		v36.Position = UDim2.fromScale(0.25, 0.5);
		v36.AnchorPoint = Vector2.new(0, 0.5);
		v36.Size = UDim2.fromScale(0.25, 1);
		v36.Parent = v33;
		v34 = u11("ImageLabel", v36);
		u11("UIAspectRatioConstraint", {
			DominantAxis = Enum.DominantAxis.Width, 
			AspectRatio = 1, 
			Parent = v34
		});
	end;
	local v38 = Instance.new("TextLabel");
	v38.Text = tostring(p7);
	v38.Size = UDim2.new(0.5, 0, 1, 0);
	v38.BackgroundTransparency = 1;
	v38.BorderSizePixel = 0;
	v38.Font = Enum.Font.GothamBlack;
	v38.Position = UDim2.fromScale(0.5, 0.5);
	v38.AnchorPoint = Vector2.new(0, 0.5);
	v38.TextSize = 25;
	v38.TextXAlignment = Enum.TextXAlignment.Left;
	local v39 = nil;
	local v40 = p8;
	if v40 ~= nil then
		v40 = v40.color;
	end;
	if v40 then
		if typeof(p8.color) == "Color3" then
			v39 = p8.color;
		else
			v39 = l__ColorUtil__12.WHITE;
		end;
	end;
	v38.TextColor3 = v39 or u10.baseColor;
	local v41 = p8;
	if v41 ~= nil then
		v41 = v41.color;
	end;
	local v42 = v41 and typeof(p8.color) == "ColorSequence";
	if v42 then
		u11("UIGradient", {
			Color = p8.color, 
			Rotation = p8.gradientRotation, 
			Parent = v38
		});
	end;
	local v43 = u11("UIStroke", {
		Parent = v38, 
		Thickness = u10.strokeThickness, 
		Color = Color3.fromRGB(0, 0, 0)
	});
	local v44 = Color3.fromRGB(255, 255, 255);
	if v25 then
		v38.Text = "+" .. tostring(p7);
		v38.TextColor3 = l__Theme__13.mcGreen;
	else
		local v45 = p8;
		if v45 ~= nil then
			v45 = v45.shieldHit;
		end;
		if v45 then
			v38.TextColor3 = l__HEALTHBAR_SHIELD_COLOR__14;
		end;
	end;
	local v46 = p8;
	if v46 ~= nil then
		v46 = v46.damageType;
	end;
	if v46 == l__DamageType__8.POISON then
		local v47 = l__ColorUtil__12.hexColor(0);
		v38.TextColor3 = l__ColorUtil__12.hexColor(5025629);
	end;
	v38.Parent = v33;
	v29.Parent = v26;
	v26.Parent = l__Workspace__4;
	task.spawn(function()
		local l__TextSize__48 = v38.TextSize;
		local u20 = l__TextSize__48;
		local function u21(p9, p10)
			return UDim2.new(p9.X.Scale * p10, p9.X.Offset * p10, p9.Y.Scale * p10, p9.Y.Offset * p10);
		end;
		local u22 = v33.Size;
		local u23 = u10.blowUpSize / l__TextSize__48;
		local v49 = l__default__15(u10.blowUpDuration, l__Linear__16, function(p11)
			v38.TextSize = u20 * (1 - p11) + p11 * u10.blowUpSize;
			v33.Size = u21(u22, 1 - p11) + u21(u22, p11 * u23);
		end, 0, 1);
		v49:Play();
		v49:Wait();
		u20 = v38.TextSize;
		u22 = v33.Size;
		local u24 = u10.textSize / u20;
		l__default__15(u10.blowUpCompleteDuration, l__Linear__16, function(p12)
			v38.TextSize = u20 * (1 - p12) + p12 * u10.textSize;
			v33.Size = u21(u22, 1 - p12) + u21(u22, p12 * u24);
		end, 0, 1):Play();
	end);
	local u25 = l__TweenService__17:Create(v43, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Transparency = 1
	});
	v1.Promise.delay(u10.anchoredDuration + 0.3):andThen(function()
		l__default__15(0.2, l__OutQuad__18, function(p13)
			v38.TextTransparency = p13;
			if v34 then
				v34.ImageTransparency = p13;
			end;
		end, 0, 1);
		u25:Play();
	end);
	l__Debris__19:AddItem(v26, 1.5);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	DamageIndicatorController = u2
};
return u1;
