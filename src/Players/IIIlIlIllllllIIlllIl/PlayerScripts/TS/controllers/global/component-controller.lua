-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "ComponentController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "ComponentController";
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src.Knit.Util.Component);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "inspect").inspect);
function u1.KnitStart(p2)
	local v5 = script.Parent;
	if v5 ~= nil then
		v5 = v5.Parent;
		if v5 ~= nil then
			v5 = v5.Parent;
			if v5 ~= nil then
				v5 = v5:WaitForChild("components");
			end;
		end;
	end;
	if not v5 then
		error("No components folder");
	end;
	for v6, v7 in ipairs(v5:GetDescendants()) do
		local u5 = 0;
		local v8, v9 = v1.try(function()
			if not v7:IsA("ModuleScript") then
				return v1.TRY_CONTINUE;
			end;
			local v10 = string.find(v7.Name, "-component");
			if v10 == 0 or v10 ~= v10 or not v10 then
				return v1.TRY_CONTINUE;
			end;
			local v11 = require(v7);
			local v12 = v11.Tag;
			if v12 == "" or not v12 then
				v12 = v7.Name;
			end;
			u3.new(v12, v11);
			u5 = u5 + 1;
		end, function(p3)
			print("Error registering component:", u4(p3));
		end);
		if not v8 then

		end;
	end;
	print("[Knit Client] Registered " .. tostring(0) .. " components in " .. tostring((math.floor(os.clock() - os.clock()))) .. "ms");
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ComponentController = u2
};
return u1;
