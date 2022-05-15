
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Settings);
local v2 = Instance.new("BindableEvent");
local v3 = Instance.new("BindableEvent");
local v4 = Instance.new("BindableEvent");
local v5 = Instance.new("BindableEvent");
local v6 = Instance.new("BindableEvent");
local v7 = {
	ObjectMetadata = {}, 
	Octree = require(script.Octree).new(), 
	Handled = 0, 
	Active = 0, 
	LastUpdate = os.clock(), 
	ObjectShakeAdded = v2.Event, 
	ObjectShakeRemoved = v3.Event, 
	ObjectShakeUpdated = v4.Event, 
	Paused = v5.Event, 
	Resumed = v6.Event, 
	Connect = function(p1, p2, p3)
		local v8 = p1[p2];
		assert(typeof(v8) == "function", "Unknown function: " .. p2);
		return p3:Connect(function(...)
			return v8(p1, ...);
		end);
	end
};
local u1 = v1.new(script, {
	WindDirection = Vector3.new(0.5, 0, 0.5), 
	WindSpeed = 20, 
	WindPower = 0.5
});
function v7.AddObjectShake(p4, p5, p6)
	if typeof(p5) ~= "Instance" then
		return;
	end;
	if not p5:IsA("BasePart") then
		return;
	end;
	local l__ObjectMetadata__9 = p4.ObjectMetadata;
	if l__ObjectMetadata__9[p5] then
		return;
	end;
	p4.Handled = p4.Handled + 1;
	l__ObjectMetadata__9[p5] = {
		Node = p4.Octree:CreateNode(p5.Position, p5), 
		Settings = v1.new(p5, u1), 
		Seed = math.random(1000) * 0.1, 
		Origin = p5.CFrame
	};
	p4:UpdateObjectSettings(p5, p6);
	v2:Fire(p5);
end;
function v7.RemoveObjectShake(p7, p8)
	if typeof(p8) ~= "Instance" then
		return;
	end;
	local l__ObjectMetadata__10 = p7.ObjectMetadata;
	local v11 = l__ObjectMetadata__10[p8];
	if v11 then
		p7.Handled = p7.Handled - 1;
		l__ObjectMetadata__10[p8] = nil;
		v11.Settings:Destroy();
		v11.Node:Destroy();
		if p8:IsA("BasePart") then
			p8.CFrame = v11.Origin;
		end;
	end;
	v3:Fire(p8);
end;
function v7.Update(p9)
	local v12 = os.clock();
	local v13 = v12 - p9.LastUpdate;
	if v13 < 0.022222222222222223 then
		return;
	end;
	p9.LastUpdate = v12;
	debug.profilebegin("WindShake");
	local l__CurrentCamera__14 = workspace.CurrentCamera;
	local v15 = l__CurrentCamera__14 and l__CurrentCamera__14.CFrame;
	debug.profilebegin("Octree Search");
	local v16 = p9.Octree:RadiusSearch(v15.Position + v15.LookVector * 115, 120);
	debug.profileend();
	local v17 = #v16;
	p9.Active = v17;
	if v17 < 1 then
		return;
	end;
	local v18 = math.min(1, v13 * 8);
	local v19 = table.create(v17);
	local l__ObjectMetadata__20 = p9.ObjectMetadata;
	debug.profilebegin("Calc");
	local v21, v22, v23 = ipairs(v16);
	while true do
		local v24, v25 = v21(v22, v23);
		if not v24 then
			break;
		end;
		local v26 = l__ObjectMetadata__20[v25];
		local l__Origin__27 = v26.Origin;
		if v12 - (v26.LastCompute and 0) > 0.03333333333333333 then
			local l__Settings__28 = v26.Settings;
			local l__Seed__29 = v26.Seed;
			local v30 = l__Settings__28.WindPower * 0.1;
			local v31 = v12 * (l__Settings__28.WindSpeed * 0.08);
			local l__PivotOffset__32 = v25.PivotOffset;
			v26.Target = (l__Origin__27 * l__PivotOffset__32 * CFrame.Angles(math.noise(v31, 0, l__Seed__29) * v30, math.noise(v31, 0, -l__Seed__29) * v30, math.noise(v31, 0, l__Seed__29 + l__Seed__29) * v30) + l__Settings__28.WindDirection * ((0.5 + math.noise(v31, l__Seed__29, l__Seed__29)) * v30)) * l__PivotOffset__32:Inverse();
			v26.LastCompute = v12;
		end;
		local v33 = (v26.CFrame and l__Origin__27):Lerp(v26.Target, v18);
		v26.CFrame = v33;
		v19[v24] = v33;	
	end;
	debug.profileend();
	workspace:BulkMoveTo(v16, v19, Enum.BulkMoveMode.FireCFrameChanged);
	debug.profileend();
