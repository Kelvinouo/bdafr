-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "RegionController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "RegionController";
end;
local l__PlaceUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__LobbyEvents__4 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).LobbyEvents;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	if l__PlaceUtil__1.isGameServer() then
		v1.Promise.defer(function()
			l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
				local v5 = p3:CallServer();
				l__ClientStore__3:dispatch({
					type = "SetServerRegion", 
					serverRegion = v5
				});
				p2:mountServerRegionDisplay(v5);
			end);
		end);
		return;
	end;
	if l__PlaceUtil__1.isLobbyServer() then
		l__LobbyEvents__4.client.deviceInfoUpdate:connect(function(p4)
			if p4.deviceInfo then
				p2:mountQueueRegionDisplay(p4.deviceInfo);
			end;
		end);
	end;
end;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.mountServerRegionDisplay(p5, p6)
	u5.mount(u5.createFragment({
		ServerRegionDisplay = u5.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, {
			ServerRegionText = u5.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0.01, 1), 
				Size = UDim2.fromScale(0.2, 0.05), 
				Text = "<b>REGION: " .. p6 .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__6.WHITE, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1, 
				TextTransparency = 0.4
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) })
		})
	}), l__Players__7.LocalPlayer:WaitForChild("PlayerGui"));
end;
local l__QueueRegionButton__8 = v1.import(script, script.Parent, "ui", "region-button").QueueRegionButton;
function v3.mountQueueRegionDisplay(p7, p8)
	u5.mount(u5.createElement(l__QueueRegionButton__8, {
		Region = p8.region
	}), l__Players__7.LocalPlayer:WaitForChild("PlayerGui"));
end;
local v6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
