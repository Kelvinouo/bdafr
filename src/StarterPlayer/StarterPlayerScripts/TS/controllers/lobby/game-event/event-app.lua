-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__EventMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__3 = v2.DarkBackground;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ScaleComponent__5 = v2.ScaleComponent;
local l__EventAppNavbar__6 = v1.import(script, script.Parent, "event-navbar", "event-app-navbar").EventAppNavbar;
local l__Padding__7 = v2.Padding;
local l__EventShop__8 = v1.import(script, script.Parent, "event-shop", "ui", "event-shop").EventShop;
local l__EventMissions__9 = v1.import(script, script.Parent, "event-missions", "ui", "event-missions").EventMissions;
local l__Empty__10 = v2.Empty;
return {
	EventApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v3 = {};
		for v4, v5 in pairs(p2) do
			v3[v4] = v5;
		end;
		v3.eventDataProfile = p1.Event.eventData;
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p3, p4)
		local v6 = p3.tab;
		if v6 == nil then
			v6 = "missions";
		end;
		local v7, v8 = p4.useState(v6);
		local v9 = l__EventMeta__1[p3.event];
		local v10 = { u2.createElement(l__DarkBackground__3, {
				AppId = p3.AppId
			}) };
		local v11 = { u2.createElement(l__ScaleComponent__5, {
				MaximumSize = Vector2.new(1035, 720), 
				ScreenPadding = Vector2.new(80, 80)
			}), u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 8)
			}), u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 0), 
				SortOrder = "LayoutOrder"
			}), u2.createElement(l__EventAppNavbar__6, {
				EventDataProfile = p3.eventDataProfile, 
				EventType = p3.event, 
				Page = v7, 
				SetPage = v8
			}) };
		local v12 = { u2.createElement(l__Padding__7, {
				Padding = {
					Vertical = 8, 
					Horizontal = 14
				}
			}), (u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.02, 0), 
				SortOrder = "LayoutOrder"
			})) };
		local v13 = {
			Size = UDim2.fromScale(1, 0.04), 
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		local v14 = string.lower(v7);
		if v14 == "shop" then
			local v15 = "The shop will stay open for a week after the event ends.";
		elseif v14 == "missions" then
			v15 = "Complete Missions or find Treasure Chests in matches to earn currency to spend in the Event Shop!\nMore missions will be unlocked on September 2nd!";
		else
			v15 = "";
		end;
		v13.Text = v15;
		v13.TextScaled = true;
		v13.RichText = true;
		v13.Font = "Roboto";
		v13.TextColor3 = Color3.fromRGB(255, 255, 255);
		v13.TextTransparency = 0.3;
		v13.TextXAlignment = "Left";
		v13.BackgroundTransparency = 1;
		v13.LayoutOrder = 2;
		v12.PageDescription = u2.createElement("TextLabel", v13);
		local v16 = {};
		local v17 = false;
		if string.lower(v7) == "shop" then
			v17 = u2.createElement(l__EventShop__8, {
				Shop = v9.shops[1], 
				ItemsPurchased = p3.eventDataProfile.events[p3.event].itemsPurchased, 
				EventType = p3.event
			});
		end;
		if v17 then
			v16[#v16 + 1] = v17;
		end;
		local v18 = false;
		if string.lower(v7) == "missions" then
			v18 = u2.createElement(l__EventMissions__9, {
				Missions = v9.missions, 
				MissionsClaimed = p3.eventDataProfile.events[p3.event].missionsClaimed, 
				EventType = p3.event
			});
		end;
		if v18 then
			v16[#v16 + 1] = v18;
		end;
		v12[#v12 + 1] = u2.createElement(l__Empty__10, {
			Size = UDim2.fromScale(1, 0.94), 
			LayoutOrder = 3
		}, v16);
		v11.Content = u2.createElement(l__Empty__10, {
			Size = UDim2.fromScale(1, 0.9), 
			LayoutOrder = 2
		}, v12);
		v10.KitShopApp = u2.createElement("ImageButton", {
			Size = UDim2.fromOffset(690, 480), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 0.05, 
			BackgroundColor3 = l__Theme__4.backgroundSecondary, 
			ScaleType = Enum.ScaleType.Crop, 
			Selectable = false, 
			AutoButtonColor = false, 
			Active = true, 
			Modal = true
		}, v11);
		return u2.createFragment({
			EventShop = u2.createElement("ScreenGui", {
				DisplayOrder = 20, 
				ResetOnSpawn = false
			}, v10)
		});
	end)))
};
