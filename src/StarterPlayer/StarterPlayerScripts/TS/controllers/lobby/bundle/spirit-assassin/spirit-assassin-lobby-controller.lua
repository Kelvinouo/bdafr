-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "SpiritAssassinLobbyController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "SpiritAssassinLobbyController";
end;
local l__WatchCollectionTag__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	local u3 = { Color3.fromRGB(255, 89, 89), Color3.fromRGB(218, 133, 65), Color3.fromRGB(91, 154, 76), Color3.fromRGB(82, 124, 174), Color3.fromRGB(180, 128, 255) };
	l__WatchCollectionTag__1("prismatic-text", function(p3)
		local v5 = 1;
		while p3.Parent ~= nil do
			local v6 = l__TweenService__2:Create(p3, TweenInfo.new(1), {
				TextColor3 = u3[v5 + 1]
			});
			v6:Play();
			v6.Completed:Wait();
			v5 = v5 + 1;
			if #u3 <= v5 then
				v5 = 0;
			end;		
		end;
	end);
end;
local v7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
