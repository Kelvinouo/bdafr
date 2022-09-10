-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
return {
	GlitchedTextLabel = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u4 = u1.createRef();
		p2.useEffect(function()
			local v3 = u4:getValue();
			if not v3 then
				return nil;
			end;
			local v4 = Random.new();
			local v5 = p1.AnimationConfig;
			if v5 ~= nil then
				v5 = v5.DisableRandomMovement;
			end;
			if not v5 then
				if l__DeviceUtil__2.isSmallScreen() then
					local v6 = { -4, 4 };
				else
					v6 = { -9, 9 };
				end;
				local u5 = true;
				task.spawn(function()
					while true do
						local v7 = p1.TextLabelProps.Position;
						if v7 ~= nil then
							v7 = v7 + UDim2.fromOffset(v4:NextNumber(v6[1], v6[2]), v4:NextNumber(v6[1], v6[2]));
						end;
						local v8 = v7;
						if v8 == nil then
							v8 = v3.Position;
						end;
						v3.Position = v8;
						if not u5 then
							break;
						end;
						if not { wait(v4:NextNumber(1, 2)) } then
							break;
						end;					
					end;
				end);
			end;
			local v9 = p1.AnimationConfig;
			if v9 ~= nil then
				v9 = v9.DisableRandomTransparency;
			end;
			if not v9 then
				local u6 = true;
				task.spawn(function()
					while true do
						v3.TextTransparency = v4:NextNumber();
						if not u6 then
							break;
						end;
						if not { wait(v4:NextNumber(0.2, 1)) } then
							break;
						end;					
					end;
				end);
			end;
			local v10 = p1.AnimationConfig;
			if v10 ~= nil then
				v10 = v10.DisableRandomSpaz;
			end;
			if not v10 then
				local u7 = true;
				task.spawn(function()
					if l__DeviceUtil__2.isSmallScreen() then
						local v11 = { -4, 4 };
					else
						v11 = { -9, 9 };
					end;
					while true do
						local v12 = {};
						local v13 = p1.TextLabelProps.Position;
						if v13 ~= nil then
							v13 = v13 + UDim2.fromOffset(v4:NextNumber(v11[1], v11[2]), v4:NextNumber(v11[1], v11[2]));
						end;
						local v14 = v13;
						if v14 == nil then
							v14 = v3.Position;
						end;
						v12.Position = v14;
						l__TweenService__3:Create(v3, TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 6, true), v12):Play();
						if not u7 then
							break;
						end;
						if not { wait(v4:NextNumber(1, 2)) } then
							break;
						end;					
					end;
				end);
			end;
			local u8 = true;
		end, {});
		local v15 = {};
		for v16, v17 in pairs(p1.TextLabelProps) do
			v15[v16] = v17;
		end;
		v15[u1.Ref] = u4;
		v15.BackgroundTransparency = 1;
		return u1.createElement("TextLabel", v15);
	end)
};