end;
function v7.Pause(p10)
	if p10.UpdateConnection then
		p10.UpdateConnection:Disconnect();
		p10.UpdateConnection = nil;
	end;
	p10.Active = 0;
	p10.Running = false;
	v5:Fire();
end;
local l__RunService__2 = game:GetService("RunService");
function v7.Resume(p11)
	if p11.Running then
		return;
	end;
	p11.Running = true;
	p11.UpdateConnection = p11:Connect("Update", l__RunService__2.Heartbeat);
	v6:Fire();
end;
local l__CollectionService__3 = game:GetService("CollectionService");
function v7.Init(p12)
	if p12.Initialized then
		return;
	end;
	p12.Initialized = true;
	if typeof((script:GetAttribute("WindPower"))) ~= "number" then
		script:SetAttribute("WindPower", u1.WindPower);
	end;
	if typeof((script:GetAttribute("WindSpeed"))) ~= "number" then
		script:SetAttribute("WindSpeed", u1.WindSpeed);
	end;
	if typeof((script:GetAttribute("WindDirection"))) ~= "Vector3" then
		script:SetAttribute("WindDirection", u1.WindDirection);
	end;
	p12:Cleanup();
	p12.AddedConnection = p12:Connect("AddObjectShake", (l__CollectionService__3:GetInstanceAddedSignal("WindShake")));
	p12.RemovedConnection = p12:Connect("RemoveObjectShake", (l__CollectionService__3:GetInstanceRemovedSignal("WindShake")));
	for v34, v35 in pairs(l__CollectionService__3:GetTagged("WindShake")) do
		p12:AddObjectShake(v35);
	end;
	p12:Resume();
end;
function v7.Cleanup(p13)
	if not p13.Initialized then
		return;
	end;
	p13:Pause();
	if p13.AddedConnection then
		p13.AddedConnection:Disconnect();
		p13.AddedConnection = nil;
	end;
	if p13.RemovedConnection then
		p13.RemovedConnection:Disconnect();
		p13.RemovedConnection = nil;
	end;
	table.clear(p13.ObjectMetadata);
	p13.Octree:ClearNodes();
	p13.Handled = 0;
	p13.Active = 0;
	p13.Initialized = false;
end;
function v7.UpdateObjectSettings(p14, p15, p16)
	if typeof(p15) ~= "Instance" then
		return;
	end;
	if typeof(p16) ~= "table" then
		return;
	end;
	if not p14.ObjectMetadata[p15] and p15 ~= script then
		return;
	end;
	for v36, v37 in pairs(p16) do
		p15:SetAttribute(v36, v37);
	end;
	v4:Fire(p15);
end;
function v7.UpdateAllObjectSettings(p17, p18)
	if typeof(p18) ~= "table" then
		return;
	end;
	for v38, v39 in pairs(p17.ObjectMetadata) do
		for v40, v41 in pairs(p18) do
			v38:SetAttribute(v40, v41);
		end;
		v4:Fire(v38);
	end;
end;
function v7.SetDefaultSettings(p19, p20)
	p19:UpdateObjectSettings(script, p20);
end;
return v7;

