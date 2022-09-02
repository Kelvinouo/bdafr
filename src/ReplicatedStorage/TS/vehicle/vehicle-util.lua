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
	local v3, v4, v5 = ipairs(p4:GetDescendants());
	while true do
		v3(v4, v5);
		if not v3 then
			break;
		end;
		v5 = v3;
		if v4:IsA("Seat") and v4.Occupant and v4.Occupant:IsDescendantOf(p3) then
			return true;
		end;	
	end;
	return false;
end;
function v1.getOccupants(p5, p6)
	local v6 = {};
	local v7, v8, v9 = ipairs(p6:GetDescendants());
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		if v8:IsA("Seat") and v8.Occupant then
			table.insert(v6, v8.Occupant);
		end;	
	end;
	return v6;
end;
function v1.getSeats(p7, p8)
	local v10 = {};
	local v11, v12, v13 = ipairs(p8:GetDescendants());
	while true do
		v11(v12, v13);
		if not v11 then
			break;
		end;
		v13 = v11;
		if v12:IsA("Seat") then
			table.insert(v10, v12);
		end;	
	end;
	return v10;
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
