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
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "PictureModeController";
	p1.pictureModeEnabled = false;
end;
local l__ContextActionService__2 = v2.ContextActionService;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ContextActionService__2:BindAction("picture-mode-toggle", function(p3, p4, p5)
		if p4 == Enum.UserInputState.Begin then
			task.spawn(function()
				p2:togglePictureMode();
			end);
		end;
	end, false, Enum.KeyCode.F1);
	l__ClientStore__3.changed:connect(function(p6, p7)
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
local l__Players__4 = v2.Players;
local l__StarterGui__5 = v2.StarterGui;
local l__CollectionService__6 = v2.CollectionService;
local l__WatchCollectionTag__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__Workspace__8 = v2.Workspace;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.enablePictureMode(p8)
	local l__PlayerGui__6 = l__Players__4.LocalPlayer:WaitForChild("PlayerGui");
	if p8.pictureModeEnabled then
		return nil;
	end;
	print("Enabling Picture Mode");
	p8.pictureModeEnabled = true;
	l__ClientStore__3:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			pictureMode = true
		}
	});
	for v7, v8 in ipairs((l__PlayerGui__6:GetChildren())) do
		if v8:IsA("ScreenGui") and v8.Name ~= "TopBarAppGui" then
			v8.Enabled = false;
		end;
	end;
	l__StarterGui__5:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
	l__StarterGui__5:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false);
	for v9, v10 in ipairs((l__CollectionService__6:GetTagged("Billboard"))) do
		local v11 = v10:FindFirstChildWhichIsA("BillboardGui");
		if v11 then
			v11.Enabled = false;
		end;
	end;
	p8.tagConnection = l__WatchCollectionTag__7("EntityNameTag", function(p9)
		p9.Enabled = false;
	end);
	local l__CurrentCamera__12 = l__Workspace__8.CurrentCamera;
	if l__CurrentCamera__12 then
		u9("DepthOfFieldEffect", {
			Parent = l__CurrentCamera__12, 
			Name = "DepthOfFieldEffect", 
			InFocusRadius = 15
		});
	end;
end;
function v4.disablePictureMode(p10)
	local l__PlayerGui__13 = l__Players__4.LocalPlayer:WaitForChild("PlayerGui");
	if not p10.pictureModeEnabled then
		return nil;
	end;
	p10.pictureModeEnabled = false;
	l__ClientStore__3:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			pictureMode = false
		}
	});
	for v14, v15 in ipairs((l__PlayerGui__13:GetChildren())) do
		if v15:IsA("ScreenGui") then
			v15.Enabled = true;
		end;
	end;
	l__StarterGui__5:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
	l__StarterGui__5:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true);
	for v16, v17 in ipairs((l__CollectionService__6:GetTagged("Billboard"))) do
		local v18 = v17:FindFirstChildWhichIsA("BillboardGui");
		if v18 then
			v18.Enabled = true;
		end;
	end;
	local l__tagConnection__19 = p10.tagConnection;
	if l__tagConnection__19 ~= nil then
		l__tagConnection__19:Disconnect();
	end;
	p10.tagConnection = nil;
	for v20, v21 in ipairs((l__CollectionService__6:GetTagged("EntityNameTag"))) do
		v21.Enabled = true;
	end;
	local l__CurrentCamera__22 = l__Workspace__8.CurrentCamera;
	if l__CurrentCamera__22 then
		local l__DepthOfFieldEffect__23 = l__CurrentCamera__22:FindFirstChild("DepthOfFieldEffect");
		if l__DepthOfFieldEffect__23 ~= nil then
			l__DepthOfFieldEffect__23:Destroy();
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
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
