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
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "EmoteHandlerController";
	p1.handlers = {};
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__2(function(p3, p4, p5)
		local l__handlers__5 = p2.handlers;
		local function v6(p6, p7)
			local u3 = false;
			local u4 = p6.new();
			local function v7(p8)
				if p8 == p7 then
					u3 = true;
					if u4 ~= nil then
						u4:enable(p3, p4, p7);
						return;
					end;
				elseif u3 then
					if u4 ~= nil then
						u4:disable(p3, p4, p7);
					end;
					u3 = false;
				end;
			end;
			v7(p4:GetAttribute("PlayingEmote"));
			p4:GetAttributeChangedSignal("PlayingEmote"):Connect(function()
				v7(p4:GetAttribute("PlayingEmote"));
			end);
			p5:GiveTask(function()
				v7(nil);
				u4 = nil;
			end);
		end;
		for v8, v9 in pairs(l__handlers__5) do
			v6(v9, v8, l__handlers__5);
		end;
	end);
end;
function v3.registerHandler(p9, p10, p11)
	p9.handlers[p10] = p11;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
