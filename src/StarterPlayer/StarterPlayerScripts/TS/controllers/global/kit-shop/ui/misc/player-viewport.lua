-- Script Hash: fae1ed7fff1a6f035207131032baa540b540e5e0d304b8078716dedce26c38734cd54780d369dc2cb51c1016b691e5e7
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
	local v7 = l__Players__2.LocalPlayer;
	if v7 ~= nil then
		v7 = v7.Character;
	end;
	if v7 ~= nil then
		l__Players__2.LocalPlayer.Character:WaitForChild("HumanoidRootPart");
		l__Players__2.LocalPlayer.Character.Archivable = true;
		local v8 = l__Players__2.LocalPlayer.Character:Clone();
		local v9 = l__CollectionService__3:GetTags(v8);
		local function v10(p3)
			if v8 then
				l__CollectionService__3:RemoveTag(v8, p3);
			end;
		end;
		for v11, v12 in ipairs(v9) do
			v10(v12, v11 - 1, v9);
		end;
	else
		v8 = l__ReplicatedStorage__4.Assets.Effects.BeastActivated:Clone();
	end;
	if not v8 then
		return nil;
	end;
	local v13 = v8:GetDescendants();
	local function v14(p4)
		if p4:IsA("LocalScript") then
			p4:Destroy();
		end;
	end;
	for v15, v16 in ipairs(v13) do
		v14(v16, v15 - 1, v13);
	end;
	local l__Animation__17 = p2.props.Animation;
	if l__Animation__17 ~= "" and l__Animation__17 then
		v8.AncestryChanged:Connect(function(p5, p6)
			if p6 ~= nil and p6:IsDescendantOf(game) then
				local v18 = v8;
				if v18 ~= nil then
					v18 = v18:FindFirstChild("Humanoid");
					if v18 ~= nil then
						v18 = v18:FindFirstChild("Animator");
					end;
				end;
				local v19 = v18;
				if not v19 then
					local v20 = {};
					local v21 = v8;
					if v21 ~= nil then
						v21 = v21:FindFirstChild("Humanoid");
					end;
					v20.Parent = v21;
					v19 = u1("Animator", v20);
				end;
				local v22 = v19:LoadAnimation(u1("Animation", {
					AnimationId = p2.props.Animation
				}));
				if p2.props.AnimationSpeed ~= nil then
					v22:AdjustSpeed(p2.props.AnimationSpeed);
				end;
				v22.Looped = true;
				v22:Play();
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
	local v23, v24 = v8:GetBoundingBox();
	local l__Position__25 = v23.Position;
	p2.cameraRef:getValue().CFrame = CFrame.new(l__Position__25 + Vector3.new(0, 0.8 * 50, (-1 * math.max(v24.X, v24.Y, v24.Z) / 1.3 - 3) * 50), l__Position__25);
	if p2.props.Rotate then
		p2:rotateKit(v8);
	end;
end;
local l__TweenService__5 = v3.TweenService;
function v4.rotateKit(p7, p8)
	if not p8.PrimaryPart then
		return nil;
	end;
	local v26 = TweenInfo.new(3, Enum.EasingStyle.Linear);
	local v27 = l__TweenService__5:Create(p8.PrimaryPart, v26, {
		CFrame = p8.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(120), 0)
	});
	local v28 = l__TweenService__5:Create(p8.PrimaryPart, v26, {
		CFrame = p8.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(240), 0)
	});
	local v29 = l__TweenService__5:Create(p8.PrimaryPart, v26, {
		CFrame = p8.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(360), 0)
	});
	v27:Play();
	v27.Completed:Connect(function()
		v28:Play();
	end);
	v28.Completed:Connect(function()
		v29:Play();
	end);
	v29.Completed:Connect(function()
		v27:Play();
	end);
end;
function v4.didMount(p9)
	local v30 = p9.viewportRef:getValue();
	v30.Ambient = Color3.fromRGB(162, 162, 162);
	v30.LightColor = Color3.fromRGB(255, 255, 255);
	v30.LightDirection = Vector3.new(0, -1, 0);
	v30.CurrentCamera = p9.cameraRef:getValue();
	task.spawn(function()
		p9:updateViewport();
	end);
end;
function v4.didUpdate(p10, p11)
	if p10.props.Animation ~= p11.Animation then
		task.spawn(function()
			p10:updateViewport();
		end);
	end;
end;
function v4.render(p12)
	local v31 = {};
	for v32, v33 in pairs(p12.props) do
		v31[v32] = v33;
	end;
	v31[v2.Children] = nil;
	v31.PreviewItemTypes = nil;
	v31.PreviewAccesories = nil;
	v31.Animation = nil;
	v31.AnimationSpeed = nil;
	v31.Rotate = nil;
	local v34 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v35 = p12.props.ImageTransparency;
	if v35 == nil then
		v35 = 0;
	end;
	v34.ImageTransparency = v35;
	v34[v2.Ref] = p12.viewportRef;
	for v36, v37 in pairs(v31) do
		v34[v36] = v37;
	end;
	local v38 = { v2.createElement("Camera", {
			FieldOfView = 1, 
			[v2.Ref] = p12.cameraRef
		}) };
	local v39 = #v38;
	local v40 = p12.props[v2.Children];
	if v40 then
		local v41, v42, v43 = pairs(v40);
		while true do
			local v44 = nil;
			local v45 = nil;
			v45, v44 = v41(v42, v43);
			if not v45 then
				break;
			end;
			v43 = v45;
			if type(v45) == "number" then
				v38[v39 + v45] = v44;
			else
				v38[v45] = v44;
			end;		
		end;
	end;
	return v2.createElement("ViewportFrame", v34, v38);
end;
return {
	PlayerViewport = v4
};
