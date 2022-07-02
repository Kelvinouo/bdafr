-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClanMenuInviteCard__3 = v1.import(script, script.Parent, "clan-menu-invite-card").ClanMenuInviteCard;
local l__AutoCanvasScrollingFrame__4 = v2.AutoCanvasScrollingFrame;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__6 = v2.Empty;
return {
	ClanInvites = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = u1.entries(p1.store.Clans.clanInvites);
		if #v4 ~= 0 then
			local v5 = v4;
			if v5 then
				local v6 = table.create(#v4);
				for v7, v8 in ipairs(v4) do
					v6[v7] = u2.createElement(l__ClanMenuInviteCard__3, {
						ClanId = v8[1], 
						ClanProfile = v8[2]
					});
				end;
				v5 = v6;
			end;
			local v9 = {
				AdditionalSpace = 80, 
				ScrollingFrameProps = {
					Size = UDim2.fromScale(1, 0.9), 
					LayoutOrder = 2
				}
			};
			local v10 = { u2.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 1)
				}), u2.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 10), 
					SortOrder = "LayoutOrder"
				}) };
			local v11 = #v10;
			for v12, v13 in ipairs(v5) do
				v10[v11 + v12] = v13;
			end;
			local v14 = u2.createElement(l__AutoCanvasScrollingFrame__4, v9, v10);
		else
			v14 = u2.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 1), 
				Text = "<b>No incoming clan invites.\n Would you like to create one instead?</b>", 
				TextColor3 = l__Theme__5.textPrimary, 
				TextXAlignment = "Center", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1, 
				TextTransparency = 0, 
				BorderSizePixel = 0, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				LayoutOrder = 1, 
				AutoLocalize = false
			}, { u2.createElement("UITextSizeConstraint", {
					MaxTextSize = 24
				}) });
		end;
		local v15 = {};
		v15[#v15 + 1] = v14;
		return u2.createFragment({
			ClanMenuInvitesTab = u2.createElement(l__Empty__6, {
				Size = UDim2.fromScale(1, 1)
			}, v15)
		});
	end)
};
