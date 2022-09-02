-- Script Hash: ff3d2020e103f7185ac23bdca88688856468b6ad31bc126d19f32422b47d2a235cba3c0a37543e5c35556db60495f5c4
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
			for v19 in pairs(p1.Team.members) do
				v18 = v18 + 1;
			end;
			local v20 = v18;
		else
			local v21 = l__Players__2:GetPlayers();
			local function v22(p4)
				local v23 = true;
				if p4.Team ~= nil then
					v23 = p4.Team.Name == "Spectators";
				end;
				return v23;
			end;
			local v24 = {};
			local v25 = 0;
			for v26, v27 in ipairs(v21) do
				if v22(v27, v26 - 1, v21) == true then
					v25 = v25 + 1;
					v24[v25] = v27;
				end;
			end;
			v20 = #v24;
		end;
		local v28 = v17;
		if v4 then
			v28 = v17 .. " (" .. tostring(v20) .. "/" .. tostring(v11) .. ")";
		end;
		local v29 = {};
		local v30 = {
			Text = v28, 
			Size = UDim2.fromScale(1, 1)
		};
		function v30.OnClick()
			l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
			local v31 = p1.Team;
			if v31 ~= nil then
				v31 = v31.name;
			end;
			local v32 = v31;
			if v32 == nil then
				v32 = "spectators";
			end;
			l__default__7.Client:GetNamespace("CustomMatches"):Get("SelectTeam"):CallServerAsync(v32):andThen(function(p5)

			end);
		end;
		v29[1] = u3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3, 
			DominantAxis = "Height"
		});
		v29[2] = u3.createElement(l__Button__4, v30);
		local v33 = v12 and u3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0.05, 0), 
			BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, -0.05), 
			AnchorPoint = Vector2.new(0.5, 1)
		});
		if v33 then
			v29[#v29 + 1] = v33;
		end;
		return u3.createElement(l__Empty__8, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = p1.LayoutOrder
		}, v29);
	end)
};
