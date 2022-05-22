-- Script Hash: b702f6a3237a9b8968e3e6ec1a38b37ee8b552a3591d628819730c76a074ae90e785f2e69d29c6f7e2db53f72deb9d71
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
	local v6 = l__Players__3.LocalPlayer:WaitForChild("PlayerGui"):GetChildren();
	local function v7(p7)
		if p7:IsA("ScreenGui") then
			p7.Enabled = false;
		end;
	end;
	for v8, v9 in ipairs(v6) do
		v7(v9, v8 - 1, v6);
	end;
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false);
	local v10 = l__CollectionService__5:GetTagged("Billboard");
	local function v11(p8)
		local v12 = p8:FindFirstChildWhichIsA("BillboardGui");
		if v12 then
			v12.Enabled = false;
		end;
	end;
	for v13, v14 in ipairs(v10) do
		v11(v14, v13 - 1, v10);
	end;
	p6.tagConnection = l__WatchCollectionTag__6("EntityNameTag", function(p9)
		p9.Enabled = false;
	end);
	local l__CurrentCamera__15 = l__Workspace__7.CurrentCamera;
	if l__CurrentCamera__15 then
		u8("DepthOfFieldEffect", {
			Parent = l__CurrentCamera__15, 
			Name = "DepthOfFieldEffect", 
			InFocusRadius = 15
		});
	end;
end;
function v4.disablePictureMode(p10)
	local v16 = l__Players__3.LocalPlayer:WaitForChild("PlayerGui"):GetChildren();
	local function v17(p11)
		if p11:IsA("ScreenGui") then
			p11.Enabled = true;
		end;
	end;
	for v18, v19 in ipairs(v16) do
		v17(v19, v18 - 1, v16);
	end;
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
	l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true);
	local v20 = l__CollectionService__5:GetTagged("Billboard");
	local function v21(p12)
		local v22 = p12:FindFirstChildWhichIsA("BillboardGui");
		if v22 then
			v22.Enabled = true;
		end;
	end;
	for v23, v24 in ipairs(v20) do
		v21(v24, v23 - 1, v20);
	end;
	local l__tagConnection__25 = p10.tagConnection;
	if l__tagConnection__25 ~= nil then
		l__tagConnection__25:Disconnect();
	end;
	p10.tagConnection = nil;
	local v26 = l__CollectionService__5:GetTagged("EntityNameTag");
	local function v27(p13)
		p13.Enabled = true;
	end;
	for v28, v29 in ipairs(v26) do
		v27(v29, v28 - 1, v26);
	end;
	local l__CurrentCamera__30 = l__Workspace__7.CurrentCamera;
	if l__CurrentCamera__30 then
		local l__DepthOfFieldEffect__31 = l__CurrentCamera__30:FindFirstChild("DepthOfFieldEffect");
		if l__DepthOfFieldEffect__31 ~= nil then
			l__DepthOfFieldEffect__31:Destroy();
		end;
	end;
end;
function v4.togglePictureMode(p14)
	if p14.pictureModeEnabled then
		p14:disablePictureMode();
	else
		p14:enablePictureMode();
	end;
	p14.pictureModeEnabled = not p14.pictureModeEnabled;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
