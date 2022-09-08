-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants");
local v6 = setmetatable({}, {
	__tostring = function()
		return "BaseCannonController";
	end, 
	__index = l__KnitController__4
});
v6.__index = v6;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1, p2)
	l__KnitController__4.constructor(p1);
	p1.Name = "BaseCannonController";
	p1.cleanupMaid = u1.new();
	p1.updateAccumulator = 0;
	p1.cannonConfig = p2;
end;
local l__WatchCollectionTag__2 = v2.WatchCollectionTag;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v6.KnitStart(p3)
	l__WatchCollectionTag__2("tnt-wars-cannon", function(p4)
		if p3:isRelevantCannon(p4) and not p3:isBlockClientPredicted(p4) then
			p3:setupUI(p4);
			p3:updateCannon(p4);
			p3:offsetCannonCamera(p4);
			p3:startAutoFire(p4);
			if not p3:isFriendlyCannon(p4) then
				p3:highlightCannon(p4);
			end;
		end;
	end);
	l__default__3.Client:WaitFor("RemoteName"):expect():Connect(function(p5)
		if p3:isRelevantCannon(p5.cannon) then
			p3:preFire(p5.player, p5.cannon);
		end;
	end);
	l__default__3.Client:WaitFor("RemoteName"):expect():Connect(function(p6)
		if p3:isRelevantCannon(p6.cannon) then
			p3:handleLoadResult(p6.result);
		end;
	end);
end;
function v6.setupUI(p7, p8)
	p7:createCannonBillboard(p8);
	p7:createOperatePrompt(p8);
	p7:createAmmoLoadPrompt(p8);
end;
local l__TweenService__4 = v3.TweenService;
local u5 = TweenInfo.new(0.2, Enum.EasingStyle.Linear);
function v6.updateCannon(p9, p10)
	local u6 = p10:GetAttributeChangedSignal("LookVector"):Connect(function()
		local v7 = p10:GetAttribute("LookVector");
		if not v7 then
			return nil;
		end;
		if not p10.Base or not p10.Barrel then
			return nil;
		end;
		l__TweenService__4:Create(p10.Base, u5, {
			CFrame = CFrame.new(p10.Base.Position, p10.Base.Position + v7 * Vector3.new(1, 0, 1)) * CFrame.Angles(0, 3.141592653589793, 0)
		}):Play();
		l__TweenService__4:Create(p10.Barrel, u5, {
			CFrame = CFrame.new(p10.Barrel.Position, p10.Barrel.Position + v7) * CFrame.Angles(0, 3.141592653589793, 0)
		}):Play();
	end);
	local u7 = nil;
	u7 = p10.AncestryChanged:Connect(function(p11, p12)
		if not p12 then
			u6:Disconnect();
			u7:Disconnect();
		end;
	end);
end;
function v6.offsetCannonCamera(p13, p14)
	p14.Camera.Position = p14.Camera.Position + Vector3.new(0, 2, 0);
end;
local l__TNTLoadResult__8 = v5.TNTLoadResult;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__10 = v2.SoundManager;
function v6.handleLoadResult(p15, p16)
	if p16 == l__TNTLoadResult__8.SUCCESS then
		local v8 = l__GameSound__9.INFO_NOTIFICATION;
	else
		v8 = l__GameSound__9.ERROR_NOTIFICATION;
	end;
	l__SoundManager__10:playSound(v8, {
		position = nil
	});
end;
function v6.startAutoFire(p17, p18)
	local l__autoFire__9 = p17.cannonConfig.autoFire;
	if not l__autoFire__9 then
		return nil;
	end;
	task.spawn(function()
		while true do
			local v10 = task.wait(l__autoFire__9.fireInterval);
			if v10 == 0 then
				break;
			end;
			if v10 ~= v10 then
				break;
			end;
			if not v10 then
				break;
			end;
			if not p18 then
				break;
			end;
			if not p18.Parent then
				break;
			end;
			p17:requestCannonFire(p18);		
		end;
	end);
end;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__CannonBillboard__12 = v1.import(script, script.Parent, "ui", "cannon-billboard").CannonBillboard;
function v6.createCannonBillboard(p19, p20)
	u11.mount(u11.createElement(l__CannonBillboard__12, {
		config = p19.cannonConfig, 
		cannon = p20
	}), p20);
