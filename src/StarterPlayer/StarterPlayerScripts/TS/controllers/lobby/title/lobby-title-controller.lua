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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "LobbyTitleController";
end;
local l__WatchCharacter__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.KnitStart(p2)
	l__WatchCharacter__1(function(p3, p4, p5)
		local v5 = u2.new();
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
local l__TitleType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__LobbyTitle__5 = v1.import(script, script.Parent, "lobby-title").LobbyTitle;
function v3.applyTitle(p6, p7, p8)
	local v6 = nil;
	v6 = u2.new();
	if p8 == l__TitleType__3.NONE then
		return v6;
	end;
	local l__Head__7 = p7:WaitForChild("Head");
	local u6 = u4.mount(u4.createElement(l__LobbyTitle__5, {
		TitleType = p8, 
		Head = l__Head__7
	}), l__Head__7, "LobbyTitle");
	v6:GiveTask(function()
		u4.unmount(u6);
	end);
	return v6;
end;
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
