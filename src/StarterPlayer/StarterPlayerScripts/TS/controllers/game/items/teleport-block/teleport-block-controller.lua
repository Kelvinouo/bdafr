
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "TeleportBlockController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "TeleportBlockController";
end;
local l__CollectionTagAdded__2 = v2.CollectionTagAdded;
local l__Players__3 = v4.Players;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__WatchCollectionTag__5 = v2.WatchCollectionTag;
local l__Maid__6 = v3.Maid;
local l__Workspace__7 = v4.Workspace;
local l__RunService__8 = v4.RunService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("teleport_block", function(p3)
		p3.Touched:Connect(function(p4)
			if l__Players__3.LocalPlayer.Character and p4.Parent == l__Players__3.LocalPlayer.Character then
				l__default__4.Client:Get("RemoteName"):SendToServer({
					teleportBlock = p3
				});
			end;
		end);
		l__WatchCollectionTag__5("teleport_block", function(p5)
			local l__TeamIndicator__8 = p5:WaitForChild("TeamIndicator");
			local v9 = l__Maid__6.new();
			local u9 = l__Workspace__7:GetServerTimeNow();
			local l__Position__10 = l__TeamIndicator__8.Position;
			v9:GiveTask(l__RunService__8.RenderStepped:Connect(function(p6)
				u9 = u9 + p6;
				if p5:GetAttribute("spouseIndex") ~= nil and l__TeamIndicator__8.Transparency > 0 then
					l__TeamIndicator__8.Transparency = l__TeamIndicator__8.Transparency - 0.002;
				end;
				l__TeamIndicator__8.CFrame = CFrame.new(l__Position__10 + Vector3.new(0, math.sin(u9 * 1.2) + 0.2, 0));
			end));
			l__TeamIndicator__8.AncestryChanged:Connect(function(p7, p8)
				if p8 == nil then
					v9:DoCleaning();
				end;
			end);
		end);
	end);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;

