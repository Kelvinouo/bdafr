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
			local v7 = {};
			local v8 = 0;
			local v9, v10, v11 = ipairs((l__StatusEffectUtil__4:getActiveStatusEffects(l__Players__3.LocalPlayer.Character)));
			while true do
				local v12, v13 = v9(v10, v11);
				if not v12 then
					break;
				end;
				if l__StatusEffectMeta__5[v13.statusEffect].noDisplay then
					local v14 = false;
				else
					v14 = true;
				end;
				if v14 == true then
					v8 = v8 + 1;
					v7[v8] = v13;
				end;			
			end;
			v5(v7);
		end;
		v6:GiveTask(l__ClientSyncEvents__6.StatusEffectAdded:connect(function(p3)
			if p3.entityInstance == l__Players__3.LocalPlayer.Character then
				task.spawn(function()
					u11();
				end);
			end;
		end));
		v6:GiveTask(l__ClientSyncEvents__6.StatusEffectRemoved:connect(function(p4)
			if p4.entityInstance == l__Players__3.LocalPlayer.Character then
				task.spawn(function()
					u11();
				end);
			end;
		end));
	end, {});
	local function v15(p5, p6)
		return u7.createFragment({
			[l__StatusEffectMeta__5[p5.statusEffect].displayName] = u7.createElement(l__StatusEffectHudTile__8, {
				ActiveStatusEffect = p5
			})
		});
	end;
	local v16 = table.create(#v4);
	for v17, v18 in ipairs(v4) do
		v16[v17] = v15(v18, v17 - 1, v4);
	end;
	local v19 = {
		Size = UDim2.new(0.7, 0, 0.06, 0), 
		Position = UDim2.new(0.5, 0, 0, 0), 
		AnchorPoint = Vector2.new(0.5, 0)
	};
	local v20 = { u7.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.012, 0)
		}) };
	local v21 = #v20;
	for v22, v23 in ipairs(v16) do
		v20[v21 + v22] = v23;
	end;
	return u7.createFragment({
		StatusEffectHud = u7.createElement(l__Empty__9, v19, v20)
	});
end);
return {
	StatusEffectHudList = u10, 
	StatusEffectHudListScreen = function(p7)
		local v24 = {};
		local v25 = {};
		for v26, v27 in pairs(p7) do
			v25[v26] = v27;
		end;
		v24[#v24 + 1] = u7.createElement(u10, v25);
		return u7.createFragment({
			StatusEffectHudScreen = u7.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, v24)
		});
	end
};
