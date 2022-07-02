-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local v2 = l__Players__1.LocalPlayer;
if not v2 then
	l__Players__1:GetPropertyChangedSignal("LocalPlayer"):Wait();
	v2 = l__Players__1.LocalPlayer;
end;
local u1 = false;
local u2 = nil;
local u3 = UDim2.new(0, 80, 0, 58);
local u4 = Color3.fromRGB(32, 32, 32);
local u5 = Color3.fromRGB(200, 200, 200);
local u6 = (function(p1, p2)
	local v3 = p1:FindFirstChildOfClass(p2);
	while not v3 or v3.ClassName ~= p2 do
		v3 = p1.ChildAdded:Wait();	
	end;
	return v3;
end)(v2, "PlayerGui");
local u7 = nil;
local u8 = nil;
local u9 = nil;
local u10 = nil;
local v4 = {};
local function u11()
	assert(not u1);
	local u12 = "ScreenGui";
	u12 = {
		Name = "RbxCameraUI", 
		AutoLocalize = false, 
		Enabled = true, 
		DisplayOrder = -1, 
		IgnoreGuiInset = false, 
		ResetOnSpawn = false, 
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	};
	local u13 = "ImageLabel";
	u13 = {
		Name = "Toast", 
		Visible = false, 
		AnchorPoint = Vector2.new(0.5, 0), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0.5, 0, 0, 8), 
		Size = u3, 
		Image = "rbxasset://textures/ui/Camera/CameraToast9Slice.png", 
		ImageColor3 = u4, 
		ImageRectSize = Vector2.new(6, 6), 
		ImageTransparency = 1, 
		ScaleType = Enum.ScaleType.Slice, 
		SliceCenter = Rect.new(3, 3, 3, 3), 
		ClipsDescendants = true
	};
	local u14 = "Frame";
	u14 = {
		Name = "IconBuffer", 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0, 0, 0, 0), 
		Size = UDim2.new(0, 80, 1, 0)
	};
	local u15 = "ImageLabel";
	u15 = {
		Name = "Icon", 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1, 
		Position = UDim2.new(0.5, 0, 0.5, 0), 
		Size = UDim2.new(0, 48, 0, 48), 
		ZIndex = 2, 
		Image = "rbxasset://textures/ui/Camera/CameraToastIcon.png", 
		ImageColor3 = u5, 
		ImageTransparency = 1
	};
	u14[1] = (function(p3)
		local v5 = Instance.new(u15);
		p3.Parent = nil;
		local v6, v7, v8 = pairs(p3);
		while true do
			local v9 = nil;
			local v10 = nil;
			v10, v9 = v6(v7, v8);
			if not v10 then
				break;
			end;
			v8 = v10;
			if type(v10) == "string" then
				v5[v10] = v9;
			else
				v9.Parent = v5;
			end;		
		end;
		v5.Parent = p3.Parent;
		return v5;
	end)(u15);
	local u16 = "Frame";
	u14 = function(p4)
		local v11 = Instance.new(u16);
		p4.Parent = nil;
		local v12, v13, v14 = pairs(p4);
		while true do
			local v15 = nil;
			local v16 = nil;
			v16, v15 = v12(v13, v14);
			if not v16 then
				break;
			end;
			v14 = v16;
			if type(v16) == "string" then
				v11[v16] = v15;
			else
				v15.Parent = v11;
			end;		
		end;
		v11.Parent = p4.Parent;
		return v11;
	end;
	u16 = {
		Name = "TextBuffer", 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0, 
		Position = UDim2.new(0, 80, 0, 0), 
		Size = UDim2.new(1, -80, 1, 0), 
		ClipsDescendants = true
	};
	local u17 = "TextLabel";
	u15 = function(p5)
		local v17 = Instance.new(u17);
		p5.Parent = nil;
		local v18, v19, v20 = pairs(p5);
		while true do
			local v21 = nil;
			local v22 = nil;
			v22, v21 = v18(v19, v20);
			if not v22 then
				break;
			end;
			v20 = v22;
			if type(v22) == "string" then
				v17[v22] = v21;
			else
				v21.Parent = v17;
			end;		
		end;
		v17.Parent = p5.Parent;
		return v17;
	end;
	u17 = {
		Name = "Upper", 
		AnchorPoint = Vector2.new(0, 1), 
		BackgroundTransparency = 1, 
		Position = UDim2.new(0, 0, 0.5, 0), 
		Size = UDim2.new(1, 0, 0, 19), 
		Font = Enum.Font.GothamMedium, 
		Text = "Camera control enabled", 
		TextColor3 = u5, 
		TextTransparency = 1, 
		TextSize = 19, 
		TextXAlignment = Enum.TextXAlignment.Left, 
		TextYAlignment = Enum.TextYAlignment.Center
	};
	u15 = u15(u17);
	local u18 = "TextLabel";
	u17 = function(p6)
		local v23 = Instance.new(u18);
		p6.Parent = nil;
		local v24, v25, v26 = pairs(p6);
		while true do
			local v27 = nil;
			local v28 = nil;
			v28, v27 = v24(v25, v26);
			if not v28 then
				break;
			end;
			v26 = v28;
			if type(v28) == "string" then
				v23[v28] = v27;
			else
				v27.Parent = v23;
			end;		
		end;
		v23.Parent = p6.Parent;
		return v23;
	end;
	u18 = {
		Name = "Lower", 
		AnchorPoint = Vector2.new(0, 0), 
		BackgroundTransparency = 1, 
		Position = UDim2.new(0, 0, 0.5, 3), 
		Size = UDim2.new(1, 0, 0, 15), 
		Font = Enum.Font.Gotham, 
		Text = "Right mouse button to toggle", 
		TextColor3 = u5, 
		TextTransparency = 1, 
		TextSize = 15, 
		TextXAlignment = Enum.TextXAlignment.Left, 
		TextYAlignment = Enum.TextYAlignment.Center
	};
	u16[1] = u15;
	u16[2] = u17(u18);
	u13[1] = (function(p7)
		local v29 = Instance.new(u14);
		p7.Parent = nil;
		local v30, v31, v32 = pairs(p7);
		while true do
			local v33 = nil;
			local v34 = nil;
			v34, v33 = v30(v31, v32);
			if not v34 then
				break;
			end;
			v32 = v34;
			if type(v34) == "string" then
				v29[v34] = v33;
			else
				v33.Parent = v29;
			end;		
		end;
		v29.Parent = p7.Parent;
		return v29;
	end)(u14);
	u13[2] = u14(u16);
	u12[1] = (function(p8)
		local v35 = Instance.new(u13);
		p8.Parent = nil;
		local v36, v37, v38 = pairs(p8);
		while true do
			local v39 = nil;
			local v40 = nil;
			v40, v39 = v36(v37, v38);
			if not v40 then
				break;
			end;
			v38 = v40;
			if type(v40) == "string" then
				v35[v40] = v39;
			else
				v39.Parent = v35;
			end;		
		end;
		v35.Parent = p8.Parent;
		return v35;
	end)(u13);
	u13 = u6;
	u12.Parent = u13;
	u2 = (function(p9)
		local v41 = Instance.new(u12);
		p9.Parent = nil;
		local v42, v43, v44 = pairs(p9);
		while true do
			local v45 = nil;
			local v46 = nil;
			v46, v45 = v42(v43, v44);
			if not v46 then
				break;
			end;
			v44 = v46;
			if type(v46) == "string" then
				v41[v46] = v45;
			else
				v45.Parent = v41;
			end;		
		end;
		v41.Parent = p9.Parent;
		return v41;
	end)(u12);
	u12 = u2;
	u7 = u12.Toast;
	u12 = u7.IconBuffer;
	u8 = u12.Icon;
	u12 = u7.TextBuffer;
	u9 = u12.Upper;
	u12 = u7.TextBuffer;
	u10 = u12.Lower;
	u1 = true;
