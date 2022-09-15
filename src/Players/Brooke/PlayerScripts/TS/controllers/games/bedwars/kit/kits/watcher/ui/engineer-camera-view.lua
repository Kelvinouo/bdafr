-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("EngineerCameraView");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__TurretId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
function v4.init(p1, p2)
	p1.filmTransparencyMotor = u1.SingleMotor.new(0.9);
	local v5, v6 = v3.createBinding(0.9);
	p1.filmTransparency = v5;
	p1.setFilmTransparency = v6;
	p1.filmTransparencyMotor:onStep(p1.setFilmTransparency);
	l__ClientStore__2:dispatch({
		type = "SetSpectatedTurret", 
		selectedTurret = l__KnitClient__3.Controllers.TurretController:getBackTurret(l__TurretId__4.VULCAN_TURRET)
	});
end;
local l__EngineerFilmEffect__5 = v1.import(script, script.Parent, "engineer-film-effect").EngineerFilmEffect;
local l__EngineerCrosshair__6 = v1.import(script, script.Parent, "engineer-crosshair").EngineerCrosshair;
local l__Empty__7 = v2.Empty;
local l__UIUtil__8 = v2.UIUtil;
local l__EngineerCameraSwitch__9 = v1.import(script, script.Parent, "engineer-camera-switch").EngineerCameraSwitch;
local l__EngineerCameraExit__10 = v1.import(script, script.Parent, "engineer-camera-exit").EngineerCameraExit;
function v4.render(p3)
	return v3.createFragment({ v3.createElement(l__EngineerFilmEffect__5, {
			transparency = p3.filmTransparency
		}), v3.createElement(l__EngineerCrosshair__6), v3.createElement(l__Empty__7, {
			AnchorPoint = Vector2.new(0.5, 1), 
			Position = UDim2.fromScale(0.5, l__UIUtil__8:getActionBarPosition().Y.Scale), 
			Size = UDim2.fromOffset(350, 100)
		}, { v3.createElement(l__EngineerCameraSwitch__9, {
				anchorPoint = Vector2.new(0, 0.5), 
				position = UDim2.fromScale(0, 0.5), 
				textShift = UDim2.fromScale(0.2, 0), 
				iconShift = UDim2.fromScale(-0.2, 0), 
				imageId = "http://www.roblox.com/asset/?id=7255895763", 
				clicked = function()
					l__ClientStore__2:dispatch({
						type = "SetSpectatedTurret", 
						selectedTurret = l__KnitClient__3.Controllers.TurretController:getBackTurret(l__TurretId__4.VULCAN_TURRET)
					});
				end, 
				inputDisplay = "A", 
				inputTypes = { Enum.KeyCode.A, Enum.KeyCode.ButtonL1 }
			}), v3.createElement(l__EngineerCameraExit__10, {
				activated = function()
					l__ClientStore__2:dispatch({
						type = "InventorySelectHotbarSlot", 
						slot = 0
					});
				end, 
				inputDisplay = "X", 
				inputTypes = { Enum.KeyCode.X, Enum.KeyCode.ButtonX }
			}), v3.createElement(l__EngineerCameraSwitch__9, {
				anchorPoint = Vector2.new(1, 0.5), 
				position = UDim2.fromScale(1, 0.5), 
				textShift = UDim2.fromScale(-0.2, 0), 
				iconShift = UDim2.fromScale(0.2, 0), 
				imageId = "http://www.roblox.com/asset/?id=7255896830", 
				clicked = function()
					l__ClientStore__2:dispatch({
						type = "SetSpectatedTurret", 
						selectedTurret = l__KnitClient__3.Controllers.TurretController:getNextTurret(l__TurretId__4.VULCAN_TURRET)
					});
				end, 
				inputDisplay = "D", 
				inputTypes = { Enum.KeyCode.D, Enum.KeyCode.ButtonR1 }
			}) }) });
end;
local l__UserInputService__11 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
function v4.didMount(p4)
	l__UserInputService__11.MouseIconEnabled = false;
end;
function v4.willUnmount(p5)
	l__ClientStore__2:dispatch({
		type = "SetSpectatedTurret", 
		selectedTurret = nil
	});
	l__UserInputService__11.MouseIconEnabled = true;
end;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.willUpdate(p6, p7)
	if p7.store.Game.selectedTurret ~= p6.props.store.Game.selectedTurret then
		l__SoundManager__12:playSound(l__GameSound__13.TV_STATIC);
		p6.filmTransparencyMotor:setGoal(u1.Spring.new(0, {
			frequency = 8, 
			dampingRatio = 0.75
		}));
		task.delay(0.2, function()
			p6.filmTransparencyMotor:setGoal(u1.Spring.new(0.9, {
				frequency = 4, 
				dampingRatio = 0.8
			}));
		end);
	end;
end;
local l__ScaleComponent__14 = v2.ScaleComponent;
return {
	EngineerCameraViewWrapper = function(p8)
		return v3.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			DisplayOrder = 5, 
			IgnoreGuiInset = true
		}, { v3.createElement(l__ScaleComponent__14, {
				MaximumSize = Vector2.new(200, 100)
			}), v3.createElement(v4, {
				store = p8.store
			}) });
	end, 
	EngineerCameraView = v4
};
