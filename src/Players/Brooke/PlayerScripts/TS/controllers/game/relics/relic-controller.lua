-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "RelicController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "RelicController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	p2:setupRelicInfoIcon();
	l__ClientSyncEvents__1.MatchStateChange:connect(function(p3)
		p2:setupRelicInfoIcon();
	end);
end;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__KnitClient__4 = v2.KnitClient;
local l__Players__5 = v3.Players;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KnitClient__7 = v2.KnitClient;
local l__RelicIcon__8 = v1.import(script, script.Parent, "ui", "relic-icon").RelicIcon;
local l__Workspace__9 = v3.Workspace;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__CollectorPlayer__11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "collector", "collector-player").CollectorPlayer;
function v5.setupRelicInfoIcon(p4)
	if l__ClientStore__2:getState().Game.matchState == l__MatchState__3.PRE then
		return nil;
	end;
	local v7 = l__KnitClient__4.Controllers.RelicVotingController:getPlayerRelic(l__Players__5.LocalPlayer);
	if v7 then
		if p4.relicInfoIcon then
			u6.unmount(p4.relicInfoIcon);
		end;
		p4.relicInfoIcon = l__KnitClient__7.Controllers.StatusInfoListController:waitForSetupAddElement(u6.createElement(l__RelicIcon__8, {
			Relic = v7, 
			FrameProps = {
				Size = UDim2.fromScale(0.1, 1)
			}, 
			EnableTooltip = true
		}), "Left", "RelicInfoIcon");
		local l__CurrentCamera__8 = l__Workspace__9.CurrentCamera;
		if l__CurrentCamera__8 and l__KnitClient__4.Controllers.StatusInfoListController:getList() then
			local v9 = u10("Frame", {
				Size = UDim2.fromScale(0.03, 0.03), 
				BackgroundTransparency = 1
			});
			u6.mount(u6.createElement(l__RelicIcon__8, {
				Relic = v7
			}), v9);
			local v10 = l__KnitClient__4.Controllers.StatusInfoListController:getList();
			if v10 ~= nil then
				v10 = v10:WaitForChild("RelicInfoIcon");
			end;
			local v11 = v10;
			if v11 ~= nil then
				v11 = v11:FindFirstChildWhichIsA("GuiObject");
			end;
			local v12 = v11;
			if v12 ~= nil then
				v12 = v12:IsA("GuiObject");
			end;
			if v12 then
				local v13 = v11;
				if v13 ~= nil then
					v13 = v13.AbsolutePosition.X;
				end;
				l__CollectorPlayer__11:create(v9, Vector2.new(l__CurrentCamera__8.ViewportSize.X / 2, l__CurrentCamera__8.ViewportSize.Y / 2), Vector2.new(v13, v11.AbsolutePosition.Y + v11.AbsoluteSize.Y / 2), {
					amount = 1, 
					disableSounds = true
				}).play();
			end;
		end;
	end;
end;
local v14 = l__KnitClient__4.CreateController(v5.new());
return nil;
