-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "KnightsBowEmoteController";
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
	p1.Name = "KnightsBowEmoteController";
end;
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EmoteType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteHandler__3 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ReplicatedStorage;
local l__GameQueryUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameQueryUtil;
local l__WeldUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	local l__EmoteHandlerController__5 = l__KnitClient__1.Controllers.EmoteHandlerController;
	local v6 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__3
	});
	v6.__index = v6;
	function v6.new(...)
		local v7 = setmetatable({}, v6);
		return v7:constructor(...) and v7;
	end;
	local u8 = l__EmoteHandler__3;
	function v6.constructor(p3, ...)
		u8.constructor(p3, ...);
		p3.maid = u4.new();
	end;
	function v6.onEnable(p4, p5, p6, p7)
		local v8 = l__ReplicatedStorage__5.Assets.Misc.LightSword:Clone();
		v8.Parent = p6;
		local v9, v10, v11 = ipairs((v8:GetDescendants()));
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			if v10:IsA("BasePart") then
				l__GameQueryUtil__6:setQueryIgnored(v10, true);
			end;		
		end;
		l__WeldUtil__7:weldCharacterAccessories(p6);
		p4.maid:GiveTask(function()
			v8:Destroy();
		end);
	end;
	function v6.onDisable(p8, p9, p10, p11)
		p8.maid:DoCleaning();
	end;
	u8 = l__EmoteHandlerController__5.registerHandler;
	u8(l__EmoteHandlerController__5, l__EmoteType__2.KNIGHTS_BOW, v6);
end;
local v12 = l__KnitClient__1.CreateController(v3.new());
return nil;
