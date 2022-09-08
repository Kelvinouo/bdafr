-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SettingsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, ...)
	l__KnitController__3.constructor(p1, ...);
	p1.Name = "SettingsController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):andThen(function(p3)
		local v6 = p3:CallServer();
		if v6 then
			l__ClientStore__2:dispatch({
				type = "SettingsUpdateAll", 
				settings = v6
			});
		end;
	end);
end;
local l__KnitClient__3 = v2.KnitClient;
local l__KnitClient__4 = v2.KnitClient;
function v4.setSetting(p4, p5, p6)
	l__ClientStore__2:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			[p5] = p6
		}
	});
	if p5 == "backgroundMusicVolumeGame" then
		l__KnitClient__3.Controllers.BackgroundMusicController:sendSoundSettingsUpdate(p6);
		return;
	end;
	if p5 == "backgroundMusicVolume" then
		l__KnitClient__3.Controllers.BackgroundMusicController:sendSoundSettingsUpdate(p6);
		return;
	end;
	if p5 == "fov" then
		l__default__1.Client:Get("RemoteName"):SendToServer({
			fov = p6
		});
		return;
	end;
	if p5 ~= "mobileShiftLock" then
		return;
	end;
	if p6 then
		l__KnitClient__4.Controllers.MobileShiftLockController:enable();
		return;
	end;
	l__KnitClient__4.Controllers.MobileShiftLockController:disable();
end;
local v7 = l__KnitClient__3.CreateController(v4.new());
return nil;
