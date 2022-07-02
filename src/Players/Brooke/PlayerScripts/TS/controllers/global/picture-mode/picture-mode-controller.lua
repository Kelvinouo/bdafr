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
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__ContextActionService__2:BindAction("picture-mode-toggle", function(p3, p4, p5)
		if p4 == Enum.UserInputState.Begin then
			task.spawn(function()
				p2:togglePictureMode();
			end);
		end;
	end, false, Enum.KeyCode.F1);
end;
local l__Players__3 = v2.Players;
local l__StarterGui__4 = v2.StarterGui;
local l__CollectionService__5 = v2.CollectionService;
local l__WatchCollectionTag__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__Workspace__7 = v2.Workspace;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.enablePictureMode(p6)
	for v6, v7 in ipairs((l__Players__3.LocalPlayer:WaitForChild("PlayerGui"):GetChildren())) do
		if v7:IsA("ScreenGui") then
			v7.Enabled = false;
		end;
	end;
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false);
	for v8, v9 in ipairs((l__CollectionService__5:GetTagged("Billboard"))) do
		local v10 = v9:FindFirstChildWhichIsA("BillboardGui");
		if v10 then
			v10.Enabled = false;
		end;
	end;
	p6.tagConnection = l__WatchCollectionTag__6("EntityNameTag", function(p7)
		p7.Enabled = false;
	end);
	local l__CurrentCamera__11 = l__Workspace__7.CurrentCamera;
	if l__CurrentCamera__11 then
		u8("DepthOfFieldEffect", {
			Parent = l__CurrentCamera__11, 
			Name = "DepthOfFieldEffect", 
			InFocusRadius = 15
		});
	end;
end;
function v4.disablePictureMode(p8)
	for v12, v13 in ipairs((l__Players__3.LocalPlayer:WaitForChild("PlayerGui"):GetChildren())) do
		if v13:IsA("ScreenGui") then
			v13.Enabled = true;
		end;
	end;
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true);
	for v14, v15 in ipairs((l__CollectionService__5:GetTagged("Billboard"))) do
		local v16 = v15:FindFirstChildWhichIsA("BillboardGui");
		if v16 then
			v16.Enabled = true;
		end;
	end;
	local l__tagConnection__17 = p8.tagConnection;
	if l__tagConnection__17 ~= nil then
		l__tagConnection__17:Disconnect();
	end;
	p8.tagConnection = nil;
	for v18, v19 in ipairs((l__CollectionService__5:GetTagged("EntityNameTag"))) do
		v19.Enabled = true;
	end;
	local l__CurrentCamera__20 = l__Workspace__7.CurrentCamera;
	if l__CurrentCamera__20 then
		local l__DepthOfFieldEffect__21 = l__CurrentCamera__20:FindFirstChild("DepthOfFieldEffect");
		if l__DepthOfFieldEffect__21 ~= nil then
			l__DepthOfFieldEffect__21:Destroy();
		end;
	end;
end;
function v4.togglePictureMode(p9)
	if p9.pictureModeEnabled then
		p9:disablePictureMode();
	else
		p9:enablePictureMode();
	end;
	p9.pictureModeEnabled = not p9.pictureModeEnabled;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
