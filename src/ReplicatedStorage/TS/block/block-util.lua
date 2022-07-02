-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = nil;
local l__BlockEngine__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__3 = v2.Workspace;
u1 = function(p1)
	local v3 = nil;
	local v4 = l__Workspace__3:WaitForChild("Map"):WaitForChild("Worlds"):GetChildren();
	v3 = {};
	local function v5(p2, p3)
		if p1 and table.find(p1, p3.Name) == nil then
			return p2;
		end;
		for v6, v7 in ipairs((p3.Blocks:GetChildren())) do
			table.insert(p2, v7);
		end;
		return p2;
	end;
	for v8 = 1, #v4 do
		v3 = v5(v3, v4[v8], v8 - 1, v4);
	end;
	return local v9;
end;
local l__RunService__4 = v2.RunService;
local function u5(p4)
	local v10 = l__BlockEngine__2:getStore():getBlockAt(p4 - Vector3.new(0, 1, 0));
	local v11 = false;
	if l__BlockEngine__2:getStore():getBlockAt(p4) == nil then
		v11 = v10 ~= nil;
	end;
	return v11;
end;
return {
	getAboveRandomBlock = v1.async(function(p5)
		local v12 = nil;
		local v13 = u1();
		while true do
			local v14 = v13[math.random(#v13 - 1) + 1];
			local v15 = l__BlockEngine__2:getHandlerRegistry():getHandler(v14.Name);
			if v15 then
				local v16 = v15:getContainedPositions(v14);
				if #v16 > 1 then
					local v17 = v16[math.random(#v16 - 1) + 1];
				else
					v17 = v16[1];
				end;
				v12 = v17;
				while true do
					v12 = v12 + Vector3.new(0, 1, 0);
					if l__BlockEngine__2:getStore():getBlockAt(v12) == nil then
						break;
					end;				
				end;
				if not p5 then
					break;
				end;
				local v18 = l__BlockEngine__2:getHandlerRegistry():getHandler(p5);
				if v18 ~= nil then
					v18 = v18:getPlacementPositions(v12, 0);
				end;
				local v19 = v18;
				if v19 == nil then
					v19 = {};
				end;
				local v20 = true;
				for v21, v22 in ipairs(v19) do
					if l__BlockEngine__2:getStore():getBlockAt(v22) then
						v20 = false;
						break;
					end;
				end;
				if v20 then
					break;
				end;
			end;		
		end;
		return l__BlockEngine__2:getWorldPosition(v12);
	end), 
	getAllMapBlocks = u1, 
	getNearbyAboveRandomBlock = v1.async(function(p6, p7, p8)
		if p8 == nil then
			p8 = 3;
		end;
		local v23 = 0;
		local v24 = nil;
		while v24 == nil do
			if p8 <= v23 then
				error("Could not find a block nearby");
			end;
			v23 = v23 + 1;
			local v25 = p6 + Vector3.new(math.random(-p7, p7), math.random(-p7, p7), math.random(-p7, p7));
			if l__BlockEngine__2:getStore():getBlockAt(v25) then
				local v26 = v25 + Vector3.new(0, 1, 0);
				if l__BlockEngine__2:getStore():getBlockAt(v26) == nil then
					v24 = v26;
				end;
			end;
			l__RunService__4.Heartbeat:Wait();		
		end;
		return l__BlockEngine__2:getWorldPosition(v24);
	end), 
	isSurfaceBlock = u5, 
	findSurfacePosition = function(p9, p10)
		if p10 == nil then
			p10 = 10;
		end;
		local function v27(p11)
			local v28 = -1;
			local v29 = false;
			while true do
				if v29 then
					v28 = v28 + 1;
				else
					v29 = true;
				end;
				if not (v28 <= 1) then
					break;
				end;
				local v30 = -1;
				local v31 = false;
				while true do
					if v31 then
						v30 = v30 + 1;
					else
						v31 = true;
					end;
					if not (v30 <= 1) then
						break;
					end;
					local v32 = p9 + Vector3.new(v28, p11 * 3, v30);
					local v33 = l__BlockEngine__2:getBlockPosition(v32);
					local v34 = l__BlockEngine__2:getWorldPosition(v33).Y - 1.5;
					if u5(v33) then
						return Vector3.new(v32.X, v34, v32.Z);
					end;				
				end;			
			end;
			return nil;
		end;
		local v35 = v27(0);
		if v35 then
			return v35;
		end;
		local v36 = 1;
		local v37 = false;
		while true do
			if v37 then
				v36 = v36 + 1;
			else
				v37 = true;
			end;
			if not (v36 <= p10) then
				break;
			end;
			local v38 = v27(-v36);
			if v38 then
				return v38;
			end;
			local v39 = v27(v36);
			if v39 then
				return v39;
			end;		
		end;
		return nil;
	end
};
