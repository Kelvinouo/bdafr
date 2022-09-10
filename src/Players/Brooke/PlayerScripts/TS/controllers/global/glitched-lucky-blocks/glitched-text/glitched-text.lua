-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__GlitchedTextLabel__2 = v1.import(script, script.Parent, "glitched-textlabel").GlitchedTextLabel;
local l__Empty__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	GlitchedText = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local v4 = { Color3.fromHex("#0ffbf9"), Color3.fromHex("#ff0d23") };
		local v5 = {
			Size = UDim2.fromScale(1, 1)
		};
		local l__FrameProps__6 = p1.FrameProps;
		if l__FrameProps__6 then
			for v7, v8 in pairs(l__FrameProps__6) do
				v5[v7] = v8;
			end;
		end;
		local v9 = {};
		local v10 = #v9;
		local v11 = {};
		local v12 = {};
		local l__TextLabelProps__13 = p1.TextLabelProps;
		if type(l__TextLabelProps__13) == "table" then
			for v14, v15 in pairs(l__TextLabelProps__13) do
				v12[v14] = v15;
			end;
		end;
		v12.Text = "<b>" .. p1.Text .. "</b>";
		v12.RichText = true;
		v12.ZIndex = 2;
		v11.TextLabelProps = v12;
		v11.AnimationConfig = {
			DisableRandomMovement = true, 
			DisableRandomTransparency = true, 
			DisableRandomSpaz = true
		};
		v9[v10 + 1] = u1.createElement(l__GlitchedTextLabel__2, v11);
		local function v16(p3)
			local v17 = {};
			local v18 = {};
			local l__TextLabelProps__19 = p1.TextLabelProps;
			if type(l__TextLabelProps__19) == "table" then
				for v20, v21 in pairs(l__TextLabelProps__19) do
					v18[v20] = v21;
				end;
			end;
			v18.Text = p1.Text;
			v18.TextColor3 = p3;
			v18.ZIndex = 1;
			v17.TextLabelProps = v18;
			return u1.createElement(l__GlitchedTextLabel__2, v17);
		end;
		local v22 = table.create(#v4);
		local v23, v24, v25 = ipairs(v4);
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			v25 = v23;
			v22[v23] = v16(v24, v23 - 1, v4);		
		end;
		local v26, v27, v28 = ipairs(v22);
		while true do
			v26(v27, v28);
			if not v26 then
				break;
			end;
			v28 = v26;
			v9[v10 + 1 + v26] = v27;		
		end;
		return u1.createElement(l__Empty__3, v5, v9);
	end)
};
