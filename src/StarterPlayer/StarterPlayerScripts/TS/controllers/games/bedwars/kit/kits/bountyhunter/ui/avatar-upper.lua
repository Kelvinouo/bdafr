
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("AvatarUpper");
function v3.init(p1)

end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__KitUpperViewport__2 = v1.import(script, script.Parent, "kit-upper-viewport").KitUpperViewport;
function v3.render(p2)
	local v4 = u1.copy(p2.props);
	v4.store = nil;
	v4.player = nil;
	v4[v2.Children] = nil;
	if p2.props.store.Bedwars.othersUsingKitSkin[p2.props.player.UserId] then
		local v5 = {
			kit = p2.props.store.Bedwars.kits[p2.props.player.UserId]
		};
		for v6, v7 in pairs(v4) do
			v5[v6] = v7;
		end;
		local v8 = {};
		local v9 = #v8;
		local v10 = p2.props[v2.Children];
		if v10 then
			local v11, v12, v13 = pairs(v10);
			while true do
				local v14 = nil;
				local v15 = nil;
				v15, v14 = v11(v12, v13);
				if not v15 then
					break;
				end;
				v13 = v15;
				if type(v15) == "number" then
					v8[v9 + v15] = v14;
				else
					v8[v15] = v14;
				end;			
			end;
		end;
		return v2.createElement(l__KitUpperViewport__2, v5, v8);
	end;
	local v16 = {
		Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(p2.props.player.UserId) .. "&w=352&h=352", 
		ScaleType = "Crop"
	};
	for v17, v18 in pairs(v4) do
		v16[v17] = v18;
	end;
	local v19 = {};
	local v20 = #v19;
	local v21 = p2.props[v2.Children];
	if v21 then
		local v22, v23, v24 = pairs(v21);
		while true do
			local v25 = nil;
			local v26 = nil;
			v26, v25 = v22(v23, v24);
			if not v26 then
				break;
			end;
			v24 = v26;
			if type(v26) == "number" then
				v19[v20 + v26] = v25;
			else
				v19[v26] = v25;
			end;		
		end;
	end;
	return v2.createElement("ImageLabel", v16, v19);
end;
return {
	AvatarUpper = v3
};

