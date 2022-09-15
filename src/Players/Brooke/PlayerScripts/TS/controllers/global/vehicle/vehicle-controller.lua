-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "VehicleController";
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
	p1.Name = "VehicleController";
end;
local l__WatchCollectionTag__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__getVehicleMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-meta").getVehicleMeta;
local l__HelicopterPilotClient__4 = v1.import(script, script.Parent, "helicopter", "helicopter-pilot-client").HelicopterPilotClient;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientSyncEvents__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SyncEventPriority__7 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__VehicleUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-util").VehicleUtil;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__WatchCollectionTag__1("vehicle", function(p3)
		local u9 = u2.new();
		p3.Destroying:Connect(function()
			u9:DoCleaning();
		end);
		local u10 = l__getVehicleMeta__3(p3.Name);
		local l__Driver__11 = p3:WaitForChild("Driver");
		u9:GiveTask(l__Driver__11:GetPropertyChangedSignal("Occupant"):Connect(function()
			local v5 = l__Driver__11.Occupant;
			if v5 then
				local v6 = l__Players__5.LocalPlayer.Character;
				if v6 ~= nil then
					v6 = v6:FindFirstChild("Humanoid");
				end;
				v5 = l__Driver__11.Occupant == v6;
			end;
			if v5 then
				local v7 = nil;
				if u10.helicopter then
					v7 = l__HelicopterPilotClient__4.new(p3, u10.helicopter.attack);
				else
					error("Failed to find vehicle client: " .. p3.Name);
				end;
				v7:enable(l__Driver__11);
			end;
		end));
		local v8 = l__Driver__11.Occupant;
		if v8 then
			local v9 = l__Players__5.LocalPlayer.Character;
			if v9 ~= nil then
				v9 = v9:FindFirstChild("Humanoid");
			end;
			v8 = l__Driver__11.Occupant == v9;
		end;
		if v8 then
			local v10 = nil;
			if u10.helicopter then
				v10 = l__HelicopterPilotClient__4.new(p3, u10.helicopter.attack);
			else
				error("Failed to find vehicle client: " .. p3.Name);
			end;
			v10:enable(l__Driver__11);
		end;
		u9:GiveTask(l__ClientSyncEvents__6.ProjectileHit:setPriority(l__SyncEventPriority__7.HIGH):connect(function(p4)
			if p4:isCancelled() then
				return nil;
			end;
			local v11 = p4.hitData.part;
			if v11 ~= nil then
				v11 = v11:IsDescendantOf(p3);
			end;
			if v11 and p4.shooter and l__VehicleUtil__8:isInVehicle(p4.shooter:getInstance(), p3) then
				p4:setCancelled(true);
			end;
		end));
	end);
end;
local v12 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
