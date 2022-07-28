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
return {
	getAboveRandomBlock = v1.async(function(p4)
		local v10 = nil;
		local v11 = u1();
		while true do
			local v12 = v11[math.random(#v11 - 1) + 1];
			local v13 = l__BlockEngine__2:getHandlerRegistry():getHandler(v12.Name);
			if v13 then
				local v14 = v13:getContainedPositions(v12);
				if #v14 > 1 then
					local v15 = v14[math.random(#v14 - 1) + 1];
				else
					v15 = v14[1];
				end;
				v10 = v15;
				while true do
					v10 = v10 + Vector3.new(0, 1, 0);
					if l__BlockEngine__2:getStore():getBlockAt(v10) == nil then
						break;
					end;				
				end;
				if not p4 then
					break;
				end;
				local v16 = l__BlockEngine__2:getHandlerRegistry():getHandler(p4);
				if v16 ~= nil then
					v16 = v16:getPlacementPositions(v10, 0);
				end;
				local v17 = v16;
				if v17 == nil then
					v17 = {};
				end;
				local v18 = true;
				for v19, v20 in ipairs(v17) do
					if l__BlockEngine__2:getStore():getBlockAt(v20) then
						v18 = false;
						break;
					end;
				end;
				if v18 then
					break;
				end;
			end;		
		end;
		return l__BlockEngine__2:getWorldPosition(v10);
	end), 
	getAllMapBlocks = u1, 
	getNearbyAboveRandomBlock = v1.async(function(p5, p6, p7)
		if p7 == nil then
			p7 = 3;
		end;
		local v21 = 0;
		local v22 = nil;
		while v22 == nil do
			if p7 <= v21 then
				error("Could not find a block nearby");
			end;
			v21 = v21 + 1;
			local v23 = p5 + Vector3.new(math.random(-p6, p6), math.random(-p6, p6), math.random(-p6, p6));
			if l__BlockEngine__2:getStore():getBlockAt(v23) then
				local v24 = v23 + Vector3.new(0, 1, 0);
				if l__BlockEngine__2:getStore():getBlockAt(v24) == nil then
					v22 = v24;
				end;
			end;
			l__RunService__4.Heartbeat:Wait();		
		end;
		return l__BlockEngine__2:getWorldPosition(v22);
	end), 
	isSurfaceBlock = function(p8)
		local v25 = l__BlockEngine__2:getStore():getBlockAt(p8 - Vector3.new(0, 1, 0));
		local v26 = false;
		if l__BlockEngine__2:getStore():getBlockAt(p8) == nil then
			v26 = v25 ~= nil;
		end;
		return v26;
	end, 
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
					local v35 = l__BlockEngine__2:getStore():getBlockAt(v33 - Vector3.new(0, 1, 0));
					local v36 = false;
					if l__BlockEngine__2:getStore():getBlockAt(v33) == nil then
						v36 = v35 ~= nil;
					end;
					if v36 then
						return Vector3.new(v32.X, v34, v32.Z);
					end;				
				end;			
			end;
			return nil;
		end;
		local v37 = v27(0);
		if v37 then
			return v37;
		end;
		local v38 = 1;
		local v39 = false;
		while true do
			if v39 then
				v38 = v38 + 1;
			else
				v39 = true;
			end;
			if not (v38 <= p10) then
				break;
			end;
			local v40 = v27(-v38);
			if v40 then
				return v40;
			end;
			local v41 = v27(v38);
			if v41 then
				return v41;
			end;		
		end;
		return nil;
	end
};
