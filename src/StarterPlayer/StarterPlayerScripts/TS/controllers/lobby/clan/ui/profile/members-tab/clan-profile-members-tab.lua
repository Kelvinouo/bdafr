-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src);
local l__ClanProfilePageLayout__4 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local l__ClanProfileMembersRow__5 = v1.import(script, script.Parent, "clan-profile-members-row").ClanProfileMembersRow;
local v6 = { {
		text = "Player", 
		width = 0.3
	}, {
		text = "Rank", 
		width = 0.15
	}, {
		text = "Contribution", 
		width = 0.2
	}, {
		text = "Daily Contribution", 
		width = 0.2
	}, {
		text = "", 
		width = 0.15
	} };
local l__ClanMemberRank__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u4 = 0.05 * (#v6 - 1) / #v6;
local l__ColorUtil__5 = v2.ColorUtil;
local l__Empty__6 = v2.Empty;
local l__AutoCanvasScrollingFrame__7 = v2.AutoCanvasScrollingFrame;
return {
	ClanProfileMembersTab = v3.new(u3)(function(p1, p2)
		local l__useState__7 = p2.useState;
		local v8 = p1.store.Clans.myClanId ~= p1.ClanId;
		local v9 = not v8 and (p1.store.Clans.myClanMember and l__ClanMemberRank__1.ADMIN < p1.store.Clans.myClanMember.rank);
		if v9 == nil then
			v9 = false;
		end;
		local v10 = {};
		local v11 = #v10;
		for v12, v13 in pairs(p1.Members) do
			v11 = v11 + 1;
			v10[v11] = { v12, v13 };
		end;
		local v14 = {};
		for v15, v16 in ipairs(v10) do
			v14[v16[1]] = v16[2];
		end;
		if not v8 and p1.store.Clans.myClanMember then
			v14[tostring(p1.store.Clans.myClanMember.offlinePlayer.userId)] = nil;
		end;
		local v17 = {};
		local v18 = #v17;
		for v19, v20 in pairs(v14) do
			v18 = v18 + 1;
			v17[v18] = { v19, v20 };
		end;
		local v21 = u2.values(v17);
		table.sort(v21, function(p3, p4)
			return string.lower(p3[2].offlinePlayer.displayName) < string.lower(p4[2].offlinePlayer.displayName);
		end);
		local v22 = { u3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Left", 
				Padding = UDim.new(0, 10), 
				SortOrder = "LayoutOrder"
			}) };
		local v23 = {
			Size = UDim2.new(0.95, 0, 0, 20), 
			LayoutOrder = 3
		};
		local v24 = { u3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 12), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}), u3.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.03, 0), 
				PaddingRight = UDim.new(0.03, 0)
			}) };
		local function v25(p5)
			local v26 = {
				Size = UDim2.new(p5.width - u4, 0, 1, 0)
			};
			local l__text__27 = p5.text;
			if l__text__27 ~= "" and l__text__27 then
				local v28 = "<b>" .. p5.text .. "</b>";
			else
				v28 = "";
			end;
			v26.Text = v28;
			v26.TextScaled = true;
			v26.RichText = true;
			v26.Font = "Roboto";
			v26.TextColor3 = l__ColorUtil__5.WHITE;
			v26.TextXAlignment = "Left";
			v26.TextYAlignment = "Bottom";
			v26.BackgroundTransparency = 1;
			v26.LayoutOrder = 1;
			return u3.createElement("TextLabel", v26, { u3.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) });
		end;
		local v29 = table.create(#v6);
		for v30, v31 in ipairs(v6) do
			v29[v30] = v25(v31, v30 - 1, v6);
		end;
		local v32 = {
			Size = UDim2.new(1, 0, 1, 0), 
			LayoutOrder = 2
		};
		local v33 = { u3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Bottom", 
				SortOrder = "LayoutOrder"
			}) };
		local v34 = #v33;
		for v35, v36 in ipairs(v29) do
			v33[v34 + v35] = v36;
		end;
		v24[#v24 + 1] = u3.createElement(l__Empty__6, v32, v33);
		v22.TableColumnHeaders = u3.createElement(l__Empty__6, v23, v24);
		local v37 = {
			AdditionalSpace = 120, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, -30), 
				LayoutOrder = 4
			}
		};
		local v38 = { u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 2), 
				PaddingLeft = UDim.new(0, 2)
			}), u3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 4), 
				HorizontalAlignment = "Left", 
				SortOrder = "LayoutOrder"
			}) };
		local v39 = not v8 and (p1.store.Clans.myClanMember and u3.createElement(l__ClanProfileMembersRow__5, {
			Columns = v6, 
			ClanMember = p1.store.Clans.myClanMember, 
			AdminView = v9, 
			Index = 0, 
			IsMyClanMemberRow = true, 
			store = p1.store
		}));
		if v39 then
			v38[#v38 + 1] = v39;
		end;
		local v40 = #v38;
		local function v41(p6, p7)
			local v42 = p6[1];
			return u3.createElement(l__ClanProfileMembersRow__5, {
				Columns = v6, 
				ClanMember = p6[2], 
				AdminView = v9, 
				Index = p7, 
				store = p1.store
			});
		end;
		local v43 = table.create(#v21);
		for v44, v45 in ipairs(v21) do
			v43[v44] = v41(v45, v44 - 1, v21);
		end;
		for v46, v47 in ipairs(v43) do
			v38[v40 + v46] = v47;
		end;
		v22[#v22 + 1] = u3.createElement(l__AutoCanvasScrollingFrame__7, v37, v38);
		return u3.createElement(l__ClanProfilePageLayout__4, {
			Title = "MEMBERS"
		}, v22);
	end)
};
