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
local function u2(p2, p3)
	for v8, v9 in pairs(p2:GetChildren()) do
		if v9:IsA("Attachment") and not p3:FindFirstChild(v9.Name) then
			local v10 = Instance.new("Vector3Value");
			v10.Name = v9.Name;
			v10.Value = v9.Position;
			v10.Parent = p3;
		end;
	end;
	local l__AvatarPartScaleType__11 = p2:FindFirstChild("AvatarPartScaleType");
	if l__AvatarPartScaleType__11 and not p3:FindFirstChild("AvatarPartScaleType") then
		l__AvatarPartScaleType__11:Clone().Parent = p3;
	end;
end;
return function(p4)
	local l__Humanoid__12 = p4.Humanoid;
	local l__RootPart__13 = l__Humanoid__12.RootPart;
	local v14 = l__RootPart__13.CFrame * CFrame.new(0, -(l__RootPart__13.Size.Y / 2 + l__Humanoid__12.HipHeight), 0);
	local l__BodyHeightScale__15 = l__Humanoid__12:FindFirstChild("BodyHeightScale");
	if l__BodyHeightScale__15 then
		local v16 = l__BodyHeightScale__15.Value;
	else
		v16 = 1;
	end;
	local v17 = 5 / u1(l__Humanoid__12) * v16;
	local l__Head__18 = p4.Head;
	local v19 = l__Head__18:FindFirstChildWhichIsA("SpecialMesh");
	local v20 = v19.MeshType == Enum.MeshType.FileMesh;
	local v21 = {};
	for v22, v23 in pairs(p4:GetChildren()) do
		if v23:IsA("Accessory") then
			v23:FindFirstChildWhichIsA("BasePart"):FindFirstChild("AccessoryWeld"):Destroy();
			v23.Parent = nil;
			v21[v23] = true;
		end;
	end;
	u2(l__Head__18, v19);
	for v24, v25 in pairs(p4:GetDescendants()) do
		if v25:IsA("Motor6D") then
			local l__Position__26 = v25.C0.Position;
			local l__Position__27 = v25.C1.Position;
			v25.C0 = v25.C0 - l__Position__26 + l__Position__26 * v17;
			v25.C1 = v25.C1 - l__Position__27 + l__Position__27 * v17;
		elseif v25:IsA("Attachment") then
			v25.Position = v25.Position * v17;
			v25.OriginalPosition.Value = v25.OriginalPosition.Value * v17;
		elseif v25.Name == "OriginalSize" then
			local l__Parent__28 = v25.Parent;
			if l__Parent__28:IsA("BasePart") then
				l__Parent__28.Size = l__Parent__28.Size * v17;
				v25.Value = v25.Value * v17;
			elseif l__Parent__28 == v19 then
				for v29, v30 in pairs(l__Parent__28:GetChildren()) do
					if v30:IsA("Vector3Value") and v30 ~= v25 then
						v30.Value = v30.Value * v17;
					end;
				end;
				if v20 then
					l__Parent__28.Scale = l__Parent__28.Scale * v17;
					v25.Value = v25.Value * v17;
				end;
			end;
		end;
	end;
	for v31, v32 in pairs(v21) do
		local v33 = v31:FindFirstChildWhichIsA("BasePart");
		v33.OriginalSize.Value = v33.OriginalSize.Value * v17;
		l__Humanoid__12:AddAccessory(v31);
	end;
	l__Humanoid__12.HipHeight = l__Humanoid__12.HipHeight * v17;
	l__RootPart__13.CFrame = v14 * CFrame.new(0, l__RootPart__13.Size.Y / 2 + l__Humanoid__12.HipHeight, 0);
end;
