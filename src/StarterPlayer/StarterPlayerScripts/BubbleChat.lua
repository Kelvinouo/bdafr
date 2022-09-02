-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__Chat__3 = game:GetService("Chat");
local l__TextService__4 = game:GetService("TextService");
local v5 = l__Players__1.LocalPlayer;
while v5 == nil do
	l__Players__1.ChildAdded:wait();
	v5 = l__Players__1.LocalPlayer;
end;
local l__PlayerGui__6 = v5:WaitForChild("PlayerGui");
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble");
end);
local v9, v10 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText");
end);
local v11, v12 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta");
end);
local v13, v14 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap");
end);
local v15 = 128 - utf8.len(utf8.nfcnormalize("...")) - 1;
local v16 = Instance.new("ScreenGui");
v16.Name = "BubbleChat";
v16.ResetOnSpawn = false;
v16.Parent = l__PlayerGui__6;
local function u1()
	local v17 = {
		data = {}
	};
	local v18 = Instance.new("BindableEvent");
	v17.Emptied = v18.Event;
	function v17.Size(p1)
		return #v17.data;
	end;
	function v17.Empty(p2)
		return v17:Size() <= 0;
	end;
	function v17.PopFront(p3)
		table.remove(v17.data, 1);
		if v17:Empty() then
			v18:Fire();
		end;
	end;
	function v17.Front(p4)
		return v17.data[1];
	end;
	function v17.Get(p5, p6)
		return v17.data[p6];
	end;
	function v17.PushBack(p7, p8)
		table.insert(v17.data, p8);
	end;
	function v17.GetData(p9)
		return v17.data;
	end;
	return v17;
end;
local function u2(p10, p11, p12)
	local v19 = {
		ComputeBubbleLifetime = function(p13, p14, p15)
			if p15 then
				return 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(p14)) / 75, 1);
			end;
			return 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(p14)) / 75, 1);
		end, 
		Origin = nil, 
		RenderBubble = nil, 
		Message = p10
	};
	v19.BubbleDieDelay = v19:ComputeBubbleLifetime(p10, p12);
	v19.BubbleColor = p11;
	v19.IsLocalPlayer = p12;
	return v19;
end;
local u3 = {
	WHITE = "dub", 
	BLUE = "blu", 
	GREEN = "gre", 
	RED = "red"
};
function createChatBubbleMain(p16, p17)
	local v20 = Instance.new("ImageLabel");
	v20.Name = "ChatBubble";
	v20.ScaleType = Enum.ScaleType.Slice;
	v20.SliceCenter = p17;
	v20.Image = "rbxasset://textures/" .. tostring(p16) .. ".png";
	v20.BackgroundTransparency = 1;
	v20.BorderSizePixel = 0;
	v20.Size = UDim2.new(1, 0, 1, 0);
	v20.Position = UDim2.new(0, 0, 0, 0);
	return v20;
end;
function createChatBubbleTail(p18, p19)
	local v21 = Instance.new("ImageLabel");
	v21.Name = "ChatBubbleTail";
	v21.Image = "rbxasset://textures/ui/dialog_tail.png";
	v21.BackgroundTransparency = 1;
	v21.BorderSizePixel = 0;
	v21.Position = p18;
	v21.Size = p19;
	return v21;
end;
function createChatBubbleWithTail(p20, p21, p22, p23)
	local v22 = createChatBubbleMain(p20, p23);
	createChatBubbleTail(p21, p22).Parent = v22;
	return v22;
end;
function createScaledChatBubbleWithTail(p24, p25, p26, p27)
	local v23 = createChatBubbleMain(p24, p27);
	local v24 = Instance.new("Frame");
	v24.Name = "ChatBubbleTailFrame";
	v24.BackgroundTransparency = 1;
	v24.SizeConstraint = Enum.SizeConstraint.RelativeXX;
	v24.Position = UDim2.new(0.5, 0, 1, 0);
	v24.Size = UDim2.new(p25, 0, p25, 0);
	v24.Parent = v23;
	createChatBubbleTail(p26, UDim2.new(1, 0, 0.5, 0)).Parent = v24;
	return v23;
