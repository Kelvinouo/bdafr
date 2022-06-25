-- Script Hash: 3697828b235f029ec02bbcd16ac52f8a46167f556d8cd96d9ddfd9b237530b38b7f4ff319aca944ee9994633b2d3d812
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default.Client:GetNamespace("SocialConnections");
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u8 = v1.import(script, script.Parent.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard;
local l__ImageId__9 = v2.ImageId;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__CornerFiller__11 = v2.CornerFiller;
local l__ColorUtil__12 = v2.ColorUtil;
local l__ButtonComponent__13 = v2.ButtonComponent;
return {
	SocialConnectionsDiscord = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u7)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3(false);
		local v6, v7 = l__useState__3("");
		local l__validated__8 = p1.store.SocialConnections.connections.discord.validated;
		local u14 = u1.new();
		p2.useEffect(function()
			local u15 = nil;
			u4:WaitFor("VerificationStatusResolved"):andThen(function(p3)
				u14:GiveTask(p3:Connect(function(p4)
					if p4.verificationCode ~= p1.store.SocialConnections.connections.discord.verificationCode then
						l__KnitClient__3.Controllers.SocialConnectionsController:updateDiscordStore(p4);
						return nil;
					end;
					if p4.validated == p1.store.SocialConnections.connections.discord.validated then
						if v4 then
							l__SoundManager__5:playSound(l__GameSound__6.ERROR_NOTIFICATION);
							v7("You're not verified");
							v5(false);
						end;
						return;
					end;
					l__SoundManager__5:playSound(l__GameSound__6.INFO_NOTIFICATION);
					l__KnitClient__3.Controllers.SocialConnectionsController:updateDiscordStore(p4);
					if v4 then
						v7("");
						v5(false);
						u15 = false;
					end;
					return nil;
				end));
			end);
			local l__verificationCode__9 = p1.store.SocialConnections.connections.discord.verificationCode;
			local v10 = false;
			if l__verificationCode__9 ~= "" then
				v10 = l__verificationCode__9;
			end;
			if not v10 and not l__DeviceUtil__2.isHoarceKat() then
				l__KnitClient__3.Controllers.SocialConnectionsController:getDiscordValidationStatus();
			end;
			u15 = true;
			if not p1.store.SocialConnections.connections.discord.validated and not l__DeviceUtil__2.isHoarceKat() then
				task.spawn(function()
					local l__verificationCode__11 = p1.store.SocialConnections.connections.discord.verificationCode;
					if l__verificationCode__11 == "" or not l__verificationCode__11 then
						wait(6);
					end;
					while true do
						l__KnitClient__3.Controllers.SocialConnectionsController:getDiscordValidationStatus();
						if not { wait(10) } then
							break;
						end;
						if not u15 then
							break;
						end;					
					end;
				end);
			end;
			return function()
				u15 = false;
				u14:DoCleaning();
			end;
		end, {});
		local v12 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		};
		local v13 = { u7.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}), u7.createElement(u8, {
				ImageId = l__ImageId__9.SATELITE, 
				Text = "<b>Verify</b> your Discord account <font color=\"#1EA1F2\">discord.gg/RobloxBedWars</font>", 
				CornerFill = true, 
				LayoutOrder = 1
			}) };
		local v14 = {
			Size = UDim2.new(1, 0, 0, 78), 
			BackgroundColor3 = l__Theme__10.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 2
		};
		local v15 = { u7.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u7.createElement(l__CornerFiller__11, {
				TopLeft = true, 
				TopRight = true
			}) };
		local v16 = {
			Size = UDim2.new(1, 0, 1, 0), 
			BackgroundTransparency = 1
		};
		local v17 = { u7.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8), 
				PaddingBottom = UDim.new(0, 8), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}) };
		local v18 = {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0, 0), 
			Size = UDim2.fromScale(0.75, 1), 
			BackgroundTransparency = 1
		};
		local v19 = {};
		if not l__validated__8 then
			local v20 = {};
			local v21 = {
				Size = UDim2.new(1, 0, 0, 14)
			};
			if p1.store.SocialConnections.connections.discord.verificationCode ~= "" then
				local v22 = p1.store.SocialConnections.connections.discord.verificationCode;
			else
				v22 = "Generating Code";
			end;
			v21.Text = "<b>Discord Verfication Code: <font color=\"" .. l__Theme__10.textPrimaryRichText .. "\">" .. tostring(v22) .. "</font></b>";
			v21.AutoLocalize = false;
			v21.TextColor3 = l__ColorUtil__12.WHITE;
			v21.TextXAlignment = Enum.TextXAlignment.Left;
			v21.RichText = true;
			v21.Font = Enum.Font.Roboto;
			v21.TextSize = 14;
			v21.BackgroundTransparency = 1;
			v21.LayoutOrder = 1;
			v20.DiscordVerficationCode = u7.createElement("TextLabel", v21);
			local v23 = u7.createFragment(v20);
		else
			v23 = u7.createFragment({
				DiscordConnectConnected = u7.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 1), 
					Text = "<b>Your Discord has been verified!</b>", 
					TextColor3 = l__ColorUtil__12.WHITE, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 16, 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				})
			});
		end;
		v19[1] = u7.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 3)
		});
		v19[2] = v23;
		local v24 = not l__validated__8 and u7.createFragment({
			DiscordConnectInstructions = u7.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0), 
				AutomaticSize = "Y", 
				BackgroundTransparency = 1, 
				LayoutOrder = 2
			}, { u7.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 0)
				}), u7.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 12), 
					Text = "1. Join the BedWars Discord at <b><font color=\"#FFFFFF\">discord.gg/RobloxBedWars</font></b>", 
					TextColor3 = l__Theme__10.textSecondary, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 12, 
					BackgroundTransparency = 1
				}), u7.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 12), 
					Text = "2. Enter your code in the <b><font color=\"#FFFFFF\">#verification</font></b> Discord channel", 
					TextColor3 = l__Theme__10.textSecondary, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 12, 
					BackgroundTransparency = 1
				}), u7.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 12), 
					Text = "3. Then click <b><font color=\"#FFFFFF\">Verify</font></b>", 
					TextColor3 = l__Theme__10.textSecondary, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 12, 
					BackgroundTransparency = 1
				}) })
		});
		if v24 then
			v19[#v19 + 1] = v24;
		end;
		v17.DiscordConnectTextInfo = u7.createElement("Frame", v18, v19);
		local v25 = not l__validated__8 and u7.createElement(l__ButtonComponent__13, {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.5), 
			Size = UDim2.fromScale(0.25, 0.5), 
			Text = "Verify", 
			Loading = v4, 
			OnClick = function()
				if not l__DeviceUtil__2.isHoarceKat() then
					l__KnitClient__3.Controllers.SocialConnectionsController:getDiscordValidationStatus();
					v5(true);
				end;
			end
		});
		if v25 then
			v17[#v17 + 1] = v25;
		end;
		v17[#v17 + 1] = u7.createElement("TextLabel", {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.87), 
			Size = UDim2.new(0.25, 0, 0, 12), 
			Text = v6, 
			TextColor3 = l__Theme__10.backgroundError, 
			TextXAlignment = Enum.TextXAlignment.Center, 
			RichText = true, 
			Font = Enum.Font.Roboto, 
			TextSize = 12, 
			BackgroundTransparency = 1
		});
		v15[#v15 + 1] = u7.createElement("Frame", v16, v17);
		v13.DiscordConnectionContent = u7.createElement("Frame", v14, v15);
		return u7.createFragment({
			DiscordConnectionContainer = u7.createElement("Frame", v12, v13)
		});
	end)
};
