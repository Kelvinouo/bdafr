
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("TargetMarker");
function v3.init(p1)

end;
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__AvatarUpper__3 = v1.import(script, script.Parent, "avatar-upper").AvatarUpper;
function v3.render(p2)
	return v2.createElement("ImageLabel", {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.fromScale(0.5, 0.5), 
		BackgroundTransparency = 1, 
		ImageColor3 = l__Theme__1.backgroundPrimary, 
		Size = UDim2.new(1, 0, 1, 0), 
		Image = l__BedwarsImageId__2.BOUNTY_HUNTER_MARKER, 
		ScaleType = "Fit"
	}, { v2.createElement(l__AvatarUpper__3, {
			store = p2.props.store, 
			player = p2.props.player, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.2), 
			Size = UDim2.fromScale(0.3, 0.3), 
			BackgroundColor3 = l__Theme__1.backgroundSecondary
		}, { v2.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1, 
				DominantAxis = "Width"
			}), v2.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}) }) });
end;
function v3.shouldUpdate(p3, p4)
	return p3.props.store.Kit.bountyHunterTarget ~= p4.store.Kit.bountyHunterTarget;
end;
return {
	TargetMarkerWrapper = function(p5)
		return v2.createElement("BillboardGui", {
			Size = UDim2.fromOffset(100, 100), 
			ExtentsOffsetWorldSpace = Vector3.new(0, 3, 0), 
			SizeOffset = Vector2.new(0, 1), 
			ResetOnSpawn = false, 
			Adornee = p5.adornee
		}, { v2.createElement(v3, {
				store = p5.store, 
				player = p5.player
			}) });
	end, 
	TargetMarker = v3
};

