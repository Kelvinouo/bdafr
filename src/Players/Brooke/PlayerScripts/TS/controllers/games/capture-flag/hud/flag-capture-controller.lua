-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "FlagCaptureController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "FlagCaptureController";
	p1.rayMap = {};
	p1.flagMap = {};
	p1.flagLocation = {};
	p1.cooldown = 0;
	p1.slowMaid = u1.new();
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__QueueType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ScoreBoardWrapper__7 = v1.import(script, script.Parent, "ui", "flag-capture-ui").ScoreBoardWrapper;
local l__Players__8 = v4.Players;
local l__ClientSyncEvents__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SyncEventPriority__10 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__ItemType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__12 = v2.SoundManager;
local l__GameTheme__13 = v2.GameTheme;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__15 = v4.RunService;
local l__CollectionTagAdded__16 = v2.CollectionTagAdded;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	local u17 = u1.new();
	l__default__2.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		if p3.matchState == l__MatchState__4.RUNNING and l__ClientStore__3:getState().Game.queueType == l__QueueType__5.FLAG_CAPTURE then
			local u18 = u6.mount(l__ScoreBoardWrapper__7(), l__Players__8.LocalPlayer:WaitForChild("PlayerGui"));
			u17:GiveTask(function()
				u6.unmount(u18);
			end);
		end;
		if p3.matchState == l__MatchState__4.POST then
			u17:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__9.StartLaunchProjectile:setPriority(l__SyncEventPriority__10.HIGHEST):connect(function(p4)
		if p4:isCancelled() then
			return nil;
		end;
		if p4.projectileType ~= "telepearl" then
			return nil;
		end;
		if l__Players__8.LocalPlayer:GetAttribute("FlagHolder") ~= true then
			return nil;
		end;
		p4:setCancelled(true);
	end);
	l__ClientSyncEvents__9.BeginProjectileTargeting:setPriority(l__SyncEventPriority__10.HIGHEST):connect(function(p5)
		if p5:isCancelled() then
			return nil;
		end;
		if p5.handItem.itemType ~= l__ItemType__11.TELEPEARL then
			return nil;
		end;
		if l__Players__8.LocalPlayer:GetAttribute("FlagHolder") ~= true then
			return nil;
		end;
		l__SoundManager__12:playSound(l__GameTheme__13.sound.uiDisabled);
		p5:setCancelled(true);
	end);
	l__ClientSyncEvents__9.ZiplineMount:setPriority(l__SyncEventPriority__10.HIGHEST):connect(function(p6)
		if p6:isCancelled() then
			return nil;
		end;
		if l__Players__8.LocalPlayer:GetAttribute("FlagHolder") ~= true then
			return nil;
		end;
		l__SoundManager__12:playSound(l__GameTheme__13.sound.uiDisabled);
		p6:setCancelled(true);
	end);
	l__default__2.Client:Get("RemoteName"):Connect(function(p7)
		print("[FLAG EFFECT] " .. p7.player.Name .. " captured.");
		p2:addSlow(p7.player);
		p2:createRay(p7.player);
	end);
	l__default__2.Client:Get("RemoteName"):Connect(function(p8)
		print("[FLAG EFFECT] " .. p8.player.Name .. " dropped.");
		p2:removeSlow(p8.player);
		local v8 = p2.rayMap[p8.player];
		if v8 then
			v8:Destroy();
			p2.rayMap[p8.player] = nil;
		end;
		local v9 = p2.flagMap[p8.player];
		if v9 then
			v9:Destroy();
			p2.flagMap[p8.player] = nil;
		end;
	end);
	l__default__2.Client:Get("RemoteName"):Connect(function(p9)
		if not p9.teamFlag then
			l__SoundManager__12:playSound(l__GameSound__14.FLAG_CAPTURE);
		end;
	end);
	l__RunService__15.Heartbeat:Connect(function()
		local v10, v11, v12 = pairs(p2.rayMap);
		while true do
			local v13, v14 = v10(v11, v12);
			if not v13 then
				break;
			end;
			local v15 = v13.Character;
			if v15 ~= nil then
				v15 = v15.PrimaryPart;
			end;
			if not v15 then
				v14:Destroy();
			end;
			local v16 = v14;
			if v16 then
				local v17 = v13;
				if v17 ~= nil then
					v17 = v17.Character;
				end;
				v16 = v17;
			end;
			if v16 then
				v14.Position = v13.Character:GetPrimaryPartCFrame().Position;
			end;		
		end;
		local l__flagMap__18 = p2.flagMap;
		local function v19(p10, p11)
			local v20 = p11.Character;
			if v20 ~= nil then
				v20 = v20.PrimaryPart;
			end;
			if not v20 then
				p10:Destroy();
			end;
			local v21 = p10;
			if v21 then
				local v22 = p11;
				if v22 ~= nil then
					v22 = v22.Character;
				end;
				v21 = v22;
			end;
			if v21 then
				local v23 = p11.Character;
				if v23 ~= nil then
					v23 = (v23:GetPrimaryPartCFrame() + Vector3.new(0, 8, 0)) * CFrame.Angles(0, math.pi / 2, 0);
				end;
				p10:SetPrimaryPartCFrame(v23);
			end;
		end;
		for v24, v25 in pairs(l__flagMap__18) do
			v19(v25, v24, l__flagMap__18);
		end;
	end);
	l__CollectionTagAdded__16("flag", function(p12)
		p12.Touched:Connect(function()
			if tick() < p2.cooldown then
				return nil;
			end;
			p2.cooldown = tick() + 0.2;
			l__default__2.Client:Get("RemoteName"):SendToServer({
				block = p12
			});
		end);
		if p2.flagLocation[p12] == nil then
			p2.flagLocation[p12] = p12.Position;
		end;
	end);
