
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__StringUtil__1 = v2.StringUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
return {
	MissionsListTimer = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v3, v4 = p2.useState("");
		local function u4()
			return l__StringUtil__1.formatCountdownTime(math.max(0, p1.EndTime - os.time()), {
				hours = true, 
				days = true, 
				seperator = " : "
			});
		end;
		p2.useEffect(function()
			local u5 = true;
			v1.Promise.defer(function()
				while { wait(0.2) } and u5 do
					v4(u4());				
				end;
			end);
			return function()
				u5 = false;
				return u5;
			end;
		end, {});
		return u2.createElement("TextLabel", {
			AnchorPoint = p1.AnchorPoint, 
			Position = p1.Position, 
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundTransparency = 1, 
			Text = "<b>Expires in " .. v3 .. "</b>", 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextColor3 = l__ColorUtil__3.WHITE, 
			TextTransparency = 0.3, 
			RichText = true, 
			Font = Enum.Font.Roboto, 
			TextSize = 16
		});
	end)
};

