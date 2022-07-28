-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "AxolotlController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v3.Workspace;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "AxolotlController";
	p1.axolotlModelFolder = u2("Folder", {
		Name = "AxolotlModel", 
		Parent = l__Workspace__3
	});
end;
local l__PlaceUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__CollectionTagAdded__5 = v2.CollectionTagAdded;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	if l__PlaceUtil__4.isGameServer() then
		p2.axolotlDataFolder = l__Workspace__3:WaitForChild("AxolotlData");
	else
		p2.axolotlDataFolder = u2("Folder", {
			Name = "AxolotlData", 
			Parent = l__Workspace__3
		});
	end;
	l__CollectionTagAdded__5("axolotl_data", function(p3)
		p2:createAxolotlModel(p3);
	end);
	l__CollectionTagAdded__5("axolotl_model", function(p4)

	end);
end;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__BedwarsKitSkin__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ReplicatedStorage__8 = v3.ReplicatedStorage;
local l__AxolotlType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType;
local l__CollectionService__10 = v3.CollectionService;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AxolotlState__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-state").AxolotlState;
local l__TweenService__14 = v3.TweenService;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__17 = v2.GameQueryUtil;
local l__RunService__18 = v3.RunService;
local l__AxolotlKit__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-kit").AxolotlKit;
function v5.createAxolotlModel(p5, p6)
	p6:WaitForChild("AttachedTo");
	p6:WaitForChild("AxolotlModel");
	p6:WaitForChild("Owner");
	local v7 = p6:GetAttribute("AxolotlSkin");
	if p6.Parent == nil then
		return nil;
	end;
	local v8 = p6:GetAttribute("RandomFloat");
	local v9 = p6:GetAttribute("AxolotlType");
	local u20 = u6.new();
	p6.AncestryChanged:Connect(function(p7, p8)
		if p8 == nil then
			u20:DoCleaning();
		end;
	end);
	if v7 == l__BedwarsKitSkin__7.AXOLOTL_REINDEER then
		local v10 = l__ReplicatedStorage__8.Assets.Misc.Axolotl.ReindeerAxolotl:Clone();
	elseif v7 == l__BedwarsKitSkin__7.AXOLOTL_EASTER_BUNNY then
		if v9 == l__AxolotlType__9.BREAK_SPEED then
			v10 = l__ReplicatedStorage__8.Assets.Misc.AxolotlEaster.BreakSpeedAxolotl:Clone();
		elseif v9 == l__AxolotlType__9.DAMAGE then
			v10 = l__ReplicatedStorage__8.Assets.Misc.AxolotlEaster.DamageAxolotl:Clone();
		elseif v9 == l__AxolotlType__9.HEALTH_REGEN then
			v10 = l__ReplicatedStorage__8.Assets.Misc.AxolotlEaster.HealthRegenAxolotl:Clone();
		else
			if v9 == l__AxolotlType__9.SHIELD then

			end;
			v10 = l__ReplicatedStorage__8.Assets.Misc.AxolotlEaster.ShieldAxolotl:Clone();
		end;
	elseif v9 == l__AxolotlType__9.BREAK_SPEED then
		v10 = l__ReplicatedStorage__8.Assets.Misc.Axolotl.BreakSpeedAxolotl:Clone();
	elseif v9 == l__AxolotlType__9.DAMAGE then
		v10 = l__ReplicatedStorage__8.Assets.Misc.Axolotl.DamageAxolotl:Clone();
	elseif v9 == l__AxolotlType__9.HEALTH_REGEN then
		v10 = l__ReplicatedStorage__8.Assets.Misc.Axolotl.HealthRegenAxolotl:Clone();
	else
		if v9 == l__AxolotlType__9.SHIELD then

		end;
		v10 = l__ReplicatedStorage__8.Assets.Misc.Axolotl.ShieldAxolotl:Clone();
	end;
	for v11, v12 in ipairs((v10:GetDescendants())) do
		if v12:IsA("BasePart") then
			v12.CastShadow = false;
		end;
	end;
	u2("ObjectValue", {
		Name = "AxolotlData", 
		Value = p6, 
		Parent = v10
	});
	v10.Parent = p5.axolotlModelFolder;
	l__CollectionService__10:AddTag(v10, "axolotl_model");
	u20:GiveTask(function()
		v10:Destroy();
	end);
	local l__Animator__13 = v10.AnimationController.Animator;
	u20:GiveTask(function()
		v10:Destroy();
	end);
	for v14, v15 in ipairs((v10:GetDescendants())) do
		if v15:IsA("BasePart") then
			u20:GiveTask(v15.AncestryChanged:Connect(function(p9, p10)
				if p10 == nil then
					u20:DoCleaning();
				end;
			end));
		end;
	end;
	local v16 = l__AnimationType__11.AXOLOTL_IDLE;
	local v17 = l__AnimationType__11.AXOLOTL_SWIM;
	local v18 = l__AnimationType__11.AXOLOTL_ABILITY;
	if v7 == l__BedwarsKitSkin__7.AXOLOTL_REINDEER then
		v16 = l__AnimationType__11.AXOLOTL_REINDEER_IDLE;
		v17 = l__AnimationType__11.AXOLOTL_REINDEER_SWIM;
		v18 = l__AnimationType__11.AXOLOTL_REINDEER_ABILITY;
	elseif v7 == l__BedwarsKitSkin__7.AXOLOTL_EASTER_BUNNY then
		v16 = l__AnimationType__11.AXOLOTL_EASTER_IDLE;
		v17 = l__AnimationType__11.AXOLOTL_EASTER_SWIM;
		v18 = l__AnimationType__11.AXOLOTL_EASTER_ABILITY;
	end;
	local v19 = nil;
	local v20 = nil;
	local v21 = nil;
	if v16 then
		v19 = l__Animator__13:LoadAnimation(l__GameAnimationUtil__12.getAnimation(v16));
		v19.Priority = Enum.AnimationPriority.Movement;
	end;
	if v17 then
		v20 = l__Animator__13:LoadAnimation(l__GameAnimationUtil__12.getAnimation(v17));
		v20.Priority = Enum.AnimationPriority.Movement;
		v20:AdjustSpeed(2);
	end;
	if v18 then
		v21 = l__Animator__13:LoadAnimation(l__GameAnimationUtil__12.getAnimation(v18));
		v21.Priority = Enum.AnimationPriority.Action;
	end;
	local v22 = v10.PrimaryPart;
	if v22 ~= nil then
		v22 = v22.CFrame;
	end;
	local v23 = v22;
	if v23 == nil then
		v23 = CFrame.new();
	end;
	local v24 = "torso.001";
	if v7 == l__BedwarsKitSkin__7.AXOLOTL_EASTER_BUNNY then
		v24 = "egg";
	end;
	local u21 = 0;
	local u22 = p6:GetAttribute("AxolotlState");
	local u23 = v23;
	local u24 = u6.new();
	local u25 = 0;
	local function u26(p11)
		u21 = tick();
		u22 = p11;
		local v25 = v10.PrimaryPart;
		if v25 ~= nil then
			v25 = v25.CFrame;
		end;
		local v26 = v25;
		if v26 == nil then
			v26 = CFrame.new();
		end;
		u23 = v26;
		u24:DoCleaning();
		if p11 == l__AxolotlState__13.IDLE then
			if v19 then
				v19:Play();
				v19.TimePosition = math.random() * 5;
				u24:GiveTask(function()
					if v19 ~= nil then
						v19:Stop();
					end;
				end);
			end;
		elseif p11 == l__AxolotlState__13.SWIMMING_TO_ATTACHED then
			if v20 ~= nil then
				v20:Play();
			end;
			u24:GiveTask(function()
				if v20 ~= nil then
					v20:Stop();
				end;
			end);
		elseif p11 == l__AxolotlState__13.ACTIVE then
			if v21 ~= nil then
				v21:Play();
			end;
			if v19 ~= nil then
				v19:Play();
			end;
			if p6.AttachedTo.Value then
				v10.Beam.Attachment1 = p6.AttachedTo.Value.UpperTorso.BodyFrontAttachment;
				v10.Beam.Enabled = true;
				local u27 = true;
				u24:GiveTask(function()
					u27 = false;
					v10.Beam.Enabled = false;
				end);
				task.spawn(function()
					local v27 = 1;
					while u27 do
						local v28 = l__TweenService__14:Create(v10.Beam, TweenInfo.new(0.4 + 0.2 * math.random()), {
							CurveSize0 = -0.3 * v27, 
							CurveSize1 = 0.3 * v27
						});
						v28:Play();
						v28.Completed:Wait();
						v27 = v27 * -1;					
					end;
				end);
			end;
			u24:GiveTask(function()
				if v19 ~= nil then
					v19:Stop();
				end;
			end);
			local v29 = nil;
			for v30, v31 in ipairs((v10:GetDescendants())) do
				if v31.Name == v24 == true then
					v29 = v31;
					break;
				end;
			end;
			local v32 = "Shield!";
			if v9 == l__AxolotlType__9.DAMAGE then
				v32 = "Damage!";
			elseif v9 == l__AxolotlType__9.BREAK_SPEED then
				v32 = "Break Speed!";
			elseif v9 == l__AxolotlType__9.HEALTH_REGEN then
				v32 = "Health Regen!";
			end;
			local u28 = u2("TextLabel", {
				Parent = u2("BillboardGui", {
					Parent = v10.PrimaryPart, 
					Adornee = v29, 
					Size = UDim2.fromScale(5, 0.55), 
					LightInfluence = 0, 
					MaxDistance = 60, 
					StudsOffsetWorldSpace = Vector3.new(0, 2.2, 0)
				}), 
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				Font = Enum.Font.LuckiestGuy, 
				TextScaled = true, 
				Text = v32
			});
			task.spawn(function()
				wait(1.1);
				l__TweenService__14:Create(u28, TweenInfo.new(1), {
					TextTransparency = 1
				}):Play();
			end);
		end;
		if (p11 == l__AxolotlState__13.SWIMMING_TO_ATTACHED or p11 == l__AxolotlState__13.ACTIVE) and tick() - u25 > 1 then
			u25 = tick();
			local v33 = {};
			local v34 = v10.PrimaryPart;
			if v34 ~= nil then
				v34 = v34.Position;
			end;
			local v35 = v34;
			if v35 == nil then
				v35 = Vector3.new();
			end;
			v33.position = v35;
			v33.parent = v10.PrimaryPart;
			local v36 = l__SoundManager__15:playSound(l__GameSound__16.AXOLOTL_SWITCH_TARGETS, v33);
			if v36 then
				v36.Ended:Connect(function()
					v36:Destroy();
				end);
			end;
		end;
	end;
	u20:GiveTask(p6:GetAttributeChangedSignal("AxolotlState"):Connect(function()
		u26(p6:GetAttribute("AxolotlState"));
	end));
	u26(p6:GetAttribute("AxolotlState"));
	local u29 = p6.AttachedTo.Value;
	p6.AttachedTo.Changed:Connect(function()
		u29 = p6.AttachedTo.Value;
	end);
	local v37 = u2("Part", {
		Size = Vector3.new(0, 0, 0), 
		Transparency = 1, 
		CanCollide = false, 
		Anchored = true, 
		Parent = v10, 
		Children = { u2("Attachment", {
				Name = "Attachment"
			}) }
	});
	v10:WaitForChild("Beam");
	v10.Beam.Attachment0 = v37:FindFirstChild("Attachment");
	l__GameQueryUtil__17:setQueryIgnored(v37, true);
	local v38 = nil;
	for v39, v40 in ipairs((v10:GetDescendants())) do
		if v40.Name == v24 == true then
			v38 = v40;
			break;
		end;
	end;
	u20:GiveTask(l__RunService__18.RenderStepped:Connect(function(p12)
		local v41 = u29;
		if v41 ~= nil then
			v41 = v41.PrimaryPart;
		end;
		if v41 and v10.PrimaryPart then
			local v42 = nil;
			local v43 = nil;
			local v44 = p5:getAngleFromAxolotlType(v9) + tick() % 6 / 6 * (-2 * math.pi);
			v42 = u29.PrimaryPart.CFrame + Vector3.new(math.cos(v44) * 3.5, 0.1, math.sin(v44) * 3.5);
			v43 = tick() - u21;
			if u22 == l__AxolotlState__13.IDLE then
				v10:SetPrimaryPartCFrame((u23:Lerp(v42, math.clamp(v43 / 0.3, 0, 1))));
			elseif u22 == l__AxolotlState__13.SWIMMING_TO_ATTACHED then
				local v45 = u23:Lerp(v42, math.clamp(v43 / l__AxolotlKit__19.SWIM_TO_CHARACTER_TIME, 0, 1));
				if (v45.Position - v42.Position).Magnitude > 0.01 then
					v45 = CFrame.new(v45.Position, v42.Position);
				end;
				v10:SetPrimaryPartCFrame(v45);
			elseif u22 == l__AxolotlState__13.ACTIVE then
				v10:SetPrimaryPartCFrame((u23:Lerp(v42 + Vector3.new(0, 1.8, 0), math.clamp(v43 / 0.3, 0, 1))));
			end;
			v37.CFrame = v38.TransformedWorldCFrame;
		end;
	end));
	return v10;
