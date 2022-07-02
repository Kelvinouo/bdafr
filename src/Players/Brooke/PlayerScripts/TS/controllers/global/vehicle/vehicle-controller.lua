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
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VehicleController";
end;
local l__WatchCollectionTag__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__getVehicleMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-meta").getVehicleMeta;
local l__HelicopterPilotClient__5 = v1.import(script, script.Parent, "helicopter", "helicopter-pilot-client").HelicopterPilotClient;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SyncEventPriority__8 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__VehicleUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-util").VehicleUtil;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("vehicle", function(p3)
		local u10 = u3.new();
		p3.Destroying:Connect(function()
			u10:DoCleaning();
		end);
		local u11 = l__getVehicleMeta__4(p3.Name);
		local l__Driver__12 = p3:WaitForChild("Driver");
		u10:GiveTask(l__Driver__12:GetPropertyChangedSignal("Occupant"):Connect(function()
			local v5 = l__Driver__12.Occupant;
			if v5 then
				local v6 = l__Players__6.LocalPlayer.Character;
				if v6 ~= nil then
					v6 = v6:FindFirstChild("Humanoid");
				end;
				v5 = l__Driver__12.Occupant == v6;
			end;
			if v5 then
				local v7 = nil;
				local l__helicopter__8 = u11.helicopter;
				if l__helicopter__8 ~= 0 and l__helicopter__8 == l__helicopter__8 and l__helicopter__8 ~= "" and l__helicopter__8 then
					v7 = l__HelicopterPilotClient__5.new(p3);
				else
					error("Failed to find vehicle client: " .. p3.Name);
				end;
				v7:enable(l__Driver__12);
			end;
		end));
		local v9 = l__Driver__12.Occupant;
		if v9 then
			local v10 = l__Players__6.LocalPlayer.Character;
			if v10 ~= nil then
				v10 = v10:FindFirstChild("Humanoid");
			end;
			v9 = l__Driver__12.Occupant == v10;
		end;
		if v9 then
			local v11 = nil;
			local l__helicopter__12 = u11.helicopter;
			if l__helicopter__12 ~= 0 and l__helicopter__12 == l__helicopter__12 and l__helicopter__12 ~= "" and l__helicopter__12 then
				v11 = l__HelicopterPilotClient__5.new(p3);
			else
				error("Failed to find vehicle client: " .. p3.Name);
			end;
			v11:enable(l__Driver__12);
		end;
		u10:GiveTask(l__ClientSyncEvents__7.ProjectileHit:setPriority(l__SyncEventPriority__8.HIGH):connect(function(p4)
			if p4:isCancelled() then
				return nil;
			end;
			local v13 = p4.hitData.part;
			if v13 ~= nil then
				v13 = v13:IsDescendantOf(p3);
			end;
			if v13 and p4.shooter and l__VehicleUtil__9:isInVehicle(p4.shooter:getInstance(), p3) then
				p4:setCancelled(true);
			end;
		end));
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
