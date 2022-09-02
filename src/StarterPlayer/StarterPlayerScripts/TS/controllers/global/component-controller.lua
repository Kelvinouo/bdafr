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
function u1.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "ComponentController";
end;
local l__Component__2 = v2.Component;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "inspect").inspect);
function u1.KnitStart(p2)
	local v6 = os.clock();
	local v7 = script.Parent;
	if v7 ~= nil then
		v7 = v7.Parent;
		if v7 ~= nil then
			v7 = v7.Parent;
			if v7 ~= nil then
				v7 = v7:WaitForChild("components");
			end;
		end;
	end;
	if not v7 then
		error("No components folder");
	end;
	local v8, v9, v10 = ipairs(v7:GetDescendants());
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		local u4 = 0;
		local v11, v12 = v1.try(function()
			if not v9:IsA("ModuleScript") then
				return v1.TRY_CONTINUE;
			end;
			local v13 = string.find(v9.Name, "-component");
			if v13 == 0 or v13 ~= v13 or not v13 then
				return v1.TRY_CONTINUE;
			end;
			local v14 = require(v9);
			local v15 = v14.Tag;
			if v15 == "" or not v15 then
				v15 = v9.Name;
			end;
			l__Component__2.new(v15, v14);
			u4 = u4 + 1;
		end, function(p3)
			print("Error registering component:", u3(p3));
		end);
		if not v11 then

		end;	
	end;
	print("[Knit Client] Registered " .. tostring(0) .. " components in " .. tostring((math.floor(os.clock() - v6))) .. "ms");
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(u1.new());
return {
	ComponentController = u1
};