end;
function createChatImposter(p28, p29, p30)
	local v25 = Instance.new("ImageLabel");
	v25.Name = "DialogPlaceholder";
	v25.Image = "rbxasset://textures/" .. tostring(p28) .. ".png";
	v25.BackgroundTransparency = 1;
	v25.BorderSizePixel = 0;
	v25.Position = UDim2.new(0, 0, -1.25, 0);
	v25.Size = UDim2.new(1, 0, 1, 0);
	local v26 = Instance.new("ImageLabel");
	v26.Name = "DotDotDot";
	v26.Image = "rbxasset://textures/" .. tostring(p29) .. ".png";
	v26.BackgroundTransparency = 1;
	v26.BorderSizePixel = 0;
	v26.Position = UDim2.new(0.001, 0, p30, 0);
	v26.Size = UDim2.new(1, 0, 0.7, 0);
	v26.Parent = v25;
	return v25;
end;
local u4 = {
	ChatBubble = {}, 
	ChatBubbleWithTail = {}, 
	ScalingChatBubbleWithTail = {}, 
	CharacterSortedMsg = (function()
		local v27 = {
			data = {}
		};
		local u5 = 0;
		function v27.Size(p31)
			return u5;
		end;
		function v27.Erase(p32, p33)
			if v27.data[p33] then
				u5 = u5 - 1;
			end;
			v27.data[p33] = nil;
		end;
		function v27.Set(p34, p35, p36)
			v27.data[p35] = p36;
			if p36 then
				u5 = u5 + 1;
			end;
		end;
		function v27.Get(p37, p38)
			if not p38 then
				return;
			end;
			if not v27.data[p38] then
				v27.data[p38] = {
					Fifo = u1(), 
					BillboardGui = nil
				};
				local u6 = nil;
				u6 = v27.data[p38].Fifo.Emptied:connect(function()
					u6:disconnect();
					v27:Erase(p38);
				end);
			end;
			return v27.data[p38];
		end;
		function v27.GetData(p39)
			return v27.data;
		end;
		return v27;
	end)()
};
local function v28(p40, p41, p42, p43, p44)
	u4.ChatBubble[p40] = createChatBubbleMain(p41, p44);
	if p43 then
		local v29 = -1;
	else
		v29 = 0;
	end;
	u4.ChatBubbleWithTail[p40] = createChatBubbleWithTail(p41, UDim2.new(0.5, -14, 1, v29), UDim2.new(0, 30, 0, 14), p44);
	if p43 then
		local v30 = -1;
	else
		v30 = 0;
	end;
	u4.ScalingChatBubbleWithTail[p40] = createScaledChatBubbleWithTail(p41, 0.5, UDim2.new(-0.5, 0, 0, v30), p44);
