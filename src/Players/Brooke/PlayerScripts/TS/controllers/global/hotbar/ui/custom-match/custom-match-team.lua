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
			local v5 = nil;
			for v6, v7 in ipairs(p1.QueueMeta.teams) do
				if v7.id == p1.Team.id == true then
					v5 = v7;
					break;
				end;
			end;
			v4 = v5;
		end;
		local v8 = v4;
		if v8 ~= nil then
			v8 = v8.maxPlayers;
		end;
		local v9 = v8;
		if v9 == nil then
			v9 = 20;
		end;
		local v10 = false;
		local v11 = p1.Team;
		if v11 then
			local v12 = p1.store.Game.myTeam;
			if v12 ~= nil then
				v12 = v12.id;
			end;
			local v13 = p1.Team;
			if v13 ~= nil then
				v13 = v13.id;
			end;
			v11 = v12 == v13;
		end;
		if v11 then
			v10 = true;
		elseif p1.Team == nil and p1.store.Game.myTeam == nil then
			v10 = true;
		end;
		if v4 then
			local v14 = l__ColorUtil__1.hexColor(v4.colorHex);
		end;
		local v15 = "Spectate";
		if v4 then
			v15 = v4.displayName;
		end;
		if p1.Team then
			local v16 = 0;
			for v17 in pairs(p1.Team.members) do
				v16 = v16 + 1;
			end;
			local v18 = v16;
		else
			local v19 = {};
			local v20 = 0;
			local v21, v22, v23 = ipairs((l__Players__2:GetPlayers()));
			while true do
				local v24, v25 = v21(v22, v23);
				if not v24 then
					break;
				end;
				local v26 = true;
				if v25.Team ~= nil then
					v26 = v25.Team.Name == "Spectators";
				end;
				if v26 == true then
					v20 = v20 + 1;
					v19[v20] = v25;
				end;			
			end;
			v18 = #v19;
		end;
		local v27 = v15;
		if v4 then
			v27 = v15 .. " (" .. tostring(v18) .. "/" .. tostring(v9) .. ")";
		end;
		local v28 = {};
		local v29 = {
			Text = v27, 
			Size = UDim2.fromScale(1, 1)
		};
		function v29.OnClick()
			l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
			local v30 = p1.Team;
			if v30 ~= nil then
				v30 = v30.name;
			end;
			local v31 = v30;
			if v31 == nil then
				v31 = "spectators";
			end;
			l__default__7.Client:GetNamespace("CustomMatches"):Get("SelectTeam"):CallServerAsync(v31):andThen(function(p3)

			end);
		end;
		v28[1] = u3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3, 
			DominantAxis = "Height"
		});
		v28[2] = u3.createElement(l__Button__4, v29);
		local v32 = v10 and u3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.05, 0), 
			BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, -0.05), 
			AnchorPoint = Vector2.new(0.5, 1)
		});
		if v32 then
			v28[#v28 + 1] = v32;
		end;
		return u3.createElement(l__Empty__8, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = p1.LayoutOrder
		}, v28);
	end)
};
