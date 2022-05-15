
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__GetTarmacAsset__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local v4 = v2.Component:extend("IceQueenPassiveBar");
function v4.init(p1)

end;
local u1 = l__GetTarmacAsset__3("ShardOutline");
local l__IceShard__2 = v1.import(script, script.Parent, "ice-shard").IceShard;
local u3 = l__GetTarmacAsset__3("Shard1");
local u4 = l__GetTarmacAsset__3("Shard2");
local u5 = l__GetTarmacAsset__3("Shard3");
local u6 = l__GetTarmacAsset__3("Shard4");
function v4.render(p2)
	return v2.createElement("ImageLabel", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.new(0.6, 0, 0.6, 0), 
		BackgroundTransparency = 1, 
		Image = u1.Image, 
		ImageRectSize = u1.ImageRectSize, 
		ImageRectOffset = u1.ImageRectOffset
	}, { v2.createElement("UIGradient", {
			Color = ColorSequence.new(Color3.fromRGB(5, 167, 226), Color3.fromRGB(84, 237, 253)), 
			Offset = Vector2.new(0, 0.1), 
			Rotation = -90
		}), v2.createElement(l__IceShard__2, {
			shard = u3, 
			barNumber = 0, 
			currentBar = p2.props.bar
		}), v2.createElement(l__IceShard__2, {
			shard = u4, 
			barNumber = 1, 
			currentBar = p2.props.bar
		}), v2.createElement(l__IceShard__2, {
			shard = u5, 
			barNumber = 2, 
			currentBar = p2.props.bar
		}), v2.createElement(l__IceShard__2, {
			shard = u6, 
			barNumber = 3, 
			currentBar = p2.props.bar
		}) });
end;
return {
	IceQueenPassiveBarWrapper = function(p3)
		return v2.createElement("BillboardGui", {
			Adornee = p3.adornee, 
			AlwaysOnTop = false, 
			Size = UDim2.fromScale(3, 3), 
			ResetOnSpawn = false, 
			ExtentsOffsetWorldSpace = Vector3.new(0, 4.3, 0)
		}, { v2.createElement(v4, {
				bar = p3.bar
			}) });
	end, 
	IceQueenPassiveBar = v4
};

