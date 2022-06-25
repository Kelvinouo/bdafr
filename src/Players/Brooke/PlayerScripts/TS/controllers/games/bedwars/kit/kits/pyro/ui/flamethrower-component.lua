-- Script Hash: 918d8fb03ec31a8c3f7286002d9cea940d53fb0e7a9d11fb85bc3a7d8e356a4c8b9cbbe48fae529dbf5a51910c6e03d0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("FlamethrowerComponent");
local l__PyroUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
function v4.init(p1, p2)
	local v5 = {};
	if p2.tool then
		local v6 = l__PyroUtil__1.getUpgradesFromFlamethrower(p2.tool);
	else
		v6 = {};
	end;
	v5.upgrades = v6;
	p1:setState(v5);
end;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function v4.onClose(p3)
	l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__3.FLAMETHROWER_UPGRADES);
end;
local l__MapUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "data-structure").out).MapUtil;
local l__ColorUtil__5 = v2.ColorUtil;
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset("CloseIcon");
local l__LineFrame__7 = v2.LineFrame;
local l__FlamethrowerTierCard__8 = v1.import(script, script.Parent, "flamethrower-tier-card").FlamethrowerTierCard;
local l__FlamethrowerUpgrade__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade;
function v4.render(p4)
	local function v7(p5)
		p4:setState({
			upgrades = p5
		});
	end;
	local v8 = l__MapUtil__4.values(p4.state.upgrades);
	local function v9(p6)
		return p6 >= 3;
	end;
	local v10 = nil;
	for v11, v12 in ipairs(v8) do
		if v9(v12, v11 - 1, v8) == true then
			v10 = v12;
			break;
		end;
	end;
	local v13 = v10 ~= nil;
	return v3.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(0.6, 0.6), 
		BackgroundTransparency = 1
	}, { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			SortOrder = "LayoutOrder"
		}), v3.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.0729559748427673), 
			BackgroundTransparency = 1, 
			LayoutOrder = 0
		}, { v3.createElement("TextLabel", {
				Size = UDim2.fromScale(0.4, 0.9), 
				Position = UDim2.fromScale(0, 0), 
				Font = "RobotoCondensed", 
				Text = "Flamethrower Upgrades", 
				TextColor3 = l__ColorUtil__5.WHITE, 
				TextScaled = true, 
				TextXAlignment = "Left", 
				TextYAlignment = "Bottom", 
				BackgroundTransparency = 1
			}), v3.createElement("TextButton", {
				AnchorPoint = Vector2.new(1, 0.5), 
				Position = UDim2.new(1, -15, 0.5, -2), 
				Size = UDim2.fromOffset(28, 28), 
				BackgroundTransparency = 0.7, 
				BackgroundColor3 = l__ColorUtil__5.BLACK, 
				Text = "", 
				[v3.Event.Activated] = function()
					return p4:onClose();
				end
			}, { v3.createElement("UICorner", {
					CornerRadius = UDim.new(1, 0)
				}), v3.createElement("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Size = UDim2.fromOffset(10, 10), 
					BackgroundTransparency = 1, 
					Image = u6.Image, 
					ImageRectOffset = u6.ImageRectOffset, 
					ImageRectSize = u6.ImageRectSize, 
					ZIndex = 3
				}) }) }), v3.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.9270440251572327), 
			BackgroundTransparency = 0.4, 
			BackgroundColor3 = l__ColorUtil__5.hexColor(0), 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, { v3.createElement(l__LineFrame__7, {
				Size = UDim2.fromScale(1, 1), 
				BorderColor3 = l__ColorUtil__5.WHITE, 
				BorderWidthPixels = 2
			}, { v3.createElement("ImageLabel", {
					Image = "rbxassetid://7286588591", 
					BackgroundTransparency = 1, 
					Size = UDim2.fromScale(1.85, 1.85), 
					Position = UDim2.fromScale(0.5, 0.4), 
					AnchorPoint = Vector2.new(0.5, 0.4), 
					ScaleType = "Fit"
				}), v3.createElement(l__FlamethrowerTierCard__8, {
					Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246), 
					Position = UDim2.fromScale(0.5953405017921147, 0.04748982360922659), 
					Upgrade = l__FlamethrowerUpgrade__9.HEAT, 
					SetUpgrades = v7, 
					Locked = v13, 
					UpgradeMap = p4.state.upgrades
				}), v3.createElement("ImageLabel", {
					BackgroundTransparency = 1, 
					Image = "rbxassetid://7287862213", 
					Position = UDim2.fromScale(0.7168458781362007, 0.29850746268656714), 
					Size = UDim2.fromScale(0.06164874551971326, 0.10990502035278155), 
					ScaleType = "Fit"
				}), v3.createElement(l__FlamethrowerTierCard__8, {
					Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246), 
					Position = UDim2.fromScale(0.1867383512544803, 0.7055630936227951), 
					Upgrade = l__FlamethrowerUpgrade__9.RANGE, 
					SetUpgrades = v7, 
					Locked = v13, 
					UpgradeMap = p4.state.upgrades
				}), v3.createElement("ImageLabel", {
					BackgroundTransparency = 1, 
					Image = "rbxassetid://7292733307", 
					Position = UDim2.fromScale(0.30824372759856633, 0.6241519674355496), 
					Size = UDim2.fromScale(0.08028673835125448, 0.09905020352781546), 
					ScaleType = "Fit"
				}), v3.createElement(l__FlamethrowerTierCard__8, {
					Size = UDim2.fromScale(0.24301075268817204, 0.20081411126187246), 
					Position = UDim2.fromScale(0.13010752688172045, 0.04748982360922659), 
					Upgrade = l__FlamethrowerUpgrade__9.POWER, 
					SetUpgrades = v7, 
					Locked = v13, 
					UpgradeMap = p4.state.upgrades
				}), v3.createElement("ImageLabel", {
					BackgroundTransparency = 1, 
					Image = "rbxassetid://7292841146", 
					Position = UDim2.fromScale(0.21505376344086022, 0.29850746268656714), 
					Size = UDim2.fromScale(0.03655913978494624, 0.07462686567164178), 
					ScaleType = "Fit"
				}), v3.createElement("TextLabel", {
					Position = UDim2.fromScale(0.6702508960573477, 0.9430122116689281), 
					Size = UDim2.fromScale(0.3154121863799283, 0.037991858887381276), 
					Font = "RobotoCondensed", 
					Text = "*You can only upgrade one component to Tier 4.", 
					TextColor3 = l__ColorUtil__5.WHITE, 
					TextScaled = true, 
					TextXAlignment = "Right", 
					TextYAlignment = "Bottom", 
					BackgroundTransparency = 1
				}) }) }) });
end;
return {
	FlamethrowerComponent = v4
};
