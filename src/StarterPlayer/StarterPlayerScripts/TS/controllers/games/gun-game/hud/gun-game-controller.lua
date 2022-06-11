-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GunGameController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GunGameController";
	p1.rayMap = {};
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__QueueType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HudProgressWrapper__8 = v1.import(script, script.Parent, "ui", "hud-progress").HudProgressWrapper;
local l__Players__9 = v2.Players;
local l__RunService__10 = v2.RunService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	local u11 = u2.new();
	l__default__3.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		if p3.matchState == l__MatchState__5.RUNNING and l__ClientStore__4:getState().Game.queueType == l__QueueType__6.GUN_GAME then
			local u12 = u7.mount(l__HudProgressWrapper__8(), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
			u11:GiveTask(function()
				u7.unmount(u12);
			end);
		end;
		if p3.matchState == l__MatchState__5.POST then
			u11:DoCleaning();
		end;
	end);
	l__default__3.Client:WaitFor("RemoteName"):expect():Connect(function(p4)
		if p4.onLastWeapon then
			p2:createRay(p4.player);
			return;
		end;
		local v6 = p2.rayMap[p4.player];
		if v6 then
			v6:Destroy();
		end;
	end);
	l__RunService__10.Heartbeat:Connect(function()
		local l__rayMap__7 = p2.rayMap;
		local function v8(p5, p6)
			local v9 = p5;
			if v9 then
				local v10 = p6;
				if v10 ~= nil then
					v10 = v10.Character;
				end;
				v9 = v10;
			end;
			if v9 then
				p5.Position = p6.Character:GetPrimaryPartCFrame().Position;
			end;
		end;
		for v11, v12 in pairs(l__rayMap__7) do
			v8(v12, v11, l__rayMap__7);
		end;
	end);
end;
local l__Workspace__13 = v2.Workspace;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameQueryUtil__15 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
function v4.createRay(p7, p8)
	local v13 = {
		Parent = l__Workspace__13
	};
	local v14 = p8.Character;
	if v14 ~= nil then
		v14 = v14:GetPrimaryPartCFrame();
	end;
	v13.CFrame = v14;
	v13.Shape = Enum.PartType.Cylinder;
	v13.Color = Color3.fromRGB(230, 255, 0);
	v13.Material = Enum.Material.ForceField;
	v13.CastShadow = false;
	v13.Size = Vector3.new(1200, 6, 6);
	v13.Orientation = Vector3.new(0, 0, 90);
	v13.Transparency = 0.25;
	v13.Anchored = true;
	v13.CanCollide = false;
	v13.CanQuery = false;
	v13.CanTouch = false;
	local v15 = u14("Part", v13);
	l__GameQueryUtil__15:setQueryIgnored(v15, true);
	p7.rayMap[p8] = v15;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
