-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__StatusEffectUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatusEffectHudTile__8 = v1.import(script, script.Parent, "status-effect-hud-tile").StatusEffectHudTile;
local l__Empty__9 = v2.Empty;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u7)(function(p1, p2)
	local l__useMemo__3 = p2.useMemo;
	local v4, v5 = p2.useState(p1.StatusEffects or {});
	p2.useEffect(function()
		if l__DeviceUtil__1.isHoarceKat() then
			return nil;
		end;
		local v6 = u2.new();
		local function u11()
			if not l__Players__3.LocalPlayer.Character then
				v5({});
				return;
			end;
			local v7 = l__StatusEffectUtil__4:getActiveStatusEffects(l__Players__3.LocalPlayer.Character);
			local function v8(p3)
				if l__StatusEffectMeta__5[p3.statusEffect].noDisplay then
					return false;
				end;
				return true;
			end;
			local v9 = {};
			local v10 = 0;
			for v11, v12 in ipairs(v7) do
				if v8(v12, v11 - 1, v7) == true then
					v10 = v10 + 1;
					v9[v10] = v12;
				end;
			end;
			v5(v9);
		end;
		v6:GiveTask(l__ClientSyncEvents__6.StatusEffectAdded:connect(function(p4)
			if p4.entityInstance == l__Players__3.LocalPlayer.Character then
				task.spawn(function()
					u11();
				end);
			end;
		end));
		v6:GiveTask(l__ClientSyncEvents__6.StatusEffectRemoved:connect(function(p5)
			if p5.entityInstance == l__Players__3.LocalPlayer.Character then
				task.spawn(function()
					u11();
				end);
			end;
		end));
	end, {});
	local function v13(p6, p7)
		return u7.createFragment({
			[l__StatusEffectMeta__5[p6.statusEffect].displayName] = u7.createElement(l__StatusEffectHudTile__8, {
				ActiveStatusEffect = p6
			})
		});
	end;
	local v14 = table.create(#v4);
	for v15, v16 in ipairs(v4) do
		v14[v15] = v13(v16, v15 - 1, v4);
	end;
	local v17 = {
		Size = UDim2.new(0.7, 0, 0.06, 0), 
		Position = UDim2.new(0.5, 0, 0, 0), 
		AnchorPoint = Vector2.new(0.5, 0)
	};
	local v18 = { u7.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.012, 0)
		}) };
	local v19 = #v18;
	for v20, v21 in ipairs(v14) do
		v18[v19 + v20] = v21;
	end;
	return u7.createFragment({
		StatusEffectHud = u7.createElement(l__Empty__9, v17, v18)
	});
end);
return {
	StatusEffectHudList = u10, 
	StatusEffectHudListScreen = function(p8)
		local v22 = {};
		local v23 = {};
		for v24, v25 in pairs(p8) do
			v23[v24] = v25;
		end;
		v22[#v22 + 1] = u7.createElement(u10, v23);
		return u7.createFragment({
			StatusEffectHudScreen = u7.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, v22)
		});
	end
};
