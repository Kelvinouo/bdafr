-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local v2 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v3 = setmetatable({}, v2);
v3.__index = v3;
function v3.new()
	local v4 = setmetatable(v2.new(), v3);
	v4.isFollowStick = false;
	v4.thumbstickFrame = nil;
	v4.moveTouchObject = nil;
	v4.onTouchMovedConn = nil;
	v4.onTouchEndedConn = nil;
	v4.screenPos = nil;
	v4.stickImage = nil;
	v4.thumbstickSize = nil;
	return v4;
end;
local u1 = Vector3.new(0, 0, 0);
function v3.Enable(p1, p2, p3)
	if p2 == nil then
		return false;
	end;
	if p2 then
		local v5 = true;
	else
		v5 = false;
	end;
	p2 = v5;
	if p1.enabled == p2 then
		return true;
	end;
	p1.moveVector = u1;
	p1.isJumping = false;
	if p2 then
		if not p1.thumbstickFrame then
			p1:Create(p3);
		end;
		p1.thumbstickFrame.Visible = true;
	else
		p1.thumbstickFrame.Visible = false;
		p1:OnInputEnded();
	end;
	p1.enabled = p2;
end;
function v3.OnInputEnded(p4)
	p4.thumbstickFrame.Position = p4.screenPos;
	p4.stickImage.Position = UDim2.new(0, p4.thumbstickFrame.Size.X.Offset / 2 - p4.thumbstickSize / 4, 0, p4.thumbstickFrame.Size.Y.Offset / 2 - p4.thumbstickSize / 4);
	p4.moveVector = u1;
	p4.isJumping = false;
	p4.thumbstickFrame.Position = p4.screenPos;
	p4.moveTouchObject = nil;
