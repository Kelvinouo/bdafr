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
	local v4, v5, v6 = ipairs(p8:GetChildren());
	while true do
		v4(v5, v6);
		if not v4 then
			break;
		end;
		v6 = v4;
		if v5:IsA("Attachment") and v5.Name == p9 then
			local v7 = u2.endsWith(v5.Name, "KneeRigAttachment");
			if v7 then
				local v8 = v5.Parent;
				if v8 ~= nil then
					v8 = v8.Name;
				end;
				local v9 = v8;
				if v9 == nil then
					v9 = "";
				end;
				v7 = u2.includes(v9, "Upper");
			end;
			if not v7 then
				return v5;
			end;
		elseif not v5:IsA("Accoutrement") and not v5:IsA("Tool") then
			local v10 = u3(v5, p9);
			if v10 then
				return v10;
			end;
		end;	
	end;
	return nil;
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v2.weldCharacterAccessories(p10)
	local v11, v12, v13 = ipairs(p10:GetChildren());
	while true do
		v11(v12, v13);
		if not v11 then
			break;
		end;
		if v12:IsA("Accessory") then
			local l__Handle__14 = v12:FindFirstChild("Handle");
			if l__Handle__14 then
				local v15, v16, v17 = ipairs(l__Handle__14:GetChildren());
				while true do
					v15(v16, v17);
					if not v15 then
						break;
					end;
					v17 = v15;
					if v16:IsA("Attachment") then
						local v18 = u3(p10, v16.Name);
						if v18 then
							local v19 = u4.new();
							local u5 = u1("Weld", {
								Name = "AccessoryAttachment", 
								Part0 = v18.Parent, 
								Part1 = v16.Parent, 
								C0 = v18.CFrame, 
								C1 = v16.CFrame, 
								Parent = v18.Parent
							});
							v19:GiveTask(function()
								u5:Destroy();
							end);
							v19:GiveTask(v16.AncestryChanged:Connect(function(p11, p12)
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
		local v20, v21, v22 = ipairs(v12:GetDescendants());
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			if v21:IsA("BasePart") then
				v21.CanCollide = false;
			end;		
		end;	
	end;
end;
return {
	WeldUtil = v2
};
