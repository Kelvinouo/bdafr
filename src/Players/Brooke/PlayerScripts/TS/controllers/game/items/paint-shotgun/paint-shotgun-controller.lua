-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PaintShotgunController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	l__HandKnitController__4.constructor(p1);
	p1.Name = "PaintShotgunController";
	p1.maid = u1.new();
end;
function v5.KnitStart(p2)
	l__HandKnitController__4.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.PAINT_SHOTGUN;
end;
local l__GameAnimationUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__4 = v3.Players;
local l__AnimationType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__UserInputService__6 = v3.UserInputService;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).MobileButton;
local l__BedwarsUI__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local l__HttpService__10 = v3.HttpService;
local l__ContextActionService__11 = v3.ContextActionService;
function v5.onEnable(p5, p6, p7)
	p5:setupYield(function()
		local v7 = l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.PAINT_SHOTGUN_IDLE);
		if v7 then
			p5.maid:GiveTask(function()
				v7:Stop();
			end);
		end;
		return function()
			if v7 ~= nil then
				v7:Stop();
			end;
		end;
	end);
	if l__UserInputService__6.TouchEnabled then
		p5.maid:GiveTask(l__UserInputService__6.TouchTapInWorld:Connect(function(p8, p9)
			if not p9 then
				p5:fire();
			end;
		end));
		p5:setupYield(function()
			local u12 = u7.mount(u7.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, { u7.createElement(l__MobileButton__8, {
					Image = "rbxassetid://6862310392", 
					Position = l__BedwarsUI__9:getActionMobileButtonPosition(), 
					OnPressDown = function()
						p5:fire();
					end
				}) }), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
			return function()
				u7.unmount(u12);
			end;
		end);
	end;
	local v8 = "shoot-shotgun:" .. l__HttpService__10:GenerateGUID(false);
	l__ContextActionService__11:BindAction(v8, function(p10, p11, p12)
		if p11 == Enum.UserInputState.Begin then
			p5:fire();
		end;
	end, false, Enum.UserInputType.MouseButton1);
	p5.maid:GiveTask(function()
		l__ContextActionService__11:UnbindAction(v8);
	end);
end;
function v5.onDisable(p13)
	p13.maid:DoCleaning();
end;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__PaintShotgunConstants__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "paint-shotgun", "paint-shotgun-constants").PaintShotgunConstants;
local l__Workspace__16 = v3.Workspace;
local l__default__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__18 = v2.KnitClient;
local l__KnitClient__19 = v2.KnitClient;
function v5.fire(p14)
	if l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(l__CooldownId__14.PAINT_SHOTGUN) then
		if l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(l__CooldownId__14.PAINT_SHOTGUN) < 0.2 then
			l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CooldownId__14.PAINT_SHOTGUN, "buffered-paint-shot", function()
				p14:fire();
			end);
		end;
		return nil;
	end;
	l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__14.PAINT_SHOTGUN, l__PaintShotgunConstants__15.COOLDOWN);
	local l__Character__9 = l__Players__4.LocalPlayer.Character;
	if l__Character__9 then
		local v10 = l__Workspace__16.CurrentCamera;
		if v10 ~= nil then
			v10 = v10.CFrame.LookVector;
		end;
		if v10 then
			l__Character__9:SetPrimaryPartCFrame(CFrame.new(l__Character__9:GetPrimaryPartCFrame().Position, l__Character__9:GetPrimaryPartCFrame().Position + v10 * Vector3.new(1, 0, 1)));
			local v11 = l__Character__9:GetPrimaryPartCFrame();
			l__default__17.Client:Get("RemoteName"):SendToServer(v11.Position, v10);
			local function v12()
				if v11 then
					l__KnitClient__18.Controllers.ScreenShakeController:shake(v11.Position, v11 * Vector3.new(-0.25, 0, -1) - v11.Position, {
						magnitude = 0.07, 
						duration = 0.15, 
						cycles = 2
					});
				end;
				l__KnitClient__19.Controllers.ViewmodelController:playAnimation(l__AnimationType__5.FP_PAINT_SHOTGUN_SHOOT);
				l__GameAnimationUtil__3.playAnimation(l__Players__4.LocalPlayer, l__AnimationType__5.PAINT_SHOTGUN_SHOOT);
				l__KnitClient__18.Controllers.PaintShotgunEffectsController:playShotgunEffect(l__Character__9);
			end;
			v12();
			task.delay(0.15, function()
				v12();
			end);
			return;
		end;
	else
		return;
	end;
	return nil;
end;
local v13 = l__KnitClient__19.CreateController(v5.new());
return nil;
