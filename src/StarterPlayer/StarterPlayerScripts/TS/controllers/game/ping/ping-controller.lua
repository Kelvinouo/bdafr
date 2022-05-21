-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@flamework", "core").out);
local l__Reflect__3 = v2.Reflect;
local v4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Controller__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v6 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v7 = setmetatable({}, {
	__tostring = function()
		return "PingController";
	end
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
function v7.constructor(p1)
	p1.keys = { Enum.KeyCode.G };
	p1.lastPing = 0;
end;
local l__PlaceUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__ContextActionService__5 = v6.ContextActionService;
local l__Workspace__6 = v6.Workspace;
local l__PingConstants__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").PingConstants;
local l__Players__8 = v6.Players;
local l__GameQueryUtil__9 = v4.GameQueryUtil;
function v7.onStart(p2)
	if l__PlaceUtil__1.isLobbyServer() then
		return nil;
	end;
	l__default__2.Client:Get("RemoteName"):Connect(function(p3)
		if l__ClientStore__3:getState().Game.matchState == l__MatchState__4.PRE then
			return nil;
		end;
		p2:createIndicator(p3.location, p3.creator);
	end);
	local u10 = l__default__2.Client:Get("RemoteName");
	l__ContextActionService__5:BindAction("ping-location", function(p4, p5, p6)
		if p5 ~= Enum.UserInputState.Begin then
			return nil;
		end;
		if l__Workspace__6:GetServerTimeNow() - p2.lastPing < l__PingConstants__7.PING_COOLDOWN then
			return nil;
		end;
		p2.lastPing = l__Workspace__6:GetServerTimeNow();
		local l__UnitRay__9 = l__Players__8.LocalPlayer:GetMouse().UnitRay;
		local l__Character__10 = l__Players__8.LocalPlayer.Character;
		if not l__Character__10 then
			return nil;
		end;
		local v11 = RaycastParams.new();
		v11.FilterDescendantsInstances = { l__Character__10 };
		v11.FilterType = Enum.RaycastFilterType.Blacklist;
		local v12 = l__GameQueryUtil__9:raycast(l__UnitRay__9.Origin, l__UnitRay__9.Direction.Unit * 1000, v11, {
			ignorePart = function(p7)
				if p7:IsA("BasePart") and not p7.CanCollide then
					return true;
				end;
				return false;
			end
		});
		if v12 ~= nil then
			v12 = v12.Position;
		end;
		if not v12 then
			return nil;
		end;
		local v13 = v12 + Vector3.new(0, 2, 0);
		p2:createIndicator(v13, l__Players__8.LocalPlayer);
		u10:SendToServer({
			location = v13
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
local l__TweenService__18 = v6.TweenService;
local l__ConstraintType__19 = v4.ConstraintType;
function v7.createIndicator(p8, p9, p10)
	local v14 = {};
	if p10 == l__Players__8.LocalPlayer then
		local v15 = nil;
	else
		v15 = p9;
	end;
	v14.position = v15;
	v14.rollOffMaxDistance = 1000;
	v14.rollOffMinDistsance = 900;
	l__SoundManager__11:playSound(l__GameSound__12.PING, v14);
	local v16 = {
		uiType = l__IndicatorUIType__16.Custom
	};
	local v17 = {
		color3 = Color3.new(255, 255, 255), 
		template = l__PingGuiObject__17
	};
	local u20 = u14:fadeOverTime(l__PingConstants__7.PING_LIFETIME - 1, 1);
	function v17.transparency(p11, p12, p13)
		local v18 = p11:GetDescendants();
		local u21 = u20(p12);
		local function v19(p14)
			if p14:IsA("TextLabel") then
				p14.TextTransparency = u21;
			end;
			if p14:IsA("ImageLabel") then
				p14.ImageTransparency = u21;
			end;
		end;
		for v20, v21 in ipairs(v18) do
			v19(v21, v20 - 1, v18);
		end;
		return u21;
	end;
	v17.distanceRelativeToPlayer = true;
	v17.scaleWithAlpha = false;
	v17.scaleOnFade = false;
	v17.easeOutOnAppoach = false;
	function v17.onEnterAnimation(p15)
		local v22 = p15:FindFirstChild("PingIcon");
		if v22 ~= nil then
			v22 = v22:Clone();
		end;
		if not v22 then
			return nil;
		end;
		v22.Parent = p15;
		local v23 = l__TweenService__18:Create(v22, TweenInfo.new(0.15), {
			Size = UDim2.fromScale(1.5, 1.5), 
			ImageTransparency = 1
		});
		v23:Play();
		v23.Completed:Connect(function()
			v23:Destroy();
			v22:Destroy();
		end);
	end;
	v16.uiConfig = v17;
	v16.creator = p10 or l__Players__8.LocalPlayer;
	v16.attachTo = p9;
	v16.constraintType = l__ConstraintType__19.Constrained;
	function v16.onUpdateProperties(p16, p17, p18, p19, p20)
		local v24 = p19:FindFirstChild("Container");
		if v24 ~= nil then
			v24 = v24:FindFirstChild("PingCreatorAvatar");
		end;
		if v24 and p20 then
			local v25 = p20;
			if v25 ~= nil then
				v25 = v25.UserId;
			end;
			v24.Image = l__Players__8:GetUserThumbnailAsync(v25, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
		end;
		local v26 = p19:FindFirstChild("Container");
		if v26 ~= nil then
			v26 = v26:FindFirstChild("DistanceTracker");
		end;
		if v26 then
			v26.Text = "<b>" .. l__StringUtil__13.roundNumber(p16 / 3, 0) .. "m</b>";
		end;
	end;
	local u22 = l__Flamework__15.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController"):addIndicator(v16);
	task.delay(l__PingConstants__7.PING_LIFETIME + 2, function()
		u22:destroy();
	end);
end;
l__Reflect__3.defineMetadata(v7, "identifier", "client/controllers/game/ping/ping-controller@PingController");
l__Reflect__3.defineMetadata(v7, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__3.decorate(v7, "$:flamework@Controller", l__Controller__5, { {} });
return {
	PingController = v7
};
