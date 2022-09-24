-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "MarkupUtil";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1)

end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u2 = {
	g = {
		open = "<b><font color=\"rgb(0,255,0)\">", 
		close = "</font></b>"
	}, 
	b = {
		open = "<b><font color=\"rgb(255,0,0)\">", 
		close = "</font></b>"
	}, 
	n = {
		open = "<b>", 
		close = "</b>"
	}
};
function v2.transformMarkup(p2, p3)
	local v4 = u1.keys(u2);
	local u3 = p3;
	local function v5(p4)
		local v6 = u2[p4];
		u3 = string.gsub(u3, "%[" .. tostring(p4) .. "%]", v6.open);
		u3 = string.gsub(u3, "%[%/" .. tostring(p4) .. "%]", v6.close);
	end;
	local v7, v8, v9 = ipairs(v4);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		v5(v8, v7 - 1, v4);	
	end;
	return p3;
end;
function v2.removeMarkup(p5, p6)
	local v10 = u1.keys(u2);
	local u4 = p6;
	local function v11(p7)
		u4 = string.gsub(u4, "%[" .. tostring(p7) .. "%]", "");
		u4 = string.gsub(u4, "%[%/" .. tostring(p7) .. "%]", "");
	end;
	local v12, v13, v14 = ipairs(v10);
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		v11(v13, v12 - 1, v10);	
	end;
	return p6;
end;
return {
	MarkupUtil = v2
};
