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
local l__StatusModifier__1 = v2.StatusModifier;
local l__StarterPlayer__2 = v3.StarterPlayer;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "JumpHeightController";
	p1.jumpSpeedMultiplier = 1;
	p1.allowedAirJumps = 0;
	p1.jumpModifier = l__StatusModifier__1.new(function(p2)
		local v7 = false;
		local v8 = 0;
		local v9 = 0;
		local v10 = 0;
		local v11, v12, v13 = ipairs(p2);
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			if v12.jumpHeightMultiplier ~= nil then
				if v12.jumpHeightMultiplier <= 0 then
					v7 = true;
				elseif v12.jumpHeightMultiplier < 1 then
					v8 = v8 + 1 / v12.jumpHeightMultiplier;
				elseif v12.jumpHeightMultiplier > 1 then
					v9 = v9 + v12.jumpHeightMultiplier;
				end;
			end;
			if v12.airJumps ~= nil then
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
			local v14 = 0;
		else
			v14 = v9 / v8;
		end;
		p1.jumpSpeedMultiplier = v14;
		p1.allowedAirJumps = v10;
		p1:setJumpHeight(l__StarterPlayer__2.CharacterJumpHeight);
	end);
end;
local l__WatchCharacter__3 = v2.WatchCharacter;
local l__Players__4 = v3.Players;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__UserInputService__6 = v3.UserInputService;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.KnitStart(p3)
	l__KnitController__4.KnitStart(p3);
	l__WatchCharacter__3(function(p4, p5, p6)
		if p4 ~= l__Players__4.LocalPlayer then
			return nil;
		end;
		local l__Humanoid__15 = p5:WaitForChild("Humanoid", 1);
		if l__Humanoid__15 == nil then
			l__default__5.Error("Could not find humanoid");
			return nil;
		end;
		p3.jumpModifier:clear();
		local u8 = false;
		local u9 = 0;
		p6:GiveTask(l__Humanoid__15.StateChanged:Connect(function(p7, p8)
			if p8 ~= Enum.HumanoidStateType.Landed then
				if p8 == Enum.HumanoidStateType.Freefall then
					u8 = true;
				end;
				return;
			end;
			u8 = false;
			u9 = 0;
			for v16 in pairs((p3.jumpModifier:getModifiers())) do
				if v16.deleteWhenLanded then
					p3.jumpModifier:removeModifier(v16);
				end;
			end;
		end));
		local u10 = false;
		local u11 = -1;
		p6:GiveTask(l__UserInputService__6.JumpRequest:Connect(function()
			if u10 then
				return nil;
			end;
			if p3.allowedAirJumps < 1 then
				return nil;
			end;
			u10 = true;
			if u8 and u9 < p3.allowedAirJumps and u11 < time() then
				u11 = time() + 0.25;
				l__default__7.Client:Get("RemoteName"):SendToServer();
				u9 = u9 + 1;
				l__Humanoid__15:ChangeState(Enum.HumanoidStateType.Jumping);
			end;
			wait(0.25);
			u10 = false;
		end));
	end);
end;
function v5.setJumpHeight(p9, p10)
	if l__Players__4.LocalPlayer.Character then
		local l__Humanoid__17 = l__Players__4.LocalPlayer.Character:WaitForChild("Humanoid");
		if l__Humanoid__17 then
			l__Humanoid__17.JumpHeight = p10 * p9.jumpSpeedMultiplier;
		end;
	end;
end;
function v5.getJumpModifier(p11)
	return p11.jumpModifier;
end;
local v18 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
