-- Script Hash: af4d5c0a33ca2d3ce1bd59c8fc32998aed85c0a4ba482caf7a6c0dc2311945ba376919787b323cb9dd864d16a3fa494d
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
local l__ContentProvider__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContentProvider;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__4.ItemAdded:connect(function(p3)
		local v7 = p2.itemPreloads[p3.item.Name];
		if #v7 == 0 then
			return nil;
		end;
		task.spawn(function()
			local v8, v9, v10 = ipairs(v7);
			while true do
				local v11, v12 = v8(v9, v10);
				if not v11 then
					break;
				end;
				if v12.instances ~= nil then
					task.spawn(function()
						l__ContentProvider__5:PreloadAsync(v12.instances);
					end);
				end;
				if v12.callback ~= nil then
					local l__callback__8 = v12.callback;
					task.spawn(function()
						l__callback__8();
					end);
				end;
				if v12.sounds ~= nil then
					task.spawn(function()
						local l__sounds__13 = v12.sounds;
						local function v14(p4)
							return u6("Sound", {
								SoundId = p4
							});
						end;
						local v15 = table.create(#l__sounds__13);
						for v16, v17 in ipairs(l__sounds__13) do
							v15[v16] = v14(v17, v16 - 1, l__sounds__13);
						end;
						l__ContentProvider__5:PreloadAsync(v15);
					end);
				end;
				if v12.animations ~= nil then
					task.spawn(function()
						local l__animations__18 = v12.animations;
						local function v19(p5)
							return l__GameAnimationUtil__7.getAnimation(p5);
						end;
						local v20 = table.create(#l__animations__18);
						for v21, v22 in ipairs(l__animations__18) do
							v20[v21] = v19(v22, v21 - 1, l__animations__18);
						end;
						l__ContentProvider__5:PreloadAsync(v20);
					end);
				end;			
			end;
		end);
	end);
end;
function v3.preloadForItemType(p6, p7, p8)
	table.insert(p6.itemPreloads[p7], p8);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
