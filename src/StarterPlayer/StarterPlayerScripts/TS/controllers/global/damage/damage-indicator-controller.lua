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
function u1.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "DamageIndicatorController";
end;
local l__ReplicatedStorage__2 = v4.ReplicatedStorage;
local l__Workspace__3 = v4.Workspace;
local l__GameQueryUtil__4 = v2.GameQueryUtil;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__6 = v4.Players;
local l__DamageType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function u1.KnitStart(p2)
	task.spawn(function()
		l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HitEffect");
		p2.hitEffectPart = l__ReplicatedStorage__2.Assets.Effects.HitEffect:Clone();
		p2.hitEffectPart.Anchored = true;
		p2.hitEffectPart.Parent = l__Workspace__3;
		l__GameQueryUtil__4:setQueryIgnored(p2.hitEffectPart, true);
	end);
	l__default__5.Client:OnEvent("RemoteName", function(p3)
		if p3.entityInstance.PrimaryPart then
			local v8 = l__Workspace__3.CurrentCamera;
			if v8 then
				v8 = (l__Workspace__3.CurrentCamera.CFrame.Position - p3.entityInstance:GetPrimaryPartCFrame().Position).Magnitude >= 60;
				if v8 then
					local v9 = false;
					if p3.entityInstance ~= l__Players__6.LocalPlayer.Character then
						v9 = p3.fromEntity ~= l__Players__6.LocalPlayer.Character;
					end;
					v8 = v9;
				end;
			end;
			if v8 then
				return nil;
			end;
			local v10 = p3.entityInstance:GetPrimaryPartCFrame().Position + Vector3.new(0, 2.5, 0);
			local v11 = p3.fromEntity == l__Players__6.LocalPlayer.Character;
			local v12 = p3.damage;
			if p3.extraDamageIndicators then
				local v13, v14, v15 = ipairs(p3.extraDamageIndicators);
				while true do
					v13(v14, v15);
					if not v13 then
						break;
					end;
					v15 = v13;
					v12 = v12 - v14.damage;
					p2:spawnDamageIndicator(v10, v14.damage, {
						damageType = p3.damageType, 
						infiniteRange = v11
					});				
				end;
			end;
			local v16 = p3.customDamageIndicator;
			if v16 ~= nil then
				v16 = v16.damage;
			end;
			local v17 = v16;
			if v17 == nil then
				v17 = p3.damage;
			end;
			local v18 = {
				damageType = p3.damageType, 
				shieldHit = p3.shieldHit
			};
			local v19 = p3.customDamageIndicator;
			if v19 ~= nil then
				v19 = v19.color;
			end;
			v18.color = v19;
			local v20 = p3.customDamageIndicator;
			if v20 ~= nil then
				v20 = v20.image;
			end;
			v18.image = v20;
			local v21 = p3.customDamageIndicator;
			if v21 ~= nil then
				v21 = v21.imageColor;
			end;
			v18.imageColor = v21;
			local v22 = p3.customDamageIndicator;
			if v22 ~= nil then
				v22 = v22.gradientRotation;
			end;
			v18.gradientRotation = v22;
			v18.infiniteRange = v11;
			p2:spawnDamageIndicator(v10, v17, v18);
			if (p3.damageType == l__DamageType__7.SWORD or p3.damageType == l__DamageType__7.PROJECTILE) and p2.hitEffectPart then
				p2.hitEffectPart.CFrame = p3.entityInstance.PrimaryPart.CFrame;
				l__EffectUtil__8:playEffects({ p2.hitEffectPart }, p3.entityInstance);
			end;
		end;
	end);
	l__default__5.Client:OnEvent("RemoteName", function(p4)
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
local u9 = v2.ConstantManager.registerConstants(script, {
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
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ColorUtil__11 = v2.ColorUtil;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__HEALTHBAR_SHIELD_COLOR__13 = v1.import(script, script.Parent.Parent, "hotbar", "ui", "healthbar", "shield").HEALTHBAR_SHIELD_COLOR;
local l__default__14 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__15 = v3.Linear;
local l__TweenService__16 = v4.TweenService;
local l__OutQuad__17 = v3.OutQuad;
local l__Debris__18 = v4.Debris;
function u1.spawnDamageIndicator(p5, p6, p7, p8)
	local v23 = (l__Workspace__3.CurrentCamera.CFrame.Position - p6).Magnitude > 200;
	if v23 then
		local v24 = p8;
		if v24 ~= nil then
			v24 = v24.infiniteRange;
		end;
		v23 = not v24;
	end;
	if v23 then
		return nil;
	end;
	p7 = math.ceil(p7);
	local v25 = p8;
	if v25 ~= nil then
		v25 = v25.heal;
	end;
	local v26 = v25;
	if v26 == nil then
		v26 = false;
	end;
	local v27 = Instance.new("Part");
	v27.Size = Vector3.new(1, 1, 1);
	v27.Transparency = 1;
	v27.CanCollide = false;
	v27.CFrame = CFrame.new(p6);
	v27.Anchored = true;
	task.delay(u9.anchoredDuration, function()
		v27.Anchored = false;
	end);
	local v28 = Instance.new("BodyForce");
	if p7 < 0 then
		local v29 = u9.gravityHeal;
	else
		v29 = u9.gravityDamage;
	end;
	v28.Force = Vector3.new(0, v27:GetMass() * l__Workspace__3.Gravity * v29, 0);
	v28.Parent = v27;
	v27.Velocity = Vector3.new(math.random(-50, 50) / 100 * u9.velX, 0, math.random(-50, 50) / 100 * u9.velZ);
	local v30 = Instance.new("BillboardGui");
	local v31 = 2.1 + 0.7 * (math.min(p7, 100) / 100);
	v30.Size = UDim2.new(v31 * 2.1, 0, v31, 0);
	v30.AlwaysOnTop = true;
	local v32 = p8;
	if v32 ~= nil then
		v32 = v32.infiniteRange;
	end;
	if v32 then
		local v33 = math.huge;
	else
		v33 = 100;
	end;
	v30.MaxDistance = v33;
	local v34 = u10("Frame", {
		Size = UDim2.fromScale(1, 1), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1, 
		Parent = v30
	});
	local v35 = nil;
	local v36 = p8;
	if v36 ~= nil then
		v36 = v36.image;
	end;
	if v36 ~= "" and v36 then
		local v37 = {
			BackgroundTransparency = 1
		};
		local v38 = p8;
		if v38 ~= nil then
			v38 = v38.image;
		end;
		v37.Image = v38;
		v37.ImageColor3 = p8.imageColor;
		v37.Position = UDim2.fromScale(0.25, 0.5);
		v37.AnchorPoint = Vector2.new(0, 0.5);
		v37.Size = UDim2.fromScale(0.25, 1);
		v37.Parent = v34;
		v35 = u10("ImageLabel", v37);
		u10("UIAspectRatioConstraint", {
			DominantAxis = Enum.DominantAxis.Width, 
			AspectRatio = 1, 
			Parent = v35
		});
	end;
	local v39 = Instance.new("TextLabel");
	v39.Text = tostring(p7);
	v39.Size = UDim2.new(0.5, 0, 1, 0);
	v39.BackgroundTransparency = 1;
	v39.BorderSizePixel = 0;
	v39.Font = Enum.Font.GothamBlack;
	v39.Position = UDim2.fromScale(0.5, 0.5);
	v39.AnchorPoint = Vector2.new(0, 0.5);
	v39.TextSize = 25;
	v39.TextXAlignment = Enum.TextXAlignment.Left;
	local v40 = nil;
	local v41 = p8;
	if v41 ~= nil then
		v41 = v41.color;
	end;
	if v41 then
		if typeof(p8.color) == "Color3" then
			v40 = p8.color;
		else
			v40 = l__ColorUtil__11.WHITE;
		end;
	end;
	v39.TextColor3 = v40 or u9.baseColor;
	local v42 = p8;
	if v42 ~= nil then
		v42 = v42.color;
	end;
	local v43 = v42 and typeof(p8.color) == "ColorSequence";
	if v43 then
		u10("UIGradient", {
			Color = p8.color, 
			Rotation = p8.gradientRotation, 
			Parent = v39
		});
	end;
	local v44 = u10("UIStroke", {
		Parent = v39, 
		Thickness = u9.strokeThickness, 
		Color = Color3.fromRGB(0, 0, 0)
	});
	local v45 = Color3.fromRGB(255, 255, 255);
	if v26 then
		v39.Text = "+" .. tostring(p7);
		v39.TextColor3 = l__Theme__12.mcGreen;
	else
		local v46 = p8;
		if v46 ~= nil then
			v46 = v46.shieldHit;
		end;
		if v46 then
			v39.TextColor3 = l__HEALTHBAR_SHIELD_COLOR__13;
		end;
	end;
	local v47 = p8;
	if v47 ~= nil then
		v47 = v47.damageType;
	end;
	if v47 == l__DamageType__7.POISON then
		local v48 = l__ColorUtil__11.hexColor(0);
		v39.TextColor3 = l__ColorUtil__11.hexColor(5025629);
	end;
	v39.Parent = v34;
	v30.Parent = v27;
	v27.Parent = l__Workspace__3;
	task.spawn(function()
		local l__TextSize__49 = v39.TextSize;
		local u19 = l__TextSize__49;
		local u20 = v34.Size;
		local u21 = u9.blowUpSize / l__TextSize__49;
		local v50 = l__default__14(u9.blowUpDuration, l__Linear__15, function(p9)
			v39.TextSize = u19 * (1 - p9) + p9 * u9.blowUpSize;
			local v51 = 1 - p9;
			local v52 = UDim2.new(u20.X.Scale * v51, u20.X.Offset * v51, u20.Y.Scale * v51, u20.Y.Offset * v51);
			local v53 = p9 * u21;
			v34.Size = v52 + UDim2.new(u20.X.Scale * v53, u20.X.Offset * v53, u20.Y.Scale * v53, u20.Y.Offset * v53);
		end, 0, 1);
		v50:Play();
		v50:Wait();
		u19 = v39.TextSize;
		u20 = v34.Size;
		local u22 = u9.textSize / u19;
		l__default__14(u9.blowUpCompleteDuration, l__Linear__15, function(p10)
			v39.TextSize = u19 * (1 - p10) + p10 * u9.textSize;
			local v54 = 1 - p10;
			local v55 = UDim2.new(u20.X.Scale * v54, u20.X.Offset * v54, u20.Y.Scale * v54, u20.Y.Offset * v54);
			local v56 = p10 * u22;
			v34.Size = v55 + UDim2.new(u20.X.Scale * v56, u20.X.Offset * v56, u20.Y.Scale * v56, u20.Y.Offset * v56);
		end, 0, 1):Play();
	end);
	local u23 = l__TweenService__16:Create(v44, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Transparency = 1
	});
	v1.Promise.delay(u9.anchoredDuration + 0.3):andThen(function()
		l__default__14(0.2, l__OutQuad__17, function(p11)
			v39.TextTransparency = p11;
			if v35 then
				v35.ImageTransparency = p11;
			end;
		end, 0, 1);
		u23:Play();
	end);
	l__Debris__18:AddItem(v27, 1.5);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	DamageIndicatorController = u1
};
