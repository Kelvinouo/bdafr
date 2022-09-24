-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GamePortalController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "GamePortalController";
	p1.teleportTime = 0;
end;
local l__Workspace__2 = v2.Workspace;
function u1.KnitStart(p2)
	local l__GamePortals__6 = l__Workspace__2:WaitForChild("Lobby"):WaitForChild("GamePortals");
end;
local l__Players__3 = v2.Players;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.hookPortal(p3, p4)
	local l__Portal__7 = p4:FindFirstChild("Portal");
	if l__Portal__7 then
		l__Portal__7.Touched:Connect(function(p5)
			if l__Players__3.LocalPlayer.Character and p5.Parent == l__Players__3.LocalPlayer.Character and u1.TELEPORT_COOLDOWN <= tick() - p3.teleportTime then
				p3.teleportTime = tick();
				l__default__4.Client:Get("RemoteName"):SendToServer({
					game = "islands"
				});
			end;
		end);
	end;
end;
u1.TELEPORT_COOLDOWN = 5;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	GamePortalController = u1
};
