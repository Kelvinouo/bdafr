-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__PlayerRender__5 = v2.PlayerRender;
local l__ColorUtil__6 = v2.ColorUtil;
return {
	GiftingFriendsListElement = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v3 = {
			Size = UDim2.new(0.95, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundColor3 = l__Theme__2.backgroundSecondary, 
			BorderSizePixel = 0
		};
		v3[u1.Event.Activated] = function()
			l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
			p1.SetFriendsListUser({
				username = p1.Friend.username, 
				userId = p1.Friend.userId
			});
		end;
		return u1.createElement("ImageButton", v3, {
			FriendNameInfo = u1.createElement("Frame", {
				Size = UDim2.new(1, -42, 0, 32), 
				BackgroundTransparency = 1, 
				LayoutOrder = 2
			}, { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 0)
				}), u1.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 1, 0), 
					Text = "<b>" .. p1.Friend.username .. "</b>", 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextYAlignment = Enum.TextYAlignment.Center, 
					TextColor3 = l__ColorUtil__6.WHITE, 
					TextScaled = true, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					LayoutOrder = 1, 
					AutoLocalize = false, 
					BackgroundTransparency = 1
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 20
					}) }) }),
			u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8), 
				PaddingBottom = UDim.new(0, 8), 
				PaddingRight = UDim.new(0, 10), 
				PaddingLeft = UDim.new(0, 10)
			}), u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}), (u1.createElement(l__PlayerRender__5, {
				Size = UDim2.fromOffset(32, 32), 
				BorderSizePixel = 0, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1, 
				Player = {
					name = p1.Friend.username, 
					userId = p1.Friend.userId
				}
			}, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}) }))
		});
	end)
};