end;
v28(u3.WHITE, "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15));
v28(u3.BLUE, "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33));
v28(u3.RED, "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33));
v28(u3.GREEN, "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33));
function u4.SanitizeChatLine(p45, p46)
	if not (v15 < utf8.len(utf8.nfcnormalize(p46))) then
		return p46;
	end;
	return string.sub(p46, 1, utf8.offset(p46, v15 + utf8.len(utf8.nfcnormalize("...")) + 1) - 1);
end;
local function u7(p47)
	local v31 = Instance.new("BillboardGui");
	v31.Adornee = p47;
	v31.Size = UDim2.new(0, 400, 0, 250);
	v31.StudsOffset = Vector3.new(0, 1.5, 2);
	v31.Parent = v16;
	local v32 = Instance.new("Frame");
	v32.Name = "BillboardFrame";
	v32.Size = UDim2.new(1, 0, 1, 0);
	v32.Position = UDim2.new(0, 0, -0.5, 0);
	v32.BackgroundTransparency = 1;
	v32.Parent = v31;
	local u8 = nil;
	u8 = v32.ChildRemoved:connect(function()
		if #v32:GetChildren() <= 1 then
			u8:disconnect();
			v31:Destroy();
		end;
	end);
	u4:CreateSmallTalkBubble(u3.WHITE).Parent = v32;
	return v31;
end;
function u4.CreateBillboardGuiHelper(p48, p49, p50)
	if p49 and not u4.CharacterSortedMsg:Get(p49).BillboardGui then
		if not p50 and p49:IsA("BasePart") then
			u4.CharacterSortedMsg:Get(p49).BillboardGui = u7(p49);
			return;
		end;
		if p49:IsA("Model") then
			local l__Head__33 = p49:FindFirstChild("Head");
			if l__Head__33 and l__Head__33:IsA("BasePart") then
				u4.CharacterSortedMsg:Get(p49).BillboardGui = u7(l__Head__33);
			end;
		end;
	end;
end;
function u4.SetBillboardLODNear(p51, p52)
	local l__Adornee__34 = p52.Adornee;
	if l__Adornee__34 and l__Players__1.LocalPlayer.Character then
		local v35 = l__Adornee__34:IsDescendantOf(l__Players__1.LocalPlayer.Character);
	else
		v35 = nil;
	end;
	p52.Size = UDim2.new(0, 400, 0, 250);
	if v35 then
		local v36 = 1.5;
	else
		v36 = 2.5;
	end;
	if v35 then
		local v37 = 2;
	else
		v37 = 0.1;
	end;
	p52.StudsOffset = Vector3.new(0, v36, v37);
	p52.Enabled = true;
	local v38 = p52.BillboardFrame:GetChildren();
	for v39 = 1, #v38 do
		v38[v39].Visible = true;
	end;
	p52.BillboardFrame.SmallTalkBubble.Visible = false;
end;
function u4.SetBillboardLODDistant(p53, p54)
	local l__Adornee__40 = p54.Adornee;
	if l__Adornee__40 and l__Players__1.LocalPlayer.Character then
		local v41 = l__Adornee__40:IsDescendantOf(l__Players__1.LocalPlayer.Character);
	else
		v41 = nil;
	end;
	p54.Size = UDim2.new(4, 0, 3, 0);
	if v41 then
		local v42 = 2;
	else
		v42 = 0.1;
	end;
	p54.StudsOffset = Vector3.new(0, 3, v42);
	p54.Enabled = true;
	local v43 = p54.BillboardFrame:GetChildren();
	for v44 = 1, #v43 do
		v43[v44].Visible = false;
	end;
	p54.BillboardFrame.SmallTalkBubble.Visible = true;
end;
function u4.SetBillboardLODVeryFar(p55, p56)
	p56.Enabled = false;
end;
function u4.SetBillboardGuiLOD(p57, p58, p59)
	if not p59 then
		return;
	end;
	if p59:IsA("Model") then
		local l__Head__45 = p59:FindFirstChild("Head");
		if not l__Head__45 then
			p59 = p59.PrimaryPart;
		else
			p59 = l__Head__45;
		end;
	end;
	if not p59 then
		local v46 = 100000;
	else
		v46 = (p59.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude;
	end;
	if v46 < 65 then
		u4:SetBillboardLODNear(p58);
		return;
	end;
	if v46 >= 65 and v46 < 100 then
		u4:SetBillboardLODDistant(p58);
		return;
	end;
	u4:SetBillboardLODVeryFar(p58);
end;
function u4.CameraCFrameChanged(p60)
	for v47, v48 in pairs(u4.CharacterSortedMsg:GetData()) do
		local l__BillboardGui__49 = v48.BillboardGui;
		if l__BillboardGui__49 then
			u4:SetBillboardGuiLOD(l__BillboardGui__49, v47);
		end;
	end;
end;
local u9 = v9 or v10;
local l__Enum_Font_SourceSans__10 = Enum.Font.SourceSans;
local l__Enum_FontSize_Size24__11 = Enum.FontSize.Size24;
function u4.CreateBubbleText(p61, p62, p63)
	local v50 = Instance.new("TextLabel");
	v50.Name = "BubbleText";
	v50.BackgroundTransparency = 1;
	if u9 then
		v50.Size = UDim2.fromScale(1, 1);
	else
		v50.Position = UDim2.new(0, 15, 0, 0);
		v50.Size = UDim2.new(1, -30, 1, 0);
	end;
	v50.Font = l__Enum_Font_SourceSans__10;
	v50.ClipsDescendants = true;
	v50.TextWrapped = true;
	v50.FontSize = l__Enum_FontSize_Size24__11;
	v50.Text = p62;
	v50.Visible = false;
	v50.AutoLocalize = p63;
	if u9 then
		local v51 = Instance.new("UIPadding");
		v51.PaddingTop = UDim.new(0, 12);
		v51.PaddingRight = UDim.new(0, 12);
		v51.PaddingBottom = UDim.new(0, 12);
		v51.PaddingLeft = UDim.new(0, 12);
		v51.Parent = v50;
	end;
	return v50;
end;
function u4.CreateSmallTalkBubble(p64, p65)
	local v52 = u4.ScalingChatBubbleWithTail[p65]:Clone();
	v52.Name = "SmallTalkBubble";
	v52.AnchorPoint = Vector2.new(0, 0.5);
	v52.Position = UDim2.new(0, 0, 0.5, 0);
	v52.Visible = false;
	local v53 = u4:CreateBubbleText("...");
	v53.TextScaled = true;
	v53.TextWrapped = false;
	v53.Visible = true;
	v53.Parent = v52;
	return v52;
end;
function u4.UpdateChatLinesForOrigin(p66, p67, p68)
	local l__Fifo__54 = u4.CharacterSortedMsg:Get(p67).Fifo;
	local v55 = l__Fifo__54:Size();
	local v56 = l__Fifo__54:GetData();
	if #v56 <= 1 then
		return;
	end;
	for v57 = #v56 - 1, 1, -1 do
		local l__RenderBubble__58 = v56[v57].RenderBubble;
		if not l__RenderBubble__58 then
			return;
		end;
		if v55 - v57 + 1 > 1 then
			local l__ChatBubbleTail__59 = l__RenderBubble__58:FindFirstChild("ChatBubbleTail");
			if l__ChatBubbleTail__59 then
				l__ChatBubbleTail__59:Destroy();
			end;
			local l__BubbleText__60 = l__RenderBubble__58:FindFirstChild("BubbleText");
			if l__BubbleText__60 then
				l__BubbleText__60.TextTransparency = 0.5;
			end;
		end;
		l__RenderBubble__58:TweenPosition(UDim2.new(l__RenderBubble__58.Position.X.Scale, l__RenderBubble__58.Position.X.Offset, 1, p68 - l__RenderBubble__58.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true);
		p68 = p68 - l__RenderBubble__58.Size.Y.Offset - 14;
	end;
end;
function u4.DestroyBubble(p69, p70, p71)
	if not p70 then
		return;
	end;
	if p70:Empty() then
		return;
	end;
	local l__RenderBubble__61 = p70:Front().RenderBubble;
	if l__RenderBubble__61 then
		local u12 = l__RenderBubble__61;
		spawn(function()
			while p70:Front().RenderBubble ~= p71 do
				wait();			
			end;
			u12 = p70:Front().RenderBubble;
			local l__BubbleText__62 = u12:FindFirstChild("BubbleText");
			local l__ChatBubbleTail__63 = u12:FindFirstChild("ChatBubbleTail");
			while u12 and u12.ImageTransparency < 1 do
				local v64 = wait();
				if u12 then
					local v65 = v64 * 1.5;
					u12.ImageTransparency = u12.ImageTransparency + v65;
					if l__BubbleText__62 then
						l__BubbleText__62.TextTransparency = l__BubbleText__62.TextTransparency + v65;
					end;
					if l__ChatBubbleTail__63 then
						l__ChatBubbleTail__63.ImageTransparency = l__ChatBubbleTail__63.ImageTransparency + v65;
					end;
				end;			
			end;
			if u12 then
				u12:Destroy();
				p70:PopFront();
			end;
		end);
		return;
	end;
	p70:PopFront();
end;
function u4.CreateChatLineRender(p72, p73, p74, p75, p76, p77)
	if not p73 then
		return;
	end;
	if not u4.CharacterSortedMsg:Get(p73).BillboardGui then
		u4:CreateBillboardGuiHelper(p73, p75);
	end;
	local l__BillboardGui__66 = u4.CharacterSortedMsg:Get(p73).BillboardGui;
	if l__BillboardGui__66 then
		local v67 = nil;
		local v68 = u4.ChatBubbleWithTail[p74.BubbleColor]:Clone();
		v68.Visible = false;
		local v69 = u4:CreateBubbleText(p74.Message, p77);
		v69.Parent = v68;
		v68.Parent = l__BillboardGui__66.BillboardFrame;
		p74.RenderBubble = v68;
		local v70 = l__TextService__4:GetTextSize(v69.Text, 24, l__Enum_Font_SourceSans__10, Vector2.new(400, 250));
		v67 = v70.Y / 24;
		if u9 then
			local v71 = math.ceil(v70.X + 24);
			local v72 = v67 * 34;
			v68.Size = UDim2.fromOffset(0, 0);
			v68.Position = UDim2.fromScale(0.5, 1);
			v68:TweenSizeAndPosition(UDim2.fromOffset(v71, v72), UDim2.new(0.5, -v71 / 2, 1, -v72), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				v69.Visible = true;
			end);
			u4:SetBillboardGuiLOD(l__BillboardGui__66, p74.Origin);
			u4:UpdateChatLinesForOrigin(p74.Origin, -v72);
		else
			local v73 = math.max((v70.X + 30) / 400, 0.1);
			v68.Size = UDim2.new(0, 0, 0, 0);
			v68.Position = UDim2.new(0.5, 0, 1, 0);
			local v74 = v67 * 34;
			v68:TweenSizeAndPosition(UDim2.new(v73, 0, 0, v74), UDim2.new((1 - v73) / 2, 0, 1, -v74), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				v69.Visible = true;
			end);
			u4:SetBillboardGuiLOD(l__BillboardGui__66, p74.Origin);
			u4:UpdateChatLinesForOrigin(p74.Origin, -v74);
		end;
		delay(p74.BubbleDieDelay, function()
			u4:DestroyBubble(p76, v68);
		end);
	end;
end;
function u4.OnPlayerChatMessage(p78, p79, p80, p81)
	if not u4:BubbleChatEnabled() then
		return;
	end;
	local l__LocalPlayer__75 = l__Players__1.LocalPlayer;
	local v76 = false;
	if l__LocalPlayer__75 ~= nil then
		v76 = p79 ~= l__LocalPlayer__75;
	end;
	local v77 = u2(u4:SanitizeChatLine(p80), u3.WHITE, not v76);
	if p79 then
		v77.User = p79.Name;
		v77.Origin = p79.Character;
	end;
	if p79 and v77.Origin then
		local l__Fifo__78 = u4.CharacterSortedMsg:Get(v77.Origin).Fifo;
		l__Fifo__78:PushBack(v77);
		u4:CreateChatLineRender(p79.Character, v77, true, l__Fifo__78, false);
	end;
end;
local u13 = v11 or v12;
local u14 = v13 or v14;
local u15 = v7 or v8;
function u4.OnGameChatMessage(p82, p83, p84, p85)
	if u13 or u14 and l__Chat__3.BubbleChatEnabled then
		return;
	end;
	local l__LocalPlayer__79 = l__Players__1.LocalPlayer;
	local v80 = false;
	if l__LocalPlayer__79 ~= nil then
		v80 = l__LocalPlayer__79.Character ~= p83;
	end;
	local v81 = u3.WHITE;
	if p85 == Enum.ChatColor.Blue then
		v81 = u3.BLUE;
	elseif p85 == Enum.ChatColor.Green then
		v81 = u3.GREEN;
	elseif p85 == Enum.ChatColor.Red then
		v81 = u3.RED;
	end;
	local v82 = u2(u4:SanitizeChatLine(p84), v81, not v80);
	v82.Origin = p83;
	u4.CharacterSortedMsg:Get(v82.Origin).Fifo:PushBack(v82);
	if u15 then
		u4:CreateChatLineRender(p83, v82, false, u4.CharacterSortedMsg:Get(v82.Origin).Fifo, true);
		return;
	end;
	u4:CreateChatLineRender(p83, v82, false, u4.CharacterSortedMsg:Get(v82.Origin).Fifo, false);
end;
function u4.BubbleChatEnabled(p86)
	if u13 or u14 and l__Chat__3.BubbleChatEnabled then
		return false;
	end;
	local l__ClientChatModules__83 = l__Chat__3:FindFirstChild("ClientChatModules");
	if l__ClientChatModules__83 then
		local l__ChatSettings__84 = l__ClientChatModules__83:FindFirstChild("ChatSettings");
		if l__ChatSettings__84 then
			local v85 = require(l__ChatSettings__84);
			if v85.BubbleChatEnabled ~= nil then
				return v85.BubbleChatEnabled;
			end;
		end;
	end;
	return l__Players__1.BubbleChat;
end;
function u4.ShowOwnFilteredMessage(p87)
	local v86 = nil;
	local l__ClientChatModules__87 = l__Chat__3:FindFirstChild("ClientChatModules");
	if l__ClientChatModules__87 then
		v86 = l__ClientChatModules__87:FindFirstChild("ChatSettings");
		if not v86 then
			return false;
		end;
	else
		return false;
	end;
	return require(v86).ShowUserOwnFilteredMessage;
end;
function findPlayer(p88)
	local v88, v89, v90 = pairs(l__Players__1:GetPlayers());
	while true do
		local v91, v92 = v88(v89, v90);
		if v91 then

		else
			break;
		end;
		v90 = v91;
		if v92.Name == p88 then
			return v92;
		end;	
	end;
end;
l__Chat__3.Chatted:connect(function(p89, p90, p91)
	u4:OnGameChatMessage(p89, p90, p91);
end);
local v93 = nil;
if game.Workspace.CurrentCamera then
	v93 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(p92)
		u4:CameraCFrameChanged();
	end);
end;
local u16 = v93;
game.Workspace.Changed:Connect(function(p93)
	if p93 == "CurrentCamera" then
		if u16 then
			u16:disconnect();
		end;
		if game.Workspace.CurrentCamera then
			u16 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(p94)
				u4:CameraCFrameChanged();
			end);
		end;
	end;
end);
local u17 = nil;
function getAllowedMessageTypes()
	if u17 then
		return u17;
	end;
	local l__ClientChatModules__94 = l__Chat__3:FindFirstChild("ClientChatModules");
	if l__ClientChatModules__94 then

	else
		return { "Message", "Whisper" };
	end;
	local l__ChatSettings__95 = l__ClientChatModules__94:FindFirstChild("ChatSettings");
	if l__ChatSettings__95 then
		local v96 = require(l__ChatSettings__95);
		if v96.BubbleChatMessageTypes then
			u17 = v96.BubbleChatMessageTypes;
			return u17;
		end;
	end;
	local l__ChatConstants__97 = l__ClientChatModules__94:FindFirstChild("ChatConstants");
	if l__ChatConstants__97 then
		local v98 = require(l__ChatConstants__97);
		u17 = { v98.MessageTypeDefault, v98.MessageTypeWhisper };
	end;
	return u17;
end;
function checkAllowedMessageType(p95)
	local v99 = getAllowedMessageTypes();
	local v100 = #v99;
	local v101 = 1 - 1;
	while true do
		if v99[v101] == p95.MessageType then
			return true;
		end;
		if 0 <= 1 then
			if v101 < v100 then

			else
				break;
			end;
		elseif v100 < v101 then

		else
			break;
		end;
		v101 = v101 + 1;	
	end;
	return false;
end;
local v102 = l__ReplicatedStorage__2:WaitForChild("DefaultChatSystemChatEvents");
local l__OnMessageDoneFiltering__103 = v102:WaitForChild("OnMessageDoneFiltering");
v102:WaitForChild("OnNewMessage").OnClientEvent:connect(function(p96, p97)
	if not checkAllowedMessageType(p96) then
		return;
	end;
	local v104 = findPlayer(p96.FromSpeaker);
	if not v104 then
		return;
	end;
	if (not p96.IsFiltered or p96.FromSpeaker == v5.Name) and (p96.FromSpeaker ~= v5.Name or u4:ShowOwnFilteredMessage()) then
		return;
	end;
	u4:OnPlayerChatMessage(v104, p96.Message, nil);
end);
l__OnMessageDoneFiltering__103.OnClientEvent:connect(function(p98, p99)
	if not checkAllowedMessageType(p98) then
		return;
	end;
	local v105 = findPlayer(p98.FromSpeaker);
	if not v105 then
		return;
	end;
	if p98.FromSpeaker == v5.Name and not u4:ShowOwnFilteredMessage() then
		return;
	end;
	u4:OnPlayerChatMessage(v105, p98.Message, nil);
end);
