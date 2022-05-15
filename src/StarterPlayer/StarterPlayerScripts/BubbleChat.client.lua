
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
local function v15(p1)
	return utf8.len(utf8.nfcnormalize(p1));
end;
local v16 = 128 - v15("...") - 1;
local v17 = Instance.new("ScreenGui");
v17.Name = "BubbleChat";
v17.ResetOnSpawn = false;
v17.Parent = l__PlayerGui__6;
local function u1()
	local v18 = {
		data = {}
	};
	local v19 = Instance.new("BindableEvent");
	v18.Emptied = v19.Event;
	function v18.Size(p2)
		return #v18.data;
	end;
	function v18.Empty(p3)
		return v18:Size() <= 0;
	end;
	function v18.PopFront(p4)
		table.remove(v18.data, 1);
		if v18:Empty() then
			v19:Fire();
		end;
	end;
	function v18.Front(p5)
		return v18.data[1];
	end;
	function v18.Get(p6, p7)
		return v18.data[p7];
	end;
	function v18.PushBack(p8, p9)
		table.insert(v18.data, p9);
	end;
	function v18.GetData(p10)
		return v18.data;
	end;
	return v18;
end;
local function u2()
	return {
		Fifo = u1(), 
		BillboardGui = nil
	};
end;
local function u3(p11, p12, p13)
	return p12 + (p13 - p12) * math.min(v15(p11) / 75, 1);
end;
local function u4(p14, p15, p16)
	local v20 = {
		ComputeBubbleLifetime = function(p17, p18, p19)
			if p19 then
				return u3(p18, 8, 15);
			end;
			return u3(p18, 12, 20);
		end, 
		Origin = nil, 
		RenderBubble = nil, 
		Message = p14
	};
	v20.BubbleDieDelay = v20:ComputeBubbleLifetime(p14, p16);
	v20.BubbleColor = p15;
	v20.IsLocalPlayer = p16;
	return v20;
end;
local u5 = {
	WHITE = "dub", 
	BLUE = "blu", 
	GREEN = "gre", 
	RED = "red"
};
function createChatBubbleMain(p20, p21)
	local v21 = Instance.new("ImageLabel");
	v21.Name = "ChatBubble";
	v21.ScaleType = Enum.ScaleType.Slice;
	v21.SliceCenter = p21;
	v21.Image = "rbxasset://textures/" .. tostring(p20) .. ".png";
	v21.BackgroundTransparency = 1;
	v21.BorderSizePixel = 0;
	v21.Size = UDim2.new(1, 0, 1, 0);
	v21.Position = UDim2.new(0, 0, 0, 0);
	return v21;
end;
function createChatBubbleTail(p22, p23)
	local v22 = Instance.new("ImageLabel");
	v22.Name = "ChatBubbleTail";
	v22.Image = "rbxasset://textures/ui/dialog_tail.png";
	v22.BackgroundTransparency = 1;
	v22.BorderSizePixel = 0;
	v22.Position = p22;
	v22.Size = p23;
	return v22;
end;
function createChatBubbleWithTail(p24, p25, p26, p27)
	local v23 = createChatBubbleMain(p24, p27);
	createChatBubbleTail(p25, p26).Parent = v23;
	return v23;
end;
function createScaledChatBubbleWithTail(p28, p29, p30, p31)
	local v24 = createChatBubbleMain(p28, p31);
	local v25 = Instance.new("Frame");
	v25.Name = "ChatBubbleTailFrame";
	v25.BackgroundTransparency = 1;
	v25.SizeConstraint = Enum.SizeConstraint.RelativeXX;
	v25.Position = UDim2.new(0.5, 0, 1, 0);
	v25.Size = UDim2.new(p29, 0, p29, 0);
	v25.Parent = v24;
	createChatBubbleTail(p30, UDim2.new(1, 0, 0.5, 0)).Parent = v25;
	return v24;
end;
function createChatImposter(p32, p33, p34)
	local v26 = Instance.new("ImageLabel");
	v26.Name = "DialogPlaceholder";
	v26.Image = "rbxasset://textures/" .. tostring(p32) .. ".png";
	v26.BackgroundTransparency = 1;
	v26.BorderSizePixel = 0;
	v26.Position = UDim2.new(0, 0, -1.25, 0);
	v26.Size = UDim2.new(1, 0, 1, 0);
	local v27 = Instance.new("ImageLabel");
	v27.Name = "DotDotDot";
	v27.Image = "rbxasset://textures/" .. tostring(p33) .. ".png";
	v27.BackgroundTransparency = 1;
	v27.BorderSizePixel = 0;
	v27.Position = UDim2.new(0.001, 0, p34, 0);
	v27.Size = UDim2.new(1, 0, 0.7, 0);
	v27.Parent = v26;
	return v26;
