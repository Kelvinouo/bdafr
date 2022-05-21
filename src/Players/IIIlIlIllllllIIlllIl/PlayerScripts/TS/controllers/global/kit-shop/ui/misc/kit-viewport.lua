-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("KitViewport");
function v3.init(p1)

end;
local l__BedwarsKit__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__PlayerViewport__2 = v1.import(script, script.Parent, "player-viewport").PlayerViewport;
local l__getBedwarsKitMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__BedwarsKitSkin__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKitSkinMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
function v3.render(p2)
	local v4 = {};
	for v5, v6 in pairs(p2.props) do
		v4[v5] = v6;
	end;
	v4[v2.Children] = nil;
	v4.Kit = nil;
	v4.Skin = nil;
	if not p2.props.Kit or p2.props.Kit == l__BedwarsKit__1.NONE then
		local v7 = {};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		local v10 = {};
		local v11 = #v10;
		local v12 = p2.props[v2.Children];
		if v12 then
			local v13, v14, v15 = pairs(v12);
			while true do
				local v16 = nil;
				local v17 = nil;
				v17, v16 = v13(v14, v15);
				if not v17 then
					break;
				end;
				v15 = v17;
				if type(v17) == "number" then
					v10[v11 + v17] = v16;
				else
					v10[v17] = v16;
				end;			
			end;
		end;
		return v2.createElement(l__PlayerViewport__2, v7, v10);
	end;
	local v18 = l__getBedwarsKitMeta__3(l__BedwarsKit__1.GRIM_REAPER).renderImage;
	if v18 == nil then
		v18 = "";
	end;
	local v19 = v18;
	if p2.props.Kit then
		v19 = l__getBedwarsKitMeta__3(p2.props.Kit).renderImage;
	end;
	if p2.props.Skin and p2.props.Skin ~= l__BedwarsKitSkin__4.DEFAULT then
		v19 = l__BedwarsKitSkinMeta__5[p2.props.Skin].renderImage;
	end;
	local v20 = {
		Image = v19, 
		ScaleType = "Crop", 
		Size = UDim2.fromScale(1, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1
	};
	local v21 = p2.props.ImageTransparency;
	if v21 == nil then
		v21 = 0;
	end;
	v20.ImageTransparency = v21;
	for v22, v23 in pairs(v4) do
		v20[v22] = v23;
	end;
	local v24 = {};
	local v25 = #v24;
	local v26 = p2.props[v2.Children];
	if v26 then
		local v27, v28, v29 = pairs(v26);
		while true do
			local v30 = nil;
			local v31 = nil;
			v31, v30 = v27(v28, v29);
			if not v31 then
				break;
			end;
			v29 = v31;
			if type(v31) == "number" then
				v24[v25 + v31] = v30;
			else
				v24[v31] = v30;
			end;		
		end;
	end;
	return v2.createElement("ImageLabel", v20, v24);
end;
return {
	KitViewport = v3
};
