-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
v1.__index = v1;
function B(p1, p2, p3)
	local function u1(p4)
		if p4 == 0 then
			return 1;
		end;
		return p4 * u1(p4 - 1);
	end;
	if p1 == 0 then
		local v2 = 1;
	else
		v2 = p1 * u1(p1 - 1);
	end;
	if p2 == 0 then
		local v3 = 1;
	else
		v3 = p2 * u1(p2 - 1);
	end;
	local v4 = p1 - p2;
	if v4 == 0 then
		local v5 = 1;
	else
		v5 = v4 * u1(v4 - 1);
	end;
	return v2 / (v3 * v5) * p3 ^ p2 * (1 - p3) ^ (p1 - p2);
end;
function v1.new(...)
	local v6 = setmetatable({}, v1);
	v6.Points = {};
	v6.LengthIterations = 1000;
	v6.LengthIndeces = {};
	v6.Length = 0;
	v6._connections = {};
	for v7, v8 in pairs({ ... }) do
		if typeof(v8) == "Vector3" or typeof(v8) == "Instance" and v8:IsA("BasePart") then
			v6:AddBezierPoint(v8);
		else
			error("The Bezier.new() constructor only takes in Vector3s and BaseParts as inputs!");
		end;
	end;
	return v6;
end;
function v1.AddBezierPoint(p5, p6, p7)
	if (not p6 or typeof(p6) ~= "Instance" or not p6:IsA("BasePart")) and typeof(p6) ~= "Vector3" then
		error("Bezier:AddBezierPoint() only accepts a Vector3 or BasePart as the first argument!");
		return;
	end;
	local v9 = {};
	if typeof(p6) == "Vector3" then
		local v10 = "StaicPoint";
	else
		v10 = "BasePartPoint";
	end;
	v9.Type = v10;
	v9.Point = p6;
	if v9.Type == "BasePartPoint" then
		local u2 = p6.Changed:Connect(function(p8)
			if p8 == "Position" then
				p5:UpdateLength();
			end;
		end);
		local v11 = p6.AncestryChanged:Connect(function(p9, p10)
			if p10 == nil then
				local v12 = table.find(p5.Points, v9);
				if v12 then
					table.remove(p5.Points, v12);
				end;
				u2:Disconnect();
				u2:Disconnect();
			end;
		end);
		if not p5._connections[p6] then
			p5._connections[p6] = {};
		end;
		table.insert(p5._connections[p6], u2);
		table.insert(p5._connections[p6], v11);
	end;
	if p7 and type(p7) == "number" then
		table.insert(p5.Points, p7, v9);
	elseif not p7 then
		table.insert(p5.Points, v9);
	elseif type(p7) ~= "number" then
		error("Bezier:AddBezierPoint() only accepts an integer as the second argument!");
	end;
	p5:UpdateLength();
end;
function v1.ChangeBezierPoint(p11, p12, p13)
	if type(p12) ~= "number" then
		error("Bezier:ChangeBezierPoint() only accepts a number index as the first argument!");
	end;
	if (not p13 or typeof(p13) ~= "Instance" or not p13:IsA("BasePart")) and typeof(p13) ~= "Vector3" then
		error("Bezier:ChangeBezierPoint() only accepts a Vector3 or BasePart as the second argument!");
		return;
	end;
	local v13 = p11.Points[p12];
	if not v13 then
		error("Did not find BezierPoint at index " .. tostring(p12));
		return;
	end;
	if typeof(p13) == "Vector3" then
		local v14 = "StaicPoint";
	else
		v14 = "BasePartPoint";
	end;
	v13.Type = v14;
	v13.Point = p13;
	p11:UpdateLength();
end;
function v1.GetAllPoints(p14)
	local v15 = {};
	for v16 = 1, #p14.Points do
		table.insert(v15, p14:GetPoint(v16));
	end;
	return v15;
end;
function v1.GetPoint(p15, p16)
	local l__Points__17 = p15.Points;
	if not l__Points__17[p16] then
		error("Did not find a BezierPoint at index " .. tostring(p16) .. "!");
		return;
	end;
	return typeof(l__Points__17[p16].Point) == "Vector3" and l__Points__17[p16].Point or l__Points__17[p16].Point.Position;
end;
function v1.RemoveBezierPoint(p17, p18)
	if p17.Points[p18] then
		local v18 = table.remove(p17.Points, p18);
		if typeof(v18.Point) == "Instance" and v18.Point:IsA("BasePart") then
			for v19, v20 in pairs(p17._connections[v18.Point]) do
				if v20.Connected then
					v20:Disconnect();
				end;
			end;
			p17._connections[v18.Point] = nil;
		end;
		p17:UpdateLength();
	end;
end;
function v1.UpdateLength(p19)
	local v21 = nil;
	local l__LengthIterations__22 = p19.LengthIterations;
	if #p19:GetAllPoints() < 2 then
		return 0, { { 0, 0, 0 }, { 0, 0, 0 } };
	end;
	v21 = 0;
	local v23 = {};
	for v24 = 1, l__LengthIterations__22 do
		local v25 = p19:CalculateDerivativeAt((v24 - 1) / (l__LengthIterations__22 - 1));
		v21 = v21 + v25.Magnitude * (1 / l__LengthIterations__22);
		table.insert(v23, { (v24 - 1) / (l__LengthIterations__22 - 1), v21, v25 });
	end;
	p19.Length = local v26;
	p19.LengthIndeces = v23;
