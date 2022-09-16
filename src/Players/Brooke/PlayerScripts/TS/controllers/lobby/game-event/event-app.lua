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
		v3.eventDataProfile = p1.Event.profileData;
		v3.activeMissions = p1.Event.activeMissions[p2.event];
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p3, p4)
		local v6 = l__EventMeta__1[p3.event];
		local v7 = v6.endDate < os.time();
		if v7 then
			local v8 = "shop";
		else
			local v9 = p3.tab;
			if v9 == nil then
				v9 = "missions";
			end;
			v8 = v9;
		end;
		local v10, v11 = p4.useState(v8);
		local v12 = { u2.createElement(l__DarkBackground__3, {
				AppId = p3.AppId
			}) };
		local v13 = {
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
		};
		local v14 = { u2.createElement(l__ScaleComponent__5, {
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
				Page = v10, 
				SetPage = v11
			}) };
		local v15 = {
			Size = UDim2.fromScale(1, 0.9), 
			LayoutOrder = 2
		};
		local v16 = { u2.createElement(l__Padding__7, {
				Padding = {
					Vertical = 8, 
					Horizontal = 14
				}
			}), (u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.02, 0), 
				SortOrder = "LayoutOrder"
			})) };
		local v17 = {
			Size = UDim2.fromScale(1, 0.04), 
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		local v18 = string.lower(v10);
		if v18 == "shop" then
			local v19 = "The shop will stay open for a week after the event ends.";
		elseif v18 == "missions" then
			v19 = "Complete Missions or find Treasure Chests in matches to earn currency to spend in the Event Shop!";
		else
			v19 = "";
		end;
		v17.Text = v19;
		v17.TextScaled = true;
		v17.RichText = true;
		v17.Font = "Roboto";
		v17.TextColor3 = Color3.fromRGB(255, 255, 255);
		v17.TextTransparency = 0.3;
		v17.TextXAlignment = "Left";
		v17.BackgroundTransparency = 1;
		v17.LayoutOrder = 2;
		v16.PageDescription = u2.createElement("TextLabel", v17);
		local v20 = {
			Size = UDim2.fromScale(1, 0.94), 
			LayoutOrder = 3
		};
		local v21 = {};
		local v22 = false;
		if string.lower(v10) == "shop" then
			v22 = u2.createElement(l__EventShop__8, {
				Shop = v6.shops[1], 
				ItemsPurchased = p3.eventDataProfile.events[p3.event].itemsPurchased, 
				EventType = p3.event
			});
		end;
		if v22 then
			v21[#v21 + 1] = v22;
		end;
		local v23 = not v7;
		if v23 then
			v23 = false;
			if string.lower(v10) == "missions" then
				v23 = p3.activeMissions and u2.createElement(l__EventMissions__9, {
					MissionsMap = p3.activeMissions, 
					ClaimedMissions = p3.eventDataProfile.events[p3.event].missionsClaimed, 
					EventType = p3.event
				});
			end;
		end;
		if v23 then
			v21[#v21 + 1] = v23;
		end;
		v16[#v16 + 1] = u2.createElement(l__Empty__10, v20, v21);
		v14.Content = u2.createElement(l__Empty__10, v15, v16);
		v12.KitShopApp = u2.createElement("ImageButton", v13, v14);
		return u2.createFragment({
			EventShop = u2.createElement("ScreenGui", {
				DisplayOrder = 20, 
				ResetOnSpawn = false
			}, v12)
		});
	end)))
};
