-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v2.Component:extend("PlayerViewport");
function v4.init(p1)
	p1.viewportRef = v2.createRef();
	p1.cameraRef = v2.createRef();
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Players__2 = v3.Players;
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
function v4.updateViewport(p2)
	local v5 = p2.viewportRef:getValue();
	if v5 == nil then
		return nil;
	end;
	local l__Kit__6 = v5:FindFirstChild("Kit");
	if l__Kit__6 ~= nil then
		l__Kit__6:Destroy();
	end;
	local v7 = l__Players__2.LocalPlayer;
	if v7 ~= nil then
		v7 = v7.Character;
	end;
	if v7 ~= nil then
		l__Players__2.LocalPlayer.Character:WaitForChild("HumanoidRootPart");
		l__Players__2.LocalPlayer.Character.Archivable = true;
		local v8 = l__Players__2.LocalPlayer.Character:Clone();
	else
		v8 = l__ReplicatedStorage__3.Assets.Effects.BeastActivated:Clone();
	end;
	if not v8 then
		return nil;
	end;
	local v9 = v8:GetDescendants();
	local function v10(p3)
		if p3:IsA("LocalScript") then
			p3:Destroy();
		end;
	end;
	for v11, v12 in ipairs(v9) do
		v10(v12, v11 - 1, v9);
	end;
	local l__Animation__13 = p2.props.Animation;
	if l__Animation__13 ~= "" and l__Animation__13 then
		v8.AncestryChanged:Connect(function(p4, p5)
			if p5 ~= nil and p5:IsDescendantOf(game) then
				local v14 = v8;
				if v14 ~= nil then
					v14 = v14:FindFirstChild("Humanoid");
					if v14 ~= nil then
						v14 = v14:FindFirstChild("Animator");
					end;
				end;
				local v15 = v14;
				if not v15 then
					local v16 = {};
					local v17 = v8;
					if v17 ~= nil then
						v17 = v17:FindFirstChild("Humanoid");
					end;
					v16.Parent = v17;
					v15 = u1("Animator", v16);
				end;
				local v18 = v15:LoadAnimation(u1("Animation", {
					AnimationId = p2.props.Animation
				}));
				if p2.props.AnimationSpeed ~= nil then
					v18:AdjustSpeed(p2.props.AnimationSpeed);
				end;
				v18.Looped = true;
				v18:Play();
			end;
		end);
	end;
	v8.Name = "Kit";
	v8.Parent = u1("WorldModel", {
		Name = "Kit", 
		Parent = v5
	});
	if v8.PrimaryPart then
		v8:SetPrimaryPartCFrame(CFrame.new() * CFrame.Angles(0, math.rad(-20), 0));
	else
		print("No primary part found when mounting kit model. Are your assets out of date?");
	end;
	local v19, v20 = v8:GetBoundingBox();
	local l__Position__21 = v19.Position;
	p2.cameraRef:getValue().CFrame = CFrame.new(l__Position__21 + Vector3.new(0, 0.8 * 50, (-1 * math.max(v20.X, v20.Y, v20.Z) / 1.3 - 3) * 50), l__Position__21);
	if p2.props.Rotate then
		p2:rotateKit(v8);
	end;
end;
local l__TweenService__4 = v3.TweenService;
function v4.rotateKit(p6, p7)
	if not p7.PrimaryPart then
		return nil;
	end;
	local v22 = TweenInfo.new(3, Enum.EasingStyle.Linear);
	local v23 = l__TweenService__4:Create(p7.PrimaryPart, v22, {
		CFrame = p7.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(120), 0)
	});
	local v24 = l__TweenService__4:Create(p7.PrimaryPart, v22, {
		CFrame = p7.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(240), 0)
	});
	local v25 = l__TweenService__4:Create(p7.PrimaryPart, v22, {
		CFrame = p7.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(360), 0)
	});
	v23:Play();
	v23.Completed:Connect(function()
		v24:Play();
	end);
	v24.Completed:Connect(function()
		v25:Play();
	end);
	v25.Completed:Connect(function()
		v23:Play();
	end);
end;
function v4.didMount(p8)
	local v26 = p8.viewportRef:getValue();
	v26.Ambient = Color3.fromRGB(162, 162, 162);
	v26.LightColor = Color3.fromRGB(255, 255, 255);
	v26.LightDirection = Vector3.new(0, -1, 0);
	v26.CurrentCamera = p8.cameraRef:getValue();
	task.spawn(function()
		p8:updateViewport();
	end);
end;
function v4.didUpdate(p9, p10)
	if p9.props.Animation ~= p10.Animation then
		task.spawn(function()
			p9:updateViewport();
		end);
	end;
end;
function v4.render(p11)
	local v27 = {};
	for v28, v29 in pairs(p11.props) do
		v27[v28] = v29;
	end;
	v27[v2.Children] = nil;
	v27.overridePreviewItems = nil;
	v27.Animation = nil;
	v27.AnimationSpeed = nil;
	v27.Rotate = nil;
	local v30 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v31 = p11.props.ImageTransparency;
	if v31 == nil then
		v31 = 0;
	end;
	v30.ImageTransparency = v31;
	v30[v2.Ref] = p11.viewportRef;
	for v32, v33 in pairs(v27) do
		v30[v32] = v33;
	end;
	local v34 = { v2.createElement("Camera", {
			FieldOfView = 1, 
			[v2.Ref] = p11.cameraRef
		}) };
	local v35 = #v34;
	local v36 = p11.props[v2.Children];
	if v36 then
		local v37, v38, v39 = pairs(v36);
		while true do
			local v40 = nil;
			local v41 = nil;
			v41, v40 = v37(v38, v39);
			if not v41 then
				break;
			end;
			v39 = v41;
			if type(v41) == "number" then
				v34[v35 + v41] = v40;
			else
				v34[v41] = v40;
			end;		
		end;
	end;
	return v2.createElement("ViewportFrame", v30, v34);
end;
return {
	PlayerViewport = v4
};
