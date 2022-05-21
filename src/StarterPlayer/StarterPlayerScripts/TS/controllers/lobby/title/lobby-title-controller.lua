-- Script Hash: 1045f5c83849dffdc454535db062a6ba1a29a24419d76efdbbde457686a5263070a7cff6a277760fb28fc633c1c9518e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LobbyTitleController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LobbyTitleController";
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Maid__3 = v2.Maid;
function v4.KnitStart(p2)
	l__WatchCharacter__2(function(p3, p4, p5)
		local v6 = l__Maid__3.new();
		if p3:GetAttribute("TitleType") ~= nil then
			v6:DoCleaning();
			v6:GiveTask(p2:applyTitle(p4, p3:GetAttribute("TitleType")));
		end;
		p5:GiveTask(p3:GetAttributeChangedSignal("TitleType"):Connect(function()
			v6:DoCleaning();
			v6:GiveTask(p2:applyTitle(p4, p3:GetAttribute("TitleType")));
		end));
		p5:GiveTask(v6);
	end);
end;
local l__TitleType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__LobbyTitle__6 = v1.import(script, script.Parent, "lobby-title").LobbyTitle;
function v4.applyTitle(p6, p7, p8)
	local v7 = nil;
	v7 = l__Maid__3.new();
	if p8 == l__TitleType__4.NONE then
		return v7;
	end;
	local l__Head__8 = p7:WaitForChild("Head");
	local u7 = u5.mount(u5.createElement(l__LobbyTitle__6, {
		TitleType = p8, 
		Head = l__Head__8
	}), l__Head__8, "LobbyTitle");
	v7:GiveTask(function()
		u5.unmount(u7);
	end);
	return v7;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
