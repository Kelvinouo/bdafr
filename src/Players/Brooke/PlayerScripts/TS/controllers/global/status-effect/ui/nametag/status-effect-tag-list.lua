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
		v3((l__StatusEffectUtil__4:getAllActive(p1.EntityInstance)));
		v5:GiveTask(l__ClientSyncEvents__5.StatusEffectAdded:connect(function(p3)
			if p3.entityInstance == p1.EntityInstance then
				v3((l__StatusEffectUtil__4:getAllActive(p1.EntityInstance)));
			end;
		end));
		v5:GiveTask(l__ClientSyncEvents__5.StatusEffectRemoved:connect(function(p4)
			if p4.entityInstance == p1.EntityInstance then
				v3((l__StatusEffectUtil__4:getAllActive(p1.EntityInstance)));
			end;
		end));
		return function()
			v5:DoCleaning();
		end;
	end, {});
	local v6 = table.create(#v2);
	local v7, v8, v9 = ipairs(v2);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		v6[v7] = u6.createElement(l__StatusEffectTag__7, {
			ActiveStatusEffect = v8
		});	
	end;
	local v10 = {
		Size = UDim2.fromScale(1, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5)
	};
	local v11 = { u6.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			VerticalAlignment = "Center", 
			HorizontalAlignment = "Center", 
			Padding = UDim.new(0.05, 0)
		}) };
	local v12 = #v11;
	local v13, v14, v15 = ipairs(v6);
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		v11[v12 + v13] = v14;	
	end;
	return u6.createFragment({
		StatusEffectTagList = u6.createElement(l__Empty__8, v10, v11)
	});
end);
return {
	StatusEffectTagListBillboard = function(p5)
		local v16 = {};
		local v17 = {};
		for v18, v19 in pairs(p5) do
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
