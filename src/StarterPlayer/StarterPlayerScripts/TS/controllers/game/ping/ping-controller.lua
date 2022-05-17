
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@flamework", "core").out);
local l__Reflect__3 = v2.Reflect;
local v4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v6 = setmetatable({}, {
	__tostring = function()
		return "PingController";
	end
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)
	p1.keys = { Enum.KeyCode.G };
	p1.lastPing = 0;
end;
local l__PlaceUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__ContextActionService__5 = v5.ContextActionService;
local l__Workspace__6 = v5.Workspace;
local l__PingConstants__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").PingConstants;
local l__Players__8 = v5.Players;
local l__GameQueryUtil__9 = v4.GameQueryUtil;
function v6.onStart(p2)
	if l__PlaceUtil__1.isLobbyServer() then
		return nil;
	end;
	l__default__2.Client:Get("ztobkVn"):Connect(function(p3)
		if l__ClientStore__3:getState().Game.matchState == l__MatchState__4.PRE then
			return nil;
		end;
		p2:createIndicator(p3.location, p3.creator);
	end);
	local u10 = l__default__2.Client:Get("xovkcdldnjhRoODa");
	l__ContextActionService__5:BindAction("ping-location", function(p4, p5, p6)
		if p5 ~= Enum.UserInputState.Begin then
			return nil;
		end;
		if l__Workspace__6:GetServerTimeNow() - p2.lastPing < l__PingConstants__7.PING_COOLDOWN then
			return nil;
		end;
		p2.lastPing = l__Workspace__6:GetServerTimeNow();
		local l__UnitRay__8 = l__Players__8.LocalPlayer:GetMouse().UnitRay;
		local l__Character__9 = l__Players__8.LocalPlayer.Character;
		if not l__Character__9 then
			return nil;
		end;
		local v10 = RaycastParams.new();
		v10.FilterDescendantsInstances = { l__Character__9 };
		v10.FilterType = Enum.RaycastFilterType.Blacklist;
		local v11 = l__GameQueryUtil__9:raycast(l__UnitRay__8.Origin, l__UnitRay__8.Direction.Unit * 1000, v10, {
			ignorePart = function(p7)
				if p7:IsA("BasePart") and not p7.CanCollide then
					return true;
				end;
				return false;
			end
		});
		if v11 ~= nil then
			v11 = v11.Position;
		end;
		if not v11 then
			return nil;
		end;
		local v12 = v11 + Vector3.new(0, 2, 0);
		p2:createIndicator(v12, l__Players__8.LocalPlayer);
		u10:SendToServer({
			location = v12
		});
	end, false, Enum.UserInputType.MouseButton3, unpack(p2.keys));
end;
local l__SoundManager__11 = v4.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__StringUtil__13 = v4.StringUtil;
local u14 = v4.IndicatorTransparencyFunctions;
local l__Flamework__15 = v2.Flamework;
local l__IndicatorUIType__16 = v4.IndicatorUIType;
local l__PingGuiObject__17 = v1.import(script, script.Parent, "ui", "ping-gui-object").PingGuiObject;
local l__TweenService__18 = v5.TweenService;
local l__ConstraintType__19 = v4.ConstraintType;
function v6.createIndicator(p8, p9, p10)
	local v13 = {};
	if p10 == l__Players__8.LocalPlayer then
		local v14 = nil;
	else
		v14 = p9;
	end;
	v13.position = v14;
	v13.rollOffMaxDistance = 1000;
	v13.rollOffMinDistsance = 900;
	l__SoundManager__11:playSound(l__GameSound__12.PING, v13);
	local v15 = {
		uiType = l__IndicatorUIType__16.Custom
	};
	local v16 = {
		color3 = Color3.new(255, 255, 255), 
		template = l__PingGuiObject__17
	};
	local u20 = u14:fadeOverTime(l__PingConstants__7.PING_LIFETIME - 1, 1);
	function v16.transparency(p11, p12, p13)
		local v17 = p11:GetDescendants();
		local u21 = u20(p12);
		local function v18(p14)
			if p14:IsA("TextLabel") then
				p14.TextTransparency = u21;
			end;
			if p14:IsA("ImageLabel") then
				p14.ImageTransparency = u21;
			end;
		end;
		for v19, v20 in ipairs(v17) do
			v18(v20, v19 - 1, v17);
		end;
		return u21;
	end;
	v16.distanceRelativeToPlayer = true;
	v16.scaleWithAlpha = false;
	v16.scaleOnFade = false;
	v16.easeOutOnAppoach = false;
	function v16.onEnterAnimation(p15)
		local v21 = p15:FindFirstChild("PingIcon");
		if v21 ~= nil then
			v21 = v21:Clone();
		end;
		if not v21 then
			return nil;
		end;
		v21.Parent = p15;
		local v22 = l__TweenService__18:Create(v21, TweenInfo.new(0.15), {
			Size = UDim2.fromScale(1.5, 1.5), 
			ImageTransparency = 1
		});
		v22:Play();
		v22.Completed:Connect(function()
			v22:Destroy();
			v21:Destroy();
		end);
	end;
	v15.uiConfig = v16;
	v15.creator = p10 or l__Players__8.LocalPlayer;
	v15.attachTo = p9;
	v15.constraintType = l__ConstraintType__19.Constrained;
	function v15.onUpdateProperties(p16, p17, p18, p19, p20)
		local v23 = p19:FindFirstChild("Container");
		if v23 ~= nil then
			v23 = v23:FindFirstChild("PingCreatorAvatar");
		end;
		if v23 and p20 then
			local v24 = p20;
			if v24 ~= nil then
				v24 = v24.UserId;
			end;
			v23.Image = l__Players__8:GetUserThumbnailAsync(v24, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
		end;
		local v25 = p19:FindFirstChild("Container");
		if v25 ~= nil then
			v25 = v25:FindFirstChild("DistanceTracker");
		end;
		if v25 then
			v25.Text = "<b>" .. l__StringUtil__13.roundNumber(p16 / 3, 0) .. "m</b>";
		end;
	end;
	local u22 = l__Flamework__15.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController"):addIndicator(v15);
	task.delay(l__PingConstants__7.PING_LIFETIME + 2, function()
		u22:destroy();
	end);
end;
l__Reflect__3.defineMetadata(v6, "identifier", "client/controllers/game/ping/ping-controller@PingController");
l__Reflect__3.defineMetadata(v6, "flamework:isExternal", false);
l__Reflect__3.defineMetadata(v6, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__3.defineMetadata(v6, "flamework:decorators", { "$:flamework@Controller" });
l__Reflect__3.defineMetadata(v6, "flamework:decorators.$:flamework@Controller", {
	type = "Controller"
});
return {
	PingController = v6
};

