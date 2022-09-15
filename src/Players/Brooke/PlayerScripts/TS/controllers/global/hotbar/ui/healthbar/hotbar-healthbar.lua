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
		local v10, v11, v12 = ipairs((u5.values(l__ShieldType__6)));
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			v12 = v10;
			p5.maid:GiveTask(v9:onShieldChanged(v11):Connect(function()
				local u9 = 0;
				local v13, v14, v15 = ipairs((u5.values(l__ShieldType__6)));
				while true do
					v13(v14, v15);
					if not v13 then
						break;
					end;
					local v16 = v9;
					if v16 ~= nil then
						v16 = v16:getShield(v14);
					end;
					local v17 = v16;
					if v17 == nil then
						v17 = 0;
					end;
					u9 = u9 + v17;				
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
	local v18 = l__EntityUtil__4:getLocalPlayerEntity();
	local v19 = u5.values(l__ShieldType__6);
	local v20 = table.create(#v19);
	local v21, v22, v23 = ipairs(v19);
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		v23 = v21;
		v20[v21] = v3.createElement(l__Shield__10, {
			ShieldType = v22
		});	
	end;
	local v24 = v18;
	if v24 ~= nil then
		v24 = v24:getMaxHealth();
	end;
	local v25 = v24;
	if v25 == nil then
		v25 = 100;
	end;
	local v26 = l__ColorUtil__11.hexColor(13317668);
	local v27 = v18;
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
		local v31, v32, v33 = ipairs(v20);
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			v33 = v31;
			v29[v30 + v31] = v32;		
		end;
		local v34 = v3.createFragment(v29);
	else
		local v35 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v36 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Right"
			}) };
		local v37 = #v36;
		local v38, v39, v40 = ipairs(v20);
		while true do
			v38(v39, v40);
			if not v38 then
				break;
			end;
			v40 = v38;
			v36[v37 + v38] = v39;		
		end;
		v34 = v3.createElement(l__Empty__14, v35, v36);
	end;
	local v41 = { v3.createElement("Frame", {
			[v3.Ref] = p9.progressFrame, 
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = v26, 
			BorderSizePixel = 0, 
			LayoutOrder = 0
		}) };
	v41[#v41 + 1] = v34;
	v28.HealthbarProgressWrapper = v3.createElement(l__Empty__14, {
		Size = UDim2.fromScale(1, 1)
	}, v41);
	local v42 = {};
	if p9.state.shield > 0 then
		local v43 = "(+" .. tostring(math.round(p9.state.shield)) .. ")";
	else
		v43 = "";
	end;
	v42.Text = tostring(math.round(p9.state.health)) .. " " .. v43;
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
	v28[#v28 + 1] = v3.createElement("TextLabel", v42);
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
