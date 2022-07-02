-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "StickyFireworkController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StickyFireworkController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
local l__WeldUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__StickyFireworkConstants__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "sticky-firework", "sticky-firework-constants").StickyFireworkConstants;
local l__Players__9 = v3.Players;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v7 = u3.new();
		local v8 = l__ReplicatedStorage__4:FindFirstChild("Items");
		if v8 ~= nil then
			v8 = v8:FindFirstChild(l__ItemType__5.STICKY_FIREWORK);
			if v8 ~= nil then
				v8 = v8:FindFirstChild("Handle");
				if v8 ~= nil then
					v8 = v8:Clone();
				end;
			end;
		end;
		if v8 then
			v7:GiveTask(v8);
			v8.Name = "Firework";
			if p3.hitEntity then
				v8.Parent = p3.hitEntity;
			end;
			if p3.hitEntity then
				local v9 = RaycastParams.new();
				local v10 = {};
				local v11 = {};
				local v12 = 0;
				local v13, v14, v15 = ipairs((p3.hitEntity:GetChildren()));
				while true do
					local v16, v17 = v13(v14, v15);
					if not v16 then
						break;
					end;
					if v17.Name ~= "Firework" == true then
						v12 = v12 + 1;
						v11[v12] = v17;
					end;				
				end;
				table.move(v11, 1, #v11, #v10 + 1, v10);
				v9.FilterDescendantsInstances = v10;
				v9.FilterType = Enum.RaycastFilterType.Whitelist;
				local v18 = l__GameQueryUtil__6:raycast(v8.Position, p3.hitPart.Position - v8.Position, v9);
				local v19 = v18;
				if v19 ~= nil then
					v19 = v19.Position;
				end;
				if v19 then
					v8.CFrame = CFrame.new(v18.Position, v18.Position + v18.Normal);
				end;
			end;
			v7:GiveTask(l__WeldUtil__7.weldParts(p3.hitPart, v8));
			task.wait(l__StickyFireworkConstants__8.TIME_TO_LAUNCH_SEC);
			local v20 = false;
			if p3.hitEntity == l__Players__9.LocalPlayer.Character then
				v20 = true;
				p2:getLaunched();
			end;
			local v21 = {};
			if v20 then
				local v22 = nil;
			else
				v22 = v8.CFrame.Position;
			end;
			v21.position = v22;
			l__SoundManager__10:playSound(l__GameSound__11.FIREWORK_LAUNCH, v21);
			local v23 = {};
			if v20 then
				local v24 = nil;
			else
				v24 = v8.CFrame.Position;
			end;
			v23.position = v24;
			v23.looped = true;
			local v25 = l__SoundManager__10:playSound(l__GameSound__11.FIREWORK_TRAIL, v23);
			if v25 then
				v7:GiveTask(v25);
			end;
			local v26 = v8:FindFirstChildWhichIsA("ParticleEmitter");
			if v26 then
				v26.Enabled = true;
			end;
			task.wait(l__StickyFireworkConstants__8.LAUNCH_DURATION_SEC);
			p2:playEffect(v8.CFrame);
			v7:DoCleaning();
		end;
	end);
end;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.getLaunched(p4)
	local v27 = l__Players__9.LocalPlayer.Character;
	if v27 ~= nil then
		v27 = v27.PrimaryPart;
	end;
	if not v27 then
		return nil;
	end;
	local v28 = l__Players__9.LocalPlayer.Character;
	if v28 ~= nil then
		v28 = v28:FindFirstChild("Humanoid");
	end;
	if v28 then
		v28.PlatformStand = true;
		task.delay(0.2, function()
			v28.PlatformStand = false;
		end);
	end;
	v27.AssemblyLinearVelocity = v27.AssemblyLinearVelocity * (Vector3.new(1, 0, 1) + Vector3.new(0, 20, 0));
	local u13 = u12("BodyForce", {
		Parent = v27, 
		Force = Vector3.new(0, l__StickyFireworkConstants__8.FIREWORK_VERTICAL_FORCE * v27.AssemblyMass, 0)
	});
	task.delay(l__StickyFireworkConstants__8.LAUNCH_DURATION_SEC, function()
		if u13.Parent then
			u13:Destroy();
		end;
		v27.AssemblyLinearVelocity = v27.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
	end);
end;
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__FireworkType__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
function v5.playEffect(p5, p6)
	l__SoundManager__10:playSound(l__GameSound__11.GOO_SPLAT, {
		position = p6.Position, 
		rollOffMaxDistance = 45
	});
	l__KnitClient__14.Controllers.FireworkController:playFireworkEffect(p6.Position, l__FireworkType__15.NORMAL);
end;
u1 = l__KnitClient__14.CreateController;
u1 = u1(v5.new());
return nil;