end;
local u6 = {
	ChatBubble = {}, 
	ChatBubbleWithTail = {}, 
	ScalingChatBubbleWithTail = {}, 
	CharacterSortedMsg = (function()
		local v28 = {
			data = {}
		};
		local u7 = 0;
		function v28.Size(p35)
			return u7;
		end;
		function v28.Erase(p36, p37)
			if v28.data[p37] then
				u7 = u7 - 1;
			end;
			v28.data[p37] = nil;
		end;
		function v28.Set(p38, p39, p40)
			v28.data[p39] = p40;
			if p40 then
				u7 = u7 + 1;
			end;
		end;
		function v28.Get(p41, p42)
			if not p42 then
				return;
			end;
			if not v28.data[p42] then
				v28.data[p42] = u2();
				local u8 = nil;
				u8 = v28.data[p42].Fifo.Emptied:connect(function()
					u8:disconnect();
					v28:Erase(p42);
				end);
			end;
			return v28.data[p42];
		end;
		function v28.GetData(p43)
			return v28.data;
		end;
		return v28;
	end)()
};
local function v29(p44, p45, p46, p47, p48)
	u6.ChatBubble[p44] = createChatBubbleMain(p45, p48);
	if p47 then
		local v30 = -1;
	else
		v30 = 0;
	end;
	u6.ChatBubbleWithTail[p44] = createChatBubbleWithTail(p45, UDim2.new(0.5, -14, 1, v30), UDim2.new(0, 30, 0, 14), p48);
	if p47 then
		local v31 = -1;
	else
		v31 = 0;
	end;
	u6.ScalingChatBubbleWithTail[p44] = createScaledChatBubbleWithTail(p45, 0.5, UDim2.new(-0.5, 0, 0, v31), p48);
