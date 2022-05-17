
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ShieldBlockEffectController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "ShieldBlockEffectController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__Workspace__5 = v3.Workspace;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__8 = v3.Players;
function u1.KnitStart(p2)
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		local v7 = p3.entity:FindFirstChild(l__ItemType__4.INFERNAL_SHIELD);
		if v7 and (v7.Handle.BlockEffectAttachment.WorldCFrame.Position - l__Workspace__5.CurrentCamera.CFrame.Position).Magnitude <= 150 then
			p2:spawnShieldBlockParticles(v7.Handle.BlockEffectAttachment.WorldCFrame.Position, {
				amount = 5
			});
			local v8 = {};
			if p3.entity == l__Players__8.LocalPlayer.Character then
				local v9 = nil;
			else
				v9 = p3.entity:GetPrimaryPartCFrame().Position;
			end;
			v8.position = v9;
			l__SoundManager__6:playSound(l__GameSound__7.SHIELD_BLOCKED, v8);
		end;
	end);
end;
local u9 = v2.ConstantManager.registerConstants(script, {
	velX = 5, 
	velY = 12, 
	velZ = 5, 
	gravity = 0.8
});
local l__PhysicsService__10 = v3.PhysicsService;
local l__GameQueryUtil__11 = v2.GameQueryUtil;
local l__TweenService__12 = v3.TweenService;
local l__Debris__13 = v3.Debris;
function u1.spawnShieldBlockParticles(p4, p5, p6)
	local v10 = 0;
	local v11 = false;
	while true do
		if v11 then
			v10 = v10 + 1;
		else
			v11 = true;
		end;
		local v12 = p6;
		if v12 ~= nil then
			v12 = v12.amount;
		end;
		local v13 = v12;
		if v13 == nil then
			v13 = 1;
		end;
		if not (v10 < v13) then
			break;
		end;
		local v14 = Vector3.new(math.random(-100, 100) / 100 * u9.velX, math.random(50, 100) / 100 * u9.velY, math.random(-100, 100) / 100 * u9.velZ) * 0.75;
		local v15 = 0.18 * math.random(80, 150) / 100;
		local v16 = Instance.new("Part");
		v16.Size = Vector3.new(v15, v15, v15);
		v16.CFrame = CFrame.new(p5);
		v16.Velocity = v14;
		v16.Transparency = 0;
		v16.Material = Enum.Material.Neon;
		v16.Color = Color3.fromRGB(195, 43, 43);
		v16.CanCollide = false;
		v1.Promise.defer(function()
			wait(0.05);
			v16.CanCollide = true;
		end);
		l__PhysicsService__10:SetPartCollisionGroup(v16, "BlockParticles");
		l__GameQueryUtil__11:setQueryIgnored(v16);
		local v17 = Instance.new("BodyForce");
		v17.Force = Vector3.new(0, v16:GetMass() * l__Workspace__5.Gravity * u9.gravity, 0);
		v17.Parent = v16;
		local v18 = Instance.new("BoolValue");
		v18.Name = "Targettable";
		v18.Value = false;
		v18.Parent = v16;
		v16.Parent = l__Workspace__5;
		v1.Promise.delay(0.3 + math.random() * 0.15):andThen(function()
			l__TweenService__12:Create(v16, TweenInfo.new(0.18), {
				Size = Vector3.new(0, 0, 0), 
				Transparency = 1
			}):Play();
		end);
		l__Debris__13:AddItem(v16, 1.3);	
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	ShieldBlockEffectController = u2
};
return u1;