end;
local l__Theme__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u14 = { "Aim", "Aim & Fire" };
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__CollectionService__16 = v3.CollectionService;
local l__CANNON_COLLECTION_TAGS__17 = v5.CANNON_COLLECTION_TAGS;
local l__Players__18 = v3.Players;
function v6.createOperatePrompt(p21, p22)
	local v11 = p21.cannonConfig;
	if v11 ~= nil then
		v11 = v11.isAimable;
	end;
	local v12 = not v11;
	if v12 then
		local v13 = p21.cannonConfig;
		if v13 ~= nil then
			v13 = v13.autoFire;
		end;
		v12 = v13;
	end;
	if v12 then
		return nil;
	end;
	local v14 = {
		Name = "OperatePrompt", 
		UIOffset = Vector2.new(0, -40), 
		KeyboardKeyCode = l__Theme__13.promptKeyboardKey, 
		HoldDuration = 0.4, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 10, 
		ClickablePrompt = false
	};
	local v15 = p21.cannonConfig;
	if v15 ~= nil then
		v15 = v15.autoFire;
	end;
	if not v15 then
		local v16 = u14[2];
	else
		v16 = u14[1];
	end;
	v14.ActionText = v16;
	v14.Parent = p22;
	local v17 = u15("ProximityPrompt", v14);
	l__CollectionService__16:AddTag(v17, l__CANNON_COLLECTION_TAGS__17.proximity);
	v17.Triggered:Connect(function(p23)
		if p23 == l__Players__18.LocalPlayer then
			p21:operateCannon(p22);
		end;
	end);
end;
function v6.highlightCannon(p24, p25)
	local v18 = { p25.Base, p25.Barrel };
	local function v19(p26)
		u15("Highlight", {
			Adornee = p26, 
			OutlineColor = Color3.fromRGB(255, 0, 0), 
			OutlineTransparency = 0.1, 
			FillColor = Color3.fromRGB(255, 0, 0), 
			FillTransparency = 0.6, 
			DepthMode = Enum.HighlightDepthMode.AlwaysOnTop, 
			Parent = p26
		});
	end;
	local v20, v21, v22 = ipairs(v18);
	while true do
		v20(v21, v22);
		if not v20 then
			break;
		end;
		v22 = v20;
		v19(v21, v20 - 1, v18);	
	end;
end;
function v6.operateCannon(p27, p28)
	p27:setPromptVisibility(false);
	p27:setBillboardVisibility(false);
	p27:toggleMovement(false);
	p27:setCharacterVisible(false);
	p27:setCannonTransparency(p28, 0.8);
	p27:setCameraTargetCannon(p28);
	p27:mountActiveHud(p28);
	p27:handleAiming(p28);
end;
function v6.stopOperatingCannon(p29, p30)
	p29:setPromptVisibility(true);
	p29:setBillboardVisibility(true);
	p29:toggleMovement(true);
	p29:setCharacterVisible(true);
	p29:setCannonTransparency(p30, 0);
	p29:setCameraTargetHumanoid();
	p29:unmountActiveHud();
end;
function v6.requestCannonFire(p31, p32)
	l__default__3.Client:Get("RemoteName"):SendToServer({
		cannon = p32
	});
end;
local l__RunService__19 = v3.RunService;
local l__Workspace__20 = v3.Workspace;
function v6.handleAiming(p33, p34)
	p33:setCameraToCannon(p34);
	local v23 = l__Players__18.LocalPlayer.Character;
	if v23 ~= nil then
		v23 = v23:WaitForChild("Humanoid");
	end;
	local u21 = p34.AncestryChanged:Connect(function(p35, p36)
		if not p36 then
			p33.cleanupMaid:DoCleaning();
		end;
	end);
	local u22 = l__RunService__19.Heartbeat:Connect(function(p37)
		p33.updateAccumulator = p33.updateAccumulator + p37;
		if p33.updateAccumulator >= 0.2 then
			local v24 = l__Workspace__20.CurrentCamera;
			if v24 ~= nil then
				v24 = v24.CFrame;
			end;
			local v25 = l__Workspace__20.CurrentCamera;
			if v25 ~= nil then
				v25 = v25.CFrame.LookVector;
			end;
			if not v25 or not v24 then
				p33.updateAccumulator = 0;
				return nil;
			end;
			l__default__3.Client:Get("RemoteName"):SendToServer({
				cannon = p34, 
				cameraCFrame = v24, 
				lookVector = v25
			});
			p33.updateAccumulator = 0;
		end;
	end);
	local u23 = v23.Died:Connect(function()
		p33.cleanupMaid:DoCleaning();
	end);
	p33.cleanupMaid:GiveTask(function()
		u21:Disconnect();
		u22:Disconnect();
		u23:Disconnect();
		p33:stopOperatingCannon(p34);
	end);
