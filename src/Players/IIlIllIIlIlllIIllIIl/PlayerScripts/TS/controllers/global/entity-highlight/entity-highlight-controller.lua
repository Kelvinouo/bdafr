-- Script Hash: 48aa9af57d117c40b274a7d39cb1be4beb36bab9d1241283dc768e2c8ed35564fcc744a15fd3301d18f0ccb331040c7b
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "EntityHighlightController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "EntityHighlightController";
	p1.entityCleanup = {};
end;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.highlight(p3, p4, p5)
	if p5 == nil then
		p5 = {};
	end;
	local v5 = p3.entityCleanup[p4];
	if v5 ~= nil then
		v5:DoCleaning();
	end;
	local v6 = u2.new();
	p3.entityCleanup[p4] = v6;
	local u5 = true;
	v6:GiveTask(function()
		u5 = false;
	end);
	local v7 = {};
	local v8 = {};
	local v9 = #v8;
	local v10 = p4:GetDescendants();
	local v11 = #v10;
	table.move(v10, 1, v11, v9 + 1, v8);
	v8[v9 + v11 + 1] = p4;
	for v12, v13 in ipairs(v8) do
		if v13:IsA("BasePart") and ((not p5.shouldApplyToPart or p5.shouldApplyToPart(v13)) and v13.Transparency ~= 1) then
			for v14, v15 in ipairs(p3:highlightPart(v13, p5.color, p5.textureId)) do
				table.insert(v7, v15);
			end;
		end;
	end;
	local v16 = p5.transparency;
	if v16 == nil then
		v16 = 0.4;
	end;
	local v17 = p5.fadeInTime;
	if v17 == nil then
		v17 = 0;
	end;
	local v18 = v17 > 0;
	if v18 then
		local v19 = 1;
	else
		v19 = v16;
	end;
	local u6 = u3("NumberValue", {
		Value = v19
	});
	local function u7()
		for v20, v21 in ipairs(v7) do
			if not v21.Parent then
				table.remove(v7, (table.find(v7, v21) and 0) - 1 + 1);
			else
				v21.Transparency = u6.Value;
			end;
		end;
	end;
	local v22 = u6.Changed:Connect(function()
		u7();
	end);
	u7();
	v6:GiveTask(function()
		v22:Disconnect();
		u6:Destroy();
	end);
	task.spawn(function()
		if v18 and u5 then
			local v23 = p5.fadeInTime;
			if v23 == nil then
				v23 = 0;
			end;
			local v24 = l__TweenService__4:Create(u6, TweenInfo.new(v23, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Value = v16
			});
			v24:Play();
			v6:GiveTask(function()
				v24:Cancel();
			end);
			v24.Completed:Wait();
		end;
		if p5.lastsForever then
			return nil;
		end;
		if p5.duration ~= nil and u5 then
			task.wait(p5.duration);
		end;
		if p5.fadeOutTime ~= nil and u5 then
			local v25 = l__TweenService__4:Create(u6, TweenInfo.new(p5.fadeOutTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Value = 1
			});
			v25:Play();
			v6:GiveTask(function()
				v25:Cancel();
			end);
			v25.Completed:Wait();
		elseif p5.fadeOutTime == nil and u5 then
			u6.Value = 1;
		end;
		v6:DoCleaning();
	end);
	return v6;
end;
function v3.highlightPart(p6, p7, p8, p9)
	local v26 = {};
	local v27, v28, v29 = ipairs(Enum.NormalId:GetEnumItems());
	while true do
		local v30, v31 = v27(v28, v29);
		if not v30 then
			break;
		end;
		local v32 = "entity-highlight-texture:" .. tostring(v31.Value);
		local v33 = p7:FindFirstChild(v32);
		if not v33 then
			v33 = Instance.new("Texture");
			v33.Name = v32;
			v33.Face = v31;
			v33.Parent = p7;
		end;
		local v34 = p9;
		if v34 == nil then
			v34 = "rbxassetid://5090332523";
		end;
		v33.Texture = v34;
		v33.Color3 = p8 or Color3.new(1, 0, 0);
		v33.Transparency = 0.4;
		table.insert(v26, v33);	
	end;
	return v26;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
