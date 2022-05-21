-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("HotbarHealthbar");
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
function v5.init(p1, p2)
	p1.progressFrame = v3.createRef();
	p1.maid = l__Maid__1.new();
	p1.characterMaid = l__Maid__1.new();
	p1:setState({
		health = 100, 
		shield = 0
	});
end;
local l__Players__2 = v4.Players;
function v5.didMount(p3)
	if l__Players__2.LocalPlayer then
		p3.characterMaid:GiveTask(l__Players__2.LocalPlayer.CharacterAdded:Connect(function(p4)
			p3:hookCharacter(p4);
		end));
		if l__Players__2.LocalPlayer.Character then
			p3:hookCharacter(l__Players__2.LocalPlayer.Character);
		end;
	end;
end;
local l__TweenService__3 = v4.TweenService;
local l__EntityUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__ShieldType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType;
function v5.hookCharacter(p5, p6)
	p5.maid:DoCleaning();
	local u7 = p6:GetAttribute("Health");
	local u8 = p6:GetAttribute("MaxHealth");
	local function v6(p7, p8)
		p5:setState({
			health = math.max(0, p7)
		});
		l__TweenService__3:Create(p5.progressFrame:getValue(), TweenInfo.new(0.3), {
			Size = UDim2.fromScale(math.clamp(p7 / p8, 0, 1), 1)
		}):Play();
		u7 = p7;
		u8 = p8;
	end;
	local v7 = u7;
	if v7 == nil then
		v7 = 1;
	end;
	local v8 = u8;
	if v8 == nil then
		v8 = 1;
	end;
	v6(v7, v8);
	p5.maid:GiveTask(p6:GetAttributeChangedSignal("Health"):Connect(function()
		v6(p6:GetAttribute("Health"), u8);
	end));
	p5.maid:GiveTask(p6:GetAttributeChangedSignal("MaxHealth"):Connect(function()
		v6(u7, p6:GetAttribute("MaxHealth"));
	end));
	local v9 = l__EntityUtil__4:getEntity(p6);
	if v9 then
		local v10 = u5.values(l__ShieldType__6);
		local function v11(p9)
			p5.maid:GiveTask(v9:onShieldChanged(p9):Connect(function()
				local v12 = u5.values(l__ShieldType__6);
				local u9 = 0;
				local function v13(p10)
					local v14 = v9;
					if v14 ~= nil then
						v14 = v14:getShield(p10);
					end;
					local v15 = v14;
					if v15 == nil then
						v15 = 0;
					end;
					u9 = u9 + v15;
				end;
				for v16, v17 in ipairs(v12) do
					v13(v17, v16 - 1, v12);
				end;
				p5:setState({
					shield = u9
				});
			end));
		end;
		for v18, v19 in ipairs(v10) do
			v11(v19, v18 - 1, v10);
		end;
	end;
end;
local l__Shield__10 = v1.import(script, script.Parent, "shield").Shield;
local l__ColorUtil__11 = v2.ColorUtil;
local l__Empty__12 = v2.Empty;
function v5.render(p11)
	local v20 = u5.values(l__ShieldType__6);
	local function v21(p12)
		return v3.createElement(l__Shield__10, {
			ShieldType = p12
		});
	end;
	local v22 = table.create(#v20);
	for v23, v24 in ipairs(v20) do
		v22[v23] = v21(v24, v23 - 1, v20);
	end;
	local v25 = l__EntityUtil__4:getLocalPlayerEntity();
	if v25 ~= nil then
		v25 = v25:getMaxHealth();
	end;
	local v26 = v25;
	if v26 == nil then
		v26 = 100;
	end;
	local v27 = {};
	if p11.state.health + p11.state.shield < v26 then
		local v28 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Center"
			}) };
		local v29 = #v28;
		for v30, v31 in ipairs(v22) do
			v28[v29 + v30] = v31;
		end;
		local v32 = v3.createFragment(v28);
	else
		local v33 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v34 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right"
			}) };
		local v35 = #v34;
		for v36, v37 in ipairs(v22) do
			v34[v35 + v36] = v37;
		end;
		v32 = v3.createElement(l__Empty__12, v33, v34);
	end;
	local v38 = { v3.createElement("Frame", {
			[v3.Ref] = p11.progressFrame, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = l__ColorUtil__11.hexColor(13317668), 
			BorderSizePixel = 0, 
			LayoutOrder = 0
		}) };
	v38[#v38 + 1] = v32;
	v27.HealthbarProgressWrapper = v3.createElement(l__Empty__12, {
		Size = UDim2.fromScale(1, 1)
	}, v38);
	local v39 = {};
	if p11.state.shield > 0 then
		local v40 = "(+" .. tostring(math.round(p11.state.shield)) .. ")";
	else
		v40 = "";
	end;
	v39.Text = tostring(math.round(p11.state.health)) .. " " .. v40;
	v39.Size = UDim2.fromScale(0.3, 1.4);
	v39.Position = UDim2.fromScale(0.5, 0);
	v39.AnchorPoint = Vector2.new(0.5, 0.35);
	v39.BorderSizePixel = 0;
	v39.BackgroundTransparency = 1;
	v39.TextColor3 = Color3.fromRGB(255, 255, 255);
	v39.RichText = true;
	v39.TextScaled = true;
	v39.Font = "LuckiestGuy";
	v39.ZIndex = 11;
	v27[#v27 + 1] = v3.createElement("TextLabel", v39);
	return v3.createFragment({
		HotbarHealthbarContainer = v3.createElement("Frame", {
			Size = UDim2.fromScale(0.85, 0.2), 
			Position = UDim2.fromScale(0.5, -0.2), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundColor3 = l__ColorUtil__11.hexColor(2700097), 
			BorderSizePixel = 0
		}, v27)
	});
end;
function v5.willUnmount(p13)
	p13.characterMaid:DoCleaning();
	p13.maid:DoCleaning();
end;
return {
	HotbarHealthbar = v5
};
