-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	constructor = function(p1, p2)
		p1.vehicleModel = p2;
		p1.enginePowerRatio = 0;
	end, 
	onEnable = function(p3)

	end
};
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Maid__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v2.enable(p4, p5)
	local v3 = l__Players__1.LocalPlayer.Character;
	if v3 ~= nil then
		v3 = v3:FindFirstChild("Humanoid");
	end;
	if not v3 then
		return nil;
	end;
	local v4 = l__Maid__2.new();
	v4:GiveTask(function()
		p4:onDisable();
	end);
	v4:GiveTask(p5:GetPropertyChangedSignal("Occupant"):Connect(function()
		if p5.Occupant == nil or p5.Occupant ~= v3 then
			v4:DoCleaning();
		end;
	end));
	local u4 = true;
	v4:GiveTask(function()
		u4 = false;
	end);
	task.spawn(function()
		local v5 = l__default__3.Client:GetNamespace("Vehicle"):Get("SetEnginePower");
		local v6 = -1;
		while true do
			local v7 = task.wait(0.1);
			if v7 ~= 0 and v7 == v7 and v7 then
				v7 = u4;
			end;
			if v7 == 0 then
				break;
			end;
			if v7 ~= v7 then
				break;
			end;
			if not v7 then
				break;
			end;
			local u5 = v6;
			task.spawn(function()
				if u5 ~= p4.enginePowerRatio then
					u5 = p4.enginePowerRatio;
					v5:SendToServer(p4.vehicleModel, p4.enginePowerRatio);
				end;
			end);		
		end;
	end);
end;
function v2.onDisable(p6)

end;
function v2.setEnginePowerRatio(p7, p8)
	p7.enginePowerRatio = p8;
end;
return {
	VehicleClient = v2
};
