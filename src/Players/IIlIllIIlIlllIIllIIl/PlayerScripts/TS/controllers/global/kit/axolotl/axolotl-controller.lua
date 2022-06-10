-- Script Hash: cd3ab4d0ae8b20111412f1abadba0fa14dc712e1a00adc69f5effd16d429b66bcd5809bb7fe052ee5cdafaffccc5612d
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
	print("axolotl kit skin:", v7);
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
	local l__Animator__11 = v10.AnimationController.Animator;
	u20:GiveTask(function()
		v10:Destroy();
	end);
	local v12 = v10:GetDescendants();
	local function v13(p9)
		if p9:IsA("BasePart") then
			u20:GiveTask(p9.AncestryChanged:Connect(function(p10, p11)
				if p11 == nil then
					u20:DoCleaning();
				end;
			end));
		end;
	end;
	for v14, v15 in ipairs(v12) do
		v13(v15, v14 - 1, v12);
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
		v19 = l__Animator__11:LoadAnimation(l__GameAnimationUtil__12.getAnimation(v16));
		v19.Priority = Enum.AnimationPriority.Movement;
	end;
	if v17 then
		v20 = l__Animator__11:LoadAnimation(l__GameAnimationUtil__12.getAnimation(v17));
		v20.Priority = Enum.AnimationPriority.Movement;
		v20:AdjustSpeed(2);
	end;
	if v18 then
		v21 = l__Animator__11:LoadAnimation(l__GameAnimationUtil__12.getAnimation(v18));
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
	local function u26(p12)
		u21 = tick();
		u22 = p12;
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
		if p12 == l__AxolotlState__13.IDLE then
			if v19 then
				v19:Play();
				v19.TimePosition = math.random() * 5;
				u24:GiveTask(function()
					if v19 ~= nil then
						v19:Stop();
					end;
				end);
			end;
		elseif p12 == l__AxolotlState__13.SWIMMING_TO_ATTACHED then
			if v20 ~= nil then
				v20:Play();
			end;
			u24:GiveTask(function()
				if v20 ~= nil then
					v20:Stop();
				end;
			end);
		elseif p12 == l__AxolotlState__13.ACTIVE then
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
			local v29 = v10:GetDescendants();
			local function v30(p13)
				return p13.Name == v24;
			end;
			local v31 = nil;
			for v32, v33 in ipairs(v29) do
				if v30(v33, v32 - 1, v29) == true then
					v31 = v33;
					break;
				end;
			end;
			local v34 = "Shield!";
			if v9 == l__AxolotlType__9.DAMAGE then
				v34 = "Damage!";
			elseif v9 == l__AxolotlType__9.BREAK_SPEED then
				v34 = "Break Speed!";
			elseif v9 == l__AxolotlType__9.HEALTH_REGEN then
				v34 = "Health Regen!";
			end;
			local u28 = u2("TextLabel", {
				Parent = u2("BillboardGui", {
					Parent = v10.PrimaryPart, 
					Adornee = v31, 
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
				Text = v34
			});
			task.spawn(function()
				wait(1.1);
				l__TweenService__14:Create(u28, TweenInfo.new(1), {
					TextTransparency = 1
				}):Play();
			end);
		end;
		if (p12 == l__AxolotlState__13.SWIMMING_TO_ATTACHED or p12 == l__AxolotlState__13.ACTIVE) and tick() - u25 > 1 then
			u25 = tick();
			local v35 = {};
			local v36 = v10.PrimaryPart;
			if v36 ~= nil then
				v36 = v36.Position;
			end;
			local v37 = v36;
			if v37 == nil then
				v37 = Vector3.new();
			end;
			v35.position = v37;
			v35.parent = v10.PrimaryPart;
			local v38 = l__SoundManager__15:playSound(l__GameSound__16.AXOLOTL_SWITCH_TARGETS, v35);
			if v38 then
				v38.Ended:Connect(function()
					v38:Destroy();
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
	local v39 = u2("Part", {
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
	v10.Beam.Attachment0 = v39:FindFirstChild("Attachment");
	l__GameQueryUtil__17:setQueryIgnored(v39, true);
	local v40 = v10:GetDescendants();
	local function v41(p14)
		return p14.Name == v24;
	end;
	local v42 = nil;
	for v43, v44 in ipairs(v40) do
		if v41(v44, v43 - 1, v40) == true then
			v42 = v44;
			break;
		end;
	end;
	u20:GiveTask(l__RunService__18.RenderStepped:Connect(function(p15)
		local v45 = u29;
		if v45 ~= nil then
			v45 = v45.PrimaryPart;
		end;
		if v45 and v10.PrimaryPart then
			local v46 = nil;
			local v47 = nil;
			local v48 = p5:getAngleFromAxolotlType(v9) + tick() % 6 / 6 * (-2 * math.pi);
			v46 = u29.PrimaryPart.CFrame + Vector3.new(math.cos(v48) * 3.5, 0.1, math.sin(v48) * 3.5);
			v47 = tick() - u21;
			if u22 == l__AxolotlState__13.IDLE then
				v10:SetPrimaryPartCFrame((u23:Lerp(v46, math.clamp(v47 / 0.3, 0, 1))));
			elseif u22 == l__AxolotlState__13.SWIMMING_TO_ATTACHED then
				local v49 = u23:Lerp(v46, math.clamp(v47 / l__AxolotlKit__19.SWIM_TO_CHARACTER_TIME, 0, 1));
				if (v49.Position - v46.Position).Magnitude > 0.01 then
					v49 = CFrame.new(v49.Position, v46.Position);
				end;
				v10:SetPrimaryPartCFrame(v49);
			elseif u22 == l__AxolotlState__13.ACTIVE then
				v10:SetPrimaryPartCFrame((u23:Lerp(v46 + Vector3.new(0, 1.8, 0), math.clamp(v47 / 0.3, 0, 1))));
			end;
			v39.CFrame = v42.TransformedWorldCFrame;
		end;
	end));
	return v10;
end;
function v5.getAngleFromAxolotlType(p16, p17)
	local v50 = 0;
	if p17 == l__AxolotlType__9.SHIELD then
		return 0;
	end;
	if p17 == l__AxolotlType__9.DAMAGE then
		return 0.5 * math.pi;
	end;
	if p17 == l__AxolotlType__9.BREAK_SPEED then
		return math.pi;
	end;
	if p17 == l__AxolotlType__9.HEALTH_REGEN then
		v50 = 1.5 * math.pi;
	end;
	return v50;
end;
function v5.createClientOnlyAxolotlData(p18, p19, p20)
	local v51 = u2("ObjectValue", {
		Name = p19.Name .. "_Axolotl", 
		Parent = p18.axolotlDataFolder, 
		Children = { u2("ObjectValue", {
				Name = "AxolotlModel"
			}), u2("ObjectValue", {
				Name = "Owner", 
				Value = p19
			}), u2("ObjectValue", {
				Name = "AttachedTo", 
				Value = p19
			}) }
	});
	v51:SetAttribute("AxolotlState", l__AxolotlState__13.IDLE);
	v51:SetAttribute("RandomFloat", math.random());
	v51:SetAttribute("AxolotlType", p20);
	v51:SetAttribute("AxolotlLastActiveTime", 0);
	l__CollectionService__10:AddTag(v51, "axolotl_data");
	return v51;
end;
function v5.getAttachedAxolotls(p21, p22)
	local v52 = l__CollectionService__10:GetTagged("axolotl_data");
	local function v53(p23)
		return p23.AttachedTo.Value == p22;
	end;
	local v54 = {};
	local v55 = 0;
	for v56, v57 in ipairs(v52) do
		if v53(v57, v56 - 1, v52) == true then
			v55 = v55 + 1;
			v54[v55] = v57;
		end;
	end;
	return v54;
end;
function v5.getOwnedAxolotls(p24, p25)
	local v58 = l__CollectionService__10:GetTagged("axolotl_data");
	local function v59(p26)
		return p26.Owner.Value == p25;
	end;
	local v60 = {};
	local v61 = 0;
	for v62, v63 in ipairs(v58) do
		if v59(v63, v62 - 1, v58) == true then
			v61 = v61 + 1;
			v60[v61] = v63;
		end;
	end;
	return v60;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
