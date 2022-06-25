-- Script Hash: b7c62f63890f9e64f037bb26a305b0469300b970ee341caa088d69bb3a8a32c730f5ecea972b2ea76dc3cf1a55602b91
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	GiftingCharacterCounter = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v2, v3 = p2.useState(0);
		p2.useEffect(function()
			local v4 = u1.new();
			local v5 = p1.TextBox:getValue();
			if v5 then
				v3(#v5.Text);
			end;
			local function u4()
				if not v5 then
					return nil;
				end;
				if #v5.Text <= p1.MaxCharCount then
					v3(#v5.Text);
				end;
			end;
			v4:GiveTask(p1.TextBox:getValue():GetPropertyChangedSignal("Text"):Connect(function()
				u4();
			end));
			return function()
				v4:DoCleaning();
			end;
		end, {});
		local v6 = {};
		for v7, v8 in pairs(p1) do
			v6[v7] = v8;
		end;
		v6[u2.Children] = nil;
		v6.TextBox = nil;
		v6.MaxCharCount = nil;
		local v9 = {
			Text = tostring(v2) .. "/" .. tostring(p1.MaxCharCount), 
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			SizeConstraint = "RelativeXX", 
			TextColor3 = l__ColorUtil__3.WHITE, 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextTransparency = 0.3, 
			Font = Enum.Font.Roboto, 
			TextSize = 14, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		};
		for v10, v11 in pairs(v6) do
			v9[v10] = v11;
		end;
		local v12 = {};
		local v13 = #v12;
		local v14 = p1[u2.Children];
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
		return u2.createElement("TextLabel", v9, v12);
	end)
};
