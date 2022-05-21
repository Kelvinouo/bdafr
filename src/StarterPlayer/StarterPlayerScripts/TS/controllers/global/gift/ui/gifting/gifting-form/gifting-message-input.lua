-- Script Hash: 9b0cc22b354059734045a0304274c7c9125c430159b0771e51b8a2c67682a233d726c13711117b1f4e386f34cd6892f7
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GiftingCharacterCounter__4 = v1.import(script, script.Parent, "gifting-character-counter").GiftingCharacterCounter;
return {
	GiftingMessageInput = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local v4 = u1.createRef();
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		}, { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 6)
			}), u1.createElement("TextLabel", {
				Text = "Message", 
				Size = UDim2.new(1, 0, 0.13, 0), 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Top, 
				TextColor3 = l__ColorUtil__2.WHITE, 
				TextTransparency = 0.3, 
				RichText = true, 
				TextSize = 20, 
				Font = Enum.Font.Roboto, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}), u1.createElement("Frame", {
				BackgroundColor3 = l__Theme__3.backgroundTertiary, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(1, 0.7), 
				LayoutOrder = 2
			}, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}), u1.createElement("TextBox", {
					Size = UDim2.fromScale(1, 1), 
					Text = "", 
					PlaceholderText = "message", 
					BackgroundTransparency = 1, 
					BackgroundColor3 = l__Theme__3.backgroundTertiary, 
					BorderSizePixel = 0, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextYAlignment = Enum.TextYAlignment.Top, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					PlaceholderColor3 = Color3.fromRGB(107, 110, 136), 
					MultiLine = true, 
					TextWrapped = true, 
					TextSize = 20, 
					Font = Enum.Font.Roboto, 
					ClearTextOnFocus = false, 
					[u1.Ref] = v4, 
					AutoLocalize = false, 
					[u1.Change.Text] = function(p3)
						if not (#p3.Text > 100) then
							p1.SetMessage(p3.Text);
							return;
						end;
						p3.Text = string.sub(p3.Text, 0, 100);
						return nil;
					end
				}, { u1.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 8), 
						PaddingBottom = UDim.new(0, 8), 
						PaddingLeft = UDim.new(0, 12), 
						PaddingRight = UDim.new(0, 12)
					}) }) }), u1.createElement(l__GiftingCharacterCounter__4, {
				TextBox = v4, 
				MaxCharCount = 100, 
				LayoutOrder = 3
			}) });
	end)
};
