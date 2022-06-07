-- Script Hash: f23c5508f9440604c6b1c88b360d5788a77eca4f146e8d84a4d8ed746782578f82398a1c8cced829b4d267e682fc1c7f
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
		local function u13()
			local v5 = nil;
			local l__helicopter__6 = u11.helicopter;
			if l__helicopter__6 ~= 0 and l__helicopter__6 == l__helicopter__6 and l__helicopter__6 ~= "" and l__helicopter__6 then
				v5 = l__HelicopterPilotClient__5.new(p3);
			else
				error("Failed to find vehicle client: " .. p3.Name);
			end;
			v5:enable(l__Driver__12);
		end;
		local function u14()
			local v7 = l__Driver__12.Occupant;
			if v7 then
				local v8 = l__Players__6.LocalPlayer.Character;
				if v8 ~= nil then
					v8 = v8:FindFirstChild("Humanoid");
				end;
				v7 = l__Driver__12.Occupant == v8;
			end;
			if v7 then
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
			local v9 = p4.hitData.part;
			if v9 ~= nil then
				v9 = v9:IsDescendantOf(p3);
			end;
			if v9 and p4.shooter and l__VehicleUtil__9:isInVehicle(p4.shooter:getInstance(), p3) then
				p4:setCancelled(true);
			end;
		end));
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
