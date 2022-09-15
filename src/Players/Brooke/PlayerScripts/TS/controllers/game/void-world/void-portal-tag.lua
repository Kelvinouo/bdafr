-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	VoidPortalTag = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local function v2()
			return math.floor(p1.closeTime - l__Workspace__1:GetServerTimeNow());
		end;
		local v3, v4 = p2.useState(v2());
		p2.useEffect(function()
			local u4 = true;
			task.spawn(function()
				while true do
					local v5 = task.wait(1);
					if v5 ~= 0 and v5 == v5 and v5 then
						v5 = u4;
					end;
					if v5 == 0 then
						break;
					end;
					if v5 ~= v5 then
						break;
					end;
					if not v5 then
						break;
					end;
					v4(v2());				
				end;
			end);
			return function()
				u4 = false;
			end;
		end, {});
		return u2.createFragment({
			VoidPortalTag = u2.createElement("BillboardGui", {
				Size = UDim2.fromScale(6, 1), 
				StudsOffsetWorldSpace = Vector3.new(0, 4, 0), 
				AlwaysOnTop = true, 
				MaxDistance = 150, 
				ResetOnSpawn = false, 
				AutoLocalize = false
			}, {
				TagContainer = u2.createElement("Frame", {
					Size = UDim2.fromScale(0.75, 0.75), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
					BackgroundTransparency = 0.75, 
					BorderSizePixel = 0, 
					LayoutOrder = 2
				}, {
					Stroke = u2.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
						Thickness = 1, 
						Transparency = 1
					}), 
					Tag = u2.createElement("TextLabel", {
						Text = p1.getTag(v3), 
						Size = UDim2.fromScale(1, 1), 
						AutomaticSize = "X", 
						TextColor3 = l__Theme__3.mcPink, 
						Font = Enum.Font.ArialBold, 
						BackgroundTransparency = 1, 
						TextScaled = true, 
						RichText = true, 
						AutoLocalize = false, 
						TextYAlignment = "Center", 
						LayoutOrder = 2
					}),
					u2.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 6), 
						PaddingRight = UDim.new(0, 6)
					}), (u2.createElement("UIListLayout", {
						FillDirection = "Horizontal", 
						HorizontalAlignment = "Center", 
						VerticalAlignment = "Center", 
						SortOrder = "LayoutOrder", 
						Padding = UDim.new(0.01, 0)
					}))
				})
			})
		});
	end)
};
