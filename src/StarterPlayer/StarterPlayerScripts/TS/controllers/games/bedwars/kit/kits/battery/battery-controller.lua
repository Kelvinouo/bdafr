-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BatteryController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BatteryController";
	p1.maid = u2.new();
end;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__RunService__5 = v2.RunService;
local l__Players__6 = v2.Players;
local l__Workspace__7 = v2.Workspace;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__KnitClient__3.Controllers.KitController:watchLocalKit(function(p3)
		p2.maid:DoCleaning();
		if p3 ~= l__BedwarsKit__4.BATTERY then
			return nil;
		end;
		p2.maid:GiveTask(l__RunService__5.Heartbeat:Connect(function()
			local v6 = l__Players__6.LocalPlayer.Character;
			if v6 ~= nil then
				v6 = v6.PrimaryPart;
			end;
			if not v6 then
				return nil;
			end;
			local v7 = OverlapParams.new();
			v7.MaxParts = 0;
			for v8, v9 in ipairs((l__Workspace__7:GetPartBoundsInRadius(l__Players__6.LocalPlayer.Character:GetPrimaryPartCFrame().Position, 6, v7))) do
				if v9:IsA("BasePart") then
					local v10 = l__KnitClient__3.Controllers.BatteryEffectsController:getBatteryIdFromPart(v9);
					if v10 ~= 0 and v10 == v10 and v10 then
						local v11 = l__KnitClient__3.Controllers.BatteryEffectsController:getBatteryInfo(v10);
						if v11 and v11.activateTime < l__Workspace__7:GetServerTimeNow() and v11.consumeTime + 0.5 < l__Workspace__7:GetServerTimeNow() then
							v11.consumeTime = l__Workspace__7:GetServerTimeNow();
							l__default__8.Client:Get("RemoteName"):SendToServer({
								batteryId = v10
							});
							return;
						end;
					end;
				end;
			end;
		end));
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v4.new());
return nil;
