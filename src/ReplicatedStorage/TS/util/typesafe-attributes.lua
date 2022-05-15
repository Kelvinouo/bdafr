
-- Decompiled with the Synapse X Luau decompiler.

local function u1(p1, p2)
	local v1 = p1:FindFirstChild("Attributes");
	if v1 ~= nil then
		v1 = v1:FindFirstChild(p2.Name);
	end;
	if v1 and v1:IsA("ValueBase") then
		return v1;
	end;
	return nil;
end;
local function u2(p3, p4)
	local v2 = p3:GetAttribute(p4.Name);
	if v2 == 0 or v2 ~= v2 or v2 == "" or not v2 then
		local v3 = u1(p3, p4);
		if v3 then
			v2 = v3.Value;
		end;
	end;
	if not p4.Guard(v2) then
		error("Invalid type (" .. typeof(v2) .. ") for attribute " .. p4.Name);
	end;
	return v2;
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
function v4.constructor(p5, p6, p7)
	p5.Name = p6;
	p5.Guard = p7;
end;
return {
	GetAttribute = u2, 
	SetAttribute = function(p8, p9, p10)
		if not p9.Guard(p10) then
			error(tostring(p10) .. " (" .. typeof(p10) .. ") for attribute " .. p9.Name .. " is incorrect type");
		end;
		p8:SetAttribute(p9.Name, p10);
	end, 
	GetAttributeChangedSignal = function(p11, p12, p13)
		local v6 = nil;
		v6 = function(p14)
			if not p12.Guard(p14) then
				error("Invalid type (" .. typeof(p14) .. ") for attribute " .. p12.Name);
			end;
			p13(p14);
		end;
		local v7 = u1(p11, p12);
		if v7 then
			return v7.Changed:Connect(v6);
		end;
		return p11:GetAttributeChangedSignal(p12.Name):Connect(function()
			v6((u2(p11, p12)));
		end);
	end, 
	Attribute = v4
};

