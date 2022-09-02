-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "EmberKitController";
	p1.upgradeRequirement = 10;
	p1.maid = u2.new();
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__5 = v2.KnitClient;
local l__BedwarsKit__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__EmberProgressBar__9 = v1.import(script, script.Parent, "emberUI", "ember-progress-bar").EmberProgressBar;
function u1.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		l__ClientStore__4:dispatch({
			type = "KitEmberIncrementProgress", 
			progress = p3.incrementProgress / p2.upgradeRequirement
		});
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p4)
		p2:createEffect(p4.player);
	end);
	l__KnitClient__5.Controllers.KitController:watchLocalKit(function(p5)
		p2.maid:DoCleaning();
		if p5 ~= l__BedwarsKit__6.EMBER then
			return nil;
		end;
		print("Ember setup");
		p2.maid:GiveTask((l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__8(l__EmberProgressBar__9))));
	end);
end;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__11 = v3.ReplicatedStorage;
local l__CollectionService__12 = v3.CollectionService;
local l__GameQueryUtil__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__Workspace__14 = v3.Workspace;
local l__RunService__15 = v3.RunService;
function u1.createEffect(p6, p7)
	local v7 = l__EntityUtil__10:getEntity(p7);
	if not v7 then
		return nil;
	end;
	print("creating effects");
	p6:playAscendEffect(v7);
	local v8 = l__ReplicatedStorage__11.Assets.Effects.EmberUpgrade:Clone();
	l__CollectionService__12:AddTag(v8, "FirstPersonHidden");
	local v9 = { v8 };
	local v10 = v8:GetDescendants();
	table.move(v10, 1, #v10, #v9 + 1, v9);
	local v11, v12, v13 = ipairs(v9);
	while true do
		v11(v12, v13);
		if not v11 then
			break;
		end;
		v13 = v11;
		l__GameQueryUtil__13:setQueryIgnored(v12, true);	
	end;
	v8:SetPrimaryPartCFrame(v7:getInstance():GetPrimaryPartCFrame());
	v8.Parent = l__Workspace__14;
	l__RunService__15.Heartbeat:Connect(function()
		if not v7:isAlive() or v7:getInstance().PrimaryPart == nil then
			v8:Destroy();
			print("effects destroyed!");
			return nil;
		end;
		v8:SetPrimaryPartCFrame(v7:getInstance():GetPrimaryPartCFrame());
	end);
end;
function u1.playAscendEffect(p8, p9)
	local v14 = l__ReplicatedStorage__11.Assets.Effects.EmberAscend:Clone();
	l__CollectionService__12:AddTag(v14, "FirstPersonHidden");
	v14:SetPrimaryPartCFrame(p9:getInstance():GetPrimaryPartCFrame());
	v14.Parent = l__Workspace__14;
	local u16 = tick() + 1;
	l__RunService__15.Heartbeat:Connect(function()
		if u16 < tick() then
			v14:Destroy();
		end;
		if tick() < u16 then
			v14:SetPrimaryPartCFrame(p9:getInstance():GetPrimaryPartCFrame());
		end;
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(u1.new());
return {
	EmberKitController = u1
};
