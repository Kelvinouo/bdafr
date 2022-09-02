-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__Controller__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MouseIconController";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	p1.mouseMaid = u1.new();
end;
function v4.onStart(p2)

end;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.setMouseIcon(p3, p4)
	local l__mouse__6 = l__Players__2.LocalPlayer:GetMouse();
	local u4 = u3("ScreenGui", {
		Name = "MouseIcon", 
		DisplayOrder = 10000, 
		Children = { u3("ImageLabel", {
				Size = UDim2.new(0, 48, 0, 48), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromOffset(l__mouse__6.X, l__mouse__6.Y), 
				Image = p4, 
				BackgroundTransparency = 1, 
				ScaleType = Enum.ScaleType.Fit, 
				ZIndex = 10000
			}) }, 
		Parent = l__Players__2.LocalPlayer:WaitForChild("PlayerGui")
	});
	p3.mouseMaid:GiveTask((l__mouse__6.Move:Connect(function()
		local v7 = u4:FindFirstChildWhichIsA("ImageLabel");
		if v7 then
			v7.Position = UDim2.fromOffset(l__mouse__6.X, l__mouse__6.Y);
		end;
	end)));
	p3.mouseMaid:GiveTask(function()
		u4:Destroy();
	end);
end;
function v4.clearMouseIcon(p5)
	p5.mouseMaid:DoCleaning();
end;
l__Reflect__2.defineMetadata(v4, "identifier", "client/controllers/global/mouse-icon/mouse-icon-controller@MouseIconController");
l__Reflect__2.defineMetadata(v4, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v4, "$:flamework@Controller", l__Controller__3, { {} });
return {
	MouseIconController = v4
};
