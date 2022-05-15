
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "BedAlarmController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BedAlarmController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__6 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__Maid__7 = v3.Maid;
local l__ReplicatedStorage__8 = v4.ReplicatedStorage;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
local l__Workspace__10 = v4.Workspace;
local l__CollectionService__11 = v4.CollectionService;
local l__TweenService__12 = v4.TweenService;
function v6.KnitStart(p2)
	l__default__2.Client:OnEvent("BedAlarmTriggered", function(p3)
		local v8 = l__ClientStore__3:getState().Game.myTeam;
		if v8 ~= nil then
			v8 = v8.id;
		end;
		local v9 = p3.bedTeamId == v8;
		local v10 = {};
		if v9 then
			local v11 = nil;
		else
			v11 = p3.bedPosition;
		end;
		v10.position = v11;
		v10.rollOffMaxDistance = 100;
		local v12 = l__SoundManager__4:playSound(l__GameSound__5.BED_ALARM, v10);
		if v9 then
			l__Flamework__6.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
				message = "[Bed Alarm]: An intruder is near your bed!"
			});
		end;
		local v13 = l__Maid__7.new();
		local v14 = l__ReplicatedStorage__8:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BedAlarm"):Clone();
		v14:SetAttribute("RotationSpeed", 270);
		v14:SetPrimaryPartCFrame(CFrame.new(p3.bedPosition + Vector3.new(0, 15, 0)));
		local v15 = v14:GetDescendants();
		local function v16(p4)
			l__GameQueryUtil__9:setQueryIgnored(p4, true);
		end;
		for v17, v18 in ipairs(v15) do
			v16(v18, v17 - 1, v15);
		end;
		v14.Parent = l__Workspace__10;
		l__CollectionService__11:AddTag(v14, "RotatingObject");
		v13:GiveTask(function()
			v14:Destroy();
		end);
		if v12 then
			v12.Looped = true;
			v13:GiveTask(function()
				l__TweenService__12:Create(v12, TweenInfo.new(0.2), {
					Volume = 0
				}):Play();
				task.delay(0.2, function()
					v12:Stop();
				end);
			end);
			task.delay(5, function()
				v13:DoCleaning();
			end);
		end;
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;

