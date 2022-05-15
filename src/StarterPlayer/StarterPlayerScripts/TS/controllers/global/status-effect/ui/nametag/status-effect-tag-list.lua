
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = nil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__CollectionService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
local l__StatusEffectUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__ClientSyncEvents__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatusEffectTag__7 = v1.import(script, script.Parent, "status-effect-tag").StatusEffectTag;
local l__Empty__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
u1 = u6.createRef();
local u9 = nil;
u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u6)(function(p1, p2)
	local v2, v3 = p2.useState({});
	p2.useEffect(function()
		local v4 = u1:getValue();
		local v5 = u2.new();
		if v4 then
			l__CollectionService__3:AddTag(v4, "EntityNameTag");
		end;
		local function v6()
			v3((l__StatusEffectUtil__4:getActiveStatusEffects(p1.EntityInstance)));
		end;
		v6();
		v5:GiveTask(l__ClientSyncEvents__5.StatusEffectAdded:connect(function(p3)
			if p3.entityInstance == p1.EntityInstance then
				v6();
			end;
		end));
		v5:GiveTask(l__ClientSyncEvents__5.StatusEffectRemoved:connect(function(p4)
			if p4.entityInstance == p1.EntityInstance then
				v6();
			end;
		end));
		return function()
			v5:DoCleaning();
		end;
	end, {});
	local function v7(p5)
		return u6.createElement(l__StatusEffectTag__7, {
			ActiveStatusEffect = p5
		});
	end;
	local v8 = table.create(#v2);
	for v9, v10 in ipairs(v2) do
		v8[v9] = v7(v10, v9 - 1, v2);
	end;
	local v11 = {
		Size = UDim2.fromScale(1, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5)
	};
	local v12 = { u6.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center", 
			Padding = UDim.new(0.05, 0)
		}) };
	local v13 = #v12;
	for v14, v15 in ipairs(v8) do
		v12[v13 + v14] = v15;
	end;
	return u6.createFragment({
		StatusEffectTagList = u6.createElement(l__Empty__8, v11, v12)
	});
end);
return {
	StatusEffectTagListBillboard = function(p6)
		local v16 = {};
		local v17 = {};
		for v18, v19 in pairs(p6) do
			v17[v18] = v19;
		end;
		v16[#v16 + 1] = u6.createElement(u9, v17);
		return u6.createFragment({
			StatusEffectTagBillboard = u6.createElement("BillboardGui", {
				Size = UDim2.fromScale(6, 1.25), 
				StudsOffsetWorldSpace = Vector3.new(0, 2.15, 0), 
				AlwaysOnTop = true, 
				MaxDistance = 150, 
				ResetOnSpawn = false, 
				AutoLocalize = false, 
				[u6.Ref] = u1
			}, v16)
		});
	end, 
	StatusEffectTagList = u9
};

