-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__StringUtil__1 = v2.StringUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
return {
	CountdownComponent = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v3, v4 = p2.useState("00:00:00:00");
		p2.useEffect(function()
			local u4 = true;
			local function u5()
				return l__StringUtil__1.formatCountdownTime(math.max(0, p1.EndTime - os.time()), p1.CountdownOptions or {
					days = true, 
					hours = true, 
					seperator = " : "
				});
			end;
			v1.Promise.defer(function()
				while { wait(0.2) } and u4 do
					v4(u5());				
				end;
			end);
			return function()
				u4 = false;
			end;
		end, { p1.EndTime });
		local v5 = {};
		for v6, v7 in pairs(p1) do
			v5[v6] = v7;
		end;
		v5.EndTime = nil;
		v5.PreText = nil;
		v5.CountdownOptions = nil;
		v5[u2.Children] = nil;
		local v8 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			SizeConstraint = "RelativeXX"
		};
		local l__PreText__9 = p1.PreText;
		if l__PreText__9 ~= "" and l__PreText__9 then
			local v10 = p1.PreText;
		else
			v10 = "";
		end;
		v8.Text = v10 .. "<b>" .. v3 .. "</b>";
		v8.TextScaled = true;
		v8.RichText = true;
		v8.Font = "Roboto";
		v8.TextColor3 = l__ColorUtil__3.WHITE;
		v8.TextXAlignment = "Left";
		v8.TextYAlignment = "Center";
		v8.BackgroundTransparency = 1;
		v8.LayoutOrder = 2;
		for v11, v12 in pairs(v5) do
			v8[v11] = v12;
		end;
		local v13 = { u2.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) };
		local v14 = #v13;
		local v15 = p1[u2.Children];
		if v15 then
			local v16, v17, v18 = pairs(v15);
			while true do
				local v19 = nil;
				local v20 = nil;
				v20, v19 = v16(v17, v18);
				if not v20 then
					break;
				end;
				v18 = v20;
				if type(v20) == "number" then
					v13[v14 + v20] = v19;
				else
					v13[v20] = v19;
				end;			
			end;
		end;
		return u2.createFragment({
			RotationTimer = u2.createElement("TextLabel", v8, v13)
		});
	end)
};
