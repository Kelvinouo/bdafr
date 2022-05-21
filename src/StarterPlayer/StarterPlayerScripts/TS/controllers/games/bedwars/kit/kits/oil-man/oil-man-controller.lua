-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "OilManController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "OilManController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Maid__3 = v3.Maid;
local l__Workspace__4 = v4.Workspace;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v8 = Random.new(p3.seed);
		local v9 = v8:NextNumber(8, 36);
		local v10 = l__Maid__3.new();
		local v11 = p2:createOilSplashPart(p3.position + Vector3.new(0, 0.05), 4, Vector3.new(0, 1, 0), v8);
		v10:GiveTask(v11);
		p2:makeOilSlippery(v11, v8);
		p2:oilSpillInTween(v11, v9):andThen(function()
			p2:oilSpillOutTween(v11, p3.expirationTime - l__Workspace__4:GetServerTimeNow()):expect();
			v10:DoCleaning();
		end);
		local v12 = v8:NextInteger(6, 15);
		local v13 = 0;
		local v14 = false;
		while true do
			if v14 then
				v13 = v13 + 1;
			else
				v14 = true;
			end;
			if not (v13 < v12) then
				break;
			end;
			local v15 = v8:NextNumber() * math.pi * 2;
			p2:launchOilSplash(p3.position + Vector3.new(0, 3, 0), Vector3.new(math.cos(v15) * v8:NextNumber(30, 60), v8:NextInteger(15, 50), math.sin(v15) * v8:NextNumber(30, 60)), p3.expirationTime - l__Workspace__4:GetServerTimeNow(), v8);		
		end;
	end);
end;
local l__TweenService__5 = v4.TweenService;
v6.oilSpillInTween = v1.async(function(p4, p5, p6)
	local v16 = l__TweenService__5:Create(p5, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Size = Vector3.new(p6, p5.Size.Y, p6)
	});
	v16:Play();
	v16.Completed:Wait();
end);
v6.oilSpillOutTween = v1.async(function(p7, p8, p9)
	local v17 = l__TweenService__5:Create(p8, TweenInfo.new(p9, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Size = Vector3.new(0, 0, 0)
	});
	v17:Play();
	v17.Completed:Wait();
end);
function v6.makeOilSlippery(p10, p11, p12)
	p11.CanCollide = true;
	p11.AssemblyLinearVelocity = Vector3.new(p12:NextNumber(-1, 1), p12:NextNumber(-1, 1), p12:NextNumber(-1, 1)) * 20;
	p11.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 100, 0);
end;
local l__ReplicatedStorage__6 = v4.ReplicatedStorage;
local l__GameQueryUtil__7 = v2.GameQueryUtil;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__ProjectileUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local l__Players__10 = v4.Players;
local l__HttpService__11 = v4.HttpService;
local l__BlockEngine__12 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__Debris__13 = v4.Debris;
function v6.launchOilSplash(p13, p14, p15, p16, p17)
	if p17 == nil then
		p17 = Random.new();
	end;
	local v18 = p17:NextNumber(0.5, 2);
	local v19 = l__ReplicatedStorage__6.Assets.Effects.OilPart:Clone();
	v19.Anchored = false;
	v19.Size = Vector3.new(v18, v18, v18);
	l__GameQueryUtil__7:setQueryIgnored(v19, true);
	local v20 = u8("Model", {
		Children = { v19 }
	});
	v20.PrimaryPart = v19;
	l__ProjectileUtil__9.fireProjectile(l__Players__10.LocalPlayer, v20, "oil:" .. l__HttpService__11:GenerateGUID(false), p14, p15, 196.2, function(p18, p19)
		local v21 = l__BlockEngine__12:getHandlerRegistry():getHandler(p19.Name);
		if v21 then
			local v22 = v21:getContainedPositions(p19);
			local function v23(p20)
				return (l__BlockEngine__12:getWorldPosition(p20) - p18).Magnitude <= 3.1;
			end;
			local v24 = nil;
			for v25, v26 in ipairs(v22) do
				if v23(v26, v25 - 1, v22) == true then
					v24 = v26;
					break;
				end;
			end;
			if v24 then
				local v27 = nil;
				for v28, v29 in ipairs(Enum.NormalId:GetEnumItems()) do
					if l__BlockEngine__12:getStore():getBlockAt(v24 + Vector3.FromNormalId(v29)) == nil then
						local v30 = l__BlockEngine__12:getWorldPosition(v24) + Vector3.FromNormalId(v29) * 1.5;
						local l__Magnitude__31 = (v30 - (p18 + (p14 - p18).Unit)).Magnitude;
						if v27 == nil or l__Magnitude__31 < v27.distance then
							v27 = {
								surface = v29, 
								distance = l__Magnitude__31, 
								surfacePosition = v30
							};
						end;
					end;
				end;
				task.spawn(function()
					if v27 then
						local v32 = Vector3.FromNormalId(v27.surface);
						if math.abs(v32.X) == 1 then
							local v33 = v27.surfacePosition.X;
						else
							v33 = p18.X;
						end;
						if math.abs(v32.Y) == 1 then
							local v34 = v27.surfacePosition.Y;
						else
							v34 = p18.Y;
						end;
						if math.abs(v32.Z) == 1 then
							local v35 = v27.surfacePosition.Z;
						else
							v35 = p18.Z;
						end;
						local v36 = p13:createOilSplashPart(Vector3.new(v33, v34, v35), v18, v32, p17);
						p13:makeOilSlippery(v36, p17);
						p13:oilSpillInTween(v36, v18 * 2):andThen(function()
							p13:oilSpillOutTween(v36, p16):expect();
							v36:Destroy();
						end);
					end;
				end);
			end;
		end;
		v20:Destroy();
	end);
	l__Debris__13:AddItem(v20, 10);
end;
local l__SoundManager__14 = v2.SoundManager;
local l__GameSound__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.createOilSplashPart(p21, p22, p23, p24, p25)
	if p25 == nil then
		p25 = Random.new();
	end;
	local v37 = l__ReplicatedStorage__6.Assets.Effects.OilPart:Clone();
	l__GameQueryUtil__7:setQueryIgnored(v37, true);
	local v38 = l__SoundManager__14:playSound(l__GameSound__15.GOO_SPLAT, {
		position = p22, 
		rollOffMaxDistance = 150
	});
	if v38 then
		v38.PlaybackSpeed = p25:NextNumber(1, 1.5);
	end;
	v37.Size = Vector3.new(p23, p25:NextNumber(0.1, 0.5), p23);
	v37.CFrame = CFrame.lookAt(p22, p22 + p24) * CFrame.Angles(math.rad(90), 0, 0);
	v37.Parent = l__Workspace__4;
	return v37;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
