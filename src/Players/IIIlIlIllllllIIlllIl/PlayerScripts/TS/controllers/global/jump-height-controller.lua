-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "JumpHeightController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__StatusModifier__2 = v2.StatusModifier;
local l__StarterPlayer__3 = v3.StarterPlayer;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "JumpHeightController";
	p1.jumpSpeedMultiplier = 1;
	p1.allowedAirJumps = 0;
	p1.jumpModifier = l__StatusModifier__2.new(function(p2)
		local v7 = false;
		local v8 = 0;
		local v9 = 0;
		local v10 = 0;
		local v11, v12, v13 = ipairs(p2);
		while true do
			local v14, v15 = v11(v12, v13);
			if not v14 then
				break;
			end;
			if v15.jumpHeightMultiplier ~= nil then
				if v15.jumpHeightMultiplier <= 0 then
					v7 = true;
				elseif v15.jumpHeightMultiplier < 1 then
					v8 = v8 + 1 / v15.jumpHeightMultiplier;
				elseif v15.jumpHeightMultiplier > 1 then
					v9 = v9 + v15.jumpHeightMultiplier;
				end;
			end;
			if v15.airJumps ~= nil then
				v10 = v10 + 1;
			end;		
		end;
		if v8 == 0 then
			v8 = 1;
		end;
		if v9 == 0 then
			v9 = 1;
		end;
		if v7 then
			local v16 = 0;
		else
			v16 = v9 / v8;
		end;
		p1.jumpSpeedMultiplier = v16;
		p1.allowedAirJumps = v10;
		p1:setJumpHeight(l__StarterPlayer__3.CharacterJumpHeight);
	end);
end;
local l__WatchCharacter__4 = v2.WatchCharacter;
local l__Players__5 = v3.Players;
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__UserInputService__7 = v3.UserInputService;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.KnitStart(p3)
	u1.KnitStart(p3);
	l__WatchCharacter__4(function(p4, p5, p6)
		if p4 ~= l__Players__5.LocalPlayer then
			return nil;
		end;
		local l__Humanoid__17 = p5:WaitForChild("Humanoid", 1);
		if l__Humanoid__17 == nil then
			l__default__6.Error("Could not find humanoid");
			return nil;
		end;
		p3.jumpModifier:clear();
		local u9 = false;
		local u10 = 0;
		p6:GiveTask(l__Humanoid__17.StateChanged:Connect(function(p7, p8)
			if p8 == Enum.HumanoidStateType.Landed then
				u9 = false;
				u10 = 0;
				return;
			end;
			if p8 == Enum.HumanoidStateType.Freefall then
				u9 = true;
			end;
		end));
		local u11 = false;
		local u12 = -1;
		p6:GiveTask(l__UserInputService__7.JumpRequest:Connect(function()
			if u11 then
				return nil;
			end;
			u11 = true;
			if p3.allowedAirJumps < 1 then
				return nil;
			end;
			if u9 and u10 < p3.allowedAirJumps and u12 < time() then
				u12 = time() + 0.25;
				l__default__8.Client:Get("RemoteName"):SendToServer();
				u10 = u10 + 1;
				l__Humanoid__17:ChangeState(Enum.HumanoidStateType.Jumping);
			end;
			wait(0.25);
			u11 = false;
		end));
	end);
end;
function v5.setJumpHeight(p9, p10)
	if l__Players__5.LocalPlayer.Character then
		local l__Humanoid__18 = l__Players__5.LocalPlayer.Character:WaitForChild("Humanoid");
		if l__Humanoid__18 then
			l__Humanoid__18.JumpHeight = p10 * p9.jumpSpeedMultiplier;
		end;
	end;
end;
function v5.getJumpModifier(p11)
	return p11.jumpModifier;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
