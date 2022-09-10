-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__Empty__4 = v2.Empty;
return {
	UIGlitchEffectInstance = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local u5 = u1.createRef();
		p2.useEffect(function()
			local v4 = u5:getValue();
			if not v4 then
				return nil;
			end;
			local l__Position__5 = v4.Position;
			local v6 = Random.new();
			local v7 = p1.AnimationConfig;
			if v7 ~= nil then
				v7 = v7.DisableRandomMovement;
			end;
			if not v7 then
				if l__DeviceUtil__2.isSmallScreen() then
					local v8 = { -4, 4 };
				else
					v8 = { -9, 9 };
				end;
				local u6 = true;
				task.spawn(function()
					while true do
						local v9 = l__Position__5;
						if v9 ~= nil then
							v9 = v9 + UDim2.fromOffset(v6:NextNumber(v8[1], v8[2]), v6:NextNumber(v8[1], v8[2]));
						end;
						local v10 = v9;
						if v10 == nil then
							v10 = v4.Position;
						end;
						v4.Position = v10;
						if not u6 then
							break;
						end;
						if not { wait(v6:NextNumber(1, 2)) } then
							break;
						end;					
					end;
				end);
			end;
			local v11 = p1.AnimationConfig;
			if v11 ~= nil then
				v11 = v11.DisableRandomTransparency;
			end;
			if not v11 then
				local u7 = p1.Element.props.BackgroundTransparency == 1;
				local u8 = true;
				task.spawn(function()
					while true do
						local v12 = v4:GetChildren();
						local u9 = v6:NextNumber();
						local function v13(p3)
							if not p3:IsA("GuiObject") then
								return nil;
							end;
							if p3:IsA("TextLabel") then
								p3.TextTransparency = u9;
							end;
							if p3:IsA("ImageLabel") then
								p3.ImageTransparency = u9;
							end;
							if not u7 then
								p3.BackgroundTransparency = u9;
							end;
						end;
						local v14, v15, v16 = ipairs(v12);
						while true do
							v14(v15, v16);
							if not v14 then
								break;
							end;
							v16 = v14;
							v13(v15, v14 - 1, v12);						
						end;
						u9 = u8;
						if not u9 then
							break;
						end;
						u9 = { wait(v6:NextNumber(0.2, 1)) };
						if not u9 then
							break;
						end;					
					end;
				end);
			end;
			local v17 = p1.AnimationConfig;
			if v17 ~= nil then
				v17 = v17.DisableRandomSpaz;
			end;
			if not v17 then
				local u10 = true;
				task.spawn(function()
					if l__DeviceUtil__2.isSmallScreen() then
						local v18 = { -4, 4 };
					else
						v18 = { -9, 9 };
					end;
					while true do
						local v19 = {};
						local v20 = l__Position__5;
						if v20 ~= nil then
							v20 = v20 + UDim2.fromOffset(v6:NextNumber(v18[1], v18[2]), v6:NextNumber(v18[1], v18[2]));
						end;
						local v21 = v20;
						if v21 == nil then
							v21 = v4.Position;
						end;
						v19.Position = v21;
						l__TweenService__3:Create(v4, TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 6, true), v19):Play();
						if not u10 then
							break;
						end;
						if not { wait(v6:NextNumber(1, 2)) } then
							break;
						end;					
					end;
				end);
			end;
			local u11 = true;
		end, {});
		return u1.createElement(l__Empty__4, {
			Size = UDim2.fromScale(1, 1), 
			[u1.Ref] = u5
		}, { p1.Element });
	end)
};
