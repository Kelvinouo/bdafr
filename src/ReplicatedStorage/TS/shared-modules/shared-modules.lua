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
		for v2, v3 in ipairs((p1:GetChildren())) do
			local v4 = u2(v3);
		end;
	end;
end;
return {
	SharedModules = {
		loadGlobalModules = function()
			local v5 = script.Parent;
			if v5 ~= nil then
				v5 = v5:WaitForChild("global"):GetChildren();
			end;
			local v6 = v5;
			if v6 == nil then
				v6 = {};
			end;
			for v7, v8 in ipairs(v6) do
				u2(v8);
			end;
		end, 
		loadGameModules = function(p3)
			local v9 = script.Parent;
			if v9 ~= nil then
				v9 = v9:WaitForChild("game"):GetChildren();
			end;
			local v10 = v9;
			if v10 == nil then
				v10 = {};
			end;
			for v11, v12 in ipairs(v10) do
				u2(v12);
			end;
			local v13 = script.Parent;
			if v13 ~= nil then
				v13 = v13:WaitForChild("games"):WaitForChild(p3):GetChildren();
			end;
			local v14 = v13;
			if v14 == nil then
				v14 = {};
			end;
			for v15, v16 in ipairs(v14) do
				u2(v16);
			end;
		end, 
		loadLobbyModules = function()
			local v17 = script.Parent;
			if v17 ~= nil then
				v17 = v17:WaitForChild("lobby"):GetChildren();
			end;
			local v18 = v17;
			if v18 == nil then
				v18 = {};
			end;
			for v19, v20 in ipairs(v18) do
				u2(v20);
			end;
		end
	}
};
