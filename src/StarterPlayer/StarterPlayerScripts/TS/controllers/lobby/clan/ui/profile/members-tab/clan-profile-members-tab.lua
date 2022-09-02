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
		local v9 = not v8 and (p1.store.Clans.myClanMember and l__ClanMemberRank__1.ADMIN <= p1.store.Clans.myClanMember.rank);
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
		local v15, v16, v17 = ipairs(v10);
		while true do
			v15(v16, v17);
			if not v15 then
				break;
			end;
			v17 = v15;
			v14[v16[1]] = v16[2];		
		end;
		if not v8 and p1.store.Clans.myClanMember then
			v14[tostring(p1.store.Clans.myClanMember.offlinePlayer.userId)] = nil;
		end;
		local v18 = {};
		local v19 = #v18;
		for v20, v21 in pairs(v14) do
			v19 = v19 + 1;
			v18[v19] = { v20, v21 };
		end;
		local v22 = u2.values(v18);
		table.sort(v22, function(p3, p4)
			return string.lower(p3[2].offlinePlayer.displayName) < string.lower(p4[2].offlinePlayer.displayName);
		end);
		local v23 = { u3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Left", 
				Padding = UDim.new(0, 10), 
				SortOrder = "LayoutOrder"
			}) };
		local v24 = {
			Size = UDim2.new(0.95, 0, 0, 20), 
			LayoutOrder = 3
		};
		local v25 = { u3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0, 12), 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}), u3.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.03, 0), 
				PaddingRight = UDim.new(0.03, 0)
			}) };
		local function v26(p5)
			local v27 = {
				Size = UDim2.new(p5.width - u4, 0, 1, 0)
			};
			local l__text__28 = p5.text;
			if l__text__28 ~= "" and l__text__28 then
				local v29 = "<b>" .. p5.text .. "</b>";
			else
				v29 = "";
			end;
			v27.Text = v29;
			v27.TextScaled = true;
			v27.RichText = true;
			v27.Font = "Roboto";
			v27.TextColor3 = l__ColorUtil__5.WHITE;
			v27.TextXAlignment = "Left";
			v27.TextYAlignment = "Bottom";
			v27.BackgroundTransparency = 1;
			v27.LayoutOrder = 1;
			return u3.createElement("TextLabel", v27, { u3.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) });
		end;
		local v30 = table.create(#v6);
		local v31, v32, v33 = ipairs(v6);
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			v33 = v31;
			v30[v31] = v26(v32, v31 - 1, v6);		
		end;
		local v34 = {
			Size = UDim2.new(1, 0, 1, 0), 
			LayoutOrder = 2
		};
		local v35 = { u3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Bottom", 
				SortOrder = "LayoutOrder"
			}) };
		local v36 = #v35;
		local v37, v38, v39 = ipairs(v30);
		while true do
			v37(v38, v39);
			if not v37 then
				break;
			end;
			v39 = v37;
			v35[v36 + v37] = v38;		
		end;
		v25[#v25 + 1] = u3.createElement(l__Empty__6, v34, v35);
		v23.TableColumnHeaders = u3.createElement(l__Empty__6, v24, v25);
		local v40 = {
			AdditionalSpace = 120, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, -30), 
				LayoutOrder = 4
			}
		};
		local v41 = { u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 2), 
				PaddingLeft = UDim.new(0, 2)
			}), u3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 4), 
				HorizontalAlignment = "Left", 
				SortOrder = "LayoutOrder"
			}) };
		local v42 = not v8 and (p1.store.Clans.myClanMember and u3.createElement(l__ClanProfileMembersRow__5, {
			Columns = v6, 
			ClanMember = p1.store.Clans.myClanMember, 
			AdminView = v9, 
			Index = 0, 
			IsMyClanMemberRow = true, 
			store = p1.store
		}));
		if v42 then
			v41[#v41 + 1] = v42;
		end;
		local v43 = #v41;
		local v44 = table.create(#v22);
		local v45, v46, v47 = ipairs(v22);
		while true do
			v45(v46, v47);
			if not v45 then
				break;
			end;
			v47 = v45;
			local v48 = v46[1];
			v44[v45] = u3.createElement(l__ClanProfileMembersRow__5, {
				Columns = v6, 
				ClanMember = v46[2], 
				AdminView = v9, 
				Index = v45 - 1, 
				store = p1.store
			});		
		end;
		local v49, v50, v51 = ipairs(v44);
		while true do
			v49(v50, v51);
			if not v49 then
				break;
			end;
			v51 = v49;
			v41[v43 + v49] = v50;		
		end;
		v23[#v23 + 1] = u3.createElement(l__AutoCanvasScrollingFrame__7, v40, v41);
		return u3.createElement(l__ClanProfilePageLayout__4, {
			Title = "MEMBERS"
		}, v23);
	end)
};