end;
function v5.getAngleFromAxolotlType(p13, p14)
	local v46 = 0;
	if p14 == l__AxolotlType__9.SHIELD then
		return 0;
	end;
	if p14 == l__AxolotlType__9.DAMAGE then
		return 0.5 * math.pi;
	end;
	if p14 == l__AxolotlType__9.BREAK_SPEED then
		return math.pi;
	end;
	if p14 == l__AxolotlType__9.HEALTH_REGEN then
		v46 = 1.5 * math.pi;
	end;
	return v46;
end;
function v5.createClientOnlyAxolotlData(p15, p16, p17)
	local v47 = u2("ObjectValue", {
		Name = p16.Name .. "_Axolotl", 
		Parent = p15.axolotlDataFolder, 
		Children = { u2("ObjectValue", {
				Name = "AxolotlModel"
			}), u2("ObjectValue", {
				Name = "Owner", 
				Value = p16
			}), u2("ObjectValue", {
				Name = "AttachedTo", 
				Value = p16
			}) }
	});
	v47:SetAttribute("AxolotlState", l__AxolotlState__13.IDLE);
	v47:SetAttribute("RandomFloat", math.random());
	v47:SetAttribute("AxolotlType", p17);
	v47:SetAttribute("AxolotlLastActiveTime", 0);
	l__CollectionService__10:AddTag(v47, "axolotl_data");
	return v47;
end;
function v5.getAttachedAxolotls(p18, p19)
	local v48 = {};
	local v49 = 0;
	local v50, v51, v52 = ipairs((l__CollectionService__10:GetTagged("axolotl_data")));
	while true do
		local v53, v54 = v50(v51, v52);
		if not v53 then
			break;
		end;
		if v54.AttachedTo.Value == p19 == true then
			v49 = v49 + 1;
			v48[v49] = v54;
		end;	
	end;
	return v48;
end;
function v5.getOwnedAxolotls(p20, p21)
	local v55 = {};
	local v56 = 0;
	local v57, v58, v59 = ipairs((l__CollectionService__10:GetTagged("axolotl_data")));
	while true do
		local v60, v61 = v57(v58, v59);
		if not v60 then
			break;
		end;
		if v61.Owner.Value == p21 == true then
			v56 = v56 + 1;
			v55[v56] = v61;
		end;	
	end;
	return v55;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
