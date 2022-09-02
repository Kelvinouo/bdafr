-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = nil;
local l__BlockEngine__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__3 = v2.Workspace;
u1 = function(p1)
	local v3 = nil;
	local v4 = l__Workspace__3:WaitForChild("Map"):WaitForChild("Worlds"):GetChildren();
	local function v5(p2, p3)
		if p1 and table.find(p1, p3.Name) == nil then
			return p2;
		end;
		local v6, v7, v8 = ipairs((p3.Blocks:GetChildren()));
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
			table.insert(p2, v7);		
		end;
		return p2;
	end;
	v3 = {};
	for v9 = 1, #v4 do
		v3 = v5(v3, v4[v9], v9 - 1, v4);
	end;
	return local v10;
end;
local l__RunService__4 = v2.RunService;
return {
	getAboveRandomBlock = v1.async(function(p4)
		local v11 = nil;
		local v12 = u1();
		while true do
			local v13 = v12[math.random(#v12 - 1) + 1];
			local v14 = l__BlockEngine__2:getHandlerRegistry():getHandler(v13.Name);
			if v14 then
				local v15 = v14:getContainedPositions(v13);
				if #v15 > 1 then
					local v16 = v15[math.random(#v15 - 1) + 1];
				else
					v16 = v15[1];
				end;
				v11 = v16;
				while true do
					v11 = v11 + Vector3.new(0, 1, 0);
					if l__BlockEngine__2:getStore():getBlockAt(v11) == nil then
						break;
					end;				
				end;
				if not p4 then
					break;
				end;
				local v17 = l__BlockEngine__2:getHandlerRegistry():getHandler(p4);
				if v17 ~= nil then
					v17 = v17:getPlacementPositions(v11, 0);
				end;
				local v18 = v17;
				if v18 == nil then
					v18 = {};
				end;
				local v19 = true;
				local v20, v21, v22 = ipairs(v18);
				while true do
					v20(v21, v22);
					if not v20 then
						break;
					end;
					v22 = v20;
					if l__BlockEngine__2:getStore():getBlockAt(v21) then
						v19 = false;
						break;
					end;				
				end;
				if v19 then
					break;
				end;
			end;		
		end;
		return l__BlockEngine__2:getWorldPosition(v11);
	end), 
	getAllMapBlocks = u1, 
	getNearbyAboveRandomBlock = v1.async(function(p5, p6, p7)
		if p7 == nil then
			p7 = 3;
		end;
		local v23 = 0;
		local v24 = nil;
		while v24 == nil do
			if p7 <= v23 then
				error("Could not find a block nearby");
			end;
			v23 = v23 + 1;
			local v25 = p5 + Vector3.new(math.random(-p6, p6), math.random(-p6, p6), math.random(-p6, p6));
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
	isSurfaceBlock = function(p8)
		local v27 = l__BlockEngine__2:getStore():getBlockAt(p8 - Vector3.new(0, 1, 0));
		local v28 = false;
		if l__BlockEngine__2:getStore():getBlockAt(p8) == nil then
			v28 = v27 ~= nil;
		end;
		return v28;
	end, 
	findSurfacePosition = function(p9, p10)
		if p10 == nil then
			p10 = 10;
		end;
		local function v29(p11)
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
				local v32 = -1;
				local v33 = false;
				while true do
					if v33 then
						v32 = v32 + 1;
					else
						v33 = true;
					end;
					if not (v32 <= 1) then
						break;
					end;
					local v34 = p9 + Vector3.new(v30, p11 * 3, v32);
					local v35 = l__BlockEngine__2:getBlockPosition(v34);
					local v36 = l__BlockEngine__2:getWorldPosition(v35).Y - 1.5;
					local v37 = l__BlockEngine__2:getStore():getBlockAt(v35 - Vector3.new(0, 1, 0));
					local v38 = false;
					if l__BlockEngine__2:getStore():getBlockAt(v35) == nil then
						v38 = v37 ~= nil;
					end;
					if v38 then
						return Vector3.new(v34.X, v36, v34.Z);
					end;				
				end;			
			end;
			return nil;
		end;
		local v39 = v29(0);
		if v39 then
			return v39;
		end;
		local v40 = 1;
		local v41 = false;
		while true do
			if v41 then
				v40 = v40 + 1;
			else
				v41 = true;
			end;
			if not (v40 <= p10) then
				break;
			end;
			local v42 = v29(-v40);
			if v42 then
				return v42;
			end;
			local v43 = v29(v40);
			if v43 then
				return v43;
			end;		
		end;
		return nil;
	end
};
