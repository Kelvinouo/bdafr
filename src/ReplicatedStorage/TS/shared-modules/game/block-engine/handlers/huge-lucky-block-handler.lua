-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out);
local l__PrefabBlockHandler__3 = v2.PrefabBlockHandler;
local v4 = setmetatable({}, {
	__tostring = function()
		return "HugeLuckyBlockHandler";
	end, 
	__index = l__PrefabBlockHandler__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, ...)
	l__PrefabBlockHandler__3.constructor(p1, ...);
end;
function v4.getPlacementPositions(p2, p3, p4)
	local v6 = {};
	local v7 = 0;
	local v8 = false;
	while true do
		if v8 then
			v7 = v7 + 1;
		else
			v8 = true;
		end;
		if not (v7 < 2) then
			break;
		end;
		local v9 = 0;
		local v10 = false;
		while true do
			if v10 then
				v9 = v9 + 1;
			else
				v10 = true;
			end;
			if not (v9 < 2) then
				break;
			end;
			local v11 = 0;
			local v12 = false;
			while true do
				if v12 then
					v11 = v11 + 1;
				else
					v12 = true;
				end;
				if not (v11 < 2) then
					break;
				end;
				table.insert(v6, p3 + Vector3.new(v7, v9, v11));			
			end;		
		end;	
	end;
	return v6;
end;
local l__BlockEngine__1 = v2.BlockEngine;
function v4.getContainedPositions(p5, p6)
	local v13 = l__BlockEngine__1:getBlockPosition(p6.Position);
	local v14 = {};
	local v15 = 0;
	local v16 = false;
	while true do
		if v16 then
			v15 = v15 + 1;
		else
			v16 = true;
		end;
		if not (v15 < 2) then
			break;
		end;
		local v17 = 0;
		local v18 = false;
		while true do
			if v18 then
				v17 = v17 + 1;
			else
				v18 = true;
			end;
			if not (v17 < 2) then
				break;
			end;
			local v19 = 0;
			local v20 = false;
			while true do
				if v20 then
					v19 = v19 + 1;
				else
					v20 = true;
				end;
				if not (v19 < 2) then
					break;
				end;
				table.insert(v14, v13 + Vector3.new(v15, v17, v19));			
			end;		
		end;	
	end;
	return v14;
end;
return {
	HugeLuckyBlockHandler = v4
};
