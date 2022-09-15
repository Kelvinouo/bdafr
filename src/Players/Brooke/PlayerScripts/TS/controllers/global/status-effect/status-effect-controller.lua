-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StatusEffectController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__StatusEffectType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__FireStatusEffectHandler__2 = v1.import(script, script.Parent, "handlers", "fire-status-effect-handler").FireStatusEffectHandler;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "StatusEffectController";
	p1.handlerMap = {};
	p1.entityHandlers = {};
	p1:setHandler(l__StatusEffectType__1.ENCHANT_FIRE_1, l__FireStatusEffectHandler__2);
	p1:setHandler(l__StatusEffectType__1.ENCHANT_FIRE_2, l__FireStatusEffectHandler__2);
	p1:setHandler(l__StatusEffectType__1.ENCHANT_FIRE_3, l__FireStatusEffectHandler__2);
end;
local l__CollectionTagAdded__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__StatusEffectUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__EntityUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__CollectionTagAdded__3("entity", function(p3)
		p2.entityHandlers[p3] = {};
		local v5 = u4.values(l__StatusEffectType__1);
		local function v6(p4)
			local v7 = l__StatusEffectUtil__5:getAttributeName(p4);
			local u9 = false;
			local u10 = nil;
			local u11 = u6.new();
			p3:GetAttributeChangedSignal(v7):Connect(function()
				if not l__EntityUtil__7:getEntity(p3) then
					return nil;
				end;
				if p3:GetAttribute(v7) ~= nil then
					l__ClientSyncEvents__8.StatusEffectAdded:fire(p3, p4);
					if u9 then
						return;
					end;
				else
					u11:DoCleaning();
					return;
				end;
				u9 = true;
				local v8 = p2.handlerMap[p4];
				if v8 then
					u10 = v8.new();
					u10:apply(p3, p4);
				end;
				u11:GiveTask(p3:GetAttributeChangedSignal(v7 .. "_stacks"):Connect(function()
					if p3:GetAttribute(v7 .. "_stacks") ~= nil then
						l__ClientSyncEvents__8.StatusEffectChanged:fire(p3, p4);
					end;
				end));
				u11:GiveTask(p3.AncestryChanged:Connect(function(p5, p6)
					if p6 == nil then
						u11:DoCleaning();
					end;
				end));
				u11:GiveTask(function()
					l__ClientSyncEvents__8.StatusEffectRemoved:fire(p3, p4);
					if u10 then
						u10:remove(p3, p4);
					end;
					u11:DoCleaning();
					u9 = false;
				end);
			end);
			if p3:GetAttribute(v7) ~= nil then
				l__ClientSyncEvents__8.StatusEffectAdded:fire(p3, p4);
				u11:GiveTask(function()
					l__ClientSyncEvents__8.StatusEffectRemoved:fire(p3, p4);
				end);
			end;
		end;
		local v9, v10, v11 = ipairs(v5);
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			v6(v10, v9 - 1, v5);		
		end;
		p3.AncestryChanged:Connect(function(p7, p8)
			if p8 == nil then
				local v12, v13, v14 = ipairs((l__StatusEffectUtil__5:getAllActive(p3)));
				while true do
					v12(v13, v14);
					if not v12 then
						break;
					end;
					v14 = v12;
					l__ClientSyncEvents__8.StatusEffectRemoved:fire(p3, v13.statusEffect);				
				end;
			end;
		end);
	end);
end;
function v3.setHandler(p9, p10, p11)
	p9.handlerMap[p10] = p11;
end;
local v15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
