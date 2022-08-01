-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VacuumController";
	end, 
	__index = v4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VacuumController";
	p1.loaded = false;
end;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.VACUUM;
end;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__4 = v3.Players;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__ContextActionService__6 = v3.ContextActionService;
local l__DeviceUtil__7 = v2.DeviceUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__9 = v2.MobileButton;
local l__BedwarsImageId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsUI__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
function v5.onEnable(p5, p6, p7)
	u1.onEnable(p5, p6, p7);
	p5:setupYield(function()
		local u12 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.VACUUM_IDLE, {
			looped = true
		});
		return function()
			if u12 ~= nil then
				u12:Stop();
			end;
		end;
	end);
	l__ContextActionService__6:BindAction("use-vacuum", function(p8, p9, p10)
		if p5.loaded then
			return Enum.ContextActionResult.Pass;
		end;
		if p9 == Enum.UserInputState.Begin then
			p5:useVacuum(p10, p7);
		end;
		return Enum.ContextActionResult.Sink;
	end, false, Enum.UserInputType.MouseButton1);
	p5.maid:GiveTask(function()
		l__ContextActionService__6:UnbindAction("use-vacuum");
	end);
	if l__DeviceUtil__7.isMobileControls() then
		p5:setupYield(function()
			local u13 = u8.mount(u8.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u8.createElement(l__MobileButton__9, {
					Image = l__BedwarsImageId__10.SHOOT_MOBILE, 
					Position = l__BedwarsUI__11:getActionMobileButtonPosition(), 
					OnPressDown = function(p11)
						p5:useVacuum(p11, p7);
					end
				}) }), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u8.unmount(u13);
			end;
		end);
	end;
end;
function v5.onDisable(p12)
	u1.onDisable(p12);
end;
function v5.useVacuum(p13, p14, p15)
	local v7 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.VACUUM_SUCK, {
		looped = true
	});
	if v7 then
		p13.maid:GiveTask(function()
			return v7:Stop();
		end);
	end;
	local v8 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.VACUUM_STARTUP, {
		looped = false
	});
	if v8 ~= nil then
		local v9 = v8.Stopped:Wait();
	end;
	if p14.UserInputState == Enum.UserInputState.End then
		if v7 ~= nil then
			v7:Stop(0.1);
		end;
		return nil;
	end;
	while v1.Promise.delay(0.05):await() and p15() and p14.UserInputState ~= Enum.UserInputState.End and not p13.loaded do
		p13:findGhosts();	
	end;
	if v7 ~= nil then
		v7:Stop(0.1);
	end;
end;
local l__CollectionService__14 = v3.CollectionService;
local l__default__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.findGhosts(p16)
	local v10 = l__Players__4.LocalPlayer.Character;
	if v10 ~= nil then
		v10 = v10.PrimaryPart;
		if v10 ~= nil then
			v10 = v10.CFrame;
		end;
	end;
	if not v10 then
		return nil;
	end;
	local v11 = l__CollectionService__14:GetTagged("ghost");
	local u16 = v10.Position + v10.LookVector.Unit * 15;
	local v12 = nil;
	for v13, v14 in ipairs(v11) do
		if (v14:GetPrimaryPartCFrame().Position - u16).Magnitude < 15 == true then
			v12 = v14;
			break;
		end;
	end;
	if not v12 then
		return nil;
	end;
	l__default__15.Client:Get("RemoteName"):SendToServer({
		id = v12:GetAttribute("Id")
	});
end;
function v5.onStartCharging(p17)

end;
function v5.onStopCharging(p18)

end;
function v5.onLaunch(p19, p20)
	task.spawn(function()
		local v15 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.VACUUM_LAUNCH, {
			looped = false
		});
		if not p20() and v15 ~= nil then
			v15:Stop();
		end;
		if v15 then
			p19.maid:GiveTask(function()
				return v15:Stop();
			end);
		end;
	end);
	p19.loaded = false;
end;
function v5.canLaunch(p21)
	return p21.loaded;
end;
function v5.onStartReload(p22, p23)

end;
function v5.setLoaded(p24)
	p24.loaded = true;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
