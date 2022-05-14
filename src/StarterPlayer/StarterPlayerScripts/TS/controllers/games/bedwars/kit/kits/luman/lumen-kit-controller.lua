-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__LegacyKitKnitController__4 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LumenKitController";
	end, 
	__index = l__LegacyKitKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__LegacyKitKnitController__4;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Maid__4 = v2.Maid;
function u1.constructor(p1)
	u2.constructor(p1, { l__BedwarsKit__3.LUMEN });
	p1.Name = "LumenKitController";
	p1.upgradeRequirement = 10;
	p1.maid = l__Maid__4.new();
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__5.Client:OnEvent("LumenProgress", function(p3)
		l__ClientStore__6:dispatch({
			type = "KitLumenIncrementProgress", 
			progress = p3.incrementProgress / p2.upgradeRequirement
		});
	end);
	l__default__5.Client:OnEvent("glyodcxwSndr", function(p4)
		p2:createEffect(p4.player);
	end);
end;
local l__Players__7 = v3.Players;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BuildRoduxApp__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local l__LumenProgressBar__10 = v1.import(script, script.Parent, "ui", "lumen-progress-bar").LumenProgressBar;
function u1.onKitEnabled(p5)
	local l__LocalPlayer__7 = l__Players__7.LocalPlayer;
	p5:gunGamePromise():andThen(function(p6)
		if not p6 then
			p5.maid:GiveTask((l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(l__BuildRoduxApp__9(l__LumenProgressBar__10))));
		end;
	end);
end;
function u1.onKitDisabled(p7)

end;
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__ReplicatedStorage__12 = v3.ReplicatedStorage;
local l__GameQueryUtil__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__CollectionService__14 = v3.CollectionService;
local l__Workspace__15 = v3.Workspace;
local l__RunService__16 = v3.RunService;
function u1.createEffect(p8, p9)
	local v8 = l__EntityUtil__11:getEntity(p9);
	if not v8 then
		return nil;
	end;
	p8:playAscendEffect(v8);
	local v9 = l__ReplicatedStorage__12.Assets.Effects.LumenUpgrade:Clone();
	local v10 = { v9 };
	local v11 = v9:GetDescendants();
	table.move(v11, 1, #v11, #v10 + 1, v10);
	local function v12(p10)
		l__GameQueryUtil__13:setQueryIgnored(p10, true);
	end;
	for v13, v14 in ipairs(v10) do
		v12(v14, v13 - 1, v10);
	end;
	l__CollectionService__14:AddTag(v9, "FirstPersonHidden");
	v9:SetPrimaryPartCFrame(v8:getInstance():GetPrimaryPartCFrame());
	v9.Parent = l__Workspace__15;
	l__RunService__16.Heartbeat:Connect(function()
		if not v8:isAlive() or v8:getInstance().PrimaryPart == nil then
			return nil;
		end;
		v9:SetPrimaryPartCFrame(v8:getInstance():GetPrimaryPartCFrame());
	end);
end;
function u1.playAscendEffect(p11, p12)
	local v15 = l__ReplicatedStorage__12.Assets.Effects.LumenAscend:Clone();
	l__CollectionService__14:AddTag(v15, "FirstPersonHidden");
	v15:SetPrimaryPartCFrame(p12:getInstance():GetPrimaryPartCFrame());
	v15.Parent = l__Workspace__15;
	local u17 = tick() + 1;
	l__RunService__16.Heartbeat:Connect(function()
		if u17 < tick() then
			v15:Destroy();
		end;
		if tick() < u17 then
			v15:SetPrimaryPartCFrame(p12:getInstance():GetPrimaryPartCFrame());
		end;
	end);
end;
local l__QueueType__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
function u1.gunGamePromise(p13)
	return v1.Promise.new(function(p14)
		local u19 = nil;
		u19 = l__ClientStore__6.changed:connect(function(p15, p16)
			if p15.Game.queueType ~= p16.Game.queueType then
				u19:disconnect();
				p14(p15.Game.queueType == l__QueueType__18.GUN_GAME);
			end;
		end);
	end);
end;
u2 = v2.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	LumenKitController = u2
};
return u1;
