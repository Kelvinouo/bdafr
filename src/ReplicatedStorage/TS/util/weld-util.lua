-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v2.weldAttachments(p1, p2)
	return u1("Weld", {
		Name = "AccessoryAttachment", 
		Part0 = p1.Parent, 
		Part1 = p2.Parent, 
		C0 = p1.CFrame, 
		C1 = p2.CFrame, 
		Parent = p1.Parent
	});
end;
function v2.weldParts(p3, p4)
	return u1("WeldConstraint", {
		Name = p4.Name, 
		Part0 = p3, 
		Part1 = p4, 
		Parent = p3
	});
end;
function v2.weldPartsWithJoint(p5, p6, p7)
	local v3 = Instance.new(p7);
	v3.Part0 = p5;
	v3.Part1 = p6;
	v3.C0 = CFrame.new();
	v3.C1 = p6.CFrame:ToObjectSpace(p5.CFrame);
	v3.Parent = p5;
	return v3;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
local function u3(p8, p9)
	for v4, v5 in ipairs(p8:GetChildren()) do
		if v5:IsA("Attachment") and v5.Name == p9 then
			local v6 = u2.endsWith(v5.Name, "KneeRigAttachment");
			if v6 then
				local v7 = v5.Parent;
				if v7 ~= nil then
					v7 = v7.Name;
				end;
				local v8 = v7;
				if v8 == nil then
					v8 = "";
				end;
				v6 = u2.includes(v8, "Upper");
			end;
			if not v6 then
				return v5;
			end;
		elseif not v5:IsA("Accoutrement") and not v5:IsA("Tool") then
			local v9 = u3(v5, p9);
			if v9 then
				return v9;
			end;
		end;
	end;
	return nil;
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v2.weldCharacterAccessories(p10)
	local v10, v11, v12 = ipairs(p10:GetChildren());
	while true do
		local v13, v14 = v10(v11, v12);
		if not v13 then
			break;
		end;
		if v14:IsA("Accessory") then
			local l__Handle__15 = v14:FindFirstChild("Handle");
			if l__Handle__15 then
				for v16, v17 in ipairs(l__Handle__15:GetChildren()) do
					if v17:IsA("Attachment") then
						local v18 = u3(p10, v17.Name);
						if v18 then
							local v19 = u4.new();
							local u5 = u1("Weld", {
								Name = "AccessoryAttachment", 
								Part0 = v18.Parent, 
								Part1 = v17.Parent, 
								C0 = v18.CFrame, 
								C1 = v17.CFrame, 
								Parent = v18.Parent
							});
							v19:GiveTask(function()
								u5:Destroy();
							end);
							v19:GiveTask(v17.AncestryChanged:Connect(function(p11, p12)
								if p12 == nil then
									v19:DoCleaning();
								end;
							end));
							break;
						end;
					end;
				end;
			end;
		end;
		for v20, v21 in ipairs(v14:GetDescendants()) do
			if v21:IsA("BasePart") then
				v21.CanCollide = false;
			end;
		end;	
	end;
end;
return {
	WeldUtil = v2
};
