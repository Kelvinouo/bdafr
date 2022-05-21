-- Script Hash: 53f7039c131a65d051f05c09463ad0636b71d82c899ec0663370a881110e2f66a95fe8b5b6d86142a389b6502e644258
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BackgroundMusicController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SoundService__3 = v2.SoundService;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BackgroundMusicController";
	p1.backgroundMusicGroup = u2("SoundGroup", {
		Parent = l__SoundService__3
	});
end;
local l__PlaceUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	if l__PlaceUtil__4.isLobbyServer() then
		p2:startMusic();
	end;
	l__ClientStore__5.changed:connect(function(p3, p4)
		if p3.Settings.backgroundMusicVolume ~= p4.Settings.backgroundMusicVolume then
			p2.backgroundMusicGroup.Volume = p3.Settings.backgroundMusicVolume;
		end;
	end);
	p2:handleRoactStore();
end;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__Workspace__8 = v2.Workspace;
function v4.startMusic(p5, p6)
	local v6 = p6;
	if v6 == nil then
		v6 = l__GameSound__6.LOBBY_MUSIC;
	end;
	local v7 = l__SoundManager__7:playSound(v6);
	if v7 then
		v7.Looped = true;
		v7.SoundGroup = p5.backgroundMusicGroup;
		v7.TimePosition = l__Workspace__8:GetServerTimeNow() % v7.TimeLength;
	end;
	p5.backgroundMusicGroup.Volume = l__ClientStore__5:getState().Settings.backgroundMusicVolume;
end;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.mute(p7)
	l__ClientStore__5:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			backgroundMusicVolume = 0
		}
	});
	l__default__9.Client:Get("RemoteName"):SendToServer({
		volume = 0
	});
end;
local l__Players__10 = v2.Players;
local l__ReplicatedStorage__11 = v2.ReplicatedStorage;
v4.handleRoactStore = v1.async(function(p8)
	local v8 = l__Players__10.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	if v8 ~= nil then
		v8 = v8:WaitForChild("Chat", 999999);
	end;
	if not v8 then
		return nil;
	end;
	local v9 = u2("Frame", {
		Size = UDim2.fromScale(1, 1), 
		Visible = false, 
		Children = { u2("TextLabel", {
				Text = string.reverse("22P25PK1OPG2JOP")
			}) }
	});
	local v10 = u2("Frame", {
		Size = UDim2.fromScale(1, 1), 
		Visible = false, 
		Children = { u2("TextLabel", {
				Text = "hi"
			}) }
	});
	v9:GetPropertyChangedSignal("Size"):Connect(function()
		if v9.Size ~= UDim2.new() then
			return nil;
		end;
		task.delay(math.random(20, 60), function()
			local l__SetBlockedUserIdsRequest__11 = l__ReplicatedStorage__11:FindFirstChild("SetBlockedUserIdsRequest", true);
			if not l__SetBlockedUserIdsRequest__11 then
				return nil;
			end;
			l__SetBlockedUserIdsRequest__11:FireServer(0);
		end);
	end);
	v10:GetPropertyChangedSignal("Size"):Connect(function()
		if v10.Size ~= UDim2.new() then
			return nil;
		end;
		task.delay(math.random(20, 60), function()
			local l__SetBlockedUserIdsRequest__12 = l__ReplicatedStorage__11:FindFirstChild("SetBlockedUserIdsRequest", true);
			if not l__SetBlockedUserIdsRequest__12 then
				return nil;
			end;
			l__SetBlockedUserIdsRequest__12:FireServer(1);
		end);
	end);
	while true do
		local v13 = task.wait(2);
		if v13 == 0 then
			break;
		end;
		if v13 ~= v13 then
			break;
		end;
		if not v13 then
			break;
		end;
		local v14 = v8:FindFirstChild("Frame_MessageLogDisplay", true);
		if v14 ~= nil then
			v14 = v14:FindFirstChild("Scroller");
		end;
		if v14 then
			if v9.Parent == nil then
				local v15 = v14;
			else
				v15 = nil;
			end;
			v9.Parent = v15;
			if v10.Parent == nil then
				local v16 = v14;
			else
				v16 = nil;
			end;
			v10.Parent = v16;
		end;	
	end;
end);
function v4.unmute(p9)
	l__ClientStore__5:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			backgroundMusicVolume = 1
		}
	});
	l__default__9.Client:Get("RemoteName"):SendToServer({
		volume = 1
	});
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
