-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "GuitarController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function u1.constructor(p1)
	l__HandKnitController__4.constructor(p1);
	p1.Name = "GuitarController";
	p1.maid = u2.new();
	p1.playingMaid = u2.new();
	p1.lastClickTime = -1;
	p1.playing = false;
	p1.lastHealTime = -1;
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Players__5 = v3.Players;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKitSkin__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__SoundManager__11 = v2.SoundManager;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__13 = v3.Workspace;
local l__GameQueryUtil__14 = v2.GameQueryUtil;
local l__ReplicatedStorage__15 = v3.ReplicatedStorage;
local l__RunService__16 = v3.RunService;
local l__TweenService__17 = v3.TweenService;
local l__Debris__18 = v3.Debris;
local l__CollectionTagAdded__19 = v2.CollectionTagAdded;
local l__CollectionService__20 = v3.CollectionService;
function u1.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
	l__default__3.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			local v7 = p4.targetEntity.PrimaryPart;
			if v7 ~= nil then
				v7 = v7:FindFirstChild("RootRigAttachment");
			end;
			local v8 = p4.sourceEntity:FindFirstChild(l__ItemType__4.GUITAR);
			if v8 ~= nil then
				v8 = v8:FindFirstChild("Handle");
				if v8 ~= nil then
					v8 = v8:FindFirstChild("HealBeamAttachment");
				end;
			end;
			if v7 and v8 then
				local v9 = p4.sourceEntity == l__Players__5.LocalPlayer.Character;
				if v9 then
					l__GameAnimationUtil__6.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__7.GUITAR_HEAL);
				end;
				local v10 = l__GameSound__8.GUITAR_HEAL_1;
				if l__KnitClient__9.Controllers.KitSkinController:getKitSkin(p4.sourceEntity) == l__BedwarsKitSkin__10.MELODY_ROCKSTAR then
					v10 = nil;
				end;
				if v10 ~= "" and v10 then
					local v11 = {};
					if v9 then
						local v12 = nil;
					else
						v12 = p4.sourceEntity:GetPrimaryPartCFrame().Position;
					end;
					v11.position = v12;
					if v9 then
						local v13 = 1;
					else
						v13 = 1.4;
					end;
					v11.volumeMultiplier = v13;
					l__SoundManager__11:playSound(v10, v11);
				end;
				local v14 = u12("Part", {
					Size = Vector3.new(1, 1, 1), 
					CFrame = p4.sourceEntity:GetPrimaryPartCFrame(), 
					Transparency = 1, 
					Anchored = true, 
					CanCollide = false, 
					Parent = l__Workspace__13.CurrentCamera
				});
				l__GameQueryUtil__14:setQueryIgnored(v14, true);
				local v15 = l__ReplicatedStorage__15:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("GuitarHeal"):Clone();
				v15.Parent = v14;
				local v16 = u2.new();
				v16:GiveTask(function()
					v15.Enabled = false;
					v1.Promise.delay(3):andThen(function()
						v14:Destroy();
					end);
				end);
				local u21 = tick();
				v16:GiveTask(l__RunService__16.RenderStepped:Connect(function(p5)
					local v17 = math.min(1, (tick() - u21) / 0.8);
					v14.CFrame = v8.WorldCFrame:Lerp(v7.WorldCFrame, v17);
					if v17 == 1 then
						v16:DoCleaning();
					end;
				end));
				local v18 = u12("Beam", {
					Attachment0 = v8, 
					Attachment1 = v7, 
					TextureSpeed = 10, 
					Width0 = 0, 
					Width1 = 0, 
					FaceCamera = true, 
					Color = v15.Color, 
					Parent = l__Workspace__13.CurrentCamera
				});
				l__TweenService__17:Create(v18, TweenInfo.new(0.2), {
					Width0 = 0.35, 
					Width1 = 0.35
				}):Play();
				v1.Promise.defer(function()
					wait(0.2);
					l__TweenService__17:Create(v18, TweenInfo.new(0.4), {
						Width0 = 0, 
						Width1 = 0
					}):Play();
					l__Debris__18:AddItem(v18, 1);
				end);
			end;
		end);
	end);
	l__CollectionTagAdded__19("GuitarPlaying", function(p6)
		local v19 = u2.new();
		local v20 = p6 == l__Players__5.LocalPlayer.Character;
		local v21 = l__GameSound__8.GUITAR_LOOP;
		if l__KnitClient__9.Controllers.KitSkinController:getKitSkin(p6) == l__BedwarsKitSkin__10.MELODY_ROCKSTAR then
			v21 = l__GameSound__8.GUITAR_LOOP_ROCKSTAR;
		end;
		local v22 = {};
		if v20 then
			local v23 = nil;
		else
			v23 = p6:GetPrimaryPartCFrame().Position;
		end;
		v22.position = v23;
		if v20 then
			local v24 = nil;
		else
			v24 = p6.PrimaryPart;
		end;
		v22.parent = v24;
		if v20 then
			local v25 = 1;
		else
			v25 = 1.4;
		end;
		v22.volumeMultiplier = v25;
		local v26 = l__SoundManager__11:playSound(v21, v22);
		if v26 then
			v26.TimePosition = tick() % v26.TimeLength;
			v26.Looped = true;
			v19:GiveTask(function()
				l__TweenService__17:Create(v26, TweenInfo.new(0.4), {
					Volume = 0
				}):Play();
				v1.Promise.delay(0.4):andThen(function()
					v26:Stop();
				end);
			end);
		end;
		v19:GiveTask(l__CollectionService__20:GetInstanceRemovedSignal("GuitarPlaying"):Connect(function(p7)
			print("instance removed:", p7);
			if p7 == p6 then
				v19:DoCleaning();
			end;
		end));
	end);
