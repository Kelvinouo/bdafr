-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1, p2)
	local v1 = p1:GetAttribute(p2.Name);
	if v1 == 0 or v1 ~= v1 or v1 == "" or not v1 then
		local v2 = p1:FindFirstChild("Attributes");
		if v2 ~= nil then
			v2 = v2:FindFirstChild(p2.Name);
		end;
		if v2 and v2:IsA("ValueBase") then
			local v3 = v2;
		else
			v3 = nil;
		end;
		if v3 then
			v1 = v3.Value;
		end;
	end;
	if not p2.Guard(v1) then
		error("Invalid type (" .. typeof(v1) .. ") for attribute " .. p2.Name);
	end;
	return v1;
end;
local v4 = setmetatable({}, {
	__tostring = function()
		return "Attribute";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p3, p4, p5)
	p3.Name = p4;
	p3.Guard = p5;
end;
return {
	GetAttribute = u1, 
	SetAttribute = function(p6, p7, p8)
		if not p7.Guard(p8) then
			error(tostring(p8) .. " (" .. typeof(p8) .. ") for attribute " .. p7.Name .. " is incorrect type");
		end;
		p6:SetAttribute(p7.Name, p8);
	end, 
	GetAttributeChangedSignal = function(p9, p10, p11)
		local v6 = p9:FindFirstChild("Attributes");
		if v6 ~= nil then
			v6 = v6:FindFirstChild(p10.Name);
		end;
		if v6 and v6:IsA("ValueBase") then
			local v7 = v6;
		else
			v7 = nil;
		end;
		if v7 then
			return v7.Changed:Connect(function(p12)
				if not p10.Guard(p12) then
					error("Invalid type (" .. typeof(p12) .. ") for attribute " .. p10.Name);
				end;
				p11(p12);
			end);
		end;
		return p9:GetAttributeChangedSignal(p10.Name):Connect(function()
			local v8 = u1(p9, p10);
			if not p10.Guard(v8) then
				error("Invalid type (" .. typeof(v8) .. ") for attribute " .. p10.Name);
			end;
			p11(v8);
		end);
	end, 
	Attribute = v4
};
