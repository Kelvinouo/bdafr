-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "EmoteHandlerController";
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
	p1.Name = "EmoteHandlerController";
	p1.handlers = {};
end;
local l__WatchCharacter__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__WatchCharacter__1(function(p3, p4, p5)
		local l__handlers__5 = p2.handlers;
		local function v6(p6, p7)
			local u2 = false;
			local u3 = p6.new();
			if p4:GetAttribute("PlayingEmote") == p7 then
				u2 = true;
				if u3 ~= nil then
					u3:enable(p3, p4, p7);
				end;
			elseif u2 then
				if u3 ~= nil then
					u3:disable(p3, p4, p7);
				end;
				u2 = false;
			end;
			p4:GetAttributeChangedSignal("PlayingEmote"):Connect(function()
				if p4:GetAttribute("PlayingEmote") == p7 then
					u2 = true;
					if u3 ~= nil then
						u3:enable(p3, p4, p7);
						return;
					end;
				elseif u2 then
					if u3 ~= nil then
						u3:disable(p3, p4, p7);
					end;
					u2 = false;
				end;
			end);
			p5:GiveTask(function()
				if p7 == nil then
					u2 = true;
					if u3 ~= nil then
						u3:enable(p3, p4, p7);
					end;
				elseif u2 then
					if u3 ~= nil then
						u3:disable(p3, p4, p7);
					end;
					u2 = false;
				end;
				u3 = nil;
			end);
		end;
		for v7, v8 in pairs(l__handlers__5) do
			v6(v8, v7, l__handlers__5);
		end;
	end);
end;
function v3.registerHandler(p8, p9, p10)
	p8.handlers[p9] = p10;
end;
local v9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
