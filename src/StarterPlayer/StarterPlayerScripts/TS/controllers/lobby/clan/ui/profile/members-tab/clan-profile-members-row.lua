
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ClanUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__ClanMemberRank__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__6 = v2.Empty;
local l__ColorUtil__7 = v2.ColorUtil;
local l__StringUtil__8 = v2.StringUtil;
local l__MenuComponent__9 = v1.import(script, script.Parent, "menu-component").MenuComponent;
return {
	ClanProfileMembersRow = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v3 = 0.05 * (#p1.Columns - 1) / #p1.Columns;
		local v4, v5 = p2.useState(0);
		p2.useEffect(function()
			local v6 = p1.store.Clans.myClan;
			if v6 ~= nil then
				v6 = v6.clanContribution;
			end;
			if v6 then
				local v7 = v6.dailyMemberContributions[l__ClanUtil__1.getContributionDayId()];
				if v7 ~= nil then
					v7 = v7[tostring(p1.ClanMember.offlinePlayer.userId)];
				end;
				if v7 ~= 0 and v7 == v7 and v7 then
					v5(v7);
				end;
			end;
		end, { p1.ClanMember.contribution });
		local v8 = {};
		local l__myClanMember__9 = p1.store.Clans.myClanMember;
		if l__myClanMember__9 and p1.ClanMember.rank < l__myClanMember__9.rank then
			if p1.ClanMember.rank < l__ClanMemberRank__2.ADMIN then
				table.insert(v8, {
					text = "Promote", 
					callback = function(p3)
						local l__myClanId__10 = p1.store.Clans.myClanId;
						if l__myClanId__10 == "" or not l__myClanId__10 then
							return nil;
						end;
						p3(true);
						l__KnitClient__3.Controllers.ClanController:promoteMember(p1.ClanMember, p1.store.Clans.myClanId):andThen(function(p4)
							p3(false);
							return p4;
						end);
					end
				});
			end;
			if l__ClanMemberRank__2.MEMBER < p1.ClanMember.rank then
				table.insert(v8, {
					text = "Demote", 
					callback = function(p5)
						local l__myClanId__11 = p1.store.Clans.myClanId;
						if l__myClanId__11 == "" or not l__myClanId__11 then
							return nil;
						end;
						p5(true);
						l__KnitClient__3.Controllers.ClanController:demoteMember(p1.ClanMember, p1.store.Clans.myClanId):andThen(function(p6)
							p5(false);
							return p6;
						end);
					end
				});
			end;
			table.insert(v8, {
				text = "Kick", 
				callback = function(p7, p8)
					local l__myClanId__12 = p1.store.Clans.myClanId;
					if l__myClanId__12 == "" or not l__myClanId__12 then
						return nil;
					end;
					p7(true);
					l__KnitClient__3.Controllers.ClanController:kickPlayer(p1.ClanMember, p1.store.Clans.myClanId):andThen(function(p9)
						p7(false);
						p8(false);
						return p9;
					end);
				end
			});
		end;
		local v13 = {
			Size = UDim2.new(0.95, 0, 0, 40), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = p1.Index
		};
		local v14 = {};
		local v15 = p1.IsMyClanMemberRow and u5.createElement("UIStroke", {
			Color = l__Theme__4.textPrimary, 
			Thickness = 1
		});
		if v15 then
			v14[#v14 + 1] = v15;
		end;
		local v16 = #v14;
		v14[v16 + 1] = u5.createElement("UICorner", {
			CornerRadius = UDim.new(0, 6)
		});
		local v17 = { u5.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.03, 0), 
				PaddingRight = UDim.new(0.03, 0)
			}), u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 12), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v18 = { u5.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}), u5.createElement(l__Empty__6, {
				Size = UDim2.new(p1.Columns[1].width - v3, 0, 1, 0), 
				LayoutOrder = 2
			}, { u5.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.05, 0), 
					VerticalAlignment = "Center", 
					SortOrder = "LayoutOrder"
				}), u5.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.55), 
					Text = "<b>" .. p1.ClanMember.offlinePlayer.displayName .. "</b>", 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__7.WHITE, 
					TextXAlignment = "Left", 
					TextYAlignment = "Center", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1, 
					AutoLocalize = false
				}, { u5.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }), u5.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.4), 
					Text = "@" .. p1.ClanMember.offlinePlayer.name, 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__7.WHITE, 
					TextXAlignment = "Left", 
					TextYAlignment = "Center", 
					TextTransparency = 0.3, 
					BackgroundTransparency = 1, 
					LayoutOrder = 2, 
					AutoLocalize = false
				}, { u5.createElement("UITextSizeConstraint", {
						MaxTextSize = 16
					}) }) }), u5.createElement("TextLabel", {
				Size = UDim2.new(p1.Columns[2].width - v3, 0, 1, 0), 
				Text = l__StringUtil__8.capitalizeFirstLetter(string.lower(tostring(l__ClanMemberRank__2[p1.ClanMember.rank]))), 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__7.WHITE, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				TextTransparency = 0.3, 
				BackgroundTransparency = 1, 
				LayoutOrder = 2
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }), u5.createElement("TextLabel", {
				Size = UDim2.new(p1.Columns[3].width - v3, 0, 1, 0), 
				Text = l__StringUtil__8.formatNumberWithCommas(math.floor(p1.ClanMember.contribution)), 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__7.WHITE, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				TextTransparency = 0.3, 
				BackgroundTransparency = 1, 
				LayoutOrder = 2
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }), u5.createElement("TextLabel", {
				Size = UDim2.new(p1.Columns[4].width - v3, 0, 1, 0), 
				Text = l__StringUtil__8.formatNumberWithCommas(math.floor(v4)), 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__7.WHITE, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				TextTransparency = 0.3, 
				BackgroundTransparency = 1, 
				LayoutOrder = 2
			}, { u5.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }) };
		local v19 = p1.AdminView;
		if v19 then
			v19 = false;
			if #v8 > 0 then
				v19 = u5.createElement(l__MenuComponent__9, {
					ButtonText = "Actions", 
					Items = v8, 
					Size = UDim2.new(p1.Columns[5].width - v3, 0, 1, 0), 
					LayoutOrder = 3
				});
			end;
		end;
		if v19 then
			v18[#v18 + 1] = v19;
		end;
		v17[#v17 + 1] = u5.createElement(l__Empty__6, {
			Size = UDim2.fromScale(1, 1), 
			LayoutOrder = 1
		}, v18);
		v14[v16 + 2] = u5.createElement(l__Empty__6, {
			Size = UDim2.fromScale(1, 1)
		}, v17);
		return u5.createElement("Frame", v13, v14);
	end)
};

