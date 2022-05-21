-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__StringUtil__2 = v2.StringUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__4 = v2.Empty;
return {
	BedShieldUI = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local function v3()
			return l__StringUtil__2.formatCountdownTime(math.max(0, p1.ExpireTime - l__Workspace__1:GetServerTimeNow()), {
				hours = false, 
				days = false, 
				seperator = ":"
			});
		end;
		local v4, v5 = p2.useState(v3());
		p2.useEffect(function()
			local u5 = true;
			task.spawn(function()
				while true do
					local v6 = task.wait(1);
					if v6 ~= 0 and v6 == v6 and v6 then
						v6 = u5;
					end;
					if v6 == 0 then
						break;
					end;
					if v6 ~= v6 then
						break;
					end;
					if not v6 then
						break;
					end;
					v5(v3());				
				end;
			end);
			return function()
				u5 = false;
			end;
		end, {});
		return u3.createElement(l__Empty__4, {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0, 0)
		}, { u3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.04, 0)
			}), u3.createElement("TextLabel", {
				Text = "<b>BED SHIELD</b>", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(1, 0.5), 
				TextScaled = true, 
				RichText = true, 
				Font = "LuckiestGuy", 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
				TextStrokeTransparency = 0
			}), u3.createElement("TextLabel", {
				Text = "<b>" .. v4 .. "</b>", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(1, 0.4), 
				TextScaled = true, 
				RichText = true, 
				Font = "RobotoMono", 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
				TextStrokeTransparency = 0
			}) });
	end)
};
