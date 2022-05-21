-- Script Hash: 703d38a07a5d86c76ca2ef0654cf419ff00537ddb4c86a52e0d17f50fcd0ae495cbbb3fcdc3ccfd332afd021f7b098b8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
local function u2(p1)
	if p1:IsA("ModuleScript") and u1.endsWith(p1.Name, ".module") then
		v1.try(function()
			require(p1);
		end, function(p2)
			v1.Promise.defer(function()
				error(p2);
			end);
		end);
		return;
	end;
	if p1:IsA("Folder") then
		local v2 = p1:GetChildren();
		local function v3(p3)
			return u2(p3);
		end;
		for v4, v5 in ipairs(v2) do
			v3(v5, v4 - 1, v2);
		end;
	end;
end;
return {
	SharedModules = {
		loadGlobalModules = function()
			local v6 = script.Parent;
			if v6 ~= nil then
				v6 = v6:WaitForChild("global"):GetChildren();
			end;
			local v7 = v6;
			if v7 == nil then
				v7 = {};
			end;
			for v8, v9 in ipairs(v7) do
				u2(v9);
			end;
		end, 
		loadGameModules = function(p4)
			local v10 = script.Parent;
			if v10 ~= nil then
				v10 = v10:WaitForChild("game"):GetChildren();
			end;
			local v11 = v10;
			if v11 == nil then
				v11 = {};
			end;
			for v12, v13 in ipairs(v11) do
				u2(v13);
			end;
			local v14 = script.Parent;
			if v14 ~= nil then
				v14 = v14:WaitForChild("games"):WaitForChild(p4):GetChildren();
			end;
			local v15 = v14;
			if v15 == nil then
				v15 = {};
			end;
			for v16, v17 in ipairs(v15) do
				u2(v17);
			end;
		end, 
		loadLobbyModules = function()
			local v18 = script.Parent;
			if v18 ~= nil then
				v18 = v18:WaitForChild("lobby"):GetChildren();
			end;
			local v19 = v18;
			if v19 == nil then
				v19 = {};
			end;
			for v20, v21 in ipairs(v19) do
				u2(v21);
			end;
		end
	}
};
