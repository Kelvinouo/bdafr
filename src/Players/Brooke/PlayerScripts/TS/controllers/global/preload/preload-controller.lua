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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "PreloadController";
	p1.itemPreloads = {};
	local v5, v6, v7 = ipairs(u1.values(l__ItemType__2));
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
		p1.itemPreloads[v6] = {};	
	end;
end;
local l__ClientSyncEvents__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__ClientSyncEvents__3.ItemAdded:connect(function(p3)
		local v8 = p2.itemPreloads[p3.item.Name];
		if #v8 == 0 then
			return nil;
		end;
		task.spawn(function()
			local v9, v10, v11 = ipairs(v8);
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				v11 = v9;
				p2:runPreload(v10);			
			end;
		end);
	end);
end;
function v3.preloadForItemType(p4, p5, p6)
	table.insert(p4.itemPreloads[p5], p6);
end;
local l__ContentProvider__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v3.runPreload(p7, p8)
	if p8.instances ~= nil then
		task.spawn(function()
			l__ContentProvider__4:PreloadAsync(p8.instances);
		end);
	end;
	if p8.callback ~= nil then
		local l__callback__7 = p8.callback;
		task.spawn(function()
			l__callback__7();
		end);
	end;
	if p8.sounds ~= nil then
		task.spawn(function()
			local l__sounds__12 = p8.sounds;
			local v13 = table.create(#l__sounds__12);
			local v14, v15, v16 = ipairs(l__sounds__12);
			while true do
				v14(v15, v16);
				if not v14 then
					break;
				end;
				v16 = v14;
				v13[v14] = u5("Sound", {
					SoundId = v15
				});			
			end;
			l__ContentProvider__4:PreloadAsync(v13);
		end);
	end;
	if p8.animations ~= nil then
		task.spawn(function()
			local l__animations__17 = p8.animations;
			local v18 = table.create(#l__animations__17);
			local v19, v20, v21 = ipairs(l__animations__17);
			while true do
				v19(v20, v21);
				if not v19 then
					break;
				end;
				v21 = v19;
				v18[v19] = l__GameAnimationUtil__6.getAnimation(v20);			
			end;
			l__ContentProvider__4:PreloadAsync(v18);
		end);
	end;
end;
local v22 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
