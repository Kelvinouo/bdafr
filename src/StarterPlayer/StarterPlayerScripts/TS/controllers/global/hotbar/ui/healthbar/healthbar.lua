
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	Healthbar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useEffect__2 = p2.useEffect;
		local v3 = u1.createRef();
		local v4 = u1.createRef();
		local v5 = p2.useMemo(function()
			return p1.Size;
		end, {});
		local v6, v7 = p2.useState(true);
		l__useEffect__2(function()
			local v8 = p1.BarTweenSpeed;
			if v8 == nil then
				v8 = 0.12;
			end;
			l__TweenService__2:Create(v4:getValue(), TweenInfo.new(v8), {
				Size = UDim2.fromScale(p1.FillRatio, 1)
			}):Play();
		end, { p1.FillRatio });
		l__useEffect__2(function()
			local v9 = p1.BarTweenSpeed;
			if v9 == nil then
				v9 = 0.012;
			end;
			l__TweenService__2:Create(v3:getValue(), TweenInfo.new(v9), {
				Size = p1.Size
			}):Play();
		end, { p1.Size });
		local v10 = { u1.createElement("UIGradient", {
				Color = p1.BackgroundColor
			}) };
		local v11 = {
			[u1.Ref] = v4, 
			Size = UDim2.fromScale(p1.FillRatio, 1), 
			BackgroundColor3 = l__ColorUtil__3.WHITE, 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0
		};
		local v12 = { u1.createElement("UIGradient", {
				Color = p1.FillColor, 
				Rotation = 90
			}) };
		local v13 = #v12;
		local v14 = p1[u1.Children];
		if v14 then
			local v15, v16, v17 = pairs(v14);
			while true do
				local v18 = nil;
				local v19 = nil;
				v19, v18 = v15(v16, v17);
				if not v19 then
					break;
				end;
				v17 = v19;
				if type(v19) == "number" then
					v12[v13 + v19] = v18;
				else
					v12[v19] = v18;
				end;			
			end;
		end;
		v10[#v10 + 1] = u1.createElement("Frame", v11, v12);
		return u1.createElement("Frame", {
			[u1.Ref] = v3, 
			Size = v5, 
			BackgroundTransparency = 0, 
			BorderSizePixel = 0
		}, v10);
	end)
};