end;
function v6.setCannonTransparency(p38, p39, p40)
	if p39 and p39.Parent and p39.Base and p39.Barrel then
		p39.Base.Transparency = p40;
		p39.Barrel.Transparency = p40;
	end;
end;
function v6.setCameraToCannon(p41, p42)
	local v26 = p42:GetAttribute("LastCameraCFrame");
	if v26 == "" or not v26 then
		return nil;
	end;
	local v27 = string.split(v26, ",");
	local v28 = table.create(#v27);
	local v29, v30, v31 = ipairs(v27);
	while true do
		v29(v30, v31);
		if not v29 then
			break;
		end;
		v31 = v29;
		v28[v29] = tonumber(v30);	
	end;
	l__Workspace__20.CurrentCamera.CFrame = CFrame.new(v28[1], v28[2], v28[3], v28[4], v28[5], v28[6], v28[7], v28[8], v28[9], v28[10], v28[11], v28[12]);
end;
local u24 = {
	mounted = {
		cameraMinZoomDistance = 6.5, 
		cameraMaxZoomDistance = 6.5
	}, 
	unmounted = {
		cameraMinZoomDistance = 0, 
		cameraMaxZoomDistance = 14
	}
};
function v6.setCameraTargetCannon(p43, p44)
	l__Workspace__20.CurrentCamera.CameraSubject = p44.Camera;
	l__Players__18.LocalPlayer.CameraMinZoomDistance = u24.mounted.cameraMinZoomDistance;
	l__Players__18.LocalPlayer.CameraMaxZoomDistance = u24.mounted.cameraMaxZoomDistance;
end;
function v6.setCameraTargetHumanoid(p45)
	local v32 = l__Players__18.LocalPlayer.Character;
	if v32 ~= nil then
		v32 = v32:FindFirstChild("Humanoid");
	end;
	l__Workspace__20.CurrentCamera.CameraSubject = v32;
	l__Players__18.LocalPlayer.CameraMinZoomDistance = u24.unmounted.cameraMinZoomDistance;
	l__Players__18.LocalPlayer.CameraMaxZoomDistance = u24.unmounted.cameraMaxZoomDistance;
end;
function v6.createAmmoLoadPrompt(p46, p47)
	local v33 = u15("ProximityPrompt", {
		Name = "AmmoPrompt", 
		UIOffset = Vector2.new(0, 40), 
		KeyboardKeyCode = Enum.KeyCode.X, 
		HoldDuration = 0.4, 
		RequiresLineOfSight = false, 
		MaxActivationDistance = 10, 
		ClickablePrompt = false, 
		ActionText = "Load TNT", 
		Parent = p47
	});
	l__CollectionService__16:AddTag(v33, l__CANNON_COLLECTION_TAGS__17.proximity);
	v33.Triggered:Connect(function(p48)
		if p48 == l__Players__18.LocalPlayer then
			l__default__3.Client:Get("RemoteName"):SendToServer({
				cannon = p47
			});
		end;
	end);
end;
function v6.setPromptVisibility(p49, p50)
	local v34, v35, v36 = ipairs((l__CollectionService__16:GetTagged(l__CANNON_COLLECTION_TAGS__17.proximity)));
	while true do
		v34(v35, v36);
		if not v34 then
			break;
		end;
		v36 = v34;
		v35.Enabled = p50;	
	end;
end;
function v6.setBillboardVisibility(p51, p52)
	local v37, v38, v39 = ipairs((l__CollectionService__16:GetTagged(l__CANNON_COLLECTION_TAGS__17.billboard)));
	while true do
		v37(v38, v39);
		if not v37 then
			break;
		end;
		v39 = v37;
		v38.Enabled = p52;	
	end;
end;
local l__ContextActionService__25 = v3.ContextActionService;
function v6.toggleMovement(p53, p54)
	if not p54 then
		local v40, v41, v42 = ipairs((Enum.PlayerActions:GetEnumItems()));
		while true do
			v40(v41, v42);
			if not v40 then
				break;
			end;
			v42 = v40;
			l__ContextActionService__25:BindAction("freeze-movement" .. "-" .. v41.Name, function()
				return Enum.ContextActionResult.Sink;
			end, false, v41);		
		end;
		local v43 = l__Players__18.LocalPlayer.Character;
		if v43 ~= nil then
			v43 = v43.PrimaryPart;
		end;
		if v43 then
			l__Players__18.LocalPlayer.Character.PrimaryPart.Anchored = true;
			return;
		end;
	else
		local v44, v45, v46 = ipairs((Enum.PlayerActions:GetEnumItems()));
		while true do
			v44(v45, v46);
			if not v44 then
				break;
			end;
			v46 = v44;
			l__ContextActionService__25:UnbindAction("freeze-movement" .. "-" .. v45.Name);		
		end;
		local v47 = l__Players__18.LocalPlayer.Character;
		if v47 ~= nil then
			v47 = v47.PrimaryPart;
		end;
		if v47 then
			l__Players__18.LocalPlayer.Character.PrimaryPart.Anchored = false;
		end;
	end;
end;
local l__KnitClient__26 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v6.setCharacterVisible(p55, p56)
	if p56 then
		local v48 = 0;
	else
		v48 = 1;
	end;
	l__KnitClient__26.Controllers.InvisibilityPotionController:setTransparencyOfCharacter(l__Players__18.LocalPlayer.Character, v48);
end;
local l__ActiveCannonHud__27 = v1.import(script, script.Parent, "ui", "active-cannon-hud").ActiveCannonHud;
function v6.mountActiveHud(p57, p58)
	local v49 = {
		cannon = p58, 
		config = p57.cannonConfig
	};
	function v49.unmount()
		p57:stopOperatingCannon(p58);
		p57.cleanupMaid:DoCleaning();
	end;
	function v49.requestFire(p59)
		p57:requestCannonFire(p59);
	end;
	p57.activeHud = u11.mount(u11.createElement(l__ActiveCannonHud__27, v49), l__Players__18.LocalPlayer:WaitForChild("PlayerGui"));
end;
function v6.unmountActiveHud(p60)
	if p60.activeHud then
		u11.unmount(p60.activeHud);
	end;
end;
function v6.isRelevantCannon(p61, p62)
	local v50 = p61.cannonConfig;
	if v50 ~= nil then
		v50 = v50.cannonType;
	end;
	return v50 == p62.Name;
end;
function v6.isBlockClientPredicted(p63, p64)
	return p64:GetAttribute("ClientPlaced");
end;
function v6.isFriendlyCannon(p65, p66)
	local v51 = l__Players__18:GetPlayerByUserId((p66:GetAttribute("PlacedByUserId")));
	if v51 ~= nil then
		v51 = v51.Team;
		if v51 ~= nil then
			v51 = v51.Name;
		end;
	end;
	local v52 = l__Players__18.LocalPlayer.Team;
	if v52 ~= nil then
		v52 = v52.Name;
	end;
	return v51 == v52;
end;
function v6.isLocalPlayer(p67, p68)
	return p68.UserId == l__Players__18.LocalPlayer.UserId;
end;
function v6.preFire(p69, p70, p71)
	p69:playCannonSound(p70, p71);
	p69:playScreenShake(p70, p71);
	p69:onFire(p70, p71);
end;
function v6.playCannonSound(p72, p73, p74)
	local v53 = p72.cannonConfig;
	if v53 ~= nil then
		v53 = v53.autoFire;
	end;
	if v53 then
		l__SoundManager__10:playSound(l__GameSound__9.CANNON_FIRE, {
			position = p74.Position
		});
		return nil;
	end;
	local v54 = {};
	if p72:isLocalPlayer(p73) then
		local v55 = nil;
	else
		v55 = p74.Position;
	end;
	v54.position = v55;
	l__SoundManager__10:playSound(l__GameSound__9.CANNON_FIRE, v54);
end;
function v6.playScreenShake(p75, p76, p77)
	local v56 = p75.cannonConfig;
	if v56 ~= nil then
		v56 = v56.autoFire;
	end;
	if v56 then
		return nil;
	end;
	if p75:isLocalPlayer(p76) then
		l__KnitClient__26.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -2, 0));
	end;
end;
return {
	BaseCannonController = v6
};
