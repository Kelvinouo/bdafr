
-- Decompiled with the Synapse X Luau decompiler.

local v1 = setmetatable({}, {
	__tostring = function()
		return "DebrisComponent";
	end
});
v1.__index = v1;
function v1.new(...)
	local v2 = setmetatable({}, v1);
	return v2:constructor(...) and v2;
end;
function v1.constructor(p1, p2)
	local v3 = p2:GetAttribute("DestroyAfter");
	if v3 == nil then
		v3 = 300;
	end;
	task.delay(v3, function()
		p2:Destroy();
	end);
end;
function v1.Destroy(p3)

end;
v1.Tag = "DebrisComponent";
return v1;

