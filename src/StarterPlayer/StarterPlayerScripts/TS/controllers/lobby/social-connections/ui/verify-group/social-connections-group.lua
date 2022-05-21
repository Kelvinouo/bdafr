-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__ImageId__3 = v2.ImageId;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ButtonComponent__5 = v2.ButtonComponent;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u9 = v1.import(script, script.Parent.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard;
return {
	SocialConnectionsGroup = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3(false);
		local v6, v7 = l__useState__3("");
		p2.useEffect(function()
			if not p1.store.SocialConnections.supportTasks.joinedGroup and not l__DeviceUtil__1.isHoarceKat() then
				local u10 = true;
				task.spawn(function()
					while true do
						l__KnitClient__2.Controllers.SocialConnectionsController:getJoinedGroupStatus():andThen(function(p3)
							if p3 then
								u10 = false;
								v7("");
							end;
						end);
						if not { wait(10) } then
							break;
						end;
						if not u10 then
							break;
						end;					
					end;
				end);
			end;
			local u11 = true;
			return function()
				u11 = false;
			end;
		end, {});
		local v8 = {};
		local v9 = {
			Size = UDim2.new(1, 0, 0, 46), 
			ImageId = l__ImageId__3.USERS_SOLID, 
			Text = "<b>Join</b> the Easy.gg Roblox Group", 
			LayoutOrder = 3
		};
		local v10 = {};
		local v11 = not p1.store.SocialConnections.supportTasks.joinedGroup;
		if v11 then
			local v12 = {};
			local v13 = {
				AnchorPoint = Vector2.new(1, 0.5), 
				Position = UDim2.new(1, -10, 0.5, 0), 
				Size = UDim2.new(0.25, -10, 0.5, 0), 
				Loading = v4, 
				Text = "Verify"
			};
			function v13.OnClick()
				v5(true);
				l__KnitClient__2.Controllers.SocialConnectionsController:getJoinedGroupStatus():andThen(function(p4)
					if not p4 then
						l__SoundManager__6:playSound(l__GameSound__7.ERROR_NOTIFICATION);
						v7("Not joined");
					elseif p4 then
						v7("");
					end;
					v5(false);
				end);
			end;
			v12[1] = u4.createElement(l__ButtonComponent__5, v13);
			v12[2] = u4.createElement("TextLabel", {
				AnchorPoint = Vector2.new(1, 0.5), 
				Position = UDim2.new(1, -10, 0.87, 0), 
				Size = UDim2.new(0.25, -10, 0, 12), 
				Text = v6, 
				TextColor3 = l__Theme__8.backgroundError, 
				TextXAlignment = Enum.TextXAlignment.Center, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 12, 
				BackgroundTransparency = 1
			});
			v11 = u4.createFragment(v12);
		end;
		if v11 then
			v10[#v10 + 1] = v11;
		end;
		v8[#v8 + 1] = u4.createElement(u9, v9, v10);
		return u4.createFragment(v8);
	end)
};
