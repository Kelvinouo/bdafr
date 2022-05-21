-- Script Hash: 726db1489df11e29742d41329276cd38f453a3d192cf1bd1acd5f2dbb404a1654a1cd56a41f785fedca885e93f5e32b5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__Maid__1 = v3.Maid;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__KnitClient__3 = v3.KnitClient;
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
		local l__useState__4 = p2.useState;
		local v5, v6 = l__useState__4(false);
		local v7, v8 = l__useState__4("");
		local l__validated__9 = p1.store.SocialConnections.connections.discord.validated;
		local u14 = l__Maid__1.new();
		p2.useEffect(function()
			local u15 = nil;
			u4:WaitFor("VerificationStatusResolved"):andThen(function(p3)
				u14:GiveTask(p3:Connect(function(p4)
					if p4.verificationCode ~= p1.store.SocialConnections.connections.discord.verificationCode then
						l__KnitClient__3.Controllers.SocialConnectionsController:updateDiscordStore(p4);
						return nil;
					end;
					if p4.validated == p1.store.SocialConnections.connections.discord.validated then
						if v5 then
							l__SoundManager__5:playSound(l__GameSound__6.ERROR_NOTIFICATION);
							v8("You're not verified");
							v6(false);
						end;
						return;
					end;
					l__SoundManager__5:playSound(l__GameSound__6.INFO_NOTIFICATION);
					l__KnitClient__3.Controllers.SocialConnectionsController:updateDiscordStore(p4);
					if v5 then
						v8("");
						v6(false);
						u15 = false;
					end;
					return nil;
				end));
			end);
			local l__verificationCode__10 = p1.store.SocialConnections.connections.discord.verificationCode;
			local v11 = false;
			if l__verificationCode__10 ~= "" then
				v11 = l__verificationCode__10;
			end;
			if not v11 and not l__DeviceUtil__2.isHoarceKat() then
				l__KnitClient__3.Controllers.SocialConnectionsController:getDiscordValidationStatus();
			end;
			u15 = true;
			if not p1.store.SocialConnections.connections.discord.validated and not l__DeviceUtil__2.isHoarceKat() then
				task.spawn(function()
					local l__verificationCode__12 = p1.store.SocialConnections.connections.discord.verificationCode;
					if l__verificationCode__12 == "" or not l__verificationCode__12 then
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
		local v13 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		};
		local v14 = { u7.createElement("UIListLayout", {
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
		local v15 = {
			Size = UDim2.new(1, 0, 0, 78), 
			BackgroundColor3 = l__Theme__10.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 2
		};
		local v16 = { u7.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u7.createElement(l__CornerFiller__11, {
				TopLeft = true, 
				TopRight = true
			}) };
		local v17 = {
			Size = UDim2.new(1, 0, 1, 0), 
			BackgroundTransparency = 1
		};
		local v18 = { u7.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8), 
				PaddingBottom = UDim.new(0, 8), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}) };
		local v19 = {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0, 0), 
			Size = UDim2.fromScale(0.75, 1), 
			BackgroundTransparency = 1
		};
		local v20 = {};
		if not l__validated__9 then
			local v21 = {};
			local v22 = {
				Size = UDim2.new(1, 0, 0, 14)
			};
			if p1.store.SocialConnections.connections.discord.verificationCode ~= "" then
				local v23 = p1.store.SocialConnections.connections.discord.verificationCode;
			else
				v23 = "Generating Code";
			end;
			v22.Text = "<b>Discord Verfication Code: <font color=\"" .. l__Theme__10.textPrimaryRichText .. "\">" .. tostring(v23) .. "</font></b>";
			v22.AutoLocalize = false;
			v22.TextColor3 = l__ColorUtil__12.WHITE;
			v22.TextXAlignment = Enum.TextXAlignment.Left;
			v22.RichText = true;
			v22.Font = Enum.Font.Roboto;
			v22.TextSize = 14;
			v22.BackgroundTransparency = 1;
			v22.LayoutOrder = 1;
			v21.DiscordVerficationCode = u7.createElement("TextLabel", v22);
			local v24 = u7.createFragment(v21);
		else
			v24 = u7.createFragment({
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
		v20[1] = u7.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 3)
		});
		v20[2] = v24;
		local v25 = not l__validated__9 and u7.createFragment({
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
		if v25 then
			v20[#v20 + 1] = v25;
		end;
		v18.DiscordConnectTextInfo = u7.createElement("Frame", v19, v20);
		local v26 = not l__validated__9 and u7.createElement(l__ButtonComponent__13, {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.5), 
			Size = UDim2.fromScale(0.25, 0.5), 
			Text = "Verify", 
			Loading = v5, 
			OnClick = function()
				if not l__DeviceUtil__2.isHoarceKat() then
					l__KnitClient__3.Controllers.SocialConnectionsController:getDiscordValidationStatus();
					v6(true);
				end;
			end
		});
		if v26 then
			v18[#v18 + 1] = v26;
		end;
		v18[#v18 + 1] = u7.createElement("TextLabel", {
			AnchorPoint = Vector2.new(1, 0.5), 
			Position = UDim2.fromScale(1, 0.87), 
			Size = UDim2.new(0.25, 0, 0, 12), 
			Text = v7, 
			TextColor3 = l__Theme__10.backgroundError, 
			TextXAlignment = Enum.TextXAlignment.Center, 
			RichText = true, 
			Font = Enum.Font.Roboto, 
			TextSize = 12, 
			BackgroundTransparency = 1
		});
		v16[#v16 + 1] = u7.createElement("Frame", v17, v18);
		v14.DiscordConnectionContent = u7.createElement("Frame", v15, v16);
		return u7.createFragment({
			DiscordConnectionContainer = u7.createElement("Frame", v13, v14)
		});
	end)
};
