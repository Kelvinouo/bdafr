-- Script Hash: 4ca4c1b68cb8ae9f6867562a518dfcf925c6e46f42eb23fbcbb10cd1ee08f631d6a8c256380fc4133bd72f3f2f3d23df
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "MagmaBlockComponent";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
local l__EntityUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__DamageType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
function v2.constructor(p1, p2)
	p2.Touched:Connect(function(p3)
		if not p3.Parent then
			return nil;
		end;
		local v4 = l__EntityUtil__1:getEntity(p3.Parent);
		local v5 = v4;
		if v5 ~= nil then
			v5 = v5:getInstance();
		end;
		if v5 == l__Players__2.LocalPlayer.Character then
			local v6 = v4;
			if v6 ~= nil then
				v6 = v6:isAlive();
			end;
			if v6 then
				l__KnitClient__3.Controllers.DamageController:requestSelfDamage(math.huge, l__DamageType__4.MAGMA_BLOCK, "69");
			end;
		end;
	end);
end;
function v2.Destroy(p4)

end;
v2.Tag = "MagmaBlock";
return v2;