end;
function u1.isRelevantItem(p8, p9)
	return p9.itemType == l__ItemType__4.GUITAR;
end;
local l__ContextActionService__22 = v3.ContextActionService;
local l__UserInputService__23 = v3.UserInputService;
local u24 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__25 = v2.MobileButton;
local l__BedwarsImageId__26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function u1.onEnable(p10, p11)
	local function u28()
		if not p10.playing then
			p10:startPlaying();
		end;
		local v27 = tick();
		p10.lastClickTime = v27;
		local u29 = v1.Promise.delay(u1.CLICK_PLAY_TIME):andThen(function()
			if p10.lastClickTime == v27 then
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
				}) }), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
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
	local v28 = l__GameAnimationUtil__6.playAnimation(l__Players__5.LocalPlayer, l__AnimationType__7.GUITAR_PLAY, {
		looped = true
	});
	if v28 then
		p16.playingMaid:GiveTask(function()
			v28:Stop();
		end);
	end;
end;
function u1.stopPlaying(p17)
	p17.playing = false;
	p17.playingMaid:DoCleaning();
	task.spawn(function()
		l__default__3.Client:Get("RemoteName"):SendToServer();
	end);
end;
local l__EntityUtil__31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__PlayerEntity__32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
function u1.performHeal(p18)
	p18.lastHealTime = tick();
	local v29 = nil;
	if l__Players__5.LocalPlayer.Character then
		local l__Position__30 = l__Players__5.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		local v31 = l__EntityUtil__31:getAliveEntityInstances();
		local v32 = {};
		local v33 = 0;
		local v34, v35, v36 = ipairs((l__EntityUtil__31:getAliveEntityInstances()));
		while true do
			v34(v35, v36);
			if not v34 then
				break;
			end;
			if v35 ~= l__Players__5.LocalPlayer.Character == true then
				v33 = v33 + 1;
				v32[v33] = v35;
			end;		
		end;
		local v37 = {};
		local v38 = 0;
		local v39, v40, v41 = ipairs(v32);
		while true do
			v39(v40, v41);
			if not v39 then
				break;
			end;
			v41 = v39;
			local v42 = l__EntityUtil__31:getEntity(v40);
			if v42 ~= nil then
				v38 = v38 + 1;
				v37[v38] = v42;
			end;		
		end;
		local v43 = {};
		local v44 = 0;
		local v45, v46, v47 = ipairs(v37);
		while true do
			v45(v46, v47);
			if not v45 then
				break;
			end;
			if (v46:getInstance().PrimaryPart and (v46:getInstance():GetPrimaryPartCFrame().Position - l__Position__30).Magnitude <= 30) == true then
				v44 = v44 + 1;
				v43[v44] = v46;
			end;		
		end;
		local v48 = {};
		local v49 = 0;
		local v50, v51, v52 = ipairs(v43);
		while true do
			v50(v51, v52);
			if not v50 then
				break;
			end;
			if (v1.instanceof(v51, l__PlayerEntity__32) and v51:getPlayer().Team == l__Players__5.LocalPlayer.Team) == true then
				v49 = v49 + 1;
				v48[v49] = v51;
			end;		
		end;
		local v53 = {};
		local v54 = 0;
		local v55, v56, v57 = ipairs(v48);
		while true do
			v55(v56, v57);
			if not v55 then
				break;
			end;
			v57 = v55;
			if v56:isAlive() == true then
				v54 = v54 + 1;
				v53[v54] = v56;
			end;		
		end;
		table.sort(v53, function(p19, p20)
			return p19:getHealth() < p20:getHealth();
		end);
		if #v53 > 0 then
			v29 = v53[1]:getInstance();
		end;
	end;
	l__default__3.Client:Get("RemoteName"):SendToServer({
		healTarget = v29
	});
end;
u1.CLICK_PLAY_TIME = 3;
u1.HEAL_COOLDOWN = 2;
u1 = l__KnitClient__9.CreateController;
u1 = u1(u1.new());
return nil;
