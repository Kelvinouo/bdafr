
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v5 = {};
local v6 = setmetatable({}, {
	__index = v5
});
v6.FIRST = 0;
v5[0] = "FIRST";
v6.MIDDLE = 1;
v5[1] = "MIDDLE";
v6.LAST = 2;
v5[2] = "LAST";
local v7 = { l__ItemType__4.TACTICAL_CROSSBOW, l__ItemType__4.TWIRLBLADE, l__ItemType__4.CARROT_CANNON, l__ItemType__4.DIAMOND_SWORD, l__ItemType__4.FIREBALL, l__ItemType__4.BEAR_CLAWS, l__ItemType__4.ROCKET_LAUNCHER, l__ItemType__4.RAGEBLADE, l__ItemType__4.PAINT_SHOTGUN, l__ItemType__4.FRYING_PAN, l__ItemType__4.WOOD_CROSSBOW, l__ItemType__4.IRON_SWORD, l__ItemType__4.GOLDEN_BOW, l__ItemType__4.BOBA_BLASTER, l__ItemType__4.BAGUETTE };
local v8 = v2.Component:extend("HudProgress");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local u2 = {
	start = 1, 
	progress = 1, 
	win = #v7, 
	lastImageId = l__getItemMeta__3(v7[1]).image, 
	currentImageId = l__getItemMeta__3(v7[2]).image, 
	nextImageId = l__getItemMeta__3(v7[3]).image, 
	place = "1st (tied)", 
	highlightFirst = true, 
	highlightMiddle = false, 
	highlightLast = false
};
function v8.init(p1, p2)
	p1.connectionMaid = l__Maid__1.new();
	p1:setState({
		progress = u2.progress, 
		lastImageId = u2.lastImageId, 
		currentImageId = u2.currentImageId, 
		nextImageId = u2.nextImageId, 
		place = u2.place, 
		highlightFirst = u2.highlightFirst, 
		highlightMiddle = u2.highlightMiddle, 
		highlightLast = u2.highlightLast
	});
	p1:listenForProgressUpdates();
	p1:listenForLeaderboardUpdates();
end;
function v8.render(p3)
	return v2.createFragment({ p3:createStageIndicator(), p3:createWeaponLabel(Vector2.new(0.44, 0.06), p3.state.lastImageId, v6.FIRST), p3:createWeaponLabel(Vector2.new(0.51, 0.06), p3.state.currentImageId, v6.MIDDLE), p3:createWeaponLabel(Vector2.new(0.58, 0.06), p3.state.nextImageId, v6.LAST), p3:createPlaceIndicator() });
end;
function v8.willUnmount(p4)
	p4.connectionMaid:DoCleaning();
end;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v8.createStageIndicator(p5)
	local v9 = l__ColorUtil__3.brighten(l__Theme__4.backgroundPrimary, 0.3);
	return v2.createFragment({ v2.createElement("Frame", {
			Size = UDim2.fromScale(0.19, 0.027), 
			Position = UDim2.fromScale(0.41, 0.11), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BackgroundTransparency = 0.25
		}, { v2.createElement("UIStroke", {
				Color = v9, 
				Thickness = 1
			}), v2.createElement("UICorner", {
				CornerRadius = UDim.new(0.2, 0)
			}), v2.createElement("Frame", {
				Size = UDim2.fromScale(0.925 * (p5.state.progress / p5.props.win), 0.5), 
				Position = UDim2.fromScale(0.04, 0.25), 
				BackgroundColor3 = v9
			}, { v2.createElement("UICorner", {
					CornerRadius = UDim.new(0.2, 0)
				}) }) }), v2.createElement("TextLabel", {
			Position = UDim2.fromScale(0.565, 0.105), 
			BackgroundTransparency = 1, 
			FontSize = Enum.FontSize.Size28, 
			Size = UDim2.fromScale(0.05, 0.05), 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
			TextStrokeTransparency = 0, 
			RichText = true, 
			TextScaled = true, 
			Font = Enum.Font.LuckiestGuy, 
			Text = tostring(p5.state.progress) .. " / " .. tostring(p5.props.win), 
			ZIndex = 3
		}) });
end;
function v8.createPlaceIndicator(p6)
	return v2.createElement("TextLabel", {
		Position = UDim2.fromScale(0.51, 0), 
		BackgroundTransparency = 1, 
		FontSize = Enum.FontSize.Size24, 
		TextColor3 = Color3.fromRGB(255, 255, 255), 
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
		TextStrokeTransparency = 0, 
		RichText = true, 
		Font = Enum.Font.LuckiestGuy, 
		Text = p6.state.place
	});
