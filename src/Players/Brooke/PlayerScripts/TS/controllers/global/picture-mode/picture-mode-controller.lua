-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "PictureModeController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "PictureModeController";
	p1.pictureModeEnabled = false;
end;
local l__ContextActionService__1 = v2.ContextActionService;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__ContextActionService__1:BindAction("picture-mode-toggle", function(p3, p4, p5)
		if p4 == Enum.UserInputState.Begin then
			task.spawn(function()
				p2:togglePictureMode();
			end);
		end;
	end, false, Enum.KeyCode.F1);
	l__ClientStore__2.changed:connect(function(p6, p7)
		if p6.Settings.pictureMode ~= p7.Settings.pictureMode then
			if not p6.Settings.pictureMode then
				p2:disablePictureMode();
				return;
			end;
		else
			return;
		end;
		p2:enablePictureMode();
	end);
end;
local l__Players__3 = v2.Players;
local l__StarterGui__4 = v2.StarterGui;
local l__CollectionService__5 = v2.CollectionService;
local l__WatchCollectionTag__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__Workspace__7 = v2.Workspace;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.enablePictureMode(p8)
	local l__PlayerGui__6 = l__Players__3.LocalPlayer:WaitForChild("PlayerGui");
	if p8.pictureModeEnabled then
		return nil;
	end;
	print("Enabling Picture Mode");
	p8.pictureModeEnabled = true;
	l__ClientStore__2:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			pictureMode = true
		}
	});
	local v7, v8, v9 = ipairs((l__PlayerGui__6:GetChildren()));
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		if v8:IsA("ScreenGui") and v8.Name ~= "TopBarAppGui" then
			v8.Enabled = false;
		end;	
	end;
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false);
	local v10, v11, v12 = ipairs((l__CollectionService__5:GetTagged("Billboard")));
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		local v13 = v11:FindFirstChildWhichIsA("BillboardGui");
		if v13 then
			v13.Enabled = false;
		end;	
	end;
	p8.tagConnection = l__WatchCollectionTag__6("EntityNameTag", function(p9)
		p9.Enabled = false;
	end);
	local l__CurrentCamera__14 = l__Workspace__7.CurrentCamera;
	if l__CurrentCamera__14 then
		u8("DepthOfFieldEffect", {
			Parent = l__CurrentCamera__14, 
			Name = "DepthOfFieldEffect", 
			InFocusRadius = 15
		});
	end;
end;
function v4.disablePictureMode(p10)
	local l__PlayerGui__15 = l__Players__3.LocalPlayer:WaitForChild("PlayerGui");
	if not p10.pictureModeEnabled then
		return nil;
	end;
	p10.pictureModeEnabled = false;
	l__ClientStore__2:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			pictureMode = false
		}
	});
	local v16, v17, v18 = ipairs((l__PlayerGui__15:GetChildren()));
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		if v17:IsA("ScreenGui") then
			v17.Enabled = true;
		end;	
	end;
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true);
	local v19, v20, v21 = ipairs((l__CollectionService__5:GetTagged("Billboard")));
	while true do
		v19(v20, v21);
		if not v19 then
			break;
		end;
		v21 = v19;
		local v22 = v20:FindFirstChildWhichIsA("BillboardGui");
		if v22 then
			v22.Enabled = true;
		end;	
	end;
	local l__tagConnection__23 = p10.tagConnection;
	if l__tagConnection__23 ~= nil then
		l__tagConnection__23:Disconnect();
	end;
	p10.tagConnection = nil;
	local v24, v25, v26 = ipairs((l__CollectionService__5:GetTagged("EntityNameTag")));
	while true do
		v24(v25, v26);
		if not v24 then
			break;
		end;
		v26 = v24;
		v25.Enabled = true;	
	end;
	local l__CurrentCamera__27 = l__Workspace__7.CurrentCamera;
	if l__CurrentCamera__27 then
		local l__DepthOfFieldEffect__28 = l__CurrentCamera__27:FindFirstChild("DepthOfFieldEffect");
		if l__DepthOfFieldEffect__28 ~= nil then
			l__DepthOfFieldEffect__28:Destroy();
		end;
	end;
end;
function v4.togglePictureMode(p11)
	if p11.pictureModeEnabled then
		p11:disablePictureMode();
		return;
	end;
	p11:enablePictureMode();
end;
local v29 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
