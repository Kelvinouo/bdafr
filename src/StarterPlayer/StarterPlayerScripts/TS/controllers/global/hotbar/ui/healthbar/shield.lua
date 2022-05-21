-- Script Hash: cd0f8564a1e7dd56d132548b80e06ada78d729f4fbe5b66a2583a853d0d92707056f69f85b63d378f73a19cefe1f426d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__EntityUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__WatchCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Healthbar__6 = v1.import(script, script.Parent, "healthbar").Healthbar;
return {
	HEALTHBAR_SHIELD_COLOR = Color3.fromRGB(240, 240, 240), 
	Shield = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local l__useMemo__2 = p2.useMemo;
		local v3, v4 = p2.useState(0);
		p2.useEffect(function()
			local v5 = l__EntityUtil__1:getLocalPlayerEntity();
			if v5 ~= nil then
				v5 = v5:getShield(p1.ShieldType);
			end;
			local v6 = v5;
			if v6 == nil then
				v6 = 0;
			end;
			v4(v6);
			local u7 = true;
			local u8 = u2.new();
			u8:GiveTask(l__WatchCharacter__3(function(p3, p4)
				if p3 == l__Players__4.LocalPlayer then
					local v7 = l__EntityUtil__1:getLocalPlayerEntity();
					if v7 and u7 then
						u8:GiveTask(v7:onShieldChanged(p1.ShieldType):Connect(function()
							local v8 = v7;
							if v8 ~= nil then
								v8 = v8:getShield(p1.ShieldType);
							end;
							local v9 = v8;
							if v9 == nil then
								v9 = 0;
							end;
							v4(v9);
						end));
					end;
				end;
			end));
			return function()
				u7 = false;
				u8:DoCleaning();
			end;
		end, { p1.ShieldType });
		local v10 = {};
		local v11 = l__EntityUtil__1:getLocalPlayerEntity();
		if v11 ~= nil then
			v11 = v11:getMaxHealth();
		end;
		local v12 = v11;
		if v12 == nil then
			v12 = 100;
		end;
		v10.Size = UDim2.fromScale(v3 / v12, 1);
		v10.FillRatio = 1;
		v10.FillColor = ColorSequence.new(Color3.fromRGB(240, 240, 240), Color3.fromRGB(199, 199, 199));
		v10.BackgroundColor = ColorSequence.new(Color3.fromRGB(0, 0, 0));
		v10.BarTweenSpeed = 0.01;
		return u5.createElement(l__Healthbar__6, v10);
	end)
};
