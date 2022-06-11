-- Script Hash: a81233d726bde4e8412e3097e47d7fd69f1bdc42686c2fe6c9d7cac1228de3f858f2746b4c20ce5c6a48a4dd34d28ee4
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("HotbarHealthbar");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.init(p1, p2)
	p1.progressFrame = v3.createRef();
	p1.maid = u1.new();
	p1.characterMaid = u1.new();
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
local l__StatusEffectUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__Empty__14 = v2.Empty;
function v5.render(p11)
	local v20 = l__EntityUtil__4:getLocalPlayerEntity();
	local v21 = u5.values(l__ShieldType__6);
	local function v22(p12)
		return v3.createElement(l__Shield__10, {
			ShieldType = p12
		});
	end;
	local v23 = table.create(#v21);
	for v24, v25 in ipairs(v21) do
		v23[v24] = v22(v25, v24 - 1, v21);
	end;
	local v26 = v20;
	if v26 ~= nil then
		v26 = v26:getMaxHealth();
	end;
	local v27 = v26;
	if v27 == nil then
		v27 = 100;
	end;
	local v28 = l__ColorUtil__11.hexColor(13317668);
	local v29 = v20;
	if v29 ~= nil then
		v29 = v29:getInstance();
	end;
	if v29 and l__StatusEffectUtil__12:isActive(v29, l__StatusEffectType__13.DECAY) then
		v28 = l__ColorUtil__11.hexColor(13970113);
	end;
	local v30 = {};
	if p11.state.health + p11.state.shield < v27 then
		local v31 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Center"
			}) };
		local v32 = #v31;
		for v33, v34 in ipairs(v23) do
			v31[v32 + v33] = v34;
		end;
		local v35 = v3.createFragment(v31);
	else
		local v36 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v37 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right"
			}) };
		local v38 = #v37;
		for v39, v40 in ipairs(v23) do
			v37[v38 + v39] = v40;
		end;
		v35 = v3.createElement(l__Empty__14, v36, v37);
	end;
	local v41 = { v3.createElement("Frame", {
			[v3.Ref] = p11.progressFrame, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = v28, 
			BorderSizePixel = 0, 
			LayoutOrder = 0
		}) };
	v41[#v41 + 1] = v35;
	v30.HealthbarProgressWrapper = v3.createElement(l__Empty__14, {
		Size = UDim2.fromScale(1, 1)
	}, v41);
	local v42 = {};
	if p11.state.shield > 0 then
		local v43 = "(+" .. tostring(math.round(p11.state.shield)) .. ")";
	else
		v43 = "";
	end;
	v42.Text = tostring(math.round(p11.state.health)) .. " " .. v43;
	v42.Size = UDim2.fromScale(0.3, 1.4);
	v42.Position = UDim2.fromScale(0.5, 0);
	v42.AnchorPoint = Vector2.new(0.5, 0.35);
	v42.BorderSizePixel = 0;
	v42.BackgroundTransparency = 1;
	v42.TextColor3 = Color3.fromRGB(255, 255, 255);
	v42.RichText = true;
	v42.TextScaled = true;
	v42.Font = "LuckiestGuy";
	v42.ZIndex = 11;
	v30[#v30 + 1] = v3.createElement("TextLabel", v42);
	return v3.createFragment({
		HotbarHealthbarContainer = v3.createElement("Frame", {
			Size = UDim2.fromScale(0.85, 0.2), 
			Position = UDim2.fromScale(0.5, -0.2), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundColor3 = l__ColorUtil__11.hexColor(2700097), 
			BorderSizePixel = 0
		}, v30)
	});
end;
function v5.willUnmount(p13)
	p13.characterMaid:DoCleaning();
	p13.maid:DoCleaning();
end;
return {
	HotbarHealthbar = v5
};