end;
function v1.CalculatePositionAt(p20, p21)
	local v27 = nil;
	if type(p21) ~= "number" then
		error("Bezier:CalculatePositionAt() only accepts a number, got " .. tostring(p21) .. "!");
	end;
	if not (#p20.Points > 0) then
		error("Bezier:CalculatePositionAt() only works if there is at least 1 BezierPoint!");
		return;
	end;
	local v28 = p20:GetAllPoints();
	local v29 = #v28;
	v27 = Vector3.new();
	for v30 = 1, v29 do
		v27 = v27 + B(v29 - 1, v30 - 1, p21) * v28[v30];
	end;
	return local v31;
end;
function v1.CalculatePositionRelativeToLength(p22, p23)
	if type(p23) ~= "number" then
		error("Bezier:CalculatePositionRelativeToLength() only accepts a number, got " .. tostring(p23) .. "!");
	end;
	if not (#p22.Points > 0) then
		error("Bezier:CalculatePositionRelativeToLength() only works if there is at least 1 BezierPoint!");
		return;
	end;
	local l__LengthIndeces__32 = p22.LengthIndeces;
	local l__LengthIterations__33 = p22.LengthIterations;
	if not (#p22:GetAllPoints() > 1) then
		return p22:CalculatePositionAt(0);
	end;
	local v34 = p22.Length * p23;
	local v35 = nil;
	local v36 = nil;
	local v37, v38, v39 = ipairs(l__LengthIndeces__32);
	while true do
		v37(v38, v39);
		if not v37 then
			break;
		end;
		v39 = v37;
		if v34 - v38[2] <= 0 then
			v35 = v37;
			v36 = v38;
			break;
		end;
		if v37 == #l__LengthIndeces__32 then
			v35 = v37;
			v36 = v38;
			break;
		end;	
	end;
	if l__LengthIndeces__32[v35 - 1] then
		local v40 = p22:CalculatePositionAt(l__LengthIndeces__32[v35 - 1][1]);
		local v41 = p22:CalculatePositionAt(v36[1]);
	else
		v40 = p22:CalculatePositionAt(v36[1]);
		v41 = p22:CalculatePositionAt(l__LengthIndeces__32[v35 + 1][1]);
	end;
	return v40 + (v41 - v40) * (1 - (v36[2] - v34) / (v41 - v40).Magnitude);
end;
function v1.CalculateDerivativeAt(p24, p25)
	local v42 = nil;
	if type(p25) ~= "number" then
		error("Bezier:CalculateDerivativeAt() only accepts a number, got " .. tostring(p25) .. "!");
	end;
	if not (#p24.Points > 1) then
		error("Bezier:CalculateDerivativeAt() only works if there are at least 2 BezierPoints!");
		return;
	end;
	local v43 = p24:GetAllPoints();
	local v44 = #v43;
	v42 = Vector3.new();
	for v45 = 1, v44 - 1 do
		v42 = v42 + B(v44 - 2, v45 - 1, p25) * ((v44 - 1) * (v43[v45 + 1] - v43[v45]));
	end;
	return local v46;
end;
function v1.CalculateDerivativeRelativeToLength(p26, p27)
	if type(p27) ~= "number" then
		error("Bezier:CalculateDerivativeRelativeToLength() only accepts a number, got " .. tostring(p27) .. "!");
	end;
	if not (#p26.Points > 1) then
		error("Bezier:CalculateDerivativeRelativeToLength() only works if there are at least 2 BezierPoints!");
		return;
	end;
	local l__LengthIndeces__47 = p26.LengthIndeces;
	local l__LengthIterations__48 = p26.LengthIterations;
	local v49 = p26:GetAllPoints();
	local v50 = p26.Length * p27;
	local v51 = nil;
	local v52 = nil;
	local v53, v54, v55 = ipairs(l__LengthIndeces__47);
	while true do
		v53(v54, v55);
		if not v53 then
			break;
		end;
		v55 = v53;
		if v50 - v54[2] <= 0 then
			v51 = v53;
			v52 = v54;
			break;
		end;
		if v53 == #l__LengthIndeces__47 then
			v51 = v53;
			v52 = v54;
			break;
		end;	
	end;
	if l__LengthIndeces__47[v51 - 1] then
		local v56 = p26:CalculateDerivativeAt(l__LengthIndeces__47[v51 - 1][1]);
		local v57 = p26:CalculateDerivativeAt(v52[1]);
	else
		v56 = p26:CalculateDerivativeAt(v52[1]);
		v57 = p26:CalculateDerivativeAt(l__LengthIndeces__47[v51 + 1][1]);
	end;
	return v56 + (v57 - v56) * (1 - (v52[2] - v50) / (v57 - v56).Magnitude);
end;
return v1;
