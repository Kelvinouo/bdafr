-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BedAlarmController";
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
	p1.Name = "BedAlarmController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__7 = v3.ReplicatedStorage;
local l__GameQueryUtil__8 = v2.GameQueryUtil;
local l__Workspace__9 = v3.Workspace;
local l__CollectionService__10 = v3.CollectionService;
local l__TweenService__11 = v3.TweenService;
function v5.KnitStart(p2)
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v7 = l__ClientStore__2:getState().Game.myTeam;
		if v7 ~= nil then
			v7 = v7.id;
		end;
		local v8 = p3.bedTeamId == v7;
		local v9 = {};
		if v8 then
			local v10 = nil;
		else
			v10 = p3.bedPosition;
		end;
		v9.position = v10;
		v9.rollOffMaxDistance = 100;
		local v11 = l__SoundManager__3:playSound(l__GameSound__4.BED_ALARM, v9);
		if v8 then
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
				message = "[Bed Alarm]: An intruder is near your bed!"
			});
		end;
		local v12 = u6.new();
		local v13 = l__ReplicatedStorage__7:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BedAlarm"):Clone();
		v13:SetAttribute("RotationSpeed", 270);
		v13:SetPrimaryPartCFrame(CFrame.new(p3.bedPosition + Vector3.new(0, 15, 0)));
		local v14, v15, v16 = ipairs((v13:GetDescendants()));
		while true do
			v14(v15, v16);
			if not v14 then
				break;
			end;
			v16 = v14;
			l__GameQueryUtil__8:setQueryIgnored(v15, true);		
		end;
		v13.Parent = l__Workspace__9;
		l__CollectionService__10:AddTag(v13, "RotatingObject");
		v12:GiveTask(function()
			v13:Destroy();
		end);
		if v11 then
			v11.Looped = true;
			v12:GiveTask(function()
				l__TweenService__11:Create(v11, TweenInfo.new(0.2), {
					Volume = 0
				}):Play();
				task.delay(0.2, function()
					v11:Stop();
				end);
			end);
			task.delay(5, function()
				v12:DoCleaning();
			end);
		end;
	end);
end;
local v17 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
