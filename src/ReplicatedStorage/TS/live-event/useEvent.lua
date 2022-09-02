-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__useEffect__2 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src.Runtime).useEffect;
local l__Queue__3 = v1.import(script, v1.getModule(script, "@rbxts", "datastructures").out).Queue;
return {
	useEvent = function(p1, p2)
		u1.useKey(p1);
		local v2, v3 = u1.useState(nil);
		l__useEffect__2(function()
			return function()
				local v4 = v2;
				if v4 ~= nil then
					v4 = v4.connection;
				end;
				if v4 then
					local v5 = v2.connection;
					if v5 ~= nil then
						v5 = v5.Destroy;
					end;
					if v5 ~= nil then
						v2.connection:Destroy();
						return;
					end;
					local v6 = v2.connection;
					if v6 ~= nil then
						v6 = v6.destroy;
					end;
					if v6 ~= nil then
						v2.connection:destroy();
						return;
					end;
					local v7 = v2.connection;
					if v7 ~= nil then
						v7 = v7.Disconnect;
					end;
					if v7 ~= nil then
						v2.connection:Disconnect();
						return;
					end;
					local v8 = v2.connection;
					if v8 ~= nil then
						v8 = v8.disconnect;
					end;
					if v8 ~= nil then
						v2.connection:disconnect();
					end;
				end;
			end;
		end);
		if v2 == nil then
			local v9 = nil;
			local u4 = l__Queue__3.new();
			v9 = function(...)
				u4:Push({ ... });
			end;
			local v10 = nil;
			if p2.Connect ~= nil then
				v10 = p2:Connect(v9);
			elseif p2.connect ~= nil then
				v10 = p2:connect(v9);
			elseif p2.on ~= nil then
				v10 = p2:on(v9);
			else
				error("Could not connect");
			end;
			v3({
				queue = u4, 
				connection = v10
			});
		end;
		return function()
			local v11 = v2;
			if v11 ~= nil then
				v11 = v11.queue;
			end;
			if not v11 then
				return;
			end;
			return v2.queue:Pop();
		end;
	end
};