end;
function v4.setCameraModeToastEnabled(p10)
	if not p10 and not u1 then
		return;
	end;
	if not u1 then
		u11();
	end;
	u7.Visible = p10;
	if not p10 then
		v4.setCameraModeToastOpen(false);
	end;
end;
local l__TweenService__19 = game:GetService("TweenService");
local u20 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local u21 = UDim2.new(0, 326, 0, 58);
function v4.setCameraModeToastOpen(p11)
	assert(u1);
	local v47 = {
		Size = p11 and u21 or u3
	};
	if p11 then
		local v48 = 0.4;
	else
		v48 = 1;
	end;
	v47.ImageTransparency = v48;
	l__TweenService__19:Create(u7, u20, v47):Play();
	local v49 = {};
	if p11 then
		local v50 = 0;
	else
		v50 = 1;
	end;
	v49.ImageTransparency = v50;
	l__TweenService__19:Create(u8, u20, v49):Play();
	local v51 = {};
	if p11 then
		local v52 = 0;
	else
		v52 = 1;
	end;
	v51.TextTransparency = v52;
	l__TweenService__19:Create(u9, u20, v51):Play();
	local v53 = {};
	if p11 then
		local v54 = 0;
	else
		v54 = 1;
	end;
	v53.TextTransparency = v54;
	l__TweenService__19:Create(u10, u20, v53):Play();
end;
return v4;
