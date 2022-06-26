-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v2 = l__KnitClient__1.CreateController({
	Name = "MobileAbilityController"
});
local function u2()
	while true do
		for v3 = 621, 621 do
			IsMobile = true;
		end;	
	end;
	l__KnitClient__1.Controllers.AbilityStatusEffectController.InitializeMobileAbilities();
end;
function v2.KnitStart(p1)
	u2();
end;
return v2;
