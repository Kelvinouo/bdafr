-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "PreloadController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "PreloadController";
	p1.itemPreloads = {};
	for v5, v6 in ipairs(u2.values(l__ItemType__3)) do
		p1.itemPreloads[v6] = {};
	end;
end;
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__4.ItemAdded:connect(function(p3)
		local v7 = p2.itemPreloads[p3.item.Name];
		if #v7 == 0 then
			return nil;
		end;
		task.spawn(function()
			for v8, v9 in ipairs(v7) do
				p2:runPreload(v9);
			end;
		end);
	end);
end;
function v3.preloadForItemType(p4, p5, p6)
	table.insert(p4.itemPreloads[p5], p6);
end;
local l__ContentProvider__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v3.runPreload(p7, p8)
	if p8.instances ~= nil then
		task.spawn(function()
			l__ContentProvider__5:PreloadAsync(p8.instances);
		end);
	end;
	if p8.callback ~= nil then
		local l__callback__8 = p8.callback;
		task.spawn(function()
			l__callback__8();
		end);
	end;
	if p8.sounds ~= nil then
		task.spawn(function()
			local l__sounds__10 = p8.sounds;
			local v11 = table.create(#l__sounds__10);
			for v12, v13 in ipairs(l__sounds__10) do
				v11[v12] = u6("Sound", {
					SoundId = v13
				});
			end;
			l__ContentProvider__5:PreloadAsync(v11);
		end);
	end;
	if p8.animations ~= nil then
		task.spawn(function()
			local l__animations__14 = p8.animations;
			local v15 = table.create(#l__animations__14);
			for v16, v17 in ipairs(l__animations__14) do
				v15[v16] = l__GameAnimationUtil__7.getAnimation(v17);
			end;
			l__ContentProvider__5:PreloadAsync(v15);
		end);
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
