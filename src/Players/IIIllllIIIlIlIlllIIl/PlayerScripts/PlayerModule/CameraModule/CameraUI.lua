-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local v2 = l__Players__1.LocalPlayer;
if not v2 then
	l__Players__1:GetPropertyChangedSignal("LocalPlayer"):Wait();
	v2 = l__Players__1.LocalPlayer;
end;
local u1 = false;
local u2 = nil;
local function u3(p1)
	return function(p2)
		local v3 = Instance.new(p1);
		p2.Parent = nil;
		local v4, v5, v6 = pairs(p2);
		while true do
			local v7 = nil;
			local v8 = nil;
			v8, v7 = v4(v5, v6);
			if not v8 then
				break;
			end;
			v6 = v8;
			if type(v8) == "string" then
				v3[v8] = v7;
			else
				v7.Parent = v3;
			end;		
		end;
		v3.Parent = p2.Parent;
		return v3;
	end;
end;
local u4 = UDim2.new(0, 80, 0, 58);
local u5 = Color3.fromRGB(32, 32, 32);
local u6 = Color3.fromRGB(200, 200, 200);
local u7 = (function(p3, p4)
	local v9 = p3:FindFirstChildOfClass(p4);
	while not v9 or v9.ClassName ~= p4 do
		v9 = p3.ChildAdded:Wait();	
	end;
	return v9;
end)(v2, "PlayerGui");
local u8 = nil;
local u9 = nil;
local u10 = nil;
local u11 = nil;
local v10 = {};
local function u12()
	assert(not u1);
	u2 = u3("ScreenGui")({
		Name = "RbxCameraUI", 
		AutoLocalize = false, 
		Enabled = true, 
		DisplayOrder = -1, 
		IgnoreGuiInset = false, 
		ResetOnSpawn = false, 
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
		Parent = u7,
		(u3("ImageLabel")({
			Name = "Toast", 
			Visible = false, 
			AnchorPoint = Vector2.new(0.5, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Position = UDim2.new(0.5, 0, 0, 8), 
			Size = u4, 
			Image = "rbxasset://textures/ui/Camera/CameraToast9Slice.png", 
			ImageColor3 = u5, 
			ImageRectSize = Vector2.new(6, 6), 
			ImageTransparency = 1, 
			ScaleType = Enum.ScaleType.Slice, 
			SliceCenter = Rect.new(3, 3, 3, 3), 
			ClipsDescendants = true,
			u3("Frame")({
				Name = "IconBuffer", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Position = UDim2.new(0, 0, 0, 0), 
				Size = UDim2.new(0, 80, 1, 0),
				u3("ImageLabel")({
					Name = "Icon", 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1, 
					Position = UDim2.new(0.5, 0, 0.5, 0), 
					Size = UDim2.new(0, 48, 0, 48), 
					ZIndex = 2, 
					Image = "rbxasset://textures/ui/Camera/CameraToastIcon.png", 
					ImageColor3 = u6, 
					ImageTransparency = 1
				})
			}), u3("Frame")({
				Name = "TextBuffer", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Position = UDim2.new(0, 80, 0, 0), 
				Size = UDim2.new(1, -80, 1, 0), 
				ClipsDescendants = true,
				u3("TextLabel")({
					Name = "Upper", 
					AnchorPoint = Vector2.new(0, 1), 
					BackgroundTransparency = 1, 
					Position = UDim2.new(0, 0, 0.5, 0), 
					Size = UDim2.new(1, 0, 0, 19), 
					Font = Enum.Font.GothamMedium, 
					Text = "Camera control enabled", 
					TextColor3 = u6, 
					TextTransparency = 1, 
					TextSize = 19, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextYAlignment = Enum.TextYAlignment.Center
				}), u3("TextLabel")({
					Name = "Lower", 
					AnchorPoint = Vector2.new(0, 0), 
					BackgroundTransparency = 1, 
					Position = UDim2.new(0, 0, 0.5, 3), 
					Size = UDim2.new(1, 0, 0, 15), 
					Font = Enum.Font.Gotham, 
					Text = "Right mouse button to toggle", 
					TextColor3 = u6, 
					TextTransparency = 1, 
					TextSize = 15, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextYAlignment = Enum.TextYAlignment.Center
				})
			})
		}))
	});
	u8 = u2.Toast;
	u9 = u8.IconBuffer.Icon;
	u10 = u8.TextBuffer.Upper;
	u11 = u8.TextBuffer.Lower;
	u1 = true;
end;
function v10.setCameraModeToastEnabled(p5)
	if not p5 and not u1 then
		return;
	end;
	if not u1 then
		u12();
	end;
	u8.Visible = p5;
	if not p5 then
		v10.setCameraModeToastOpen(false);
	end;
end;
local l__TweenService__13 = game:GetService("TweenService");
local u14 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local u15 = UDim2.new(0, 326, 0, 58);
function v10.setCameraModeToastOpen(p6)
	assert(u1);
	local v11 = {
		Size = p6 and u15 or u4
	};
	if p6 then
		local v12 = 0.4;
	else
		v12 = 1;
	end;
	v11.ImageTransparency = v12;
	l__TweenService__13:Create(u8, u14, v11):Play();
	local v13 = {};
	if p6 then
		local v14 = 0;
	else
		v14 = 1;
	end;
	v13.ImageTransparency = v14;
	l__TweenService__13:Create(u9, u14, v13):Play();
	local v15 = {};
	if p6 then
		local v16 = 0;
	else
		v16 = 1;
	end;
	v15.TextTransparency = v16;
	l__TweenService__13:Create(u10, u14, v15):Play();
	local v17 = {};
	if p6 then
		local v18 = 0;
	else
		v18 = 1;
	end;
	v17.TextTransparency = v18;
	l__TweenService__13:Create(u11, u14, v17):Play();
end;
return v10;
