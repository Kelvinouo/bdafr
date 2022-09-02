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
		local v3, v4, v5 = ipairs(u1.entries(p1));
		while true do
			v3(v4, v5);
			if not v3 then
				break;
			end;
			v5 = v3;
			local v6 = v4[2];
			local v7 = l__GetTarmacAssetFromPath__2({ "blocks", v4[1] });
			if v7 then
				local v8 = {};
				local v9 = 0;
				local v10 = false;
				while true do
					if v10 then
						v9 = v9 + 1;
					else
						v10 = true;
					end;
					if not (v9 < 6) then
						break;
					end;
					table.insert(v8, "");				
				end;
				local v11, v12, v13 = ipairs(u1.keys(v7));
				while true do
					v11(v12, v13);
					if not v11 then
						break;
					end;
					local l__image__14 = v6.image;
					local v15 = false;
					if l__image__14 ~= "" then
						v15 = l__image__14;
					end;
					local v16 = not v15 and v12 == "icon";
					if v16 then
						v6.image = l__GetTarmacAsset__3(v12, v7).Image;
					elseif v12 == "s" then
						local l__Image__17 = l__GetTarmacAsset__3(v12, v7).Image;
						local v18 = 0;
						local v19 = false;
						while true do
							if v19 then
								v18 = v18 + 1;
							else
								v19 = true;
							end;
							if not (v18 < #v8) then
								break;
							end;
							if v8[v18 + 1] == "" then
								v8[v18 + 1] = l__Image__17;
							end;						
						end;
					elseif type(v12) == "string" then
						local l__Image__20 = l__GetTarmacAsset__3(v12, v7).Image;
						local v21, v22, v23 = ipairs(u1.keys(u4));
						while true do
							v21(v22, v23);
							if not v21 then
								break;
							end;
							v23 = v21;
							if u5.includes(v12, v22) then
								v8[u4[v22] + 1] = l__Image__20;
							end;						
						end;
					end;				
				end;
				if v6.block and v6.block.greedyMesh and not (#v6.block.greedyMesh.textures > 0) then
					v6.block.greedyMesh.textures = v8;
				end;
			end;		
		end;
		local v24, v25, v26 = ipairs(u1.entries(p1));
		while true do
			v24(v25, v26);
			if not v24 then
				break;
			end;
			v26 = v24;
			local v27 = v25[2];
			if v27.block and v27.block.greedyMesh and #v27.block.greedyMesh.textures == 0 then
				print("Missing block texture for: " .. v25[1]);
			end;		
		end;
	end
};
