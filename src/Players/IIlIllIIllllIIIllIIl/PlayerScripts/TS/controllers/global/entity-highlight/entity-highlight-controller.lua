-- Script Hash: 0d7c5556e15483c54c6bb23ffadb5f4f2c8c89c47cb6fbab14ec2e45b20f59b2891353b8dd6fdf2c6a8f3e21fe6b48a1
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "EntityHighlightController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "EntityHighlightController";
	p1.entityCleanup = {};
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__Maid__2 = v2.Maid;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v4.highlight(p3, p4, p5)
	if p5 == nil then
		p5 = {};
	end;
	local v6 = p3.entityCleanup[p4];
	if v6 ~= nil then
		v6:DoCleaning();
	end;
	local v7 = l__Maid__2.new();
	p3.entityCleanup[p4] = v7;
	local u5 = true;
	v7:GiveTask(function()
		u5 = false;
	end);
	local v8 = {};
	local v9 = {};
	local v10 = #v9;
	local v11 = p4:GetDescendants();
	local v12 = #v11;
	table.move(v11, 1, v12, v10 + 1, v9);
	v9[v10 + v12 + 1] = p4;
	for v13, v14 in ipairs(v9) do
		if v14:IsA("BasePart") and ((not p5.shouldApplyToPart or p5.shouldApplyToPart(v14)) and v14.Transparency ~= 1) then
			for v15, v16 in ipairs(p3:highlightPart(v14, p5.color, p5.textureId)) do
				table.insert(v8, v16);
			end;
		end;
	end;
	local v17 = p5.transparency;
	if v17 == nil then
		v17 = 0.4;
	end;
	local v18 = p5.fadeInTime;
	if v18 == nil then
		v18 = 0;
	end;
	local v19 = v18 > 0;
	if v19 then
		local v20 = 1;
	else
		v20 = v17;
	end;
	local u6 = u3("NumberValue", {
		Value = v20
	});
	local function u7()
		for v21, v22 in ipairs(v8) do
			if not v22.Parent then
				table.remove(v8, (table.find(v8, v22) and 0) - 1 + 1);
			else
				v22.Transparency = u6.Value;
			end;
		end;
	end;
	local v23 = u6.Changed:Connect(function()
		u7();
	end);
	u7();
	v7:GiveTask(function()
		v23:Disconnect();
		u6:Destroy();
	end);
	task.spawn(function()
		if v19 and u5 then
			local v24 = p5.fadeInTime;
			if v24 == nil then
				v24 = 0;
			end;
			local v25 = l__TweenService__4:Create(u6, TweenInfo.new(v24, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Value = v17
			});
			v25:Play();
			v7:GiveTask(function()
				v25:Cancel();
			end);
			v25.Completed:Wait();
		end;
		if p5.lastsForever then
			return nil;
		end;
		if p5.duration ~= nil and u5 then
			task.wait(p5.duration);
		end;
		if p5.fadeOutTime ~= nil and u5 then
			local v26 = l__TweenService__4:Create(u6, TweenInfo.new(p5.fadeOutTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Value = 1
			});
			v26:Play();
			v7:GiveTask(function()
				v26:Cancel();
			end);
			v26.Completed:Wait();
		elseif p5.fadeOutTime == nil and u5 then
			u6.Value = 1;
		end;
		v7:DoCleaning();
	end);
	return v7;
end;
function v4.highlightPart(p6, p7, p8, p9)
	local v27 = {};
	local v28, v29, v30 = ipairs(Enum.NormalId:GetEnumItems());
	while true do
		local v31, v32 = v28(v29, v30);
		if not v31 then
			break;
		end;
		local v33 = "entity-highlight-texture:" .. tostring(v32.Value);
		local v34 = p7:FindFirstChild(v33);
		if not v34 then
			v34 = Instance.new("Texture");
			v34.Name = v33;
			v34.Face = v32;
			v34.Parent = p7;
		end;
		local v35 = p9;
		if v35 == nil then
			v35 = "rbxassetid://5090332523";
		end;
		v34.Texture = v35;
		v34.Color3 = p8 or Color3.new(1, 0, 0);
		v34.Transparency = 0.4;
		table.insert(v27, v34);	
	end;
	return v27;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
