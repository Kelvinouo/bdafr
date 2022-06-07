-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "OilManController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "OilManController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__4 = v3.Workspace;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v7 = Random.new(p3.seed);
		local v8 = v7:NextNumber(8, 36);
		local v9 = u3.new();
		local v10 = p2:createOilSplashPart(p3.position + Vector3.new(0, 0.05), 4, Vector3.new(0, 1, 0), v7);
		v9:GiveTask(v10);
		p2:makeOilSlippery(v10, v7);
		p2:oilSpillInTween(v10, v8):andThen(function()
			p2:oilSpillOutTween(v10, p3.expirationTime - l__Workspace__4:GetServerTimeNow()):expect();
			v9:DoCleaning();
		end);
		local v11 = v7:NextInteger(6, 15);
		local v12 = 0;
		local v13 = false;
		while true do
			if v13 then
				v12 = v12 + 1;
			else
				v13 = true;
			end;
			if not (v12 < v11) then
				break;
			end;
			local v14 = v7:NextNumber() * math.pi * 2;
			p2:launchOilSplash(p3.position + Vector3.new(0, 3, 0), Vector3.new(math.cos(v14) * v7:NextNumber(30, 60), v7:NextInteger(15, 50), math.sin(v14) * v7:NextNumber(30, 60)), p3.expirationTime - l__Workspace__4:GetServerTimeNow(), v7);		
		end;
	end);
end;
local l__TweenService__5 = v3.TweenService;
v5.oilSpillInTween = v1.async(function(p4, p5, p6)
	local v15 = l__TweenService__5:Create(p5, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Size = Vector3.new(p6, p5.Size.Y, p6)
	});
	v15:Play();
	v15.Completed:Wait();
end);
v5.oilSpillOutTween = v1.async(function(p7, p8, p9)
	local v16 = l__TweenService__5:Create(p8, TweenInfo.new(p9, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Size = Vector3.new(0, 0, 0)
	});
	v16:Play();
	v16.Completed:Wait();
end);
function v5.makeOilSlippery(p10, p11, p12)
	p11.CanCollide = true;
	p11.AssemblyLinearVelocity = Vector3.new(p12:NextNumber(-1, 1), p12:NextNumber(-1, 1), p12:NextNumber(-1, 1)) * 20;
	p11.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 100, 0);
end;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ProjectileUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local l__Players__10 = v3.Players;
local l__HttpService__11 = v3.HttpService;
local l__BlockEngine__12 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Debris__13 = v3.Debris;
function v5.launchOilSplash(p13, p14, p15, p16, p17)
	if p17 == nil then
		p17 = Random.new();
	end;
	local v17 = p17:NextNumber(0.5, 2);
	local v18 = l__ReplicatedStorage__6.Assets.Effects.OilPart:Clone();
	v18.Anchored = false;
	v18.Size = Vector3.new(v17, v17, v17);
	l__GameQueryUtil__7:setQueryIgnored(v18, true);
	local v19 = u8("Model", {
		Children = { v18 }
	});
	v19.PrimaryPart = v18;
	l__ProjectileUtil__9.fireProjectile(l__Players__10.LocalPlayer, v19, "oil:" .. l__HttpService__11:GenerateGUID(false), p14, p15, 196.2, function(p18, p19)
		local v20 = l__BlockEngine__12:getHandlerRegistry():getHandler(p19.Name);
		if v20 then
			local v21 = v20:getContainedPositions(p19);
			local function v22(p20)
				return (l__BlockEngine__12:getWorldPosition(p20) - p18).Magnitude <= 3.1;
			end;
			local v23 = nil;
			for v24, v25 in ipairs(v21) do
				if v22(v25, v24 - 1, v21) == true then
					v23 = v25;
					break;
				end;
			end;
			if v23 then
				local v26 = nil;
				for v27, v28 in ipairs(Enum.NormalId:GetEnumItems()) do
					if l__BlockEngine__12:getStore():getBlockAt(v23 + Vector3.FromNormalId(v28)) == nil then
						local v29 = l__BlockEngine__12:getWorldPosition(v23) + Vector3.FromNormalId(v28) * 1.5;
						local l__Magnitude__30 = (v29 - (p18 + (p14 - p18).Unit)).Magnitude;
						if v26 == nil or l__Magnitude__30 < v26.distance then
							v26 = {
								surface = v28, 
								distance = l__Magnitude__30, 
								surfacePosition = v29
							};
						end;
					end;
				end;
				task.spawn(function()
					if v26 then
						local v31 = Vector3.FromNormalId(v26.surface);
						if math.abs(v31.X) == 1 then
							local v32 = v26.surfacePosition.X;
						else
							v32 = p18.X;
						end;
						if math.abs(v31.Y) == 1 then
							local v33 = v26.surfacePosition.Y;
						else
							v33 = p18.Y;
						end;
						if math.abs(v31.Z) == 1 then
							local v34 = v26.surfacePosition.Z;
						else
							v34 = p18.Z;
						end;
						local v35 = p13:createOilSplashPart(Vector3.new(v32, v33, v34), v17, v31, p17);
						p13:makeOilSlippery(v35, p17);
						p13:oilSpillInTween(v35, v17 * 2):andThen(function()
							p13:oilSpillOutTween(v35, p16):expect();
							v35:Destroy();
						end);
					end;
				end);
			end;
		end;
		v19:Destroy();
	end);
	l__Debris__13:AddItem(v19, 10);
end;
local l__SoundManager__14 = v2.SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.createOilSplashPart(p21, p22, p23, p24, p25)
	if p25 == nil then
		p25 = Random.new();
	end;
	local v36 = l__ReplicatedStorage__6.Assets.Effects.OilPart:Clone();
	l__GameQueryUtil__7:setQueryIgnored(v36, true);
	local v37 = l__SoundManager__14:playSound(l__GameSound__15.GOO_SPLAT, {
		position = p22, 
		rollOffMaxDistance = 150
	});
	if v37 then
		v37.PlaybackSpeed = p25:NextNumber(1, 1.5);
	end;
	v36.Size = Vector3.new(p23, p25:NextNumber(0.1, 0.5), p23);
	v36.CFrame = CFrame.lookAt(p22, p22 + p24) * CFrame.Angles(math.rad(90), 0, 0);
	v36.Parent = l__Workspace__4;
	return v36;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
