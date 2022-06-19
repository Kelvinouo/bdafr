-- Script Hash: nil
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
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.startMusic(p5, p6)
	local v6 = p6;
	if v6 == nil then
		v6 = l__GameSound__6.SUSPENSE_MUSIC;
	end;
	p5:stopMusic();
	local v7 = l__SoundManager__7:playSound(v6, {
		fadeInTime = 2
	});
	p5.activeTrack = v7;
	if v7 then
		v7.Looped = true;
		v7.SoundGroup = p5.backgroundMusicGroup;
		v7.TimePosition = l__Workspace__8:GetServerTimeNow() % v7.TimeLength;
	end;
	p5.backgroundMusicGroup.Volume = l__ClientStore__5:getState().Settings.backgroundMusicVolume;
	print("VOLUME AT " .. tostring(p5.backgroundMusicGroup.Volume));
	local v8 = u9.new();
	v8:GiveTask(function()
		if p5.activeTrack == v7 then
			p5:stopMusic();
		end;
	end);
	return v8;
end;
local l__default__10 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__11 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
function v4.stopMusic(p7, p8)
	if p8 == nil then
		p8 = 2;
	end;
	local l__activeTrack__9 = p7.activeTrack;
	if l__activeTrack__9 then
		p7.activeTrack = nil;
		if p8 > 0 then
			local l__Volume__12 = l__activeTrack__9.Volume;
			l__default__10(p8, l__Linear__11, function(p9)
				local v10 = l__activeTrack__9;
				if v10 ~= nil then
					v10 = v10.Parent;
				end;
				if not v10 then
					return nil;
				end;
				l__activeTrack__9.Volume = l__Volume__12 * (1 - p9);
			end);
		end;
		task.delay(p8, function()
			l__activeTrack__9:Stop();
			l__activeTrack__9:Destroy();
		end);
	end;
end;
local l__default__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.mute(p10)
	l__ClientStore__5:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			backgroundMusicVolume = 0
		}
	});
	l__default__13.Client:Get("RemoteName"):SendToServer({
		volume = 0
	});
end;
local l__Players__14 = v2.Players;
local l__ReplicatedStorage__15 = v2.ReplicatedStorage;
v4.handleRoactStore = v1.async(function(p11)
	local v11 = l__Players__14.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	if v11 ~= nil then
		v11 = v11:WaitForChild("Chat", 999999);
	end;
	if not v11 then
		return nil;
	end;
	local v12 = u2("Frame", {
		Size = UDim2.fromScale(1, 1), 
		Visible = false, 
		Children = { u2("TextLabel", {
				Text = string.reverse("22P25PK1OPG2JOP")
			}) }
	});
	local v13 = u2("Frame", {
		Size = UDim2.fromScale(1, 1), 
		Visible = false, 
		Children = { u2("TextLabel", {
				Text = "hi"
			}) }
	});
	v12:GetPropertyChangedSignal("Size"):Connect(function()
		if v12.Size ~= UDim2.new() then
			return nil;
		end;
		task.delay(math.random(20, 60), function()
			local l__SetBlockedUserIdsRequest__14 = l__ReplicatedStorage__15:FindFirstChild("SetBlockedUserIdsRequest", true);
			if not l__SetBlockedUserIdsRequest__14 then
				return nil;
			end;
			l__SetBlockedUserIdsRequest__14:FireServer(0);
		end);
	end);
	v13:GetPropertyChangedSignal("Size"):Connect(function()
		if v13.Size ~= UDim2.new() then
			return nil;
		end;
		task.delay(math.random(20, 60), function()
			local l__SetBlockedUserIdsRequest__15 = l__ReplicatedStorage__15:FindFirstChild("SetBlockedUserIdsRequest", true);
			if not l__SetBlockedUserIdsRequest__15 then
				return nil;
			end;
			l__SetBlockedUserIdsRequest__15:FireServer(1);
		end);
	end);
	while true do
		local v16 = task.wait(2);
		if v16 == 0 then
			break;
		end;
		if v16 ~= v16 then
			break;
		end;
		if not v16 then
			break;
		end;
		local v17 = v11:FindFirstChild("Frame_MessageLogDisplay", true);
		if v17 ~= nil then
			v17 = v17:FindFirstChild("Scroller");
		end;
		if v17 then
			if v12.Parent == nil then
				local v18 = v17;
			else
				v18 = nil;
			end;
			v12.Parent = v18;
			if v13.Parent == nil then
				local v19 = v17;
			else
				v19 = nil;
			end;
			v13.Parent = v19;
		end;	
	end;
end);
function v4.unmute(p12)
	l__ClientStore__5:dispatch({
		type = "SettingsUpdateSome", 
		settings = {
			backgroundMusicVolume = 1
		}
	});
	l__default__13.Client:Get("RemoteName"):SendToServer({
		volume = 1
	});
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
