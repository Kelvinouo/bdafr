-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LobbyCountdownController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "LobbyCountdownController";
end;
local l__WatchCollectionTag__1 = v2.WatchCollectionTag;
local l__UpdateTimeEpoch__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop.UpdateTimeEpoch;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__WatchCollectionTag__1("sale-countdown", function(p3)
		task.spawn(function()
			while true do
				p3.Text = p2:getTime(1660341600, "LAST CHANCE!!");
				local v6 = wait(1);
				if v6 == 0 then
					break;
				end;
				if v6 ~= v6 then
					break;
				end;
				if not v6 then
					break;
				end;			
			end;
		end);
	end);
	l__WatchCollectionTag__1("update-countdown", function(p4)
		task.spawn(function()
			while true do
				p4.Text = p2:getTime(l__UpdateTimeEpoch__2, "UPDATE HYPE!!");
				local v7 = wait(1);
				if v7 == 0 then
					break;
				end;
				if v7 ~= v7 then
					break;
				end;
				if not v7 then
					break;
				end;			
			end;
		end);
	end);
	l__WatchCollectionTag__1("br-countdown", function(p5)
		task.spawn(function()
			while true do
				p5.Text = p2:getTime(1656172800, "UPDATE HYPE!!");
				local v8 = wait(1);
				if v8 == 0 then
					break;
				end;
				if v8 ~= v8 then
					break;
				end;
				if not v8 then
					break;
				end;			
			end;
		end);
	end);
end;
local l__StringUtil__3 = v2.StringUtil;
function v4.getTime(p6, p7, p8)
	local v9 = math.max(0, p7 - os.time());
	if v9 == 0 then
		return p8;
	end;
	return l__StringUtil__3.formatCountdownTime(v9, {
		days = true, 
		hours = true, 
		seperator = " : "
	});
end;
local v10 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