end;
local l__Workspace__19 = v4.Workspace;
local u20 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__21 = v4.ReplicatedStorage;
local l__GameQueryUtil__22 = v2.GameQueryUtil;
function v6.createRay(p13, p14)
	local v26 = Color3.fromRGB(230, 255, 0);
	if p14.Team == l__Players__8.LocalPlayer.Team then
		local v27 = Color3.fromRGB(0, 255, 13);
	else
		v27 = Color3.fromRGB(255, 0, 0);
	end;
	local v28 = {
		Parent = l__Workspace__19
	};
	local v29 = p14.Character;
	if v29 ~= nil then
		v29 = v29:GetPrimaryPartCFrame();
	end;
	v28.CFrame = v29;
	v28.Shape = Enum.PartType.Cylinder;
	v28.Color = v27;
	v28.Material = Enum.Material.ForceField;
	v28.CastShadow = false;
	v28.Size = Vector3.new(1200, 4, 4);
	v28.Orientation = Vector3.new(0, 0, 90);
	v28.Transparency = 0.25;
	v28.Anchored = true;
	v28.CanCollide = false;
	v28.CanQuery = false;
	v28.CanTouch = false;
	local v30 = u20("Part", v28);
	local v31 = p14.Character;
	if v31 ~= nil then
		v31 = v31:GetPrimaryPartCFrame();
	end;
	if v31 then
		local v32 = l__ReplicatedStorage__21.Assets.Effects.Flag:Clone();
		v32.Parent = l__Workspace__19;
		local v33 = p14.Team;
		if v33 ~= nil then
			v33 = v33.Name;
		end;
		if v33 == "Blue" then
			local v34 = Color3.fromRGB(230, 255, 0);
		else
			v34 = Color3.fromRGB(0, 120, 255);
		end;
		v32:WaitForChild("TeamIndicator1", 3).Color = v34;
		v32:WaitForChild("TeamIndicator2", 3).Color = v34;
		local v35 = p14.Character;
		if v35 ~= nil then
			v35 = v35:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0);
		end;
		v32:SetPrimaryPartCFrame(v35);
		p13.flagMap[p14] = v32;
		l__GameQueryUtil__22:setQueryIgnored(v32, true);
	end;
	l__GameQueryUtil__22:setQueryIgnored(v30, true);
	p13.rayMap[p14] = v30;
	return v30;
end;
local l__KnitClient__23 = v3.KnitClient;
function v6.addSlow(p15, p16)
	if p16 == l__Players__8.LocalPlayer then
		p15.slowMaid:GiveTask(l__KnitClient__23.Controllers.SprintController:getMovementStatusModifier():addModifier({
			moveSpeedMultiplier = 0.8
		}));
	end;
end;
function v6.removeSlow(p17, p18)
	if p18 == l__Players__8.LocalPlayer then
		p17.slowMaid:DoCleaning();
	end;
end;
local v36 = v3.KnitClient.CreateController(v6.new());
return nil;
