-- Script Hash: e84ed264f4703ae320c22bc32b5c030a8952b366483bf8ec6be925ff6537f82e4f6f4ca3b61cd97e7118927b4772617d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = nil;
local l__BlockEngine__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local u3 = nil;
u3 = v1.async(function()
	local v3 = u1();
	local v4 = v3[math.random(#v3 - 1) + 1];
	local v5 = l__BlockEngine__2:getHandlerRegistry():getHandler(v4.Name);
	if not v5 then
		return v1.await(u3());
	end;
	local v6 = v5:getContainedPositions(v4);
	if #v6 > 1 then
		local v7 = v6[math.random(#v6 - 1) + 1];
	else
		v7 = v6[1];
	end;
	local v8 = v7;
	while true do
		v8 = v8 + Vector3.new(0, 1, 0);
		if l__BlockEngine__2:getStore():getBlockAt(v8) == nil then
			break;
		end;	
	end;
	return l__BlockEngine__2:getWorldPosition(v8);
end);
local l__Workspace__4 = v2.Workspace;
u1 = function(p1)
	local v9 = nil;
	local v10 = l__Workspace__4:WaitForChild("Map"):WaitForChild("Worlds"):GetChildren();
	v9 = {};
	local function v11(p2, p3)
		if p1 and table.find(p1, p3.Name) == nil then
			return p2;
		end;
		local v12 = p3.Blocks:GetChildren();
		local function v13(p4)
			table.insert(p2, p4);
		end;
		for v14, v15 in ipairs(v12) do
			v13(v15, v14 - 1, v12);
		end;
		return p2;
	end;
	for v16 = 1, #v10 do
		v9 = v11(v9, v10[v16], v16 - 1, v10);
	end;
	return local v17;
end;
local l__RunService__5 = v2.RunService;
local function u6(p5)
	local v18 = l__BlockEngine__2:getStore():getBlockAt(p5 - Vector3.new(0, 1, 0));
	local v19 = false;
	if l__BlockEngine__2:getStore():getBlockAt(p5) == nil then
		v19 = v18 ~= nil;
	end;
	return v19;
end;
return {
	getAboveRandomBlock = u3, 
	getAllMapBlocks = u1, 
	getNearbyAboveRandomBlock = v1.async(function(p6, p7, p8)
		if p8 == nil then
			p8 = 3;
		end;
		local v20 = 0;
		local v21 = nil;
		while v21 == nil do
			if p8 <= v20 then
				error("Could not find a block nearby");
			end;
			v20 = v20 + 1;
			local v22 = p6 + Vector3.new(math.random(-p7, p7), math.random(-p7, p7), math.random(-p7, p7));
			if l__BlockEngine__2:getStore():getBlockAt(v22) then
				local v23 = v22 + Vector3.new(0, 1, 0);
				if l__BlockEngine__2:getStore():getBlockAt(v23) == nil then
					v21 = v23;
				end;
			end;
			l__RunService__5.Heartbeat:Wait();		
		end;
		return l__BlockEngine__2:getWorldPosition(v21);
	end), 
	isSurfaceBlock = u6, 
	findSurfacePosition = function(p9, p10)
		if p10 == nil then
			p10 = 10;
		end;
		local function v24(p11)
			local v25 = -1;
			local v26 = false;
			while true do
				if v26 then
					v25 = v25 + 1;
				else
					v26 = true;
				end;
				if not (v25 <= 1) then
					break;
				end;
				local v27 = -1;
				local v28 = false;
				while true do
					if v28 then
						v27 = v27 + 1;
					else
						v28 = true;
					end;
					if not (v27 <= 1) then
						break;
					end;
					local v29 = p9 + Vector3.new(v25, p11 * 3, v27);
					local v30 = l__BlockEngine__2:getBlockPosition(v29);
					local v31 = l__BlockEngine__2:getWorldPosition(v30).Y - 1.5;
					if u6(v30) then
						return Vector3.new(v29.X, v31, v29.Z);
					end;				
				end;			
			end;
			return nil;
		end;
		local v32 = v24(0);
		if v32 then
			return v32;
		end;
		local v33 = 1;
		local v34 = false;
		while true do
			if v34 then
				v33 = v33 + 1;
			else
				v34 = true;
			end;
			if not (v33 <= p10) then
				break;
			end;
			local v35 = v24(-v33);
			if v35 then
				return v35;
			end;
			local v36 = v24(v33);
			if v36 then
				return v36;
			end;		
		end;
		return nil;
	end
};
