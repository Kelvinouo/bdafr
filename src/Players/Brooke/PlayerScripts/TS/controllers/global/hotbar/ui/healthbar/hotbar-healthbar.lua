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
		for v10, v11 in ipairs((u5.values(l__ShieldType__6))) do
			p5.maid:GiveTask(v9:onShieldChanged(v11):Connect(function()
				local u9 = 0;
				local v12, v13, v14 = ipairs((u5.values(l__ShieldType__6)));
				while true do
					local v15, v16 = v12(v13, v14);
					if not v15 then
						break;
					end;
					local v17 = v9;
					if v17 ~= nil then
						v17 = v17:getShield(v16);
					end;
					local v18 = v17;
					if v18 == nil then
						v18 = 0;
					end;
					u9 = u9 + v18;				
				end;
				p5:setState({
					shield = u9
				});
			end));
		end;
	end;
end;
local l__Shield__10 = v1.import(script, script.Parent, "shield").Shield;
local l__ColorUtil__11 = v2.ColorUtil;
local l__StatusEffectUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__Empty__14 = v2.Empty;
function v5.render(p9)
	local v19 = l__EntityUtil__4:getLocalPlayerEntity();
	local v20 = u5.values(l__ShieldType__6);
	local v21 = table.create(#v20);
	for v22, v23 in ipairs(v20) do
		v21[v22] = v3.createElement(l__Shield__10, {
			ShieldType = v23
		});
	end;
	local v24 = v19;
	if v24 ~= nil then
		v24 = v24:getMaxHealth();
	end;
	local v25 = v24;
	if v25 == nil then
		v25 = 100;
	end;
	local v26 = l__ColorUtil__11.hexColor(13317668);
	local v27 = v19;
	if v27 ~= nil then
		v27 = v27:getInstance();
	end;
	if v27 and l__StatusEffectUtil__12:isActive(v27, l__StatusEffectType__13.DECAY) then
		v26 = l__ColorUtil__11.hexColor(13970113);
	end;
	local v28 = {};
	if p9.state.health + p9.state.shield < v25 then
		local v29 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Left", 
				VerticalAlignment = "Center"
			}) };
		local v30 = #v29;
		for v31, v32 in ipairs(v21) do
			v29[v30 + v31] = v32;
		end;
		local v33 = v3.createFragment(v29);
	else
		local v34 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v35 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right"
			}) };
		local v36 = #v35;
		for v37, v38 in ipairs(v21) do
			v35[v36 + v37] = v38;
		end;
		v33 = v3.createElement(l__Empty__14, v34, v35);
	end;
	local v39 = { v3.createElement("Frame", {
			[v3.Ref] = p9.progressFrame, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = v26, 
			BorderSizePixel = 0, 
			LayoutOrder = 0
		}) };
	v39[#v39 + 1] = v33;
	v28.HealthbarProgressWrapper = v3.createElement(l__Empty__14, {
		Size = UDim2.fromScale(1, 1)
	}, v39);
	local v40 = {};
	if p9.state.shield > 0 then
		local v41 = "(+" .. tostring(math.round(p9.state.shield)) .. ")";
	else
		v41 = "";
	end;
	v40.Text = tostring(math.round(p9.state.health)) .. " " .. v41;
	v40.Size = UDim2.fromScale(0.3, 1.4);
	v40.Position = UDim2.fromScale(0.5, 0);
	v40.AnchorPoint = Vector2.new(0.5, 0.35);
	v40.BorderSizePixel = 0;
	v40.BackgroundTransparency = 1;
	v40.TextColor3 = Color3.fromRGB(255, 255, 255);
	v40.RichText = true;
	v40.TextScaled = true;
	v40.Font = "LuckiestGuy";
	v40.ZIndex = 11;
	v28[#v28 + 1] = v3.createElement("TextLabel", v40);
	return v3.createFragment({
		HotbarHealthbarContainer = v3.createElement("Frame", {
			Size = UDim2.fromScale(0.85, 0.2), 
			Position = UDim2.fromScale(0.5, -0.2), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundColor3 = l__ColorUtil__11.hexColor(2700097), 
			BorderSizePixel = 0
		}, v28)
	});
end;
function v5.willUnmount(p10)
	p10.characterMaid:DoCleaning();
	p10.maid:DoCleaning();
end;
return {
	HotbarHealthbar = v5
};
