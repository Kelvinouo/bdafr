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
		local v2, v3, v4 = ipairs((p1:GetChildren()));
		while true do
			v2(v3, v4);
			if not v2 then
				break;
			end;
			v4 = v2;
			local v5 = u2(v3);		
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
			local v8, v9, v10 = ipairs(v7);
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				v10 = v8;
				u2(v9);			
			end;
		end, 
		loadGameModules = function(p3)
			local v11 = script.Parent;
			if v11 ~= nil then
				v11 = v11:WaitForChild("game"):GetChildren();
			end;
			local v12 = v11;
			if v12 == nil then
				v12 = {};
			end;
			local v13, v14, v15 = ipairs(v12);
			while true do
				v13(v14, v15);
				if not v13 then
					break;
				end;
				v15 = v13;
				u2(v14);			
			end;
			local v16 = script.Parent;
			if v16 ~= nil then
				v16 = v16:WaitForChild("games"):WaitForChild(p3):GetChildren();
			end;
			local v17 = v16;
			if v17 == nil then
				v17 = {};
			end;
			local v18, v19, v20 = ipairs(v17);
			while true do
				v18(v19, v20);
				if not v18 then
					break;
				end;
				v20 = v18;
				u2(v19);			
			end;
		end, 
		loadLobbyModules = function()
			local v21 = script.Parent;
			if v21 ~= nil then
				v21 = v21:WaitForChild("lobby"):GetChildren();
			end;
			local v22 = v21;
			if v22 == nil then
				v22 = {};
			end;
			local v23, v24, v25 = ipairs(v22);
			while true do
				v23(v24, v25);
				if not v23 then
					break;
				end;
				v25 = v23;
				u2(v24);			
			end;
		end
	}
};
