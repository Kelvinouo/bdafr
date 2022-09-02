-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("ModalTransitionComponent");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__SingleMotor__2 = v2.SingleMotor;
local l__BindingFromMotor__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "binding-util").BindingFromMotor;
local l__Spring__4 = v2.Spring;
function v4.init(p1, p2)
	p1._maid = u1.new();
	p1.ScaleMotor = l__SingleMotor__2.new(0);
	p1.ScaleBinding = l__BindingFromMotor__3(p1.ScaleMotor);
	p1._maid:GiveTask(p2.Close:Connect(function(p3)
		p1.ScaleMotor:setGoal(l__Spring__4.new(0, {
			frequency = p2.CloseSpeed, 
			dampingRatio = 1
		}));
		p1.ScaleMotor:onComplete(function()
			p1._maid:DoCleaning();
			if p3 then
				p3();
			end;
		end);
	end));
end;
function v4.didMount(p4)
	local v5 = {};
	local v6 = p4.props.OpenSpeed;
	if v6 == 0 or v6 ~= v6 or not v6 then
		v6 = 3.5;
	end;
	v5.frequency = v6;
	v5.dampingRatio = 0.8;
	p4.ScaleMotor:setGoal(l__Spring__4.new(1, v5));
end;
function v4.render(p5)
	local v7 = { v3.createElement("UIScale", {
			Scale = p5.ScaleBinding
		}) };
	local v8 = #v7;
	local v9 = p5.props[v3.Children];
	if v9 then
		local v10, v11, v12 = pairs(v9);
		while true do
			local v13 = nil;
			local v14 = nil;
			v14, v13 = v10(v11, v12);
			if not v14 then
				break;
			end;
			v12 = v14;
			if type(v14) == "number" then
				v7[v8 + v14] = v13;
			else
				v7[v14] = v13;
			end;		
		end;
	end;
	return v3.createElement("Frame", {
		AnchorPoint = p5.props.AnchorPoint, 
		Position = p5.props.Position, 
		Size = p5.props.Size, 
		Active = true, 
		BackgroundTransparency = 1
	}, v7);
end;
function v4.willUnmount(p6)
	p6._maid:DoCleaning();
end;
v4.defaultProps = {
	CloseSpeed = 6
};
return v4;
