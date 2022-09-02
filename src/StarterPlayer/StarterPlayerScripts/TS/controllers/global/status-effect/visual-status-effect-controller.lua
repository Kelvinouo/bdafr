-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VisualStatusEffectController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "VisualStatusEffectController";
	p1.nametagTrees = {};
end;
local l__WatchCharacter__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__EntityUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClientSyncEvents__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__StatusEffectType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	p2:mountStatusEffectHud();
	l__WatchCharacter__1(function(p3, p4, p5)
		local v5 = l__EntityUtil__2:getEntity(p3);
		if not v5 then
			return nil;
		end;
		local v6 = p2.nametagTrees[v5];
		if v6 then
			u3.unmount(v6);
		end;
		task.spawn(function()
			local v7 = p2:mountStatusEffectNametag(p4);
			if v7 then
				p2.nametagTrees[v5] = v7;
				p5:GiveTask(function()
					p2.nametagTrees[v5] = nil;
				end);
			end;
		end);
	end);
	l__ClientSyncEvents__4.StatusEffectAdded:connect(function(p6)
		if p6.entityInstance == l__Players__5.LocalPlayer.Character then
			return nil;
		end;
		if p6.statusEffect == l__StatusEffectType__6.INVISIBILITY then
			task.spawn(function()
				p2:hideStatusEffectNameTag(p6.entityInstance);
			end);
		end;
	end);
	l__ClientSyncEvents__4.StatusEffectRemoved:connect(function(p7)
		if p7.entityInstance == l__Players__5.LocalPlayer.Character then
			return nil;
		end;
		if p7.statusEffect == l__StatusEffectType__6.INVISIBILITY then
			task.spawn(function()
				p2:showStatusEffectNameTag(p7.entityInstance);
			end);
		end;
	end);
end;
local u7 = v1.import(script, script.Parent, "ui", "hud", "status-effect-hud-list").StatusEffectHudListScreen;
function v3.mountStatusEffectHud(p8)
	u3.mount(u3.createElement(u7), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
end;
local u8 = v1.import(script, script.Parent, "ui", "nametag", "status-effect-tag-list").StatusEffectTagListBillboard;
function v3.mountStatusEffectNametag(p9, p10)
	local l__Head__8 = p10:WaitForChild("Head");
	if not l__Head__8 then
		return nil;
	end;
	return u3.mount(u3.createElement(u8, {
		EntityInstance = p10
	}), l__Head__8);
end;
function v3.hideStatusEffectNameTag(p11, p12)
	local l__Head__9 = p12:FindFirstChild("Head");
	if not l__Head__9 then
		return nil;
	end;
	l__Head__9:WaitForChild("StatusEffectTagBillboard"):WaitForChild("StatusEffectTagList").Visible = false;
end;
function v3.showStatusEffectNameTag(p13, p14)
	local l__Head__10 = p14:FindFirstChild("Head");
	if not l__Head__10 then
		return nil;
	end;
	l__Head__10:WaitForChild("StatusEffectTagBillboard"):WaitForChild("StatusEffectTagList").Visible = true;
end;
local v11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
