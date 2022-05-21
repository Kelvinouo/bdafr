-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("KitShopToolbar");
function v4.init(p1, p2)
	p1.alive = true;
	p1:setState({
		time = p1:getTime()
	});
end;
function v4.didMount(p3)
	v1.Promise.defer(function()
		while { wait(0.2) } and p3.alive do
			p3:setState({
				time = p3:getTime()
			});		
		end;
	end);
end;
function v4.willUnmount(p4)
	p4.alive = false;
end;
local l__UpdateTimeEpoch__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop.UpdateTimeEpoch;
local l__StringUtil__2 = v2.StringUtil;
function v4.getTime(p5)
	return l__StringUtil__2.formatCountdownTime(math.max(0, l__UpdateTimeEpoch__1 - os.time()), {
		days = true, 
		hours = true, 
		seperator = " : "
	});
end;
local l__ColorUtil__3 = v2.ColorUtil;
function v4.render(p6)
	return v3.createElement("Frame", {
		Size = p6.props.Size, 
		BackgroundColor3 = l__ColorUtil__3.hexColor(3092550), 
		BorderSizePixel = 0
	}, { v3.createElement("TextLabel", {
			Text = "<b>Kit Shop</b>", 
			Size = UDim2.fromScale(0.3, 0.5), 
			Position = UDim2.fromScale(0.03, 0.5), 
			AnchorPoint = Vector2.new(0, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextXAlignment = "Left", 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}), v3.createElement("TextLabel", {
			Text = "Next free rotation: <font face=\"Roboto\"><b>" .. p6.state.time .. "</b></font>", 
			Size = UDim2.fromScale(0.97, 0.4), 
			Position = UDim2.fromScale(0.95, 0.5), 
			AnchorPoint = Vector2.new(1, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextXAlignment = "Right"
		}) });
end;
return {
	KitShopToolbar = v4
};
