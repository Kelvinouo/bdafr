-- Script Hash: 548992d12c935430f747accfed5ad654ba47cba3fbf5381fc26823c6e4c9f269109b4e8711573bec6444c1455ac120f0
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
	for v7, v8 in ipairs(v3) do
		local v9 = v4(v8, v7 - 1, v3);
		if v9 ~= nil then
			v6 = v6 + 1;
			v5[v6] = v9;
		end;
	end;
	local v10 = {};
	for v11, v12 in ipairs(v5) do
		v10[v12[1]] = v12[2];
	end;
	local l__Position__3 = p1:GetPrimaryPartCFrame().Position;
	l__default__1(p2, p3, function(p6)
		for v13, v14 in ipairs(p1:GetDescendants()) do
			if v14:IsA("BasePart") then
				local v15 = v10[v14];
				if v15 ~= nil then
					local v16 = l__Linear__2(p6, 1, p4 - 1, 1);
					v14.Position = l__Position__3:Lerp(v15.position, v16);
					v14.Size = v15.size * v16;
				end;
			end;
		end;
	end, 0, 1):Wait();
end);
return {
	ModelUtil = v2
};
