-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FallDamageController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
function u1.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "FallDamageController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__WatchCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__4 = v2.Players;
local l__RunService__5 = v2.RunService;
local l__BLOCK_SIZE__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local l__BlockEngine__7 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Workspace__8 = v2.Workspace;
local l__ClientSyncEvents__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function u1.KnitStart(p2)
	local u10 = l__default__2.Client:Get("RemoteName");
	l__WatchCharacter__3(function(p3, p4)
		if l__Players__4.LocalPlayer == p3 then
			local u11 = false;
			local u12 = Vector3.new(0, 0, 0);
			l__RunService__5:BindToRenderStep("VelocityTracking", Enum.RenderPriority.Last.Value, function(p5)
				if u11 then
					local v6 = l__Players__4.LocalPlayer.Character;
					if v6 ~= nil then
						v6 = v6.PrimaryPart;
						if v6 ~= nil then
							v6 = v6.AssemblyLinearVelocity;
						end;
					end;
					u12 = v6 or Vector3.new(0, 0, 0);
				end;
			end);
			local l__Humanoid__7 = p4:WaitForChild("Humanoid");
			l__Humanoid__7.StateChanged:Connect(function(p6, p7)
				if p4.PrimaryPart == nil then
					return nil;
				end;
				if p7 == Enum.HumanoidStateType.Freefall then
					u11 = true;
					return;
				end;
				if p6 == Enum.HumanoidStateType.Freefall and p7 == Enum.HumanoidStateType.Landed then
					local l__PrimaryPart__8 = p4.PrimaryPart;
					local v9 = nil;
					if l__PrimaryPart__8 then
						local v10 = l__PrimaryPart__8.Position - Vector3.new(0, l__PrimaryPart__8.Size.Y / 2 + l__Humanoid__7.HipHeight + 0.25 * l__BLOCK_SIZE__6, 0);
						local v11 = 0;
						local v12 = false;
						while true do
							if v12 then
								v11 = v11 + 1;
							else
								v12 = true;
							end;
							if not (v11 < 5) then
								break;
							end;
							if l__BlockEngine__7:getStore():getBlockAt(l__BlockEngine__7:getBlockPosition(v10)) then
								break;
							end;
							v10 = l__PrimaryPart__8.Position - Vector3.new(0, l__PrimaryPart__8.Size.Y / 2 + l__Humanoid__7.HipHeight + 0.25 * l__BLOCK_SIZE__6 + v11 * l__BLOCK_SIZE__6, 0);						
						end;
						v9 = l__BlockEngine__7:getStore():getBlockAt(l__BlockEngine__7:getBlockPosition(v10));
					end;
					u10:SendToServer(v9, u12, l__Workspace__8:GetServerTimeNow());
					l__ClientSyncEvents__9.GroundTouch:fire(v9, u12);
				end;
			end);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	FallDamageController = u1
};
