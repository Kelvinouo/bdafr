-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "signal"));
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatusInfoList__3 = v1.import(script, script.Parent, "status-info-list").StatusInfoList;
local l__StarCollectorDisplay__4 = v1.import(script, script.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "star-collector", "ui", "star-collector-display").StarCollectorDisplay;
local l__ColorUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return function(p1)
	local v2 = {};
	local u6 = nil;
	local u7 = u1.new();
	function v2.SetupRef(p2)
		u6 = p2;
		u7:Fire(p2);
	end;
	local u8 = {};
	local u9 = u2.mount(u2.createElement(l__StatusInfoList__3, v2), p1);
	local u10 = u7:Connect(function(p3)
		print("[StatusInfoList] Story. List Setup", p3);
		table.insert(u8, (u2.mount(u2.createElement(l__StarCollectorDisplay__4, {
			greenStars = 0, 
			yellowStars = 11
		}), p3)));
		table.insert(u8, (u2.mount(u2.createElement("TextLabel", {
			BackgroundColor3 = l__ColorUtil__5.BLACK, 
			Size = UDim2.fromScale(1, 1), 
			Text = "TEST", 
			TextColor3 = l__ColorUtil__5.WHITE
		}), p3)));
	end);
	return function()
		u2.unmount(u9);
		local v3, v4, v5 = ipairs(u8);
		while true do
			v3(v4, v5);
			if not v3 then
				break;
			end;
			v5 = v3;
			u2.unmount(v4);		
		end;
		u10:Disconnect();
	end;
end;
