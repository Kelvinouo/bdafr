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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "EntityHighlightController";
	p1.entityCleanup = {};
end;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.highlight(p3, p4, p5)
	if p5 == nil then
		p5 = {};
	end;
	local v5 = p3.entityCleanup[p4];
	if v5 ~= nil then
		v5:DoCleaning();
	end;
	local v6 = u1.new();
	p3.entityCleanup[p4] = v6;
	local u4 = true;
	v6:GiveTask(function()
		u4 = false;
	end);
	local v7 = {};
	local v8 = {};
	local v9 = #v8;
	local v10 = p4:GetDescendants();
	local v11 = #v10;
	table.move(v10, 1, v11, v9 + 1, v8);
	v8[v9 + v11 + 1] = p4;
	local v12, v13, v14 = ipairs(v8);
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		if v13:IsA("BasePart") and ((not p5.shouldApplyToPart or p5.shouldApplyToPart(v13)) and v13.Transparency ~= 1) then
			local v15, v16, v17 = ipairs(p3:highlightPart(v13, p5.color, p5.textureId));
			while true do
				v15(v16, v17);
				if not v15 then
					break;
				end;
				v17 = v15;
				table.insert(v7, v16);			
			end;
		end;	
	end;
	local v18 = p5.transparency;
	if v18 == nil then
		v18 = 0.4;
	end;
	local v19 = p5.fadeInTime;
	if v19 == nil then
		v19 = 0;
	end;
	local v20 = v19 > 0;
	if v20 then
		local v21 = 1;
	else
		v21 = v18;
	end;
	local u5 = u2("NumberValue", {
		Value = v21
	});
	local function u6()
		local v22, v23, v24 = ipairs(v7);
		while true do
			v22(v23, v24);
			if not v22 then
				break;
			end;
			v24 = v22;
			if not v23.Parent then
				table.remove(v7, (table.find(v7, v23) and 0) - 1 + 1);
			else
				v23.Transparency = u5.Value;
			end;		
		end;
	end;
	local v25 = u5.Changed:Connect(function()
		u6();
	end);
	u6();
	v6:GiveTask(function()
		v25:Disconnect();
		u5:Destroy();
	end);
	task.spawn(function()
		if v20 and u4 then
			local v26 = p5.fadeInTime;
			if v26 == nil then
				v26 = 0;
			end;
			local v27 = l__TweenService__3:Create(u5, TweenInfo.new(v26, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Value = v18
			});
			v27:Play();
			v6:GiveTask(function()
				v27:Cancel();
			end);
			v27.Completed:Wait();
		end;
		if p5.lastsForever then
			return nil;
		end;
		if p5.duration ~= nil and u4 then
			task.wait(p5.duration);
		end;
		if p5.fadeOutTime ~= nil and u4 then
			local v28 = l__TweenService__3:Create(u5, TweenInfo.new(p5.fadeOutTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Value = 1
			});
			v28:Play();
			v6:GiveTask(function()
				v28:Cancel();
			end);
			v28.Completed:Wait();
		elseif p5.fadeOutTime == nil and u4 then
			u5.Value = 1;
		end;
		v6:DoCleaning();
	end);
	return v6;
end;
function v3.highlightPart(p6, p7, p8, p9)
	local v29 = {};
	local v30, v31, v32 = ipairs(Enum.NormalId:GetEnumItems());
	while true do
		v30(v31, v32);
		if not v30 then
			break;
		end;
		local v33 = "entity-highlight-texture:" .. tostring(v31.Value);
		local v34 = p7:FindFirstChild(v33);
		if not v34 then
			v34 = Instance.new("Texture");
			v34.Name = v33;
			v34.Face = v31;
			v34.Parent = p7;
		end;
		local v35 = p9;
		if v35 == nil then
			v35 = "rbxassetid://5090332523";
		end;
		v34.Texture = v35;
		v34.Color3 = p8 or Color3.new(1, 0, 0);
		v34.Transparency = 0.4;
		table.insert(v29, v34);	
	end;
	return v29;
end;
local v36 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