end;
v29(u5.WHITE, "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15));
v29(u5.BLUE, "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33));
v29(u5.RED, "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33));
v29(u5.GREEN, "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33));
function u6.SanitizeChatLine(p49, p50)
	if not (v16 < v15(p50)) then
		return p50;
	end;
	return string.sub(p50, 1, utf8.offset(p50, v16 + v15("...") + 1) - 1);
end;
local function u9(p51)
	local v32 = Instance.new("BillboardGui");
	v32.Adornee = p51;
	v32.Size = UDim2.new(0, 400, 0, 250);
	v32.StudsOffset = Vector3.new(0, 1.5, 2);
	v32.Parent = v17;
	local v33 = Instance.new("Frame");
	v33.Name = "BillboardFrame";
	v33.Size = UDim2.new(1, 0, 1, 0);
	v33.Position = UDim2.new(0, 0, -0.5, 0);
	v33.BackgroundTransparency = 1;
	v33.Parent = v32;
	local u10 = nil;
	u10 = v33.ChildRemoved:connect(function()
		if #v33:GetChildren() <= 1 then
			u10:disconnect();
			v32:Destroy();
		end;
	end);
	u6:CreateSmallTalkBubble(u5.WHITE).Parent = v33;
	return v32;
end;
function u6.CreateBillboardGuiHelper(p52, p53, p54)
	if p53 and not u6.CharacterSortedMsg:Get(p53).BillboardGui then
		if not p54 and p53:IsA("BasePart") then
			u6.CharacterSortedMsg:Get(p53).BillboardGui = u9(p53);
			return;
		end;
		if p53:IsA("Model") then
			local l__Head__34 = p53:FindFirstChild("Head");
			if l__Head__34 and l__Head__34:IsA("BasePart") then
				u6.CharacterSortedMsg:Get(p53).BillboardGui = u9(l__Head__34);
			end;
		end;
	end;
end;
local function u11(p55)
	if not p55 or not l__Players__1.LocalPlayer.Character then
		return;
	end;
	return p55:IsDescendantOf(l__Players__1.LocalPlayer.Character);
end;
function u6.SetBillboardLODNear(p56, p57)
	local v35 = u11(p57.Adornee);
	p57.Size = UDim2.new(0, 400, 0, 250);
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
	p57.StudsOffset = Vector3.new(0, v36, v37);
	p57.Enabled = true;
	local v38 = p57.BillboardFrame:GetChildren();
	for v39 = 1, #v38 do
		v38[v39].Visible = true;
	end;
	p57.BillboardFrame.SmallTalkBubble.Visible = false;
end;
function u6.SetBillboardLODDistant(p58, p59)
	p59.Size = UDim2.new(4, 0, 3, 0);
	if u11(p59.Adornee) then
		local v40 = 2;
	else
		v40 = 0.1;
	end;
	p59.StudsOffset = Vector3.new(0, 3, v40);
	p59.Enabled = true;
	local v41 = p59.BillboardFrame:GetChildren();
	for v42 = 1, #v41 do
		v41[v42].Visible = false;
	end;
	p59.BillboardFrame.SmallTalkBubble.Visible = true;
end;
function u6.SetBillboardLODVeryFar(p60, p61)
	p61.Enabled = false;
end;
local function u12(p62)
	if not p62 then
		return 100000;
	end;
	return (p62.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude;
end;
function u6.SetBillboardGuiLOD(p63, p64, p65)
	if not p65 then
		return;
	end;
	if p65:IsA("Model") then
		local l__Head__43 = p65:FindFirstChild("Head");
		if not l__Head__43 then
			p65 = p65.PrimaryPart;
		else
			p65 = l__Head__43;
		end;
	end;
	local v44 = u12(p65);
	if v44 < 65 then
		u6:SetBillboardLODNear(p64);
		return;
	end;
	if v44 >= 65 and v44 < 100 then
		u6:SetBillboardLODDistant(p64);
		return;
	end;
	u6:SetBillboardLODVeryFar(p64);
end;
function u6.CameraCFrameChanged(p66)
	for v45, v46 in pairs(u6.CharacterSortedMsg:GetData()) do
		local l__BillboardGui__47 = v46.BillboardGui;
		if l__BillboardGui__47 then
			u6:SetBillboardGuiLOD(l__BillboardGui__47, v45);
		end;
	end;
end;
local u13 = v9 or v10;
local l__Enum_Font_SourceSans__14 = Enum.Font.SourceSans;
local l__Enum_FontSize_Size24__15 = Enum.FontSize.Size24;
function u6.CreateBubbleText(p67, p68, p69)
	local v48 = Instance.new("TextLabel");
	v48.Name = "BubbleText";
	v48.BackgroundTransparency = 1;
	if u13 then
		v48.Size = UDim2.fromScale(1, 1);
	else
		v48.Position = UDim2.new(0, 15, 0, 0);
		v48.Size = UDim2.new(1, -30, 1, 0);
	end;
	v48.Font = l__Enum_Font_SourceSans__14;
	v48.ClipsDescendants = true;
	v48.TextWrapped = true;
	v48.FontSize = l__Enum_FontSize_Size24__15;
	v48.Text = p68;
	v48.Visible = false;
	v48.AutoLocalize = p69;
	if u13 then
		local v49 = Instance.new("UIPadding");
		v49.PaddingTop = UDim.new(0, 12);
		v49.PaddingRight = UDim.new(0, 12);
		v49.PaddingBottom = UDim.new(0, 12);
		v49.PaddingLeft = UDim.new(0, 12);
		v49.Parent = v48;
	end;
	return v48;
end;
function u6.CreateSmallTalkBubble(p70, p71)
	local v50 = u6.ScalingChatBubbleWithTail[p71]:Clone();
	v50.Name = "SmallTalkBubble";
	v50.AnchorPoint = Vector2.new(0, 0.5);
	v50.Position = UDim2.new(0, 0, 0.5, 0);
	v50.Visible = false;
	local v51 = u6:CreateBubbleText("...");
	v51.TextScaled = true;
	v51.TextWrapped = false;
	v51.Visible = true;
	v51.Parent = v50;
	return v50;
end;
function u6.UpdateChatLinesForOrigin(p72, p73, p74)
	local l__Fifo__52 = u6.CharacterSortedMsg:Get(p73).Fifo;
	local v53 = l__Fifo__52:Size();
	local v54 = l__Fifo__52:GetData();
	if #v54 <= 1 then
		return;
	end;
	for v55 = #v54 - 1, 1, -1 do
		local l__RenderBubble__56 = v54[v55].RenderBubble;
		if not l__RenderBubble__56 then
			return;
		end;
		if v53 - v55 + 1 > 1 then
			local l__ChatBubbleTail__57 = l__RenderBubble__56:FindFirstChild("ChatBubbleTail");
			if l__ChatBubbleTail__57 then
				l__ChatBubbleTail__57:Destroy();
			end;
			local l__BubbleText__58 = l__RenderBubble__56:FindFirstChild("BubbleText");
			if l__BubbleText__58 then
				l__BubbleText__58.TextTransparency = 0.5;
			end;
		end;
		l__RenderBubble__56:TweenPosition(UDim2.new(l__RenderBubble__56.Position.X.Scale, l__RenderBubble__56.Position.X.Offset, 1, p74 - l__RenderBubble__56.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true);
		p74 = p74 - l__RenderBubble__56.Size.Y.Offset - 14;
	end;
end;
function u6.DestroyBubble(p75, p76, p77)
	if not p76 then
		return;
	end;
	if p76:Empty() then
		return;
	end;
	local l__RenderBubble__59 = p76:Front().RenderBubble;
	if l__RenderBubble__59 then
		local u16 = l__RenderBubble__59;
		spawn(function()
			while p76:Front().RenderBubble ~= p77 do
				wait();			
			end;
			u16 = p76:Front().RenderBubble;
			local l__BubbleText__60 = u16:FindFirstChild("BubbleText");
			local l__ChatBubbleTail__61 = u16:FindFirstChild("ChatBubbleTail");
			while u16 and u16.ImageTransparency < 1 do
				local v62 = wait();
				if u16 then
					local v63 = v62 * 1.5;
					u16.ImageTransparency = u16.ImageTransparency + v63;
					if l__BubbleText__60 then
						l__BubbleText__60.TextTransparency = l__BubbleText__60.TextTransparency + v63;
					end;
					if l__ChatBubbleTail__61 then
						l__ChatBubbleTail__61.ImageTransparency = l__ChatBubbleTail__61.ImageTransparency + v63;
					end;
				end;			
			end;
			if u16 then
				u16:Destroy();
				p76:PopFront();
			end;
		end);
		return;
	end;
	p76:PopFront();
end;
function u6.CreateChatLineRender(p78, p79, p80, p81, p82, p83)
	if not p79 then
		return;
	end;
	if not u6.CharacterSortedMsg:Get(p79).BillboardGui then
		u6:CreateBillboardGuiHelper(p79, p81);
	end;
	local l__BillboardGui__64 = u6.CharacterSortedMsg:Get(p79).BillboardGui;
	if l__BillboardGui__64 then
		local v65 = nil;
		local v66 = u6.ChatBubbleWithTail[p80.BubbleColor]:Clone();
		v66.Visible = false;
		local v67 = u6:CreateBubbleText(p80.Message, p83);
		v67.Parent = v66;
		v66.Parent = l__BillboardGui__64.BillboardFrame;
		p80.RenderBubble = v66;
		local v68 = l__TextService__4:GetTextSize(v67.Text, 24, l__Enum_Font_SourceSans__14, Vector2.new(400, 250));
		v65 = v68.Y / 24;
		if u13 then
			local v69 = math.ceil(v68.X + 24);
			local v70 = v65 * 34;
			v66.Size = UDim2.fromOffset(0, 0);
			v66.Position = UDim2.fromScale(0.5, 1);
			v66:TweenSizeAndPosition(UDim2.fromOffset(v69, v70), UDim2.new(0.5, -v69 / 2, 1, -v70), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				v67.Visible = true;
			end);
			u6:SetBillboardGuiLOD(l__BillboardGui__64, p80.Origin);
			u6:UpdateChatLinesForOrigin(p80.Origin, -v70);
		else
			local v71 = math.max((v68.X + 30) / 400, 0.1);
			v66.Size = UDim2.new(0, 0, 0, 0);
			v66.Position = UDim2.new(0.5, 0, 1, 0);
			local v72 = v65 * 34;
			v66:TweenSizeAndPosition(UDim2.new(v71, 0, 0, v72), UDim2.new((1 - v71) / 2, 0, 1, -v72), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
				v67.Visible = true;
			end);
			u6:SetBillboardGuiLOD(l__BillboardGui__64, p80.Origin);
			u6:UpdateChatLinesForOrigin(p80.Origin, -v72);
		end;
		delay(p80.BubbleDieDelay, function()
			u6:DestroyBubble(p82, v66);
		end);
	end;
end;
local function u17(p84, p85, p86)
	local v73 = u4(p85, u5.WHITE, p86);
	if p84 then
		v73.User = p84.Name;
		v73.Origin = p84.Character;
	end;
	return v73;
end;
function u6.OnPlayerChatMessage(p87, p88, p89, p90)
	if not u6:BubbleChatEnabled() then
		return;
	end;
	local l__LocalPlayer__74 = l__Players__1.LocalPlayer;
	local v75 = false;
	if l__LocalPlayer__74 ~= nil then
		v75 = p88 ~= l__LocalPlayer__74;
	end;
	local v76 = u17(p88, u6:SanitizeChatLine(p89), not v75);
	if p88 and v76.Origin then
		local l__Fifo__77 = u6.CharacterSortedMsg:Get(v76.Origin).Fifo;
		l__Fifo__77:PushBack(v76);
		u6:CreateChatLineRender(p88.Character, v76, true, l__Fifo__77, false);
	end;
end;
local u18 = v11 or v12;
local u19 = v13 or v14;
local function u20(p91, p92, p93, p94)
	local v78 = u4(p92, p94, p93);
	v78.Origin = p91;
	return v78;
end;
local u21 = v7 or v8;
function u6.OnGameChatMessage(p95, p96, p97, p98)
	if u18 or u19 and l__Chat__3.BubbleChatEnabled then
		return;
	end;
	local l__LocalPlayer__79 = l__Players__1.LocalPlayer;
	local v80 = false;
	if l__LocalPlayer__79 ~= nil then
		v80 = l__LocalPlayer__79.Character ~= p96;
	end;
	local v81 = u5.WHITE;
	if p98 == Enum.ChatColor.Blue then
		v81 = u5.BLUE;
	elseif p98 == Enum.ChatColor.Green then
		v81 = u5.GREEN;
	elseif p98 == Enum.ChatColor.Red then
		v81 = u5.RED;
	end;
	local v82 = u20(p96, u6:SanitizeChatLine(p97), not v80, v81);
	u6.CharacterSortedMsg:Get(v82.Origin).Fifo:PushBack(v82);
	if u21 then
		u6:CreateChatLineRender(p96, v82, false, u6.CharacterSortedMsg:Get(v82.Origin).Fifo, true);
		return;
	end;
	u6:CreateChatLineRender(p96, v82, false, u6.CharacterSortedMsg:Get(v82.Origin).Fifo, false);
end;
function u6.BubbleChatEnabled(p99)
	if u18 or u19 and l__Chat__3.BubbleChatEnabled then
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
function u6.ShowOwnFilteredMessage(p100)
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
function findPlayer(p101)
	local v88, v89, v90 = pairs(l__Players__1:GetPlayers());
	while true do
		local v91, v92 = v88(v89, v90);
		if v91 then

		else
			break;
		end;
		v90 = v91;
		if v92.Name == p101 then
			return v92;
		end;	
	end;
end;
l__Chat__3.Chatted:connect(function(p102, p103, p104)
	u6:OnGameChatMessage(p102, p103, p104);
end);
local v93 = nil;
if game.Workspace.CurrentCamera then
	v93 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(p105)
		u6:CameraCFrameChanged();
	end);
end;
local u22 = v93;
game.Workspace.Changed:Connect(function(p106)
	if p106 == "CurrentCamera" then
		if u22 then
			u22:disconnect();
		end;
		if game.Workspace.CurrentCamera then
			u22 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(p107)
				u6:CameraCFrameChanged();
			end);
		end;
	end;
end);
local u23 = nil;
function getAllowedMessageTypes()
	if u23 then
		return u23;
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
			u23 = v96.BubbleChatMessageTypes;
			return u23;
		end;
	end;
	local l__ChatConstants__97 = l__ClientChatModules__94:FindFirstChild("ChatConstants");
	if l__ChatConstants__97 then
		local v98 = require(l__ChatConstants__97);
		u23 = { v98.MessageTypeDefault, v98.MessageTypeWhisper };
	end;
	return u23;
end;
function checkAllowedMessageType(p108)
	local v99 = getAllowedMessageTypes();
	local v100 = #v99;
	local v101 = 1 - 1;
	while true do
		if v99[v101] == p108.MessageType then
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
v102:WaitForChild("OnNewMessage").OnClientEvent:connect(function(p109, p110)
	if not checkAllowedMessageType(p109) then
		return;
	end;
	local v104 = findPlayer(p109.FromSpeaker);
	if not v104 then
		return;
	end;
	if (not p109.IsFiltered or p109.FromSpeaker == v5.Name) and (p109.FromSpeaker ~= v5.Name or u6:ShowOwnFilteredMessage()) then
		return;
	end;
	u6:OnPlayerChatMessage(v104, p109.Message, nil);
end);
l__OnMessageDoneFiltering__103.OnClientEvent:connect(function(p111, p112)
	if not checkAllowedMessageType(p111) then
		return;
	end;
	local v105 = findPlayer(p111.FromSpeaker);
	if not v105 then
		return;
	end;
	if p111.FromSpeaker == v5.Name and not u6:ShowOwnFilteredMessage() then
		return;
	end;
	u6:OnPlayerChatMessage(v105, p111.Message, nil);
end);

