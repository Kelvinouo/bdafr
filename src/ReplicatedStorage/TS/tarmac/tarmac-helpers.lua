-- Script Hash: 3bfcd11e539becc211dcda8ee1b7d86daf43333e6196d71dfb8f78ed51500ac1f393745055a168c478860086b476309d
-- Decompiled with the Synapse X Luau decompiler.

local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac");
return {
	GetTarmacAsset = function(p1, p2)
		if p2 == nil then
			p2 = u1;
		end;
		local v1 = p2[p1];
		if not v1 then
			error(string.format("No asset by name %s", p1));
		end;
		if type(v1) == "string" then
			return {
				Image = v1
			};
		end;
		if type(v1) ~= "function" then
			return v1;
		end;
		return v1(2);
	end, 
	GetTarmacAssetFromPath = function(p3)
		local v2 = u1;
		for v3, v4 in ipairs(p3) do
			v2 = v2[v4];
		end;
		return v2;
	end
};
