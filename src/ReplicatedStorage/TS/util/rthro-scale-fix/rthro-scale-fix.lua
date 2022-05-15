
-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1)
	local l__Parent__1 = p1.Parent;
	local l__UpperTorso__2 = l__Parent__1.UpperTorso;
	local l__Head__3 = l__Parent__1.Head;
	local l__Root__4 = l__Parent__1.LowerTorso.Root;
	local l__Waist__5 = l__UpperTorso__2.Waist;
	local l__Neck__6 = l__Head__3.Neck;
	local v7 = l__Root__4.C0 * l__Root__4.C1:Inverse() * l__Waist__5.C0 * l__Waist__5.C1:Inverse();
	return math.max(v7.Y + l__UpperTorso__2.Size.Y / 2, (v7 * l__Neck__6.C0 * l__Neck__6.C1:Inverse()).Y + l__Head__3.Size.Y / 2) + p1.RootPart.Size.Y / 2 + p1.HipHeight;
end;
local function u2(p2, p3, p4)
	local v8 = p2:FindFirstChild(p3);
	if not v8 then
		return p4;
	end;
	return v8.Value;
end;
local function u3(p5, p6)
	for v9, v10 in pairs(p5:GetChildren()) do
		if v10:IsA("Attachment") and not p6:FindFirstChild(v10.Name) then
			local v11 = Instance.new("Vector3Value");
			v11.Name = v10.Name;
			v11.Value = v10.Position;
			v11.Parent = p6;
		end;
	end;
	local l__AvatarPartScaleType__12 = p5:FindFirstChild("AvatarPartScaleType");
	if l__AvatarPartScaleType__12 and not p6:FindFirstChild("AvatarPartScaleType") then
		l__AvatarPartScaleType__12:Clone().Parent = p6;
	end;
end;
return function(p7)
	local l__Humanoid__13 = p7.Humanoid;
	local l__RootPart__14 = l__Humanoid__13.RootPart;
	local v15 = l__RootPart__14.CFrame * CFrame.new(0, -(l__RootPart__14.Size.Y / 2 + l__Humanoid__13.HipHeight), 0);
	local v16 = 5 / u1(l__Humanoid__13) * u2(l__Humanoid__13, "BodyHeightScale", 1);
	local l__Head__17 = p7.Head;
	local v18 = l__Head__17:FindFirstChildWhichIsA("SpecialMesh");
	local v19 = v18.MeshType == Enum.MeshType.FileMesh;
	local v20 = {};
	for v21, v22 in pairs(p7:GetChildren()) do
		if v22:IsA("Accessory") then
			v22:FindFirstChildWhichIsA("BasePart"):FindFirstChild("AccessoryWeld"):Destroy();
			v22.Parent = nil;
			v20[v22] = true;
		end;
	end;
	u3(l__Head__17, v18);
	for v23, v24 in pairs(p7:GetDescendants()) do
		if v24:IsA("Motor6D") then
			local l__Position__25 = v24.C0.Position;
			local l__Position__26 = v24.C1.Position;
			v24.C0 = v24.C0 - l__Position__25 + l__Position__25 * v16;
			v24.C1 = v24.C1 - l__Position__26 + l__Position__26 * v16;
		elseif v24:IsA("Attachment") then
			v24.Position = v24.Position * v16;
			v24.OriginalPosition.Value = v24.OriginalPosition.Value * v16;
		elseif v24.Name == "OriginalSize" then
			local l__Parent__27 = v24.Parent;
			if l__Parent__27:IsA("BasePart") then
				l__Parent__27.Size = l__Parent__27.Size * v16;
				v24.Value = v24.Value * v16;
			elseif l__Parent__27 == v18 then
				for v28, v29 in pairs(l__Parent__27:GetChildren()) do
					if v29:IsA("Vector3Value") and v29 ~= v24 then
						v29.Value = v29.Value * v16;
					end;
				end;
				if v19 then
					l__Parent__27.Scale = l__Parent__27.Scale * v16;
					v24.Value = v24.Value * v16;
				end;
			end;
		end;
	end;
	for v30, v31 in pairs(v20) do
		local v32 = v30:FindFirstChildWhichIsA("BasePart");
		v32.OriginalSize.Value = v32.OriginalSize.Value * v16;
		l__Humanoid__13:AddAccessory(v30);
	end;
	l__Humanoid__13.HipHeight = l__Humanoid__13.HipHeight * v16;
	l__RootPart__14.CFrame = v15 * CFrame.new(0, l__RootPart__14.Size.Y / 2 + l__Humanoid__13.HipHeight, 0);
end;

