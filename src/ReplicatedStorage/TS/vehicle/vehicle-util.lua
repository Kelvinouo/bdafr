-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "VehicleUtil";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1)

end;
function v1.isInVehicle(p2, p3, p4)
	for v3, v4 in ipairs(p4:GetDescendants()) do
		if v4:IsA("Seat") and v4.Occupant and v4.Occupant:IsDescendantOf(p3) then
			return true;
		end;
	end;
	return false;
end;
function v1.getOccupants(p5, p6)
	local v5 = {};
	for v6, v7 in ipairs(p6:GetDescendants()) do
		if v7:IsA("Seat") and v7.Occupant then
			table.insert(v5, v7.Occupant);
		end;
	end;
	return v5;
end;
function v1.getSeats(p7, p8)
	local v8 = {};
	for v9, v10 in ipairs(p8:GetDescendants()) do
		if v10:IsA("Seat") then
			table.insert(v8, v10);
		end;
	end;
	return v8;
end;
function v1.isDriver(p9, p10, p11)
	if p10.Character and p11.Driver.Occupant ~= nil and p11.Driver.Occupant:IsDescendantOf(p10.Character) then
		return true;
	end;
	return false;
end;
return {
	VehicleUtil = v1
};
