
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "VehicleController";
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
	p1.Name = "VehicleController";
end;
local l__WatchCollectionTag__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__Maid__3 = v2.Maid;
local l__getVehicleMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-meta").getVehicleMeta;
local l__HelicopterPilotClient__5 = v1.import(script, script.Parent, "helicopter", "helicopter-pilot-client").HelicopterPilotClient;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SyncEventPriority__8 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__VehicleUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-util").VehicleUtil;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("vehicle", function(p3)
		local u10 = l__Maid__3.new();
		p3.Destroying:Connect(function()
			u10:DoCleaning();
		end);
		local u11 = l__getVehicleMeta__4(p3.Name);
		local l__Driver__12 = p3:WaitForChild("Driver");
		local function u13()
			local v6 = nil;
			local l__helicopter__7 = u11.helicopter;
			if l__helicopter__7 ~= 0 and l__helicopter__7 == l__helicopter__7 and l__helicopter__7 ~= "" and l__helicopter__7 then
				v6 = l__HelicopterPilotClient__5.new(p3);
			else
				error("Failed to find vehicle client: " .. p3.Name);
			end;
			v6:enable(l__Driver__12);
		end;
		local function u14()
			local v8 = l__Driver__12.Occupant;
			if v8 then
				local v9 = l__Players__6.LocalPlayer.Character;
				if v9 ~= nil then
					v9 = v9:FindFirstChild("Humanoid");
				end;
				v8 = l__Driver__12.Occupant == v9;
			end;
			if v8 then
				u13();
			end;
		end;
		u10:GiveTask(l__Driver__12:GetPropertyChangedSignal("Occupant"):Connect(function()
			u14();
		end));
		u14();
		u10:GiveTask(l__ClientSyncEvents__7.ProjectileHit:setPriority(l__SyncEventPriority__8.HIGH):connect(function(p4)
			if p4:isCancelled() then
				return nil;
			end;
			local v10 = p4.hitData.part;
			if v10 ~= nil then
				v10 = v10:IsDescendantOf(p3);
			end;
			if v10 and p4.shooter and l__VehicleUtil__9:isInVehicle(p4.shooter:getInstance(), p3) then
				p4:setCancelled(true);
			end;
		end));
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;

