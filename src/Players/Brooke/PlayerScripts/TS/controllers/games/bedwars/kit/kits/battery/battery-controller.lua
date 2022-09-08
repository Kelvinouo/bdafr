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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "BatteryController";
	p1.maid = u1.new();
end;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKit__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__RunService__4 = v2.RunService;
local l__Players__5 = v2.Players;
local l__Workspace__6 = v2.Workspace;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__KnitClient__2.Controllers.KitController:watchLocalKit(function(p3)
		p2.maid:DoCleaning();
		if p3 ~= l__BedwarsKit__3.BATTERY then
			return nil;
		end;
		p2.maid:GiveTask(l__RunService__4.Heartbeat:Connect(function()
			local v6 = l__Players__5.LocalPlayer.Character;
			if v6 ~= nil then
				v6 = v6.PrimaryPart;
			end;
			if not v6 then
				return nil;
			end;
			local v7 = OverlapParams.new();
			v7.MaxParts = 0;
			local v8, v9, v10 = ipairs((l__Workspace__6:GetPartBoundsInRadius(l__Players__5.LocalPlayer.Character:GetPrimaryPartCFrame().Position, 6, v7)));
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				v10 = v8;
				if v9:IsA("BasePart") then
					local v11 = l__KnitClient__2.Controllers.BatteryEffectsController:getBatteryIdFromPart(v9);
					if v11 ~= 0 and v11 == v11 and v11 then
						local v12 = l__KnitClient__2.Controllers.BatteryEffectsController:getBatteryInfo(v11);
						if v12 and v12.activateTime < l__Workspace__6:GetServerTimeNow() and v12.consumeTime + 0.5 < l__Workspace__6:GetServerTimeNow() then
							v12.consumeTime = l__Workspace__6:GetServerTimeNow();
							l__default__7.Client:Get("RemoteName"):SendToServer({
								batteryId = v11
							});
							return;
						end;
					end;
				end;			
			end;
		end));
	end);
end;
local v13 = l__KnitClient__2.CreateController(v4.new());
return nil;
