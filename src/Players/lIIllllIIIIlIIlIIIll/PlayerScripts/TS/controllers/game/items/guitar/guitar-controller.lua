-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "GuitarController";
	end, 
	__index = l__HandKnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__HandKnitController__5;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "GuitarController";
	p1.maid = u3.new();
	p1.playingMaid = u3.new();
	p1.lastClickTime = -1;
	p1.playing = false;
	p1.lastHealTime = -1;
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__6 = v4.Players;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BedwarsKitSkin__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__SoundManager__11 = v2.SoundManager;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__13 = v4.Workspace;
local l__GameQueryUtil__14 = v2.GameQueryUtil;
local l__ReplicatedStorage__15 = v4.ReplicatedStorage;
local l__RunService__16 = v4.RunService;
local l__TweenService__17 = v4.TweenService;
local l__Debris__18 = v4.Debris;
local l__CollectionTagAdded__19 = v2.CollectionTagAdded;
local l__CollectionService__20 = v4.CollectionService;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			local v8 = p4.targetEntity.PrimaryPart;
			if v8 ~= nil then
				v8 = v8:FindFirstChild("RootRigAttachment");
			end;
			local v9 = p4.sourceEntity:FindFirstChild(l__ItemType__5.GUITAR);
			if v9 ~= nil then
				v9 = v9:FindFirstChild("Handle");
				if v9 ~= nil then
					v9 = v9:FindFirstChild("HealBeamAttachment");
				end;
			end;
			if v8 and v9 then
				local v10 = p4.sourceEntity == l__Players__6.LocalPlayer.Character;
				if v10 then
					l__GameAnimationUtil__7.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__8.GUITAR_HEAL);
				end;
				local v11 = l__GameSound__9.GUITAR_HEAL_1;
				if l__KnitClient__3.Controllers.KitSkinController:getKitSkin(p4.sourceEntity) == l__BedwarsKitSkin__10.MELODY_ROCKSTAR then
					v11 = nil;
				end;
				if v11 ~= "" and v11 then
					local v12 = {};
					if v10 then
						local v13 = nil;
					else
						v13 = p4.sourceEntity:GetPrimaryPartCFrame().Position;
					end;
					v12.position = v13;
					if v10 then
						local v14 = 1;
					else
						v14 = 1.4;
					end;
					v12.volumeMultiplier = v14;
					l__SoundManager__11:playSound(v11, v12);
				end;
				local v15 = u12("Part", {
					Size = Vector3.new(1, 1, 1), 
					CFrame = p4.sourceEntity:GetPrimaryPartCFrame(), 
					Transparency = 1, 
					Anchored = true, 
					CanCollide = false, 
					Parent = l__Workspace__13.CurrentCamera
				});
				l__GameQueryUtil__14:setQueryIgnored(v15, true);
				local v16 = l__ReplicatedStorage__15:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarHeal"):Clone();
				v16.Parent = v15;
				local v17 = u3.new();
				v17:GiveTask(function()
					v16.Enabled = false;
					v1.Promise.delay(3):andThen(function()
						v15:Destroy();
					end);
				end);
				local u21 = tick();
				v17:GiveTask(l__RunService__16.RenderStepped:Connect(function(p5)
					local v18 = math.min(1, (tick() - u21) / 0.8);
					v15.CFrame = v9.WorldCFrame:Lerp(v8.WorldCFrame, v18);
					if v18 == 1 then
						v17:DoCleaning();
					end;
				end));
				local v19 = u12("Beam", {
					Attachment0 = v9, 
					Attachment1 = v8, 
					TextureSpeed = 10, 
					Width0 = 0, 
					Width1 = 0, 
					FaceCamera = true, 
					Color = v16.Color, 
					Parent = l__Workspace__13.CurrentCamera
				});
				l__TweenService__17:Create(v19, TweenInfo.new(0.2), {
					Width0 = 0.35, 
					Width1 = 0.35
				}):Play();
				v1.Promise.defer(function()
					wait(0.2);
					l__TweenService__17:Create(v19, TweenInfo.new(0.4), {
						Width0 = 0, 
						Width1 = 0
					}):Play();
					l__Debris__18:AddItem(v19, 1);
				end);
			end;
		end);
	end);
	l__CollectionTagAdded__19("GuitarPlaying", function(p6)
		local v20 = u3.new();
		local v21 = p6 == l__Players__6.LocalPlayer.Character;
		local v22 = l__GameSound__9.GUITAR_LOOP;
		if l__KnitClient__3.Controllers.KitSkinController:getKitSkin(p6) == l__BedwarsKitSkin__10.MELODY_ROCKSTAR then
			v22 = l__GameSound__9.GUITAR_LOOP_ROCKSTAR;
		end;
		local v23 = {};
		if v21 then
			local v24 = nil;
		else
			v24 = p6:GetPrimaryPartCFrame().Position;
		end;
		v23.position = v24;
		if v21 then
			local v25 = nil;
		else
			v25 = p6.PrimaryPart;
		end;
		v23.parent = v25;
		if v21 then
			local v26 = 1;
		else
			v26 = 1.4;
		end;
		v23.volumeMultiplier = v26;
		local v27 = l__SoundManager__11:playSound(v22, v23);
		if v27 then
			v27.TimePosition = tick() % v27.TimeLength;
			v27.Looped = true;
			v20:GiveTask(function()
				l__TweenService__17:Create(v27, TweenInfo.new(0.4), {
					Volume = 0
				}):Play();
				v1.Promise.delay(0.4):andThen(function()
					v27:Stop();
				end);
			end);
		end;
		v20:GiveTask(l__CollectionService__20:GetInstanceRemovedSignal("GuitarPlaying"):Connect(function(p7)
			print("instance removed:", p7);
			if p7 == p6 then
				v20:DoCleaning();
			end;
		end));
	end);
