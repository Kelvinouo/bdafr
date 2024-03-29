-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LaunchPadController";
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
	p1.Name = "LaunchPadController";
	p1.launchpadData = {};
	p1.lastLaunch = -1;
	p1.launched = false;
end;
local l__CollectionTagAdded__1 = v2.CollectionTagAdded;
local l__Players__2 = v3.Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__Zone__6 = v1.import(script, v1.getModule(script, "@rbxts", "zone-plus").src).Zone;
local l__CollectionService__7 = v3.CollectionService;
local l__RunService__8 = v3.RunService;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientSyncEvents__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__CollectionTagAdded__1("launch-pad", function(p3)
		local v7 = p3:GetAttribute("PlacedByUserId");
		if v7 == nil then
			return nil;
		end;
		if p3:GetAttribute("ClientPlaced") then
			return nil;
		end;
		local v8 = l__Players__2:GetPlayerByUserId(v7);
		if v8 == nil then
			return nil;
		end;
		local v9 = v8:GetAttribute("Team");
		if v9 == nil then
			return nil;
		end;
		local v10 = u3.new();
		local v11 = p3:FindFirstChild("ZonePart");
		if v11 == nil or not v11:IsA("BasePart") then
			v11 = u4("Part", {
				Size = p3.Size * 1.25 + Vector3.new(0, 5, 0), 
				Position = p3.Position + Vector3.new(0, 5, 0), 
				Anchored = true, 
				CanCollide = false, 
				Transparency = 1, 
				Parent = p3
			});
			l__GameQueryUtil__5:setQueryIgnored(v11, true);
			v10:GiveTask(v11);
		end;
		local v12 = l__Zone__6.new(v11);
		v10:GiveTask(v12.localPlayerEntered:Connect(function()
			p2:attemptLaunch(p3, v9);
		end));
		v10:GiveTask(function()
			v12:destroy();
		end);
		p2.launchpadData[p3] = {
			zone = v12, 
			zonePart = v11, 
			maid = v10, 
			team = v9, 
			nextCheckForPlayer = -1
		};
	end);
	l__CollectionService__7:GetInstanceRemovedSignal("launch-pad"):Connect(function(p4)
		local v13 = p2.launchpadData[p4];
		if v13 then
			v13.maid:DoCleaning();
			p2.launchpadData[p4] = nil;
		end;
	end);
	l__RunService__8.Heartbeat:Connect(function()
		for v14, v15 in pairs(p2.launchpadData) do
			if time() < v15.nextCheckForPlayer then
				return nil;
			end;
			v15.nextCheckForPlayer = time() + 0.3;
			if v15.zone:findLocalPlayer() then
				p2:attemptLaunch(v14, v15.team);
			end;
		end;
	end);
	l__default__9.Client:OnEvent("RemoteName", function(p5)
		if p5.player ~= l__Players__2.LocalPlayer then
			l__ClientSyncEvents__10.LaunchPadUsed:fire(p5.launchpad);
		end;
	end);
end;
local l__Workspace__11 = v3.Workspace;
function v5.attemptLaunch(p6, p7, p8)
	if l__Workspace__11:GetServerTimeNow() - p6.lastLaunch < 1 then
		return nil;
	end;
	if l__Players__2.LocalPlayer:GetAttribute("Team") ~= p8 then
		return nil;
	end;
	local l__Character__16 = l__Players__2.LocalPlayer.Character;
	local v17 = p7:GetAttribute("Strength");
	if l__Character__16 then
		local l__AssemblyLinearVelocity__18 = l__Character__16.HumanoidRootPart.AssemblyLinearVelocity;
		l__Character__16.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
		local v19 = v17;
		if v19 == nil then
			v19 = 1;
		end;
		l__Character__16.PrimaryPart:ApplyImpulse(Vector3.new(0, l__Character__16.PrimaryPart.AssemblyMass * 100 * v19, 0));
		p6.lastLaunch = l__Workspace__11:GetServerTimeNow();
		p6.launched = true;
		l__default__9.Client:Get("RemoteName"):SendToServer({
			launchPad = p7
		});
		l__ClientSyncEvents__10.LaunchPadUsed:fire(p7);
	end;
end;
local v20 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
