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
local l__CollectionService__3 = v3.CollectionService;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
function v4.updateViewport(p2)
	local v5 = p2.viewportRef:getValue();
	if v5 == nil then
		return nil;
	end;
	local l__Kit__6 = v5:FindFirstChild("Kit");
	if l__Kit__6 ~= nil then
		l__Kit__6:Destroy();
	end;
	local v7 = u1("WorldModel", {
		Name = "Kit", 
		Parent = v5
	});
	local v8 = l__Players__2.LocalPlayer;
	if v8 ~= nil then
		v8 = v8.Character;
	end;
	if v8 ~= nil then
		l__Players__2.LocalPlayer.Character:WaitForChild("HumanoidRootPart");
		l__Players__2.LocalPlayer.Character.Archivable = true;
		local v9 = l__Players__2.LocalPlayer.Character:Clone();
		local v10, v11, v12 = ipairs((l__CollectionService__3:GetTags(v9)));
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			v12 = v10;
			if v9 then
				l__CollectionService__3:RemoveTag(v9, v11);
			end;		
		end;
	else
		v9 = l__ReplicatedStorage__4.Assets.Effects.BeastActivated:Clone();
	end;
	if not v9 then
		return nil;
	end;
	local v13, v14, v15 = ipairs((v9:GetDescendants()));
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		if v14:IsA("LocalScript") then
			v14:Destroy();
		end;	
	end;
	local l__Animation__16 = p2.props.Animation;
	if l__Animation__16 ~= "" and l__Animation__16 then
		v9.AncestryChanged:Connect(function(p3, p4)
			if p4 ~= nil and p4:IsDescendantOf(game) then
				local v17 = v9;
				if v17 ~= nil then
					v17 = v17:FindFirstChild("Humanoid");
					if v17 ~= nil then
						v17 = v17:FindFirstChild("Animator");
					end;
				end;
				local v18 = v17;
				if not v18 then
					local v19 = {};
					local v20 = v9;
					if v20 ~= nil then
						v20 = v20:FindFirstChild("Humanoid");
					end;
					v19.Parent = v20;
					v18 = u1("Animator", v19);
				end;
				local v21 = v18:LoadAnimation(u1("Animation", {
					AnimationId = p2.props.Animation
				}));
				if p2.props.AnimationSpeed ~= nil then
					v21:AdjustSpeed(p2.props.AnimationSpeed);
				end;
				v21.Looped = true;
				v21:Play();
			end;
		end);
	end;
	v9.Name = "Kit";
	v9.Parent = v7;
	if v9.PrimaryPart then
		v9:SetPrimaryPartCFrame(CFrame.new() * CFrame.Angles(0, -0.3490658503988659, 0));
	else
		print("No primary part found when mounting kit model. Are your assets out of date?");
	end;
	local v22, v23 = v9:GetBoundingBox();
	local l__Position__24 = v22.Position;
	p2.cameraRef:getValue().CFrame = CFrame.new(l__Position__24 + Vector3.new(0, 0.8 * 50, (-1 * math.max(v23.X, v23.Y, v23.Z) / 1.3 - 3) * 50), l__Position__24);
	if p2.props.Rotate then
		p2:rotateKit(v9);
	end;
end;
local l__TweenService__5 = v3.TweenService;
function v4.rotateKit(p5, p6)
	if not p6.PrimaryPart then
		return nil;
	end;
	local v25 = TweenInfo.new(3, Enum.EasingStyle.Linear);
	local v26 = l__TweenService__5:Create(p6.PrimaryPart, v25, {
		CFrame = p6.PrimaryPart.CFrame * CFrame.Angles(0, 2.0943951023931953, 0)
	});
	local v27 = l__TweenService__5:Create(p6.PrimaryPart, v25, {
		CFrame = p6.PrimaryPart.CFrame * CFrame.Angles(0, 4.1887902047863905, 0)
	});
	local v28 = l__TweenService__5:Create(p6.PrimaryPart, v25, {
		CFrame = p6.PrimaryPart.CFrame * CFrame.Angles(0, 6.283185307179586, 0)
	});
	v26:Play();
	v26.Completed:Connect(function()
		v27:Play();
	end);
	v27.Completed:Connect(function()
		v28:Play();
	end);
	v28.Completed:Connect(function()
		v26:Play();
	end);
end;
function v4.didMount(p7)
	local v29 = p7.viewportRef:getValue();
	v29.Ambient = Color3.fromRGB(162, 162, 162);
	v29.LightColor = Color3.fromRGB(255, 255, 255);
	v29.LightDirection = Vector3.new(0, -1, 0);
	v29.CurrentCamera = p7.cameraRef:getValue();
	task.spawn(function()
		p7:updateViewport();
	end);
end;
function v4.didUpdate(p8, p9)
	if p8.props.Animation ~= p9.Animation then
		task.spawn(function()
			p8:updateViewport();
		end);
	end;
end;
function v4.render(p10)
	local v30 = {};
	for v31, v32 in pairs(p10.props) do
		v30[v31] = v32;
	end;
	v30[v2.Children] = nil;
	v30.PreviewItemTypes = nil;
	v30.PreviewAccesories = nil;
	v30.Animation = nil;
	v30.AnimationSpeed = nil;
	v30.Rotate = nil;
	local v33 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v34 = p10.props.ImageTransparency;
	if v34 == nil then
		v34 = 0;
	end;
	v33.ImageTransparency = v34;
	v33[v2.Ref] = p10.viewportRef;
	for v35, v36 in pairs(v30) do
		v33[v35] = v36;
	end;
	local v37 = { v2.createElement("Camera", {
			FieldOfView = 1, 
			[v2.Ref] = p10.cameraRef
		}) };
	local v38 = #v37;
	local v39 = p10.props[v2.Children];
	if v39 then
		local v40, v41, v42 = pairs(v39);
		while true do
			local v43 = nil;
			local v44 = nil;
			v44, v43 = v40(v41, v42);
			if not v44 then
				break;
			end;
			v42 = v44;
			if type(v44) == "number" then
				v37[v38 + v44] = v43;
			else
				v37[v44] = v43;
			end;		
		end;
	end;
	return v2.createElement("ViewportFrame", v33, v37);
end;
return {
	PlayerViewport = v4
};
