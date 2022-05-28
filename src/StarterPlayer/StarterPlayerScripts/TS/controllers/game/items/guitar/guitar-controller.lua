-- Script Hash: a8665369b95663f8d88bd68e682a2cda3d7925bc9f72fa8eec18c7c96cc27f37d2b97168fb37c554f5f75882ec949f13
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "GuitarController";
	end, 
	__index = l__HandKnitController__6
});
v7.__index = v7;
local u1 = v7;
function u1.new(...)
	local v8 = setmetatable({}, u1);
	return v8:constructor(...) and v8;
end;
local u2 = l__HandKnitController__6;
local l__Maid__3 = v3.Maid;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "GuitarController";
	p1.maid = l__Maid__3.new();
	p1.playingMaid = l__Maid__3.new();
	p1.lastClickTime = -1;
	p1.playing = false;
	p1.lastHealTime = -1;
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__6 = v5.Players;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BedwarsKitSkin__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__SoundManager__11 = v2.SoundManager;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__13 = v5.Workspace;
local l__GameQueryUtil__14 = v2.GameQueryUtil;
local l__ReplicatedStorage__15 = v5.ReplicatedStorage;
local l__RunService__16 = v5.RunService;
local l__TweenService__17 = v5.TweenService;
local l__Debris__18 = v5.Debris;
local l__CollectionTagAdded__19 = v2.CollectionTagAdded;
local l__CollectionService__20 = v5.CollectionService;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			local v9 = p4.targetEntity.PrimaryPart;
			if v9 ~= nil then
				v9 = v9:FindFirstChild("RootRigAttachment");
			end;
			local v10 = p4.sourceEntity:FindFirstChild(l__ItemType__5.GUITAR);
			if v10 ~= nil then
				v10 = v10:FindFirstChild("Handle");
				if v10 ~= nil then
					v10 = v10:FindFirstChild("HealBeamAttachment");
				end;
			end;
			if v9 and v10 then
				local v11 = p4.sourceEntity == l__Players__6.LocalPlayer.Character;
				if v11 then
					l__GameAnimationUtil__7.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__8.GUITAR_HEAL);
				end;
				local v12 = l__GameSound__9.GUITAR_HEAL_1;
				if l__KnitClient__4.Controllers.KitSkinController:getKitSkin(p4.sourceEntity) == l__BedwarsKitSkin__10.MELODY_ROCKSTAR then
					v12 = nil;
				end;
				if v12 ~= "" and v12 then
					local v13 = {};
					if v11 then
						local v14 = nil;
					else
						v14 = p4.sourceEntity:GetPrimaryPartCFrame().Position;
					end;
					v13.position = v14;
					if v11 then
						local v15 = 1;
					else
						v15 = 1.4;
					end;
					v13.volumeMultiplier = v15;
					l__SoundManager__11:playSound(v12, v13);
				end;
				local v16 = u12("Part", {
					Size = Vector3.new(1, 1, 1), 
					CFrame = p4.sourceEntity:GetPrimaryPartCFrame(), 
					Transparency = 1, 
					Anchored = true, 
					CanCollide = false, 
					Parent = l__Workspace__13.CurrentCamera
				});
				l__GameQueryUtil__14:setQueryIgnored(v16, true);
				local v17 = l__ReplicatedStorage__15:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarHeal"):Clone();
				v17.Parent = v16;
				local v18 = l__Maid__3.new();
				v18:GiveTask(function()
					v17.Enabled = false;
					v1.Promise.delay(3):andThen(function()
						v16:Destroy();
					end);
				end);
				local u21 = tick();
				v18:GiveTask(l__RunService__16.RenderStepped:Connect(function(p5)
					local v19 = math.min(1, (tick() - u21) / 0.8);
					v16.CFrame = v10.WorldCFrame:Lerp(v9.WorldCFrame, v19);
					if v19 == 1 then
						v18:DoCleaning();
					end;
				end));
				local v20 = u12("Beam", {
					Attachment0 = v10, 
					Attachment1 = v9, 
					TextureSpeed = 10, 
					Width0 = 0, 
					Width1 = 0, 
					FaceCamera = true, 
					Color = v17.Color, 
					Parent = l__Workspace__13.CurrentCamera
				});
				l__TweenService__17:Create(v20, TweenInfo.new(0.2), {
					Width0 = 0.35, 
					Width1 = 0.35
				}):Play();
				v1.Promise.defer(function()
					wait(0.2);
					l__TweenService__17:Create(v20, TweenInfo.new(0.4), {
						Width0 = 0, 
						Width1 = 0
					}):Play();
					l__Debris__18:AddItem(v20, 1);
				end);
			end;
		end);
	end);
	l__CollectionTagAdded__19("GuitarPlaying", function(p6)
		local v21 = l__Maid__3.new();
		local v22 = p6 == l__Players__6.LocalPlayer.Character;
		local v23 = l__GameSound__9.GUITAR_LOOP;
		if l__KnitClient__4.Controllers.KitSkinController:getKitSkin(p6) == l__BedwarsKitSkin__10.MELODY_ROCKSTAR then
			v23 = l__GameSound__9.GUITAR_LOOP_ROCKSTAR;
		end;
		local v24 = {};
		if v22 then
			local v25 = nil;
		else
			v25 = p6:GetPrimaryPartCFrame().Position;
		end;
		v24.position = v25;
		if v22 then
			local v26 = nil;
		else
			v26 = p6.PrimaryPart;
		end;
		v24.parent = v26;
		if v22 then
			local v27 = 1;
		else
			v27 = 1.4;
		end;
		v24.volumeMultiplier = v27;
		local v28 = l__SoundManager__11:playSound(v23, v24);
		if v28 then
			v28.TimePosition = tick() % v28.TimeLength;
			v28.Looped = true;
			v21:GiveTask(function()
				l__TweenService__17:Create(v28, TweenInfo.new(0.4), {
					Volume = 0
				}):Play();
				v1.Promise.delay(0.4):andThen(function()
					v28:Stop();
				end);
			end);
		end;
		v21:GiveTask(l__CollectionService__20:GetInstanceRemovedSignal("GuitarPlaying"):Connect(function(p7)
			print("instance removed:", p7);
			if p7 == p6 then
				v21:DoCleaning();
			end;
		end));
	end);
