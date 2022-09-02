-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TopBarController";
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
	p1.Name = "TopBarController";
end;
local l__StarterGui__2 = v2.StarterGui;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ContentProvider__6 = v2.ContentProvider;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	p2:mountHud();
	l__StarterGui__2:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
	if l__PlaceUtil__3.isGameServer() then
		v1.Promise.defer(function()
			local v6 = { l__BedwarsImageId__4.HUD_BED_DESTROYED };
			local v7 = table.create(#v6);
			for v8, v9 in ipairs(v6) do
				v7[v8] = u5("ImageLabel", {
					Image = v9
				});
			end;
			l__ContentProvider__6:PreloadAsync(v7);
		end);
		v1.Promise.defer(function()
			l__default__7.Client:WaitFor("RemoteName"):andThen(function(p3)
				local v10 = p3:CallServer();
				l__ClientStore__8:dispatch({
					type = "SetServerRegion", 
					serverRegion = v10
				});
				p2:mountServerRegionDisplay(v10);
			end);
		end);
	end;
end;
local l__CreateRoduxApp__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__TopBarAppWrapper__10 = v1.import(script, script.Parent, "ui", "top-bar-app").TopBarAppWrapper;
local l__Players__11 = v2.Players;
function v4.mountHud(p4)
	v1.Promise.defer(function()
		l__CreateRoduxApp__9("TopBarApp", l__TopBarAppWrapper__10, {
			localPlayerId = l__Players__11.LocalPlayer.UserId
		}, {}, {});
	end);
end;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
function v4.mountServerRegionDisplay(p5, p6)
	u12.mount(u12.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, {
		ServerRegionDisplay = u12.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0.01, 1), 
			Size = UDim2.fromScale(0.2, 0.05), 
			Text = "<b>REGION: " .. p6 .. "</b>", 
			TextScaled = true, 
			RichText = true, 
			Font = "Roboto", 
			TextColor3 = l__ColorUtil__13.WHITE, 
			TextXAlignment = "Left", 
			TextYAlignment = "Center", 
			BackgroundTransparency = 1, 
			TextTransparency = 0.4
		}, { u12.createElement("UITextSizeConstraint", {
				MaxTextSize = 16
			}) })
	}), l__Players__11.LocalPlayer:WaitForChild("PlayerGui"));
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
