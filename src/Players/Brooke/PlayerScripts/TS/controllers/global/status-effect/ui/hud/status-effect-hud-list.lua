-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__StatusEffectUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__StatusEffectCategory__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-category").StatusEffectCategory;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u9 = v1.import(script, script.Parent, "status-effect-hud-enchant-tile").StatusEffectHudEnchantTile;
local l__StatusEffectHudTile__10 = v1.import(script, script.Parent, "status-effect-hud-tile").StatusEffectHudTile;
local l__Empty__11 = v2.Empty;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
	local l__useMemo__3 = p2.useMemo;
	local v4, v5 = p2.useState(p1.StatusEffects or {});
	p2.useEffect(function()
		if l__DeviceUtil__1.isHoarceKat() then
			return nil;
		end;
		local v6 = u2.new();
		local function u13()
			if not l__Players__3.LocalPlayer.Character then
				v5({});
				return;
			end;
			local v7 = {};
			local v8 = 0;
			local v9, v10, v11 = ipairs((l__StatusEffectUtil__4:getAllActive(l__Players__3.LocalPlayer.Character)));
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				if l__StatusEffectMeta__5[v10.statusEffect].noDisplay then
					local v12 = false;
				else
					v12 = true;
				end;
				if v12 == true then
					v8 = v8 + 1;
					v7[v8] = v10;
				end;			
			end;
			v5(v7);
		end;
		v6:GiveTask(l__ClientSyncEvents__6.StatusEffectAdded:connect(function(p3)
			if p3.entityInstance == l__Players__3.LocalPlayer.Character then
				task.spawn(function()
					u13();
				end);
			end;
		end));
		v6:GiveTask(l__ClientSyncEvents__6.StatusEffectRemoved:connect(function(p4)
			if p4.entityInstance == l__Players__3.LocalPlayer.Character then
				task.spawn(function()
					u13();
				end);
			end;
		end));
		v6:GiveTask(l__ClientSyncEvents__6.StatusEffectChanged:connect(function(p5)
			if p5.entityInstance == l__Players__3.LocalPlayer.Character then
				task.spawn(function()
					u13();
				end);
			end;
		end));
	end, {});
	local function v13(p6, p7)
		if l__StatusEffectMeta__5[p6.statusEffect].category == l__StatusEffectCategory__7.ENCHANT then
			return u8.createFragment({
				[l__StatusEffectMeta__5[p6.statusEffect].displayName] = u8.createElement(u9, {
					ActiveStatusEffect = p6
				})
			});
		end;
		return u8.createFragment({
			[l__StatusEffectMeta__5[p6.statusEffect].displayName] = u8.createElement(l__StatusEffectHudTile__10, {
				ActiveStatusEffect = p6
			})
		});
	end;
	local v14 = table.create(#v4);
	local v15, v16, v17 = ipairs(v4);
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		v14[v15] = v13(v16, v15 - 1, v4);	
	end;
	local v18 = {
		Size = UDim2.new(0.7, 0, 0.06, 0), 
		Position = p1.Position or UDim2.new(0.5, 0, 0, 0), 
		AnchorPoint = Vector2.new(0.5, 0)
	};
	local v19 = { u8.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.012, 0)
		}) };
	local v20 = #v19;
	local v21, v22, v23 = ipairs(v14);
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		v23 = v21;
		v19[v20 + v21] = v22;	
	end;
	return u8.createFragment({
		StatusEffectHud = u8.createElement(l__Empty__11, v18, v19)
	});
end);
return {
	StatusEffectHudList = u12, 
	StatusEffectHudListScreen = function(p8)
		local v24 = {};
		local v25 = {};
		for v26, v27 in pairs(p8) do
			v25[v26] = v27;
		end;
		v24[#v24 + 1] = u8.createElement(u12, v25);
		return u8.createFragment({
			StatusEffectHudScreen = u8.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, v24)
		});
	end
};
