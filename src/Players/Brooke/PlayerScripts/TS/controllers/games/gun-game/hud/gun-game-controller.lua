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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "GunGameController";
	p1.rayMap = {};
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__QueueType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__HudProgressWrapper__7 = v1.import(script, script.Parent, "ui", "hud-progress").HudProgressWrapper;
local l__Players__8 = v2.Players;
local l__RunService__9 = v2.RunService;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local u10 = u1.new();
	l__default__2.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		if p3.matchState == l__MatchState__4.RUNNING and l__ClientStore__3:getState().Game.queueType == l__QueueType__5.GUN_GAME then
			local u11 = u6.mount(l__HudProgressWrapper__7(), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
			u10:GiveTask(function()
				u6.unmount(u11);
			end);
		end;
		if p3.matchState == l__MatchState__4.POST then
			u10:DoCleaning();
		end;
	end);
	l__default__2.Client:WaitFor("RemoteName"):expect():Connect(function(p4)
		if p4.onLastWeapon then
			p2:createRay(p4.player);
			return;
		end;
		local v6 = p2.rayMap[p4.player];
		if v6 then
			v6:Destroy();
		end;
	end);
	l__RunService__9.Heartbeat:Connect(function()
		local v7, v8, v9 = pairs(p2.rayMap);
		while true do
			local v10, v11 = v7(v8, v9);
			if not v10 then
				break;
			end;
			local v12 = v11;
			if v12 then
				local v13 = v10;
				if v13 ~= nil then
					v13 = v13.Character;
				end;
				v12 = v13;
			end;
			if v12 then
				v11.Position = v10.Character:GetPrimaryPartCFrame().Position;
			end;		
		end;
	end);
end;
local l__Workspace__12 = v2.Workspace;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameQueryUtil__14 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
function v4.createRay(p5, p6)
	local v14 = {
		Parent = l__Workspace__12
	};
	local v15 = p6.Character;
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
	local v16 = u13("Part", v14);
	l__GameQueryUtil__14:setQueryIgnored(v16, true);
	p5.rayMap[p6] = v16;
end;
local v17 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
