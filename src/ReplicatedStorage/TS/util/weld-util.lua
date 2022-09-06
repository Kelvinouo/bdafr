-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "WeldUtil";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1)

end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v2.weldAttachments(p2, p3, p4)
	return u1("Weld", {
		Name = "AccessoryAttachment", 
		Part0 = p3.Parent, 
		Part1 = p4.Parent, 
		C0 = p3.CFrame, 
		C1 = p4.CFrame, 
		Parent = p3.Parent
	});
end;
function v2.weldParts(p5, p6, p7)
	return u1("WeldConstraint", {
		Name = p7.Name, 
		Part0 = p6, 
		Part1 = p7, 
		Parent = p6
	});
end;
function v2.weldPartsWithJoint(p8, p9, p10, p11)
	local v4 = Instance.new(p11);
	v4.Part0 = p9;
	v4.Part1 = p10;
	v4.C0 = CFrame.new();
	v4.C1 = p10.CFrame:ToObjectSpace(p9.CFrame);
	v4.Parent = p9;
	return v4;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
local l__MapUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v2.findFirstMatchAttachment(p12, p13, p14)
	local v5 = p12.firstMatchAttachment[p13];
	if v5 then
		local v6 = v5[p14];
		if v6 then
			return v6;
		end;
	end;
	local v7 = nil;
	local v8, v9, v10 = ipairs(p13:GetChildren());
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		if v9:IsA("Attachment") and v9.Name == p14 then
			local v11 = u2.endsWith(v9.Name, "KneeRigAttachment");
			if v11 then
				local v12 = v9.Parent;
				if v12 ~= nil then
					v12 = v12.Name;
				end;
				local v13 = v12;
				if v13 == nil then
					v13 = "";
				end;
				v11 = u2.includes(v13, "Upper");
			end;
			if not v11 then
				v7 = v9;
				break;
			end;
		elseif not v9:IsA("Accoutrement") and not v9:IsA("Tool") then
			local v14 = p12:findFirstMatchAttachment(v9, p14);
			if v14 then
				v7 = v14;
				break;
			end;
		end;	
	end;
	if v7 then
		local v15 = l__MapUtil__3.getOrCreate(p12.firstMatchAttachment, p13, {});
		v15[p14] = v7;
		local v16 = u4.new();
		v16:GiveTask(function()
			v15[p14] = nil;
		end);
		v16:GiveTask(v7:GetPropertyChangedSignal("Name"):Connect(function()
			v16:DoCleaning();
		end));
		v16:GiveTask(v7.AncestryChanged:Connect(function()
			v16:DoCleaning();
		end));
	end;
	return v7;
end;
function v2.weldCharacterAccessories(p15, p16)
	local v17, v18, v19 = ipairs(p16:GetChildren());
	while true do
		local v20 = nil;
		local v21 = nil;
		local v22 = nil;
		local v23 = nil;
		local v24 = nil;
		local v25 = nil;
		local v26 = nil;
		local v27 = nil;
		local v28 = nil;
		local v29 = nil;
		local v30 = nil;
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		if v18:IsA("Accessory") then
			local v31 = nil;
			local v32 = nil;
			local v33 = nil;
			local v34 = nil;
			local v35 = nil;
			local v36 = nil;
			local v37 = nil;
			local v38 = nil;
			local v39 = nil;
			local v40 = nil;
			local v41 = nil;
			local v42 = p15.characterAccessoryWelds[v18];
			local v43 = v42;
			if v43 ~= nil then
				v43 = v43.Parent;
			end;
			if v43 ~= nil then
				if not v42.Part0 or not v42.Part1 then
					v42:Destroy();
					v37 = "Handle";
					v32 = "FindFirstChild";
					v31 = v18;
					v36 = v31;
					v33 = v18;
					v34 = v32;
					v35 = v33[v34];
					v38 = v35;
					v39 = v36;
					v40 = v37;
					local v44 = v38(v39, v40);
					v41 = v44;
					if v41 then
						local v45, v46, v47 = ipairs(v44:GetChildren());
						while true do
							v45(v46, v47);
							if not v45 then
								break;
							end;
							v47 = v45;
							if v46:IsA("Attachment") then
								local v48 = p15:findFirstMatchAttachment(p16, v46.Name);
								if v48 then
									local v49 = p15:weldAttachments(v48, v46);
									p15.characterAccessoryWelds[v18] = v49;
									local v50 = u4.new();
									v50:GiveTask(function()
										p15.characterAccessoryWelds[v18] = nil;
									end);
									v50:GiveTask(function()
										v49:Destroy();
									end);
									v50:GiveTask(v46.AncestryChanged:Connect(function(p17, p18)
										if p18 == nil then
											v50:DoCleaning();
										end;
									end));
									break;
								end;
							end;						
						end;
					end;
					v28 = ipairs;
					v21 = "GetDescendants";
					v20 = v18;
					v25 = v20;
					v22 = v18;
					v23 = v21;
					v24 = v22[v23];
					v26 = v24;
					v27 = v25;
					v30 = v26(v27);
					v29 = v28;
					local v51, v52, v53 = v29(v30);
					while true do
						v51(v52, v53);
						if not v51 then
							break;
						end;
						v53 = v51;
						if v52:IsA("BasePart") then
							v52.CanCollide = false;
						end;					
					end;
				end;
			else
				v37 = "Handle";
				v32 = "FindFirstChild";
				v31 = v18;
				v36 = v31;
				v33 = v18;
				v34 = v32;
				v35 = v33[v34];
				v38 = v35;
				v39 = v36;
				v40 = v37;
				v44 = v38(v39, v40);
				v41 = v44;
				if v41 then
					v45, v46, v47 = ipairs(v44:GetChildren());
					while true do
						v45(v46, v47);
						if not v45 then
							break;
						end;
						v47 = v45;
						if v46:IsA("Attachment") then
							v48 = p15:findFirstMatchAttachment(p16, v46.Name);
							if v48 then
								v49 = p15:weldAttachments(v48, v46);
								p15.characterAccessoryWelds[v18] = v49;
								v50 = u4.new();
								v50:GiveTask(function()
									p15.characterAccessoryWelds[v18] = nil;
								end);
								v50:GiveTask(function()
									v49:Destroy();
								end);
								v50:GiveTask(v46.AncestryChanged:Connect(function(p17, p18)
									if p18 == nil then
										v50:DoCleaning();
									end;
								end));
								break;
							end;
						end;					
					end;
				end;
				v28 = ipairs;
				v21 = "GetDescendants";
				v20 = v18;
				v25 = v20;
				v22 = v18;
				v23 = v21;
				v24 = v22[v23];
				v26 = v24;
				v27 = v25;
				v30 = v26(v27);
				v29 = v28;
				v51, v52, v53 = v29(v30);
				while true do
					v51(v52, v53);
					if not v51 then
						break;
					end;
					v53 = v51;
					if v52:IsA("BasePart") then
						v52.CanCollide = false;
					end;				
				end;
			end;
		else
			v28 = ipairs;
			v21 = "GetDescendants";
			v20 = v18;
			v25 = v20;
			v22 = v18;
			v23 = v21;
			v24 = v22[v23];
			v26 = v24;
			v27 = v25;
			v30 = v26(v27);
			v29 = v28;
			v51, v52, v53 = v29(v30);
			while true do
				v51(v52, v53);
				if not v51 then
					break;
				end;
				v53 = v51;
				if v52:IsA("BasePart") then
					v52.CanCollide = false;
				end;			
			end;
		end;	
	end;
end;
v2.characterAccessoryWelds = {};
v2.firstMatchAttachment = {};
return {
	WeldUtil = v2
};