end;
function v8.createWeaponLabel(p7, p8, p9, p10)
	local v10 = false;
	if p10 == v6.FIRST then
		v10 = p7.state.highlightFirst;
	end;
	local v11 = false;
	if p10 == v6.MIDDLE then
		v11 = p7.state.highlightMiddle;
	end;
	local v12 = false;
	if p10 == v6.LAST then
		v12 = p7.state.highlightLast;
	end;
	local v13 = {
		transparency = 0.7, 
		backgroundColor = l__Theme__4.backgroundPrimary, 
		strokeColor = l__Theme__4.backgroundPrimary, 
		size = UDim2.fromScale(0.05, 0.05)
	};
	if v10 or v11 then
		v13.size = UDim2.fromScale(0.07, 0.07);
		v13.transparency = 0;
	end;
	if v12 then
		v13.size = UDim2.fromScale(0.07, 0.07);
		v13.transparency = 0;
		v13.backgroundColor = Color3.new(220, 188, 129);
		v13.strokeColor = Color3.new(220, 188, 129);
	end;
	return v2.createElement("ImageLabel", {
		Position = UDim2.fromScale(p8.X, p8.Y), 
		Size = v13.size, 
		ScaleType = Enum.ScaleType.Fit, 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Image = p9, 
		BackgroundColor3 = v13.backgroundColor, 
		BackgroundTransparency = 0.5, 
		ImageTransparency = v13.transparency
	}, { v2.createElement("UIStroke", {
			Color = l__ColorUtil__3.brighten(v13.strokeColor, 0.3), 
			Thickness = 2
		}), v2.createElement("UICorner", {
			CornerRadius = UDim.new(0.1, 0)
		}) });
end;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v8.listenForProgressUpdates(p11)
	p11.connectionMaid:GiveTask((l__default__5.Client:WaitFor("phalaFdzjcooCPeqq"):expect():Connect(function(p12)
		if p12.progress == p11.props.start then
			local v14 = u2.lastImageId;
			local v15 = u2.currentImageId;
			local v16 = u2.nextImageId;
			p11:updateHighlightStates(true, false, false);
		elseif p12.progress == p11.props.win then
			v14 = l__getItemMeta__3(v7[p12.progress - 3 + 1]).image;
			v15 = l__getItemMeta__3(v7[p12.progress - 2 + 1]).image;
			v16 = l__getItemMeta__3(v7[p12.progress - 1 + 1]).image;
			p11:updateHighlightStates(false, false, true);
		else
			v14 = l__getItemMeta__3(v7[p12.progress - 2 + 1]).image;
			v15 = l__getItemMeta__3(v7[p12.progress - 1 + 1]).image;
			v16 = l__getItemMeta__3(v7[p12.progress + 1]).image;
			p11:updateHighlightStates(false, true, false);
		end;
		p11:setState({
			progress = p12.progress, 
			lastImageId = v14, 
			currentImageId = v15, 
			nextImageId = v16
		});
	end)));
end;
function v8.listenForLeaderboardUpdates(p13)
	p13.connectionMaid:GiveTask((l__default__5.Client:WaitFor("qdfBbzAiljvjWvjhCaysiitefcphsdwnpv"):expect():Connect(function(p14)
		local v17 = p13:ordinalSuffix(p14.place);
		if p14.tied then
			v17 = v17 .. " (tied)";
		end;
		p13:setState({
			place = v17
		});
	end)));
end;
function v8.ordinalSuffix(p15, p16)
	local v18 = p16 % 10;
	local v19 = p16 % 100;
	if v18 == 1 and v19 ~= 11 then
		return tostring(p16) .. "st";
	end;
	if v18 == 2 and v19 ~= 12 then
		return tostring(p16) .. "nd";
	end;
	if v18 == 3 and v19 ~= 13 then
		return tostring(p16) .. "rd";
	end;
	return tostring(p16) .. "th";
end;
function v8.updateHighlightStates(p17, p18, p19, p20)
	p17:setState({
		highlightFirst = p18, 
		highlightMiddle = p19, 
		highlightLast = p20
	});
end;
return {
	HudProgressWrapper = function()
		return v2.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, { v2.createElement(v8, {
				start = u2.start, 
				win = u2.win
			}) });
	end, 
	HudProgress = v8
};

