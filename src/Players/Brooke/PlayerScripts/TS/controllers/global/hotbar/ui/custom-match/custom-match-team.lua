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
			local v6, v7, v8 = ipairs(p1.QueueMeta.teams);
			while true do
				v6(v7, v8);
				if not v6 then
					break;
				end;
				v8 = v6;
				if v7.id == p1.Team.id == true then
					v5 = v7;
					break;
				end;			
			end;
			v4 = v5;
		end;
		local v9 = v4;
		if v9 ~= nil then
			v9 = v9.maxPlayers;
		end;
		local v10 = v9;
		if v10 == nil then
			v10 = 20;
		end;
		local v11 = false;
		local v12 = p1.Team;
		if v12 then
			local v13 = p1.store.Game.myTeam;
			if v13 ~= nil then
				v13 = v13.id;
			end;
			local v14 = p1.Team;
			if v14 ~= nil then
				v14 = v14.id;
			end;
			v12 = v13 == v14;
		end;
		if v12 then
			v11 = true;
		elseif p1.Team == nil and p1.store.Game.myTeam == nil then
			v11 = true;
		end;
		local v15 = nil;
		if v4 then
			v15 = l__ColorUtil__1.hexColor(v4.colorHex);
		end;
		local v16 = "Spectate";
		if v4 then
			v16 = v4.displayName;
		end;
		if p1.Team then
			local v17 = 0;
			for v18 in pairs(p1.Team.members) do
				v17 = v17 + 1;
			end;
			local v19 = v17;
		else
			local v20 = {};
			local v21 = 0;
			local v22, v23, v24 = ipairs((l__Players__2:GetPlayers()));
			while true do
				v22(v23, v24);
				if not v22 then
					break;
				end;
				local v25 = true;
				if v23.Team ~= nil then
					v25 = v23.Team.Name == "Spectators";
				end;
				if v25 == true then
					v21 = v21 + 1;
					v20[v21] = v23;
				end;			
			end;
			v19 = #v20;
		end;
		local v26 = {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = p1.LayoutOrder
		};
		local v27 = {};
		local v28 = {};
		if v4 then
			local v29 = "  (" .. tostring(v19) .. "/" .. tostring(v10) .. ")";
		else
			v29 = "";
		end;
		v28.Text = "<b><font color=\"" .. l__ColorUtil__1.richTextColor(v15 or Color3.fromRGB(255, 255, 255)) .. "\">" .. v16 .. "</font>" .. v29 .. "</b>";
		v28.Size = UDim2.fromScale(1, 1);
		function v28.OnClick()
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
		v27[1] = u3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3, 
			DominantAxis = "Height"
		});
		v27[2] = u3.createElement(l__Button__4, v28);
		local v32 = v11 and u3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.05, 0), 
			BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, -0.05), 
			AnchorPoint = Vector2.new(0.5, 1)
		});
		if v32 then
			v27[#v27 + 1] = v32;
		end;
		return u3.createElement(l__Empty__8, v26, v27);
	end)
};
