-- Script Hash: 0084ea6f5154ea1b3e977f49f287cdab0f61db377e6347f52750588fbdc913bbbd314818181b01158d57ab67ff01acdc
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "EmberKitController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
local l__Maid__3 = v2.Maid;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "EmberKitController";
	p1.upgradeRequirement = 10;
	p1.maid = l__Maid__3.new();
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__6 = v2.KnitClient;
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__EmberProgressBar__10 = v1.import(script, script.Parent, "emberUI", "ember-progress-bar").EmberProgressBar;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		l__ClientStore__5:dispatch({
			type = "KitEmberIncrementProgress", 
			progress = p3.incrementProgress / p2.upgradeRequirement
		});
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p4)
		p2:createEffect(p4.player);
	end);
	l__KnitClient__6.Controllers.KitController:watchLocalKit(function(p5)
		p2.maid:DoCleaning();
		if p5 ~= l__BedwarsKit__7.EMBER then
			return nil;
		end;
		print("Ember setup");
		p2.maid:GiveTask((l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__9(l__EmberProgressBar__10))));
	end);
end;
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__12 = v3.ReplicatedStorage;
local l__CollectionService__13 = v3.CollectionService;
local l__GameQueryUtil__14 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__15 = v3.Workspace;
local l__RunService__16 = v3.RunService;
function u1.createEffect(p6, p7)
	local v7 = l__EntityUtil__11:getEntity(p7);
	if not v7 then
		return nil;
	end;
	print("creating effects");
	p6:playAscendEffect(v7);
	local v8 = l__ReplicatedStorage__12.Assets.Effects.EmberUpgrade:Clone();
	l__CollectionService__13:AddTag(v8, "FirstPersonHidden");
	local v9 = { v8 };
	local v10 = v8:GetDescendants();
	table.move(v10, 1, #v10, #v9 + 1, v9);
	local function v11(p8)
		l__GameQueryUtil__14:setQueryIgnored(p8, true);
	end;
	for v12, v13 in ipairs(v9) do
		v11(v13, v12 - 1, v9);
	end;
	v8:SetPrimaryPartCFrame(v7:getInstance():GetPrimaryPartCFrame());
	v8.Parent = l__Workspace__15;
	l__RunService__16.Heartbeat:Connect(function()
		if not v7:isAlive() or v7:getInstance().PrimaryPart == nil then
			v8:Destroy();
			print("effects destroyed!");
			return nil;
		end;
		v8:SetPrimaryPartCFrame(v7:getInstance():GetPrimaryPartCFrame());
	end);
end;
function u1.playAscendEffect(p9, p10)
	local v14 = l__ReplicatedStorage__12.Assets.Effects.EmberAscend:Clone();
	l__CollectionService__13:AddTag(v14, "FirstPersonHidden");
	v14:SetPrimaryPartCFrame(p10:getInstance():GetPrimaryPartCFrame());
	v14.Parent = l__Workspace__15;
	local u17 = tick() + 1;
	l__RunService__16.Heartbeat:Connect(function()
		if u17 < tick() then
			v14:Destroy();
		end;
		if tick() < u17 then
			v14:SetPrimaryPartCFrame(p10:getInstance():GetPrimaryPartCFrame());
		end;
	end);
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	EmberKitController = u2
};
return u1;
