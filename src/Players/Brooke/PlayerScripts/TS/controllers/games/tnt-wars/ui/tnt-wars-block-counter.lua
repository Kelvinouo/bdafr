-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("TNTWarsBlockCounter");
function v3.init(p1)
	p1.avatarRef = v2.createRef();
	p1.counterRef = v2.createRef();
	p1.blockCount = 0;
end;
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TNT_WARS_IMAGE_ID__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
function v3.render(p2)
	return v2.createFragment({
		BlockDestroyedCounter = v2.createElement("Frame", {
			Size = UDim2.fromScale(0.225, 0.1), 
			Position = UDim2.fromScale(0.5, -0.1), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundColor3 = l__Theme__1.Gray, 
			BackgroundTransparency = 0.2
		}, {
			BlockImage = v2.createElement("ImageLabel", {
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Image = l__TNT_WARS_IMAGE_ID__2.GRASS_BLOCK, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(-0.1, 0.5), 
				SizeConstraint = Enum.SizeConstraint.RelativeXX, 
				Size = UDim2.fromScale(0.3, 0.3)
			}), 
			CounterText = v2.createElement("TextLabel", {
				[v2.Ref] = p2.counterRef, 
				Text = "X" .. tostring(p2.blockCount) .. " DESTROYED", 
				Font = Enum.Font.Arcade, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Size = UDim2.fromScale(1, 1), 
				Position = UDim2.fromScale(0.5, 0.5), 
				TextScaled = true, 
				BackgroundTransparency = 1, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeTransparency = 0, 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			}, { v2.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 5)
				}) }), 
			AvatarImage = v2.createElement("ImageLabel", {
				[v2.Ref] = p2.avatarRef, 
				BackgroundTransparency = 0, 
				BackgroundColor3 = l__Theme__1.Gray, 
				BorderSizePixel = 0, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(1.125, 0.5), 
				SizeConstraint = Enum.SizeConstraint.RelativeXX, 
				Size = UDim2.fromScale(0.25, 0.25)
			}, { v2.createElement("UIStroke", {
					Color = Color3.fromRGB(255, 255, 255), 
					Thickness = 3
				}), v2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 30)
				}) }),
			v2.createElement("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255), 
				Thickness = 3
			}), (v2.createElement("UICorner"))
		})
	});
end;
function v3.didMount(p3)
	p3:setAvatar();
	p3:handleBlockUpdates();
end;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.setAvatar(p4)
	local v4 = p4.avatarRef:getValue();
	if not v4 then
		return nil;
	end;
	v4.Image = l__Players__3:GetUserThumbnailAsync(l__Players__3.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.handleBlockUpdates(p5)
	local v5 = p5.counterRef:getValue();
	if not v5 then
		return nil;
	end;
	l__default__4.Client:WaitFor("RemoteName"):expect():Connect(function(p6)
		p5.blockCount = p5.blockCount + p6.amount;
		v5.Text = "X" .. tostring(p5.blockCount) .. " DESTROYED";
	end);
end;
return {
	TNTWarsBlockCounter = v3
};
