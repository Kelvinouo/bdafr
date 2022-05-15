
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ColorUtil__1 = v2.ColorUtil;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Button__4 = v2.Button;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Empty__8 = v2.Empty;
return {
	CustomMatchTeam = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = nil;
		if p1.Team ~= nil then
			local l__teams__5 = p1.QueueMeta.teams;
			local function v6(p3)
				return p3.id == p1.Team.id;
			end;
			local v7 = nil;
			for v8, v9 in ipairs(l__teams__5) do
				if v6(v9, v8 - 1, l__teams__5) == true then
					v7 = v9;
					break;
				end;
			end;
			v4 = v7;
		end;
		local v10 = v4;
		if v10 ~= nil then
			v10 = v10.maxPlayers;
		end;
		local v11 = v10;
		if v11 == nil then
			v11 = 20;
		end;
		local v12 = false;
		local v13 = p1.Team;
		if v13 then
			local v14 = p1.store.Game.myTeam;
			if v14 ~= nil then
				v14 = v14.id;
			end;
			local v15 = p1.Team;
			if v15 ~= nil then
				v15 = v15.id;
			end;
			v13 = v14 == v15;
		end;
		if v13 then
			v12 = true;
		elseif p1.Team == nil and p1.store.Game.myTeam == nil then
			v12 = true;
		end;
		if v4 then
			local v16 = l__ColorUtil__1.hexColor(v4.colorHex);
		end;
		local v17 = "Spectate";
		if v4 then
			v17 = v4.displayName;
		end;
		if p1.Team then
			local v18 = 0;
			for v19, v20 in pairs(p1.Team.members) do
				v18 = v18 + 1;
			end;
			local v21 = v18;
		else
			local v22 = l__Players__2:GetPlayers();
			local function v23(p4)
				local v24 = true;
				if p4.Team ~= nil then
					v24 = p4.Team.Name == "Spectators";
				end;
				return v24;
			end;
			local v25 = {};
			local v26 = 0;
			for v27, v28 in ipairs(v22) do
				if v23(v28, v27 - 1, v22) == true then
					v26 = v26 + 1;
					v25[v26] = v28;
				end;
			end;
			v21 = #v25;
		end;
		local v29 = v17;
		if v4 then
			v29 = v17 .. " (" .. tostring(v21) .. "/" .. tostring(v11) .. ")";
		end;
		local v30 = {};
		local v31 = {
			Text = v29, 
			Size = UDim2.fromScale(1, 1)
		};
		function v31.OnClick()
			l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
			local v32 = p1.Team;
			if v32 ~= nil then
				v32 = v32.name;
			end;
			local v33 = v32;
			if v33 == nil then
				v33 = "spectators";
			end;
			l__default__7.Client:GetNamespace("CustomMatches"):Get("SelectTeam"):CallServerAsync(v33):andThen(function(p5)

			end);
		end;
		v30[1] = u3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3, 
			DominantAxis = "Height"
		});
		v30[2] = u3.createElement(l__Button__4, v31);
		local v34 = v12 and u3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.05, 0), 
			BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, -0.05), 
			AnchorPoint = Vector2.new(0.5, 1)
		});
		if v34 then
			v30[#v30 + 1] = v34;
		end;
		return u3.createElement(l__Empty__8, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = p1.LayoutOrder
		}, v30);
	end)
};

