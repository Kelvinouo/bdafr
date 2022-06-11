-- Script Hash: b1161bc0520c887dfa236807d657362edcad37353d92ebb34ee4979b611e94dc55d61dd92e93c6d5042279b0aa5bd3c1
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local function v3(p1, p2)
	return u1("Weld", {
		Name = "AccessoryAttachment", 
		Part0 = p1.Parent, 
		Part1 = p2.Parent, 
		C0 = p1.CFrame, 
		C1 = p2.CFrame, 
		Parent = p1.Parent
	});
end;
v2.weldAttachments = v3;
function v2.weldParts(p3, p4)
	return u1("WeldConstraint", {
		Name = p4.Name, 
		Part0 = p3, 
		Part1 = p4, 
		Parent = p3
	});
end;
function v2.weldPartsWithJoint(p5, p6, p7)
	local v4 = Instance.new(p7);
	v4.Part0 = p5;
	v4.Part1 = p6;
	v4.C0 = CFrame.new();
	v4.C1 = p6.CFrame:ToObjectSpace(p5.CFrame);
	v4.Parent = p5;
	return v4;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
local function u3(p8, p9)
	for v5, v6 in ipairs(p8:GetChildren()) do
		if v6:IsA("Attachment") and v6.Name == p9 then
			local v7 = u2.endsWith(v6.Name, "KneeRigAttachment");
			if v7 then
				local v8 = v6.Parent;
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
				return v6;
			end;
		elseif not v6:IsA("Accoutrement") and not v6:IsA("Tool") then
			local v10 = u3(v6, p9);
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
		local v14, v15 = v11(v12, v13);
		if not v14 then
			break;
		end;
		if v15:IsA("Accessory") then
			local l__Handle__16 = v15:FindFirstChild("Handle");
			if l__Handle__16 then
				for v17, v18 in ipairs(l__Handle__16:GetChildren()) do
					if v18:IsA("Attachment") then
						local v19 = u3(p10, v18.Name);
						if v19 then
							local v20 = u4.new();
							local u5 = v3(v19, v18);
							v20:GiveTask(function()
								u5:Destroy();
							end);
							v20:GiveTask(v18.AncestryChanged:Connect(function(p11, p12)
								if p12 == nil then
									v20:DoCleaning();
								end;
							end));
							break;
						end;
					end;
				end;
			end;
		end;
		for v21, v22 in ipairs(v15:GetDescendants()) do
			if v22:IsA("BasePart") then
				v22.CanCollide = false;
			end;
		end;	
	end;
end;
return {
	WeldUtil = v2
};
