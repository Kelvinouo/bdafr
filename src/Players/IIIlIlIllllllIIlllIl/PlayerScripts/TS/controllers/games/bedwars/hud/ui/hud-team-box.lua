-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
return {
	HudTeamBox = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local v4, v5 = l__useState__2(true);
		local v6, v7 = l__useState__2(0);
		if type(p1.teamColor) == "number" then
			local v8 = l__ColorUtil__1.hexColor(p1.teamColor);
		else
			v8 = p1.teamColor;
		end;
		local v9 = p1.store.Game.myTeam;
		if v9 ~= nil then
			v9 = v9.id;
		end;
		local v10 = p1.team;
		if v10 ~= nil then
			v10 = v10.id;
		end;
		l__useEffect__3(function()
			if p1.team then
				local v11 = p1.team;
				if v11 ~= nil then
					v11 = v11.id;
				end;
				local v12 = p1.store.Bedwars.teamBedAlive[v11];
				if v12 == nil then
					v12 = true;
				end;
				v5(v12);
			end;
		end, { p1.store.Bedwars.teamBedAlive });
		l__useEffect__3(function()
			if p1.team then
				local l__teams__13 = p1.store.TabList.teams;
				local function v14(p3)
					local v15 = p1.team;
					if v15 ~= nil then
						v15 = v15.id;
					end;
					return p3.id == v15;
				end;
				local v16 = nil;
				for v17, v18 in ipairs(l__teams__13) do
					if v14(v18, v17 - 1, l__teams__13) == true then
						v16 = v18;
						break;
					end;
				end;
				local v19 = v16;
				if v19 ~= nil then
					v19 = v19.members;
				end;
				if v19 then
					local v20 = nil;
					local v21 = {};
					local v22 = #v21;
					for v23, v24 in pairs(v19) do
						v22 = v22 + 1;
						v21[v22] = { v23, v24 };
					end;
					v20 = 0;
					local function v25(p4, p5)
						local v26 = p5[1];
						if p1.store.Bedwars.finalDeaths[p5[2].userId] then
							return p4;
						end;
						p4 = p4 + 1;
						return p4;
					end;
					for v27 = 1, #v21 do
						v20 = v25(v20, v21[v27], v27 - 1, v21);
					end;
					local v28 = local v29;
					if v28 == nil then
						v28 = 0;
					end;
					v7(v28);
				end;
			end;
		end, { p1.store.Bedwars.finalDeaths });
		local u4 = v9 == v10;
		local v30 = {};
		if v4 then
			local v31 = u2.createElement(function()
				local v32 = {};
				local v33 = {
					Size = UDim2.fromScale(1, 1)
				};
				if u4 then
					local v34 = l__BedwarsImageId__3.HUD_MY_TEAM_BOX_STROKE;
				else
					v34 = l__BedwarsImageId__3.HUD_TEAM_BOX_STROKE;
				end;
				v33.Image = v34;
				if u4 then
					local v35 = l__ColorUtil__1.WHITE;
				else
					v35 = nil;
				end;
				v33.ImageColor3 = v35;
				v33.BackgroundTransparency = 1;
				v33.BorderSizePixel = 0;
				v33.ZIndex = 100;
				v32[1] = u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 3)
				});
				v32[2] = u2.createElement("ImageLabel", v33, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) });
				v32[3] = u2.createElement("Frame", {
					Size = UDim2.fromScale(1, 1), 
					BackgroundColor3 = v8, 
					BorderSizePixel = 0, 
					ZIndex = 99
				}, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) });
				return u2.createElement("Frame", {
					Size = UDim2.fromOffset(20, 20), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 0, 
					LayoutOrder = p1.layoutOrder
				}, v32);
			end);
		else
			v31 = u2.createElement(function()
				local v36 = { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) };
				local v37 = false;
				if v6 > 0 then
					v37 = u2.createElement("TextLabel", {
						Position = UDim2.fromScale(0.5, 0.5), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						BackgroundTransparency = 1, 
						BorderSizePixel = 0, 
						Text = "<b>" .. tostring(v6) .. "</b>", 
						Font = "Roboto", 
						TextSize = 16, 
						RichText = true, 
						TextColor3 = Color3.fromRGB(255, 255, 255), 
						TextStrokeColor3 = l__ColorUtil__1.BLACK, 
						TextStrokeTransparency = 0
					});
				end;
				if v37 then
					v36[#v36 + 1] = v37;
				end;
				return u2.createElement("ImageLabel", {
					Size = UDim2.fromOffset(20, 20), 
					Image = l__BedwarsImageId__3.HUD_BED_DESTROYED, 
					ImageColor3 = v8, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					LayoutOrder = p1.layoutOrder
				}, v36);
			end);
		end;
		v30[1] = v31;
		return u2.createFragment(v30);
	end)
};
