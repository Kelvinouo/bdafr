-- Script Hash: nil
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
local u1 = l__KnitController__5;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "FlagCaptureController";
	p1.rayMap = {};
	p1.flagMap = {};
	p1.flagLocation = {};
	p1.cooldown = 0;
	p1.slowMaid = u2.new();
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__QueueType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ScoreBoardWrapper__8 = v1.import(script, script.Parent, "ui", "flag-capture-ui").ScoreBoardWrapper;
local l__Players__9 = v4.Players;
local l__ClientSyncEvents__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__SyncEventPriority__11 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__ItemType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__13 = v2.SoundManager;
local l__GameTheme__14 = v2.GameTheme;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__16 = v4.RunService;
local l__CollectionTagAdded__17 = v2.CollectionTagAdded;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	local u18 = u2.new();
	l__default__3.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		if p3.matchState == l__MatchState__5.RUNNING and l__ClientStore__4:getState().Game.queueType == l__QueueType__6.FLAG_CAPTURE then
			local u19 = u7.mount(l__ScoreBoardWrapper__8(), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
			u18:GiveTask(function()
				u7.unmount(u19);
			end);
		end;
		if p3.matchState == l__MatchState__5.POST then
			u18:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__10.StartLaunchProjectile:setPriority(l__SyncEventPriority__11.HIGHEST):connect(function(p4)
		if p4:isCancelled() then
			return nil;
		end;
		if p4.projectileType ~= "telepearl" then
			return nil;
		end;
		if l__Players__9.LocalPlayer:GetAttribute("FlagHolder") ~= true then
			return nil;
		end;
		p4:setCancelled(true);
	end);
	l__ClientSyncEvents__10.BeginProjectileTargeting:setPriority(l__SyncEventPriority__11.HIGHEST):connect(function(p5)
		if p5:isCancelled() then
			return nil;
		end;
		if p5.handItem.itemType ~= l__ItemType__12.TELEPEARL then
			return nil;
		end;
		if l__Players__9.LocalPlayer:GetAttribute("FlagHolder") ~= true then
			return nil;
		end;
		l__SoundManager__13:playSound(l__GameTheme__14.sound.uiDisabled);
		p5:setCancelled(true);
	end);
	l__ClientSyncEvents__10.ZiplineMount:setPriority(l__SyncEventPriority__11.HIGHEST):connect(function(p6)
		if p6:isCancelled() then
			return nil;
		end;
		if l__Players__9.LocalPlayer:GetAttribute("FlagHolder") ~= true then
			return nil;
		end;
		l__SoundManager__13:playSound(l__GameTheme__14.sound.uiDisabled);
		p6:setCancelled(true);
	end);
	l__default__3.Client:Get("RemoteName"):Connect(function(p7)
		print("[FLAG EFFECT] " .. p7.player.Name .. " captured.");
		p2:addSlow(p7.player);
		p2:createRay(p7.player);
	end);
	l__default__3.Client:Get("RemoteName"):Connect(function(p8)
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
	l__default__3.Client:Get("RemoteName"):Connect(function(p9)
		if not p9.teamFlag then
			l__SoundManager__13:playSound(l__GameSound__15.FLAG_CAPTURE);
		end;
	end);
	l__RunService__16.Heartbeat:Connect(function()
		local l__rayMap__10 = p2.rayMap;
		local function v11(p10, p11)
			local v12 = p11.Character;
			if v12 ~= nil then
				v12 = v12.PrimaryPart;
			end;
			if not v12 then
				p10:Destroy();
			end;
			local v13 = p10;
			if v13 then
				local v14 = p11;
				if v14 ~= nil then
					v14 = v14.Character;
				end;
				v13 = v14;
			end;
			if v13 then
				p10.Position = p11.Character:GetPrimaryPartCFrame().Position;
			end;
		end;
		for v15, v16 in pairs(l__rayMap__10) do
			v11(v16, v15, l__rayMap__10);
		end;
		local l__flagMap__17 = p2.flagMap;
		local function v18(p12, p13)
			local v19 = p13.Character;
			if v19 ~= nil then
				v19 = v19.PrimaryPart;
			end;
			if not v19 then
				p12:Destroy();
			end;
			local v20 = p12;
			if v20 then
				local v21 = p13;
				if v21 ~= nil then
					v21 = v21.Character;
				end;
				v20 = v21;
			end;
			if v20 then
				local v22 = p13.Character;
				if v22 ~= nil then
					v22 = (v22:GetPrimaryPartCFrame() + Vector3.new(0, 8, 0)) * CFrame.Angles(0, math.pi / 2, 0);
				end;
				p12:SetPrimaryPartCFrame(v22);
			end;
		end;
		for v23, v24 in pairs(l__flagMap__17) do
			v18(v24, v23, l__flagMap__17);
		end;
	end);
	l__CollectionTagAdded__17("flag", function(p14)
		p14.Touched:Connect(function()
			if tick() < p2.cooldown then
				return nil;
			end;
			p2.cooldown = tick() + 0.2;
			l__default__3.Client:Get("RemoteName"):SendToServer({
				block = p14
			});
		end);
		if p2.flagLocation[p14] == nil then
			p2.flagLocation[p14] = p14.Position;
		end;
	end);
end;
local l__Workspace__20 = v4.Workspace;
local u21 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ReplicatedStorage__22 = v4.ReplicatedStorage;
local l__GameQueryUtil__23 = v2.GameQueryUtil;
function v6.createRay(p15, p16)
	local v25 = Color3.fromRGB(230, 255, 0);
	if p16.Team == l__Players__9.LocalPlayer.Team then
		local v26 = Color3.fromRGB(0, 255, 13);
	else
		v26 = Color3.fromRGB(255, 0, 0);
	end;
	local v27 = {
		Parent = l__Workspace__20
	};
	local v28 = p16.Character;
	if v28 ~= nil then
		v28 = v28:GetPrimaryPartCFrame();
	end;
	v27.CFrame = v28;
	v27.Shape = Enum.PartType.Cylinder;
	v27.Color = v26;
	v27.Material = Enum.Material.ForceField;
	v27.CastShadow = false;
	v27.Size = Vector3.new(1200, 4, 4);
	v27.Orientation = Vector3.new(0, 0, 90);
	v27.Transparency = 0.25;
	v27.Anchored = true;
	v27.CanCollide = false;
	v27.CanQuery = false;
	v27.CanTouch = false;
	local v29 = u21("Part", v27);
	local v30 = p16.Character;
	if v30 ~= nil then
		v30 = v30:GetPrimaryPartCFrame();
	end;
	if v30 then
		local v31 = l__ReplicatedStorage__22.Assets.Effects.Flag:Clone();
		v31.Parent = l__Workspace__20;
		local v32 = p16.Team;
		if v32 ~= nil then
			v32 = v32.Name;
		end;
		if v32 == "Blue" then
			local v33 = Color3.fromRGB(230, 255, 0);
		else
			v33 = Color3.fromRGB(0, 120, 255);
		end;
		v31:WaitForChild("TeamIndicator1", 3).Color = v33;
		v31:WaitForChild("TeamIndicator2", 3).Color = v33;
		local v34 = p16.Character;
		if v34 ~= nil then
			v34 = v34:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0);
		end;
		v31:SetPrimaryPartCFrame(v34);
		p15.flagMap[p16] = v31;
		l__GameQueryUtil__23:setQueryIgnored(v31, true);
	end;
	l__GameQueryUtil__23:setQueryIgnored(v29, true);
	p15.rayMap[p16] = v29;
	return v29;
end;
local l__KnitClient__24 = v3.KnitClient;
function v6.addSlow(p17, p18)
	if p18 == l__Players__9.LocalPlayer then
		p17.slowMaid:GiveTask(l__KnitClient__24.Controllers.SprintController:getMovementStatusModifier():addModifier({
			moveSpeedMultiplier = 0.8
		}));
	end;
end;
function v6.removeSlow(p19, p20)
	if p20 == l__Players__9.LocalPlayer then
		p19.slowMaid:DoCleaning();
	end;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
