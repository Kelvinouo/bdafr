-- Script Hash: 5e8197a39f8f0262553c26bc9da2b93102a9d82612000a76e29f709b042ca743f42cc0a0a69a5439d0288ac3f3ebdf0a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "LobbyTitleController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LobbyTitleController";
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.KnitStart(p2)
	l__WatchCharacter__2(function(p3, p4, p5)
		local v5 = u3.new();
		if p3:GetAttribute("TitleType") ~= nil then
			v5:DoCleaning();
			v5:GiveTask(p2:applyTitle(p4, p3:GetAttribute("TitleType")));
		end;
		p5:GiveTask(p3:GetAttributeChangedSignal("TitleType"):Connect(function()
			v5:DoCleaning();
			v5:GiveTask(p2:applyTitle(p4, p3:GetAttribute("TitleType")));
		end));
		p5:GiveTask(v5);
	end);
end;
local l__TitleType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__LobbyTitle__6 = v1.import(script, script.Parent, "lobby-title").LobbyTitle;
function v3.applyTitle(p6, p7, p8)
	local v6 = nil;
	v6 = u3.new();
	if p8 == l__TitleType__4.NONE then
		return v6;
	end;
	local l__Head__7 = p7:WaitForChild("Head");
	local u7 = u5.mount(u5.createElement(l__LobbyTitle__6, {
		TitleType = p8, 
		Head = l__Head__7
	}), l__Head__7, "LobbyTitle");
	v6:GiveTask(function()
		u5.unmount(u7);
	end);
	return v6;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
