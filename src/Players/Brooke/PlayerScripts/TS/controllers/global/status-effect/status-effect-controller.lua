-- Script Hash: 2aafac5a6cdccaf629406bd8e345eb4fdb3f9e2f5187e97858e007b4e6f33e1b42f1d97d6b2925b952fbecc130ff90f3
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
local u1 = l__KnitController__2;
local l__StatusEffectType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__FireStatusEffectHandler__3 = v1.import(script, script.Parent, "handlers", "fire-status-effect-handler").FireStatusEffectHandler;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StatusEffectController";
	p1.handlerMap = {};
	p1.entityHandlers = {};
	p1:setHandler(l__StatusEffectType__2.ENCHANT_FIRE_1, l__FireStatusEffectHandler__3);
	p1:setHandler(l__StatusEffectType__2.ENCHANT_FIRE_2, l__FireStatusEffectHandler__3);
	p1:setHandler(l__StatusEffectType__2.ENCHANT_FIRE_3, l__FireStatusEffectHandler__3);
end;
local l__CollectionTagAdded__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__StatusEffectUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__EntityUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ClientSyncEvents__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__4("entity", function(p3)
		p2.entityHandlers[p3] = {};
		local v5 = u5.values(l__StatusEffectType__2);
		local function v6(p4)
			local v7 = l__StatusEffectUtil__6:getAttributeName(p4);
			local u10 = false;
			local u11 = nil;
			local u12 = u7.new();
			p3:GetAttributeChangedSignal(v7):Connect(function()
				if not l__EntityUtil__8:getEntity(p3) then
					return nil;
				end;
				if p3:GetAttribute(v7) ~= nil then
					if u10 then
						return;
					end;
				else
					u12:DoCleaning();
					return;
				end;
				u10 = true;
				l__ClientSyncEvents__9.StatusEffectAdded:fire(p3, p4);
				local v8 = p2.handlerMap[p4];
				if v8 then
					u11 = v8.new();
					u11:apply(p3, p4);
				end;
				u12:GiveTask(p3.AncestryChanged:Connect(function(p5, p6)
					if p6 == nil then
						u12:DoCleaning();
					end;
				end));
				u12:GiveTask(function()
					l__ClientSyncEvents__9.StatusEffectRemoved:fire(p3, p4);
					if u11 then
						u11:remove(p3, p4);
					end;
					u12:DoCleaning();
					u10 = false;
				end);
			end);
			if p3:GetAttribute(v7) ~= nil then
				l__ClientSyncEvents__9.StatusEffectAdded:fire(p3, p4);
				u12:GiveTask(function()
					l__ClientSyncEvents__9.StatusEffectRemoved:fire(p3, p4);
				end);
			end;
		end;
		for v9, v10 in ipairs(v5) do
			v6(v10, v9 - 1, v5);
		end;
		p3.AncestryChanged:Connect(function(p7, p8)
			if p8 == nil then
				for v11, v12 in ipairs((l__StatusEffectUtil__6:getActiveStatusEffects(p3))) do
					l__ClientSyncEvents__9.StatusEffectRemoved:fire(p3, v12.statusEffect);
				end;
			end;
		end);
	end);
end;
function v3.setHandler(p9, p10, p11)
	p9.handlerMap[p10] = p11;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
