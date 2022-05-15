
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v2.Component:extend("EngineerFilmEffect");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
function v4.init(p1, p2)
	p1.maid = l__Maid__1.new();
	p1.sizeX = 400;
	p1.sizeY = 400;
	local v5, v6 = v2.createBinding(UDim2.new(0.18, 0, 0.18, 0));
	p1.tileSize = v5;
	p1.setTileSize = v6;
end;
local l__Lighting__2 = v3.Lighting;
function v4.render(p3)
	return v2.createFragment({ v2.createElement(v2.Portal, {
			target = l__Lighting__2
		}, { v2.createElement("ColorCorrectionEffect", {
				Contrast = 0.2, 
				Saturation = -0.3, 
				TintColor = p3.props.color or Color3.fromRGB(74, 107, 135)
			}) }), v2.createElement("ImageLabel", {
			Size = UDim2.fromScale(1.5, 1.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 1, 
			ImageTransparency = p3.props.transparency, 
			TileSize = p3.tileSize, 
			ScaleType = "Tile", 
			Image = "http://www.roblox.com/asset/?id=28756351"
		}) });
end;
local l__CurrentCamera__3 = v3.Workspace.CurrentCamera;
function v4.updateSize(p4)
	p4.sizeX = 300000 / l__CurrentCamera__3.ViewportSize.X;
	p4.sizeY = 300000 / l__CurrentCamera__3.ViewportSize.Y;
end;
local l__RunService__4 = v3.RunService;
function v4.didMount(p5)
	p5.maid:GiveTask(l__RunService__4.Heartbeat:Connect(function()
		p5.setTileSize(UDim2.fromScale(math.random(p5.sizeX * 0.9, p5.sizeX * 1.1) / 1000, math.random(p5.sizeY * 0.9, p5.sizeY * 1.1) / 1000));
	end));
	p5:updateSize();
	p5.maid:GiveTask(l__CurrentCamera__3:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		p5:updateSize();
	end));
end;
function v4.willUnmount(p6)
	p6.maid:DoCleaning();
end;
return {
	EngineerFilmEffectWrapper = function(p7)
		return v2.createElement("ScreenGui", {
			ResetOnSpawn = false, 
			IgnoreGuiInset = true
		}, { v2.createElement(v4, {
				transparency = v2.createBinding(0.9)
			}) });
	end, 
	EngineerFilmEffect = v4
};