end;
local l__UserInputService__2 = game:GetService("UserInputService");
local l__GuiService__3 = game:GetService("GuiService");
function v3.Create(p5, p6)
	if p5.thumbstickFrame then
		p5.thumbstickFrame:Destroy();
		p5.thumbstickFrame = nil;
		if p5.onTouchMovedConn then
			p5.onTouchMovedConn:Disconnect();
			p5.onTouchMovedConn = nil;
		end;
		if p5.onTouchEndedConn then
			p5.onTouchEndedConn:Disconnect();
			p5.onTouchEndedConn = nil;
		end;
	end;
	local v6 = math.min(p6.AbsoluteSize.x, p6.AbsoluteSize.y) <= 500;
	if v6 then
		local v7 = 70;
	else
		v7 = 120;
	end;
	p5.thumbstickSize = v7;
	p5.screenPos = v6 and UDim2.new(0, p5.thumbstickSize / 2 - 10, 1, -p5.thumbstickSize - 20) or UDim2.new(0, p5.thumbstickSize / 2, 1, -p5.thumbstickSize * 1.75);
	p5.thumbstickFrame = Instance.new("Frame");
	p5.thumbstickFrame.Name = "ThumbstickFrame";
	p5.thumbstickFrame.Active = true;
	p5.thumbstickFrame.Visible = false;
	p5.thumbstickFrame.Size = UDim2.new(0, p5.thumbstickSize, 0, p5.thumbstickSize);
	p5.thumbstickFrame.Position = p5.screenPos;
	p5.thumbstickFrame.BackgroundTransparency = 1;
	local v8 = Instance.new("ImageLabel");
	v8.Name = "OuterImage";
	v8.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
	v8.ImageRectOffset = Vector2.new();
	v8.ImageRectSize = Vector2.new(220, 220);
	v8.BackgroundTransparency = 1;
	v8.Size = UDim2.new(0, p5.thumbstickSize, 0, p5.thumbstickSize);
	v8.Position = UDim2.new(0, 0, 0, 0);
	v8.Parent = p5.thumbstickFrame;
	p5.stickImage = Instance.new("ImageLabel");
	p5.stickImage.Name = "StickImage";
	p5.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png";
	p5.stickImage.ImageRectOffset = Vector2.new(220, 0);
	p5.stickImage.ImageRectSize = Vector2.new(111, 111);
	p5.stickImage.BackgroundTransparency = 1;
	p5.stickImage.Size = UDim2.new(0, p5.thumbstickSize / 2, 0, p5.thumbstickSize / 2);
	p5.stickImage.Position = UDim2.new(0, p5.thumbstickSize / 2 - p5.thumbstickSize / 4, 0, p5.thumbstickSize / 2 - p5.thumbstickSize / 4);
	p5.stickImage.ZIndex = 2;
	p5.stickImage.Parent = p5.thumbstickFrame;
	local u4 = nil;
	p5.thumbstickFrame.InputBegan:Connect(function(p7)
		if not (not p5.moveTouchObject) or p7.UserInputType ~= Enum.UserInputType.Touch or p7.UserInputState ~= Enum.UserInputState.Begin then
			return;
		end;
		p5.moveTouchObject = p7;
		p5.thumbstickFrame.Position = UDim2.new(0, p7.Position.x - p5.thumbstickFrame.Size.X.Offset / 2, 0, p7.Position.y - p5.thumbstickFrame.Size.Y.Offset / 2);
		u4 = Vector2.new(p5.thumbstickFrame.AbsolutePosition.x + p5.thumbstickFrame.AbsoluteSize.x / 2, p5.thumbstickFrame.AbsolutePosition.y + p5.thumbstickFrame.AbsoluteSize.y / 2);
		local v9 = Vector2.new(p7.Position.x - u4.x, p7.Position.y - u4.y);
	end);
	local function u5(p8)
		local v10 = p8 / (p5.thumbstickSize / 2);
		local l__magnitude__11 = v10.magnitude;
		if l__magnitude__11 < 0.05 then
			local v12 = Vector3.new();
		else
			local v13 = v10.unit * ((l__magnitude__11 - 0.05) / 0.95);
			v12 = Vector3.new(v13.x, 0, v13.y);
		end;
		p5.moveVector = v12;
	end;
	local function u6(p9)
		local v14 = Vector2.new(p9.x - u4.x, p9.y - u4.y);
		local l__magnitude__15 = v14.magnitude;
		local v16 = p5.thumbstickFrame.AbsoluteSize.x / 2;
		if p5.isFollowStick and v16 < l__magnitude__15 then
			local v17 = v14.unit * v16;
			p5.thumbstickFrame.Position = UDim2.new(0, p9.x - p5.thumbstickFrame.AbsoluteSize.x / 2 - v17.x, 0, p9.y - p5.thumbstickFrame.AbsoluteSize.y / 2 - v17.y);
		else
			v14 = v14.unit * math.min(l__magnitude__15, v16);
		end;
		p5.stickImage.Position = UDim2.new(0, v14.x + p5.stickImage.AbsoluteSize.x / 2, 0, v14.y + p5.stickImage.AbsoluteSize.y / 2);
	end;
	p5.onTouchMovedConn = l__UserInputService__2.TouchMoved:Connect(function(p10, p11)
		if p10 == p5.moveTouchObject then
			u4 = Vector2.new(p5.thumbstickFrame.AbsolutePosition.x + p5.thumbstickFrame.AbsoluteSize.x / 2, p5.thumbstickFrame.AbsolutePosition.y + p5.thumbstickFrame.AbsoluteSize.y / 2);
			u5((Vector2.new(p10.Position.x - u4.x, p10.Position.y - u4.y)));
			u6(p10.Position);
		end;
	end);
	p5.onTouchEndedConn = l__UserInputService__2.TouchEnded:Connect(function(p12, p13)
		if p12 == p5.moveTouchObject then
			p5:OnInputEnded();
		end;
	end);
	l__GuiService__3.MenuOpened:Connect(function()
		if p5.moveTouchObject then
			p5:OnInputEnded();
		end;
	end);
	p5.thumbstickFrame.Parent = p6;
end;
return v3;