end;
function u1.isRelevantItem(p8, p9)
	return p9.itemType == l__ItemType__5.GUITAR;
end;
local l__ContextActionService__22 = v4.ContextActionService;
local l__UserInputService__23 = v4.UserInputService;
local u24 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__25 = v2.MobileButton;
local l__BedwarsImageId__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p10, p11)
	local function u28()
		if not p10.playing then
			p10:startPlaying();
		end;
		local v28 = tick();
		p10.lastClickTime = v28;
		local u29 = v1.Promise.delay(u1.CLICK_PLAY_TIME):andThen(function()
			if p10.lastClickTime == v28 then
				p10:stopPlaying();
			end;
		end);
		p10.playingMaid:GiveTask(function()
			u29:cancel();
		end);
		if u1.HEAL_COOLDOWN < tick() - p10.lastHealTime then
			p10:performHeal();
		end;
	end;
	l__ContextActionService__22:BindAction("guitar-click", function(p12, p13, p14)
		u28();
	end, false, Enum.UserInputType.MouseButton1);
	p10.maid:GiveTask(function()
		l__ContextActionService__22:UnbindAction("guitar-click");
	end);
	if l__UserInputService__23.TouchEnabled then
		p10:setupYield(function()
			local u30 = u24.mount(u24.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u24.createElement(l__MobileButton__25, {
					Image = l__BedwarsImageId__26.GUITAR_MOBILE, 
					Position = l__BedwarsUI__27:getActionMobileButtonPosition(), 
					OnClick = function()
						u28();
					end
				}) }), l__Players__6.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u24.unmount(u30);
			end;
		end);
	end;
end;
function u1.onDisable(p15)
	p15:stopPlaying();
	p15.maid:DoCleaning();
end;
function u1.startPlaying(p16)
	p16.playing = true;
	local v29 = l__GameAnimationUtil__7.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__8.GUITAR_PLAY, {
		looped = true
	});
	if v29 then
		p16.playingMaid:GiveTask(function()
			v29:Stop();
		end);
	end;
end;
function u1.stopPlaying(p17)
	p17.playing = false;
	p17.playingMaid:DoCleaning();
	task.spawn(function()
		l__default__4.Client:Get("RemoteName"):SendToServer();
	end);
end;
local l__EntityUtil__31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__PlayerEntity__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
function u1.performHeal(p18)
	p18.lastHealTime = tick();
	local v30 = nil;
	if l__Players__6.LocalPlayer.Character then
		local v31 = l__EntityUtil__31:getAliveEntityInstances();
		local v32 = l__EntityUtil__31:getAliveEntityInstances();
		local function v33(p19)
			return p19 ~= l__Players__6.LocalPlayer.Character;
		end;
		local v34 = {};
		local v35 = 0;
		for v36, v37 in ipairs(v32) do
			if v33(v37, v36 - 1, v32) == true then
				v35 = v35 + 1;
				v34[v35] = v37;
			end;
		end;
		local function v38(p20)
			return l__EntityUtil__31:getEntity(p20);
		end;
		local v39 = {};
		local v40 = 0;
		for v41, v42 in ipairs(v34) do
			local v43 = v38(v42, v41 - 1, v34);
			if v43 ~= nil then
				v40 = v40 + 1;
				v39[v40] = v43;
			end;
		end;
		local l__Position__33 = l__Players__6.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		local function v44(p21)
			return p21:getInstance().PrimaryPart and (p21:getInstance():GetPrimaryPartCFrame().Position - l__Position__33).Magnitude <= 30;
		end;
		local v45 = {};
		local v46 = 0;
		for v47, v48 in ipairs(v39) do
			if v44(v48, v47 - 1, v39) == true then
				v46 = v46 + 1;
				v45[v46] = v48;
			end;
		end;
		local function v49(p22)
			return v1.instanceof(p22, l__PlayerEntity__32) and p22:getPlayer().Team == l__Players__6.LocalPlayer.Team;
		end;
		local v50 = {};
		local v51 = 0;
		for v52, v53 in ipairs(v45) do
			if v49(v53, v52 - 1, v45) == true then
				v51 = v51 + 1;
				v50[v51] = v53;
			end;
		end;
		local function v54(p23)
			return p23:isAlive();
		end;
		local v55 = {};
		local v56 = 0;
		for v57, v58 in ipairs(v50) do
			if v54(v58, v57 - 1, v50) == true then
				v56 = v56 + 1;
				v55[v56] = v58;
			end;
		end;
		table.sort(v55, function(p24, p25)
			return p24:getHealth() < p25:getHealth();
		end);
		if #v55 > 0 then
			v30 = v55[1]:getInstance();
		end;
	end;
	l__default__4.Client:Get("RemoteName"):SendToServer({
		healTarget = v30
	});
end;
u1.CLICK_PLAY_TIME = 3;
u1.HEAL_COOLDOWN = 2;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
