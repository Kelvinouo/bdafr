-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Workspace__1 = v2.Workspace;
local l__BlockEngine__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local u3 = nil;
u3 = v1.async(function()
	local l__Blocks__3 = l__Workspace__1:WaitForChild("Map"):WaitForChild("Blocks");
	local v4 = l__Blocks__3:GetChildren()[math.random(#l__Blocks__3:GetChildren() - 1) + 1];
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
local l__RunService__4 = v2.RunService;
local function u5(p1)
	local v9 = l__BlockEngine__2:getStore():getBlockAt(p1 - Vector3.new(0, 1, 0));
	local v10 = false;
	if l__BlockEngine__2:getStore():getBlockAt(p1) == nil then
		v10 = v9 ~= nil;
	end;
	return v10;
end;
return {
	getAboveRandomBlock = u3, 
	getNearbyAboveRandomBlock = v1.async(function(p2, p3, p4)
		if p4 == nil then
			p4 = 3;
		end;
		local v11 = 0;
		local v12 = nil;
		while v12 == nil do
			if p4 <= v11 then
				error("Could not find a block nearby");
			end;
			v11 = v11 + 1;
			local v13 = p2 + Vector3.new(math.random(-p3, p3), math.random(-p3, p3), math.random(-p3, p3));
			if l__BlockEngine__2:getStore():getBlockAt(v13) then
				local v14 = v13 + Vector3.new(0, 1, 0);
				if l__BlockEngine__2:getStore():getBlockAt(v14) == nil then
					v12 = v14;
				end;
			end;
			l__RunService__4.Heartbeat:Wait();		
		end;
		return l__BlockEngine__2:getWorldPosition(v12);
	end), 
	isSurfaceBlock = u5, 
	findSurfacePosition = function(p5, p6)
		if p6 == nil then
			p6 = 10;
		end;
		local function v15(p7)
			local v16 = -1;
			local v17 = false;
			while true do
				if v17 then
					v16 = v16 + 1;
				else
					v17 = true;
				end;
				if not (v16 <= 1) then
					break;
				end;
				local v18 = -1;
				local v19 = false;
				while true do
					if v19 then
						v18 = v18 + 1;
					else
						v19 = true;
					end;
					if not (v18 <= 1) then
						break;
					end;
					local v20 = p5 + Vector3.new(v16, p7 * 3, v18);
					local v21 = l__BlockEngine__2:getBlockPosition(v20);
					local v22 = l__BlockEngine__2:getWorldPosition(v21).Y - 1.5;
					if u5(v21) then
						return Vector3.new(v20.X, v22, v20.Z);
					end;				
				end;			
			end;
			return nil;
		end;
		local v23 = v15(0);
		if v23 then
			return v23;
		end;
		local v24 = 1;
		local v25 = false;
		while true do
			if v25 then
				v24 = v24 + 1;
			else
				v25 = true;
			end;
			if not (v24 <= p6) then
				break;
			end;
			local v26 = v15(-v24);
			if v26 then
				return v26;
			end;
			local v27 = v15(v24);
			if v27 then
				return v27;
			end;		
		end;
		return nil;
	end
};