end;
function u1.isRelevantItem(p8, p9)
	return p9.itemType == l__ItemType__5.GUITAR;
end;
local l__ContextActionService__22 = v5.ContextActionService;
local l__UserInputService__23 = v5.UserInputService;
local u24 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__25 = v2.MobileButton;
local l__BedwarsImageId__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p10, p11)
	local function u28()
		if not p10.playing then
			p10:startPlaying();
		end;
		local v29 = tick();
		p10.lastClickTime = v29;
		p10.playingMaid:GivePromise(v1.Promise.delay(u1.CLICK_PLAY_TIME):andThen(function()
			if p10.lastClickTime == v29 then
				p10:stopPlaying();
			end;
		end));
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
			local u29 = u24.mount(u24.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u24.createElement(l__MobileButton__25, {
					Image = l__BedwarsImageId__26.GUITAR_MOBILE, 
					Position = l__BedwarsUI__27:getActionMobileButtonPosition(), 
					OnClick = function()
						u28();
					end
				}) }), l__Players__6.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u24.unmount(u29);
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
	local v30 = l__GameAnimationUtil__7.playAnimation(l__Players__6.LocalPlayer, l__AnimationType__8.GUITAR_PLAY, {
		looped = true
	});
	if v30 then
		p16.playingMaid:GiveTask(function()
			v30:Stop();
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
local l__EntityUtil__30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__PlayerEntity__31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
function u1.performHeal(p18)
	p18.lastHealTime = tick();
	local v31 = nil;
	if l__Players__6.LocalPlayer.Character then
		local v32 = l__EntityUtil__30:getAliveEntityInstances();
		local v33 = l__EntityUtil__30:getAliveEntityInstances();
		local function v34(p19)
			return p19 ~= l__Players__6.LocalPlayer.Character;
		end;
		local v35 = {};
		local v36 = 0;
		for v37, v38 in ipairs(v33) do
			if v34(v38, v37 - 1, v33) == true then
				v36 = v36 + 1;
				v35[v36] = v38;
			end;
		end;
		local function v39(p20)
			return l__EntityUtil__30:getEntity(p20);
		end;
		local v40 = {};
		local v41 = 0;
		for v42, v43 in ipairs(v35) do
			local v44 = v39(v43, v42 - 1, v35);
			if v44 ~= nil then
				v41 = v41 + 1;
				v40[v41] = v44;
			end;
		end;
		local l__Position__32 = l__Players__6.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		local function v45(p21)
			return p21:getInstance().PrimaryPart and (p21:getInstance():GetPrimaryPartCFrame().Position - l__Position__32).Magnitude <= 30;
		end;
		local v46 = {};
		local v47 = 0;
		for v48, v49 in ipairs(v40) do
			if v45(v49, v48 - 1, v40) == true then
				v47 = v47 + 1;
				v46[v47] = v49;
			end;
		end;
		local function v50(p22)
			return v1.instanceof(p22, l__PlayerEntity__31) and p22:getPlayer().Team == l__Players__6.LocalPlayer.Team;
		end;
		local v51 = {};
		local v52 = 0;
		for v53, v54 in ipairs(v46) do
			if v50(v54, v53 - 1, v46) == true then
				v52 = v52 + 1;
				v51[v52] = v54;
			end;
		end;
		local function v55(p23)
			return p23:isAlive();
		end;
		local v56 = {};
		local v57 = 0;
		for v58, v59 in ipairs(v51) do
			if v55(v59, v58 - 1, v51) == true then
				v57 = v57 + 1;
				v56[v57] = v59;
			end;
		end;
		table.sort(v56, function(p24, p25)
			return p24:getHealth() < p25:getHealth();
		end);
		if #v56 > 0 then
			v31 = v56[1]:getInstance();
		end;
	end;
	l__default__4.Client:Get("RemoteName"):SendToServer({
		healTarget = v31
	});
end;
u1.CLICK_PLAY_TIME = 3;
u1.HEAL_COOLDOWN = 2;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
