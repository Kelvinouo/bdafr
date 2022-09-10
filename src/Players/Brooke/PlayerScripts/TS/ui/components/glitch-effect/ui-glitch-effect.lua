-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__Empty__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local l__UIGlitchEffectInstance__4 = v1.import(script, script.Parent, "ui-glitch-effect-instance").UIGlitchEffectInstance;
return {
	UIGlitchEffect = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = p1.Disabled or p1[u1.Children] == nil;
		if not v3 then
			local v4 = p1[u1.Children];
			if v4 ~= nil then
				v4 = next(v4) == nil;
			end;
			v3 = v4;
		end;
		if v3 then
			local v5 = {};
			local v6 = #v5;
			local v7 = p1[u1.Children];
			if v7 then
				local v8, v9, v10 = pairs(v7);
				while true do
					local v11 = nil;
					local v12 = nil;
					v12, v11 = v8(v9, v10);
					if not v12 then
						break;
					end;
					v10 = v12;
					if type(v12) == "number" then
						v5[v6 + v12] = v11;
					else
						v5[v12] = v11;
					end;				
				end;
			end;
			return u1.createFragment(v5);
		end;
		local v13 = {
			Size = UDim2.fromScale(1, 1)
		};
		local l__ContainerProps__14 = p1.ContainerProps;
		if l__ContainerProps__14 then
			for v15, v16 in pairs(l__ContainerProps__14) do
				v13[v15] = v16;
			end;
		end;
		local v17 = u2.values(p1[u1.Children]);
		local u5 = p1.GlitchColors or { Color3.fromHex("#0ffbf9"), Color3.fromHex("#ff0d23") };
		local function v18(p3)
			p3 = p3;
			local v19 = Instance.new(p3.component);
			if not v19:IsA("GuiObject") then
				return p3;
			end;
			local l__props__20 = p3.props;
			l__props__20.Size = UDim2.fromScale(1, 1);
			l__props__20.ZIndex = 2;
			local v21 = u2.deepCopy(p3);
			local v22 = u2.deepCopy(p3);
			if v19:IsA("TextLabel") then
				v21.props.TextColor3 = u5[1];
				v22.props.TextColor3 = u5[2];
			elseif v19:IsA("ImageLabel") then
				v21.props.ImageColor3 = u5[1];
				v22.props.ImageColor3 = u5[2];
			end;
			if l__props__20.BackgroundTransparency ~= 1 then
				v21.props.BackgroundColor3 = u5[1];
				v22.props.BackgroundColor3 = u5[2];
			end;
			v21.props.ZIndex = 1;
			v22.props.ZIndex = 1;
			return u1.createElement(l__Empty__3, {
				Position = l__props__20.Position, 
				AnchorPoint = l__props__20.AnchorPoint, 
				Size = l__props__20.Size
			}, { u1.createElement(l__UIGlitchEffectInstance__4, {
					Element = p3, 
					AnimationConfig = {
						DisableRandomMovement = true, 
						DisableRandomTransparency = true, 
						DisableRandomSpaz = true
					}
				}), u1.createElement(l__UIGlitchEffectInstance__4, {
					Element = v21, 
					AnimationConfig = p1.AnimationConfig
				}), u1.createElement(l__UIGlitchEffectInstance__4, {
					Element = v22, 
					AnimationConfig = p1.AnimationConfig
				}) });
		end;
		local v23 = {};
		local v24 = 0;
		local v25, v26, v27 = ipairs(v17);
		while true do
			v25(v26, v27);
			if not v25 then
				break;
			end;
			v27 = v25;
			local v28 = v18(v26, v25 - 1, v17);
			if v28 ~= nil then
				v24 = v24 + 1;
				v23[v24] = v28;
			end;		
		end;
		local v29 = {};
		local v30 = #v29;
		local v31, v32, v33 = ipairs(v23);
		while true do
			v31(v32, v33);
			if not v31 then
				break;
			end;
			v33 = v31;
			v29[v30 + v31] = v32;		
		end;
		return u1.createElement(l__Empty__3, v13, v29);
	end)
};
