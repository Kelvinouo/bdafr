-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v2 = setmetatable({}, v1);
v2.__index = v2;
function v2.new()
	local v3 = setmetatable(v1.new(), v2);
	v3.parentUIFrame = nil;
	v3.jumpButton = nil;
	v3.characterAddedConn = nil;
	v3.humanoidStateEnabledChangedConn = nil;
	v3.humanoidJumpPowerConn = nil;
	v3.humanoidParentConn = nil;
	v3.externallyEnabled = false;
	v3.jumpPower = 0;
	v3.jumpStateEnabled = true;
	v3.isJumping = false;
	v3.humanoid = nil;
	return v3;
end;
local l__Players__1 = game:GetService("Players");
function v2.EnableButton(p1, p2)
	if p2 then
		if not p1.jumpButton then
			p1:Create();
		end;
		local v4 = l__Players__1.LocalPlayer.Character and l__Players__1.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
		if v4 and p1.externallyEnabled and p1.externallyEnabled and v4.JumpPower > 0 then
			p1.jumpButton.Visible = true;
			return;
		end;
	else
		p1.jumpButton.Visible = false;
		p1.isJumping = false;
		p1.jumpButton.ImageRectOffset = Vector2.new(1, 146);
	end;
end;
function v2.UpdateEnabled(p3)
	if p3.jumpPower > 0 and p3.jumpStateEnabled then
		p3:EnableButton(true);
		return;
	end;
	p3:EnableButton(false);
end;
function v2.HumanoidChanged(p4, p5)
	local v5 = l__Players__1.LocalPlayer.Character and l__Players__1.LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
	if v5 then
		if p5 == "JumpPower" then
			p4.jumpPower = v5.JumpPower;
			p4:UpdateEnabled();
			return;
		end;
		if p5 == "Parent" and not v5.Parent then
			p4.humanoidChangeConn:Disconnect();
		end;
	end;
end;
function v2.HumanoidStateEnabledChanged(p6, p7, p8)
	if p7 == Enum.HumanoidStateType.Jumping then
		p6.jumpStateEnabled = p8;
		p6:UpdateEnabled();
	end;
end;
function v2.CharacterAdded(p9, p10)
	if p9.humanoidChangeConn then
		p9.humanoidChangeConn:Disconnect();
		p9.humanoidChangeConn = nil;
	end;
	p9.humanoid = p10:FindFirstChildOfClass("Humanoid");
	while not p9.humanoid do
		p10.ChildAdded:wait();
		p9.humanoid = p10:FindFirstChildOfClass("Humanoid");	
	end;
	p9.humanoidJumpPowerConn = p9.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
		p9.jumpPower = p9.humanoid.JumpPower;
		p9:UpdateEnabled();
	end);
	p9.humanoidParentConn = p9.humanoid:GetPropertyChangedSignal("Parent"):Connect(function()
		if not p9.humanoid.Parent then
			p9.humanoidJumpPowerConn:Disconnect();
			p9.humanoidJumpPowerConn = nil;
			p9.humanoidParentConn:Disconnect();
			p9.humanoidParentConn = nil;
		end;
	end);
	p9.humanoidStateEnabledChangedConn = p9.humanoid.StateEnabledChanged:Connect(function(p11, p12)
		p9:HumanoidStateEnabledChanged(p11, p12);
	end);
	p9.jumpPower = p9.humanoid.JumpPower;
	p9.jumpStateEnabled = p9.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping);
	p9:UpdateEnabled();
end;
function v2.SetupCharacterAddedFunction(p13)
	p13.characterAddedConn = l__Players__1.LocalPlayer.CharacterAdded:Connect(function(p14)
		p13:CharacterAdded(p14);
	end);
	if l__Players__1.LocalPlayer.Character then
		p13:CharacterAdded(l__Players__1.LocalPlayer.Character);
	end;
end;
function v2.Enable(p15, p16, p17)
	if p17 then
		p15.parentUIFrame = p17;
	end;
	p15.externallyEnabled = p16;
	p15:EnableButton(p16);
end;
local l__GuiService__2 = game:GetService("GuiService");
function v2.Create(p18)
	if not p18.parentUIFrame then
		return;
	end;
	if p18.jumpButton then
		p18.jumpButton:Destroy();
		p18.jumpButton = nil;
	end;
	local v6 = math.min(p18.parentUIFrame.AbsoluteSize.x, p18.parentUIFrame.AbsoluteSize.y) <= 500;
	if v6 then
		local v7 = 70;
	else
		v7 = 120;
	end;
	p18.jumpButton = Instance.new("ImageButton");
	p18.jumpButton.Name = "JumpButton";
	p18.jumpButton.Visible = false;
	p18.jumpButton.BackgroundTransparency = 1;
	p18.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png";
	p18.jumpButton.ImageRectOffset = Vector2.new(1, 146);
	p18.jumpButton.ImageRectSize = Vector2.new(144, 144);
	p18.jumpButton.Size = UDim2.new(0, v7, 0, v7);
	p18.jumpButton.Position = v6 and UDim2.new(1, -(v7 * 1.5 - 10), 1, -v7 - 20) or UDim2.new(1, -(v7 * 1.5 - 10), 1, -v7 * 1.75);
	local u3 = nil;
	p18.jumpButton.InputBegan:connect(function(p19)
		if not (not u3) or p19.UserInputType ~= Enum.UserInputType.Touch or p19.UserInputState ~= Enum.UserInputState.Begin then
			return;
		end;
		u3 = p19;
		p18.jumpButton.ImageRectOffset = Vector2.new(146, 146);
		p18.isJumping = true;
	end);
	local function u4()
		u3 = nil;
		p18.isJumping = false;
		p18.jumpButton.ImageRectOffset = Vector2.new(1, 146);
	end;
	p18.jumpButton.InputEnded:connect(function(p20)
		if p20 == u3 then
			u4();
		end;
	end);
	l__GuiService__2.MenuOpened:connect(function()
		if u3 then
			u4();
		end;
	end);
	if not p18.characterAddedConn then
		p18:SetupCharacterAddedFunction();
	end;
	p18.jumpButton.Parent = p18.parentUIFrame;
end;
return v2;
