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
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "DamageController";
end;
function u1.KnitStart(p2)

end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
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
	l__default__2.Client:Get("RemoteName"):SendToServer(v5);
end;
function u1.requestSelfDeath(p8, p9)
	l__default__2.Client:Get("RemoteName"):SendToServer({
		damageType = p9
	});
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	DamageController = u1
};
