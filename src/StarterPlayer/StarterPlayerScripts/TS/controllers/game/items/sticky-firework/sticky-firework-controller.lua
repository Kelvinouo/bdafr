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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "StickyFireworkController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__WeldUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__StickyFireworkConstants__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "sticky-firework", "sticky-firework-constants").StickyFireworkConstants;
local l__Players__8 = v3.Players;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v7 = u2.new();
		local v8 = l__ReplicatedStorage__3:FindFirstChild("Items");
		if v8 ~= nil then
			v8 = v8:FindFirstChild(l__ItemType__4.STICKY_FIREWORK);
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
					v13(v14, v15);
					if not v13 then
						break;
					end;
					if v14.Name ~= "Firework" == true then
						v12 = v12 + 1;
						v11[v12] = v14;
					end;				
				end;
				table.move(v11, 1, #v11, #v10 + 1, v10);
				v9.FilterDescendantsInstances = v10;
				v9.FilterType = Enum.RaycastFilterType.Whitelist;
				local v16 = l__GameQueryUtil__5:raycast(v8.Position, p3.hitPart.Position - v8.Position, v9);
				local v17 = v16;
				if v17 ~= nil then
					v17 = v17.Position;
				end;
				if v17 then
					v8.CFrame = CFrame.new(v16.Position, v16.Position + v16.Normal);
				end;
			end;
			v7:GiveTask(l__WeldUtil__6:weldParts(p3.hitPart, v8));
			task.wait(l__StickyFireworkConstants__7.TIME_TO_LAUNCH_SEC);
			local v18 = false;
			if p3.hitEntity == l__Players__8.LocalPlayer.Character then
				v18 = true;
				p2:getLaunched();
			end;
			local v19 = {};
			if v18 then
				local v20 = nil;
			else
				v20 = v8.CFrame.Position;
			end;
			v19.position = v20;
			l__SoundManager__9:playSound(l__GameSound__10.FIREWORK_LAUNCH, v19);
			local v21 = {};
			if v18 then
				local v22 = nil;
			else
				v22 = v8.CFrame.Position;
			end;
			v21.position = v22;
			v21.looped = true;
			local v23 = l__SoundManager__9:playSound(l__GameSound__10.FIREWORK_TRAIL, v21);
			if v23 then
				v7:GiveTask(v23);
			end;
			local v24 = v8:FindFirstChildWhichIsA("ParticleEmitter");
			if v24 then
				v24.Enabled = true;
			end;
			task.wait(l__StickyFireworkConstants__7.LAUNCH_DURATION_SEC);
			p2:playEffect(v8.CFrame);
			v7:DoCleaning();
		end;
	end);
end;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.getLaunched(p4)
	local v25 = l__Players__8.LocalPlayer.Character;
	if v25 ~= nil then
		v25 = v25.PrimaryPart;
	end;
	if not v25 then
		return nil;
	end;
	local v26 = l__Players__8.LocalPlayer.Character;
	if v26 ~= nil then
		v26 = v26:FindFirstChild("Humanoid");
	end;
	if v26 then
		v26.PlatformStand = true;
		task.delay(0.2, function()
			v26.PlatformStand = false;
		end);
	end;
	v25.AssemblyLinearVelocity = v25.AssemblyLinearVelocity * (Vector3.new(1, 0, 1) + Vector3.new(0, 20, 0));
	local u12 = u11("BodyForce", {
		Parent = v25, 
		Force = Vector3.new(0, l__StickyFireworkConstants__7.FIREWORK_VERTICAL_FORCE * v25.AssemblyMass, 0)
	});
	task.delay(l__StickyFireworkConstants__7.LAUNCH_DURATION_SEC, function()
		if u12.Parent then
			u12:Destroy();
		end;
		v25.AssemblyLinearVelocity = v25.AssemblyLinearVelocity * Vector3.new(1, 0, 1);
	end);
end;
local l__KnitClient__13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__FireworkType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
function v5.playEffect(p5, p6)
	l__SoundManager__9:playSound(l__GameSound__10.GOO_SPLAT, {
		position = p6.Position, 
		rollOffMaxDistance = 45
	});
	l__KnitClient__13.Controllers.FireworkController:playFireworkEffect(p6.Position, l__FireworkType__14.NORMAL);
end;
local v27 = l__KnitClient__13.CreateController(v5.new());
return nil;
