-- Script Hash: 982c7525df09dedfc673fb05fe3a609459b9e5b919213b21905222f976c2c33fdf708e788a51608169c86f04798c63ce
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ComponentController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "ComponentController";
end;
local l__Component__3 = v2.Component;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "inspect").inspect);
function u1.KnitStart(p2)
	local v6 = script.Parent;
	if v6 ~= nil then
		v6 = v6.Parent;
		if v6 ~= nil then
			v6 = v6.Parent;
			if v6 ~= nil then
				v6 = v6:WaitForChild("components");
			end;
		end;
	end;
	if not v6 then
		error("No components folder");
	end;
	for v7, v8 in ipairs(v6:GetDescendants()) do
		local u5 = 0;
		local v9, v10 = v1.try(function()
			if not v8:IsA("ModuleScript") then
				return v1.TRY_CONTINUE;
			end;
			local v11 = string.find(v8.Name, "-component");
			if v11 == 0 or v11 ~= v11 or not v11 then
				return v1.TRY_CONTINUE;
			end;
			local v12 = require(v8);
			local v13 = v12.Tag;
			if v13 == "" or not v13 then
				v13 = v8.Name;
			end;
			l__Component__3.new(v13, v12);
			u5 = u5 + 1;
		end, function(p3)
			print("Error registering component:", u4(p3));
		end);
		if not v9 then

		end;
	end;
	print("[Knit Client] Registered " .. tostring(0) .. " components in " .. tostring((math.floor(os.clock() - os.clock()))) .. "ms");
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ComponentController = u2
};
return u1;
