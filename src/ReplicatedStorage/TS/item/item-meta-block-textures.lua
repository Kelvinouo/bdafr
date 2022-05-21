-- Script Hash: 6b5bb79fe4322886e35e08544dcecfa810daeeeede17002de32e1aec3f580757cb5038216d1d55ddeae558d73a517146
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__GetTarmacAssetFromPath__2 = v2.GetTarmacAssetFromPath;
local l__GetTarmacAsset__3 = v2.GetTarmacAsset;
local u4 = {
	t = 0, 
	d = 1, 
	l = 2, 
	f = 3, 
	r = 4, 
	b = 5
};
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
return {
	SetupItemMetaBlockTextures = function(p1)
		for v3, v4 in ipairs(u1.entries(p1)) do
			local v5 = v4[2];
			local v6 = l__GetTarmacAssetFromPath__2({ "blocks", v4[1] });
			if v6 then
				local v7 = {};
				local v8 = 0;
				local v9 = false;
				while true do
					if v9 then
						v8 = v8 + 1;
					else
						v9 = true;
					end;
					if not (v8 < 6) then
						break;
					end;
					table.insert(v7, "");				
				end;
				local v10, v11, v12 = ipairs(u1.keys(v6));
				while true do
					local v13, v14 = v10(v11, v12);
					if not v13 then
						break;
					end;
					local l__image__15 = v5.image;
					local v16 = false;
					if l__image__15 ~= "" then
						v16 = l__image__15;
					end;
					local v17 = not v16 and v14 == "icon";
					if v17 then
						v5.image = l__GetTarmacAsset__3(v14, v6).Image;
					elseif v14 == "s" then
						local l__Image__18 = l__GetTarmacAsset__3(v14, v6).Image;
						local v19 = 0;
						local v20 = false;
						while true do
							if v20 then
								v19 = v19 + 1;
							else
								v20 = true;
							end;
							if not (v19 < #v7) then
								break;
							end;
							if v7[v19 + 1] == "" then
								v7[v19 + 1] = l__Image__18;
							end;						
						end;
					elseif type(v14) == "string" then
						local l__Image__21 = l__GetTarmacAsset__3(v14, v6).Image;
						for v22, v23 in ipairs(u1.keys(u4)) do
							if u5.includes(v14, v23) then
								v7[u4[v23] + 1] = l__Image__21;
							end;
						end;
					end;				
				end;
				if v5.block and v5.block.greedyMesh and not (#v5.block.greedyMesh.textures > 0) then
					v5.block.greedyMesh.textures = v7;
				end;
			end;
		end;
		for v24, v25 in ipairs(u1.entries(p1)) do
			local v26 = v25[2];
			if v26.block and v26.block.greedyMesh and #v26.block.greedyMesh.textures == 0 then
				print("Missing block texture for: " .. v25[1]);
			end;
		end;
	end
};
