-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local l__default__1 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
v2.tweenModelSize = v1.async(function(p1, p2, p3, p4)
	local v3 = p1:GetDescendants();
	local function v4(p5)
		if not p5:IsA("BasePart") then
			return;
		end;
		return { p5, {
				size = p5.Size, 
				position = p5.Position
			} };
	end;
	local v5 = {};
	local v6 = 0;
	local v7, v8, v9 = ipairs(v3);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		local v10 = v4(v8, v7 - 1, v3);
		if v10 ~= nil then
			v6 = v6 + 1;
			v5[v6] = v10;
		end;	
	end;
	local v11 = {};
	local v12, v13, v14 = ipairs(v5);
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		v11[v13[1]] = v13[2];	
	end;
	local l__Position__3 = p1:GetPrimaryPartCFrame().Position;
	l__default__1(p2, p3, function(p6)
		local v15, v16, v17 = ipairs(p1:GetDescendants());
		while true do
			v15(v16, v17);
			if not v15 then
				break;
			end;
			v17 = v15;
			if v16:IsA("BasePart") then
				local v18 = v11[v16];
				if v18 ~= nil then
					local v19 = l__Linear__2(p6, 1, p4 - 1, 1);
					v16.Position = l__Position__3:Lerp(v18.position, v19);
					v16.Size = v18.size * v19;
				end;
			end;		
		end;
	end, 0, 1):Wait();
end);
return {
	ModelUtil = v2
};
