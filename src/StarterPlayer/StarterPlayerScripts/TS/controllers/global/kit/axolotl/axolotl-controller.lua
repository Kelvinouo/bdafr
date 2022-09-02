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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v3.Workspace;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "AxolotlController";
	p1.axolotlModelFolder = u1("Folder", {
		Name = "AxolotlModel", 
		Parent = l__Workspace__2
	});
end;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__CollectionTagAdded__4 = v2.CollectionTagAdded;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	if l__PlaceUtil__3.isGameServer() then
		p2.axolotlDataFolder = l__Workspace__2:WaitForChild("AxolotlData");
	else
		p2.axolotlDataFolder = u1("Folder", {
			Name = "AxolotlData", 
			Parent = l__Workspace__2
		});
	end;
	l__CollectionTagAdded__4("axolotl_data", function(p3)
		p2:createAxolotlModel(p3);
	end);
	l__CollectionTagAdded__4("axolotl_model", function(p4)

	end);
end;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__BedwarsKitSkin__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ReplicatedStorage__7 = v3.ReplicatedStorage;
local l__AxolotlType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-type").AxolotlType;
local l__CollectionService__9 = v3.CollectionService;
local l__AnimationType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AxolotlState__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-state").AxolotlState;
local l__TweenService__13 = v3.TweenService;
local l__SoundManager__14 = v2.SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__16 = v2.GameQueryUtil;
local l__RunService__17 = v3.RunService;
local l__AxolotlKit__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "axolotl", "axolotl-kit").AxolotlKit;
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
	local u19 = u5.new();
	p6.AncestryChanged:Connect(function(p7, p8)
		if p8 == nil then
			u19:DoCleaning();
		end;
	end);
	if v7 == l__BedwarsKitSkin__6.AXOLOTL_REINDEER then
		local v10 = l__ReplicatedStorage__7.Assets.Misc.Axolotl.ReindeerAxolotl:Clone();
	elseif v7 == l__BedwarsKitSkin__6.AXOLOTL_EASTER_BUNNY then
		if v9 == l__AxolotlType__8.BREAK_SPEED then
			v10 = l__ReplicatedStorage__7.Assets.Misc.AxolotlEaster.BreakSpeedAxolotl:Clone();
		elseif v9 == l__AxolotlType__8.DAMAGE then
			v10 = l__ReplicatedStorage__7.Assets.Misc.AxolotlEaster.DamageAxolotl:Clone();
		elseif v9 == l__AxolotlType__8.HEALTH_REGEN then
			v10 = l__ReplicatedStorage__7.Assets.Misc.AxolotlEaster.HealthRegenAxolotl:Clone();
		else
			if v9 == l__AxolotlType__8.SHIELD then

			end;
			v10 = l__ReplicatedStorage__7.Assets.Misc.AxolotlEaster.ShieldAxolotl:Clone();
		end;
	elseif v9 == l__AxolotlType__8.BREAK_SPEED then
		v10 = l__ReplicatedStorage__7.Assets.Misc.Axolotl.BreakSpeedAxolotl:Clone();
	elseif v9 == l__AxolotlType__8.DAMAGE then
		v10 = l__ReplicatedStorage__7.Assets.Misc.Axolotl.DamageAxolotl:Clone();
	elseif v9 == l__AxolotlType__8.HEALTH_REGEN then
		v10 = l__ReplicatedStorage__7.Assets.Misc.Axolotl.HealthRegenAxolotl:Clone();
	else
		if v9 == l__AxolotlType__8.SHIELD then

		end;
		v10 = l__ReplicatedStorage__7.Assets.Misc.Axolotl.ShieldAxolotl:Clone();
	end;
	local v11, v12, v13 = ipairs((v10:GetDescendants()));
	while true do
		v11(v12, v13);
		if not v11 then
			break;
		end;
		v13 = v11;
		if v12:IsA("BasePart") then
			v12.CastShadow = false;
		end;	
	end;
	u1("ObjectValue", {
		Name = "AxolotlData", 
		Value = p6, 
		Parent = v10
	});
	v10.Parent = p5.axolotlModelFolder;
	l__CollectionService__9:AddTag(v10, "axolotl_model");
	u19:GiveTask(function()
		v10:Destroy();
	end);
	local l__Animator__14 = v10.AnimationController.Animator;
	u19:GiveTask(function()
		v10:Destroy();
	end);
	local v15, v16, v17 = ipairs((v10:GetDescendants()));
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		if v16:IsA("BasePart") then
			u19:GiveTask(v16.AncestryChanged:Connect(function(p9, p10)
				if p10 == nil then
					u19:DoCleaning();
				end;
			end));
		end;	
	end;
	local v18 = l__AnimationType__10.AXOLOTL_IDLE;
	local v19 = l__AnimationType__10.AXOLOTL_SWIM;
	local v20 = l__AnimationType__10.AXOLOTL_ABILITY;
	if v7 == l__BedwarsKitSkin__6.AXOLOTL_REINDEER then
		v18 = l__AnimationType__10.AXOLOTL_REINDEER_IDLE;
		v19 = l__AnimationType__10.AXOLOTL_REINDEER_SWIM;
		v20 = l__AnimationType__10.AXOLOTL_REINDEER_ABILITY;
	elseif v7 == l__BedwarsKitSkin__6.AXOLOTL_EASTER_BUNNY then
		v18 = l__AnimationType__10.AXOLOTL_EASTER_IDLE;
		v19 = l__AnimationType__10.AXOLOTL_EASTER_SWIM;
		v20 = l__AnimationType__10.AXOLOTL_EASTER_ABILITY;
	end;
	local v21 = nil;
	local v22 = nil;
	local v23 = nil;
	if v18 then
		v21 = l__Animator__14:LoadAnimation(l__GameAnimationUtil__11.getAnimation(v18));
		v21.Priority = Enum.AnimationPriority.Movement;
	end;
	if v19 then
		v22 = l__Animator__14:LoadAnimation(l__GameAnimationUtil__11.getAnimation(v19));
		v22.Priority = Enum.AnimationPriority.Movement;
		v22:AdjustSpeed(2);
	end;
	if v20 then
		v23 = l__Animator__14:LoadAnimation(l__GameAnimationUtil__11.getAnimation(v20));
		v23.Priority = Enum.AnimationPriority.Action;
	end;
	local v24 = v10.PrimaryPart;
	if v24 ~= nil then
		v24 = v24.CFrame;
	end;
	local v25 = v24;
	if v25 == nil then
		v25 = CFrame.new();
	end;
	local v26 = "torso.001";
	if v7 == l__BedwarsKitSkin__6.AXOLOTL_EASTER_BUNNY then
		v26 = "egg";
	end;
	local u20 = 0;
	local u21 = p6:GetAttribute("AxolotlState");
	local u22 = v25;
	local u23 = u5.new();
	local u24 = 0;
	local function u25(p11)
		u20 = tick();
		u21 = p11;
		local v27 = v10.PrimaryPart;
		if v27 ~= nil then
			v27 = v27.CFrame;
		end;
		local v28 = v27;
		if v28 == nil then
			v28 = CFrame.new();
		end;
		u22 = v28;
		u23:DoCleaning();
		if p11 == l__AxolotlState__12.IDLE then
			if v21 then
				v21:Play();
				v21.TimePosition = math.random() * 5;
				u23:GiveTask(function()
					if v21 ~= nil then
						v21:Stop();
					end;
				end);
			end;
		elseif p11 == l__AxolotlState__12.SWIMMING_TO_ATTACHED then
			if v22 ~= nil then
				v22:Play();
			end;
			u23:GiveTask(function()
				if v22 ~= nil then
					v22:Stop();
				end;
			end);
		elseif p11 == l__AxolotlState__12.ACTIVE then
			if v23 ~= nil then
				v23:Play();
			end;
			if v21 ~= nil then
				v21:Play();
			end;
			if p6.AttachedTo.Value then
				v10.Beam.Attachment1 = p6.AttachedTo.Value.UpperTorso.BodyFrontAttachment;
				v10.Beam.Enabled = true;
				local u26 = true;
				u23:GiveTask(function()
					u26 = false;
					v10.Beam.Enabled = false;
				end);
				task.spawn(function()
					local v29 = 1;
					while u26 do
						local v30 = l__TweenService__13:Create(v10.Beam, TweenInfo.new(0.4 + 0.2 * math.random()), {
							CurveSize0 = -0.3 * v29, 
							CurveSize1 = 0.3 * v29
						});
						v30:Play();
						v30.Completed:Wait();
						v29 = v29 * -1;					
					end;
				end);
			end;
			u23:GiveTask(function()
				if v21 ~= nil then
					v21:Stop();
				end;
			end);
			local v31 = nil;
			local v32, v33, v34 = ipairs((v10:GetDescendants()));
			while true do
				v32(v33, v34);
				if not v32 then
					break;
				end;
				v34 = v32;
				if v33.Name == v26 == true then
					v31 = v33;
					break;
				end;			
			end;
			local v35 = "Shield!";
			if v9 == l__AxolotlType__8.DAMAGE then
				v35 = "Damage!";
			elseif v9 == l__AxolotlType__8.BREAK_SPEED then
				v35 = "Break Speed!";
			elseif v9 == l__AxolotlType__8.HEALTH_REGEN then
				v35 = "Health Regen!";
			end;
			local u27 = u1("TextLabel", {
				Parent = u1("BillboardGui", {
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
				Text = v35
			});
			task.spawn(function()
				wait(1.1);
				l__TweenService__13:Create(u27, TweenInfo.new(1), {
					TextTransparency = 1
				}):Play();
			end);
		end;
		if (p11 == l__AxolotlState__12.SWIMMING_TO_ATTACHED or p11 == l__AxolotlState__12.ACTIVE) and tick() - u24 > 1 then
			u24 = tick();
			local v36 = {};
			local v37 = v10.PrimaryPart;
			if v37 ~= nil then
				v37 = v37.Position;
			end;
			local v38 = v37;
			if v38 == nil then
				v38 = Vector3.new();
			end;
			v36.position = v38;
			v36.parent = v10.PrimaryPart;
			local v39 = l__SoundManager__14:playSound(l__GameSound__15.AXOLOTL_SWITCH_TARGETS, v36);
			if v39 then
				v39.Ended:Connect(function()
					v39:Destroy();
				end);
			end;
		end;
	end;
	u19:GiveTask(p6:GetAttributeChangedSignal("AxolotlState"):Connect(function()
		u25(p6:GetAttribute("AxolotlState"));
	end));
	u25(p6:GetAttribute("AxolotlState"));
	local u28 = p6.AttachedTo.Value;
	p6.AttachedTo.Changed:Connect(function()
		u28 = p6.AttachedTo.Value;
	end);
	local v40 = u1("Part", {
		Size = Vector3.new(0, 0, 0), 
		Transparency = 1, 
		CanCollide = false, 
		Anchored = true, 
		Parent = v10, 
		Children = { u1("Attachment", {
				Name = "Attachment"
			}) }
	});
	v10:WaitForChild("Beam");
	v10.Beam.Attachment0 = v40:FindFirstChild("Attachment");
	l__GameQueryUtil__16:setQueryIgnored(v40, true);
	local v41 = nil;
	local v42, v43, v44 = ipairs((v10:GetDescendants()));
	while true do
		v42(v43, v44);
		if not v42 then
			break;
		end;
		v44 = v42;
		if v43.Name == v26 == true then
			v41 = v43;
			break;
		end;	
	end;
	u19:GiveTask(l__RunService__17.RenderStepped:Connect(function(p12)
		local v45 = u28;
		if v45 ~= nil then
			v45 = v45.PrimaryPart;
		end;
		if v45 and v10.PrimaryPart then
			local v46 = nil;
			local v47 = nil;
			local v48 = p5:getAngleFromAxolotlType(v9) + tick() % 6 / 6 * (-2 * math.pi);
			v46 = u28.PrimaryPart.CFrame + Vector3.new(math.cos(v48) * 3.5, 0.1, math.sin(v48) * 3.5);
			v47 = tick() - u20;
			if u21 == l__AxolotlState__12.IDLE then
				v10:SetPrimaryPartCFrame((u22:Lerp(v46, math.clamp(v47 / 0.3, 0, 1))));
			elseif u21 == l__AxolotlState__12.SWIMMING_TO_ATTACHED then
				local v49 = u22:Lerp(v46, math.clamp(v47 / l__AxolotlKit__18.SWIM_TO_CHARACTER_TIME, 0, 1));
				if (v49.Position - v46.Position).Magnitude > 0.01 then
					v49 = CFrame.new(v49.Position, v46.Position);
				end;
				v10:SetPrimaryPartCFrame(v49);
			elseif u21 == l__AxolotlState__12.ACTIVE then
				v10:SetPrimaryPartCFrame((u22:Lerp(v46 + Vector3.new(0, 1.8, 0), math.clamp(v47 / 0.3, 0, 1))));
			end;
			v40.CFrame = v41.TransformedWorldCFrame;
		end;
	end));
	return v10;
end;
function v5.getAngleFromAxolotlType(p13, p14)
	local v50 = 0;
	if p14 == l__AxolotlType__8.SHIELD then
		return 0;
	end;
	if p14 == l__AxolotlType__8.DAMAGE then
		return 0.5 * math.pi;
	end;
	if p14 == l__AxolotlType__8.BREAK_SPEED then
		return math.pi;
	end;
	if p14 == l__AxolotlType__8.HEALTH_REGEN then
		v50 = 1.5 * math.pi;
	end;
	return v50;
end;
function v5.createClientOnlyAxolotlData(p15, p16, p17)
	local v51 = u1("ObjectValue", {
		Name = p16.Name .. "_Axolotl", 
		Parent = p15.axolotlDataFolder, 
		Children = { u1("ObjectValue", {
				Name = "AxolotlModel"
			}), u1("ObjectValue", {
				Name = "Owner", 
				Value = p16
			}), u1("ObjectValue", {
				Name = "AttachedTo", 
				Value = p16
			}) }
	});
	v51:SetAttribute("AxolotlState", l__AxolotlState__12.IDLE);
	v51:SetAttribute("RandomFloat", math.random());
	v51:SetAttribute("AxolotlType", p17);
	v51:SetAttribute("AxolotlLastActiveTime", 0);
	l__CollectionService__9:AddTag(v51, "axolotl_data");
	return v51;
end;
function v5.getAttachedAxolotls(p18, p19)
	local v52 = {};
	local v53 = 0;
	local v54, v55, v56 = ipairs((l__CollectionService__9:GetTagged("axolotl_data")));
	while true do
		v54(v55, v56);
		if not v54 then
			break;
		end;
		if v55.AttachedTo.Value == p19 == true then
			v53 = v53 + 1;
			v52[v53] = v55;
		end;	
	end;
	return v52;
end;
function v5.getOwnedAxolotls(p20, p21)
	local v57 = {};
	local v58 = 0;
	local v59, v60, v61 = ipairs((l__CollectionService__9:GetTagged("axolotl_data")));
	while true do
		v59(v60, v61);
		if not v59 then
			break;
		end;
		if v60.Owner.Value == p21 == true then
			v58 = v58 + 1;
			v57[v58] = v60;
		end;	
	end;
	return v57;
end;
local v62 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
