-- Script Hash: b5026a8465d8baa1aca0a448b9091fa1492830fc6fbc8a95e0dbf02cab96e935557842729ae67c5376612719520a77dd
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitClient__4 = v3.KnitClient;
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v7 = setmetatable({}, {
	__tostring = function()
		return "FlamethrowerController";
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
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "FlamethrowerController";
	p1.maid = l__Maid__3.new();
end;
function u1.KnitStart(p2)
	u2.KnitStart(p2);
end;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__FLAMETHROWER_USE__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId.FLAMETHROWER_USE;
local l__PyroUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__8 = v3.KnitClient;
local l__GameAnimationUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__10 = v5.Players;
local l__AnimationType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function u1.useFlamethrower(p3)
	if l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__FLAMETHROWER_USE__5) then
		if l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__FLAMETHROWER_USE__5) < 0.25 then
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__FLAMETHROWER_USE__5, "buffer", function()
				if p3:isEnabled() then
					p3:useFlamethrower();
				end;
			end);
		end;
		return nil;
	end;
	l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__FLAMETHROWER_USE__5, l__PyroUtil__6.FLAMETHROWER_COOLDOWN_SEC);
	l__default__7.Client:Get("UseFlamethrower"):CallServerAsync();
	local v9 = l__KnitClient__8.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 0.2
	});
	p3.maid:GiveTask(v9);
	local u12 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, l__AnimationType__11.FLAMETHROWER_USE);
	p3.maid:GiveTask(function()
		if u12 ~= nil then
			u12:Stop();
		end;
	end);
	if u12 ~= nil then
		local v10 = u12.Stopped:Connect(function()
			v9.Destroy();
		end);
	end;
end;
function u1.upgrade(p4)
	if p4:isEnabled() then
		local u13 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, l__AnimationType__11.FLAMETHROWER_UPGRADE);
		p4.maid:GiveTask(function()
			if u13 ~= nil then
				u13:Stop();
			end;
		end);
	end;
end;
local l__ContextActionService__14 = v5.ContextActionService;
local l__DeviceUtil__15 = v2.DeviceUtil;
local u16 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__17 = v2.MobileButton;
local l__BedwarsUI__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__UIUtil__19 = v2.UIUtil;
function u1.onEnable(p5, p6)
	p5:setupYield(function()
		local v11 = l__Maid__3.new();
		v11:GiveTask(l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__FLAMETHROWER_USE__5));
		return function()
			v11:DoCleaning();
		end;
	end);
	p5:setupYield(function()
		local u20 = l__GameAnimationUtil__9.playAnimation(l__Players__10.LocalPlayer, l__AnimationType__11.FLAMETHROWER_IDLE, {
			looped = true
		});
		return function()
			if u20 ~= nil then
				u20:Stop();
			end;
		end;
	end);
	l__ContextActionService__14:BindAction("use-flamethrower", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			p5:useFlamethrower();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p5.maid:GiveTask(function()
		l__ContextActionService__14:UnbindAction("use-flamethrower");
	end);
	if l__DeviceUtil__15.isMobileControls() then
		p5:setupYield(function()
			local u21 = u16.mount(u16.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u16.createElement(l__MobileButton__17, {
					Image = "rbxassetid://6862310392", 
					Position = l__BedwarsUI__18:getActionMobileButtonPosition(), 
					OnClick = function()
						p5:useFlamethrower();
					end
				}) }), l__Players__10.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u16.unmount(u21);
			end;
		end);
	end;
	local v12 = "[X] ";
	if l__DeviceUtil__15.isGamepadControls() then
		v12 = "[B] ";
	end;
	if l__DeviceUtil__15.isMobileControls() then
		v12 = "";
	end;
	p5:setupYield(function()
		local u22 = u16.mount(u16.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { u16.createElement("ImageButton", {
				Size = UDim2.fromScale(0.08, 0.1), 
				Position = l__UIUtil__19:getActionBarPosition(), 
				AnchorPoint = Vector2.new(0.5, 1), 
				BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
				BackgroundTransparency = 0.6, 
				BorderSizePixel = 0, 
				[u16.Event.MouseButton1Down] = function()
					l__KnitClient__4.Controllers.PyroController:openUpgradeMenu();
				end
			}, { u16.createElement("UIAspectRatioConstraint", {
					AspectRatio = 4.675675675675675
				}), u16.createElement("TextLabel", {
					Size = UDim2.fromScale(0.8, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Text = "<b>" .. v12 .. "Upgrade Flamethrower</b>", 
					Font = "Roboto", 
					RichText = true, 
					TextScaled = true, 
					TextColor3 = Color3.fromRGB(255, 255, 255)
				}) }) }), l__Players__10.LocalPlayer:WaitForChild("PlayerGui"));
		return function()
			u16.unmount(u22);
		end;
	end);
	l__ContextActionService__14:BindAction("open-upgrades", function(p10, p11, p12)
		if p11 == Enum.UserInputState.Begin then
			l__KnitClient__4.Controllers.PyroController:openUpgradeMenu();
		end;
	end, false, Enum.KeyCode.X, Enum.KeyCode.ButtonB);
	p5.maid:GiveTask(function()
		l__ContextActionService__14:UnbindAction("open-upgrades");
	end);
end;
function u1.onDisable(p13)
	p13.maid:DoCleaning();
end;
local l__ItemType__23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function u1.isRelevantItem(p14, p15)
	return p15.itemType == l__ItemType__23.FLAMETHROWER;
end;
u2 = l__KnitClient__4.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
