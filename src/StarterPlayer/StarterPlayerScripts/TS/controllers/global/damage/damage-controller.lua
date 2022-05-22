-- Script Hash: a82ed18d0d4653138609b695d3239a447ba36333ac895ef47da310741a7651ddf914197573ffa7e53c04b85bb44ffbae
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DamageController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "DamageController";
end;
function u1.KnitStart(p2)

end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.requestSelfDamage(p3, p4, p5, p6, p7)
	local v5 = {
		damage = p4, 
		damageType = p5
	};
	local v6 = p7;
	if v6 ~= nil then
		v6 = v6.fromEntity;
		if v6 ~= nil then
			v6 = v6:getInstance();
		end;
	end;
	v5.fromEntity = v6;
	v5.banjo = p6;
	l__default__3.Client:Get("RemoteName"):SendToServer(v5);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	DamageController = u2
};
return u1;
