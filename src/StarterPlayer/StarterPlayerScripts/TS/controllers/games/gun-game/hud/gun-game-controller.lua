-- Script Hash: 4169155c96f6e9f45f1fba506fdbbd191ba0a1cfbf1f612dfe09c7bf0a29629ef8337acbea93c6c4999420082cbadb38
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GunGameController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "GunGameController";
	p1.rayMap = {};
end;
local l__Maid__2 = v2.Maid;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__QueueType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HudProgressWrapper__8 = v1.import(script, script.Parent, "ui", "hud-progress").HudProgressWrapper;
local l__Players__9 = v3.Players;
local l__RunService__10 = v3.RunService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	local u11 = l__Maid__2.new();
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
		local v7 = p2.rayMap[p4.player];
		if v7 then
			v7:Destroy();
		end;
	end);
	l__RunService__10.Heartbeat:Connect(function()
		local l__rayMap__8 = p2.rayMap;
		local function v9(p5, p6)
			local v10 = p5;
			if v10 then
				local v11 = p6;
				if v11 ~= nil then
					v11 = v11.Character;
				end;
				v10 = v11;
			end;
			if v10 then
				p5.Position = p6.Character:GetPrimaryPartCFrame().Position;
			end;
		end;
		for v12, v13 in pairs(l__rayMap__8) do
			v9(v13, v12, l__rayMap__8);
		end;
	end);
end;
local l__Workspace__13 = v3.Workspace;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameQueryUtil__15 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
function v5.createRay(p7, p8)
	local v14 = {
		Parent = l__Workspace__13
	};
	local v15 = p8.Character;
	if v15 ~= nil then
		v15 = v15:GetPrimaryPartCFrame();
	end;
	v14.CFrame = v15;
	v14.Shape = Enum.PartType.Cylinder;
	v14.Color = Color3.fromRGB(230, 255, 0);
	v14.Material = Enum.Material.ForceField;
	v14.CastShadow = false;
	v14.Size = Vector3.new(1200, 6, 6);
	v14.Orientation = Vector3.new(0, 0, 90);
	v14.Transparency = 0.25;
	v14.Anchored = true;
	v14.CanCollide = false;
	v14.CanQuery = false;
	v14.CanTouch = false;
	local v16 = u14("Part", v14);
	l__GameQueryUtil__15:setQueryIgnored(v16, true);
	p7.rayMap[p8] = v16;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
