-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__Controller__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = setmetatable({}, {
	__tostring = function()
		return "DropPianoController";
	end
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.constructor(p1)
	p1.maid = u1.new();
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__DropPianoConstants__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "drop-piano", "drop-piano-constants").DropPianoConstants;
local l__ReplicatedStorage__4 = v4.ReplicatedStorage;
local l__Workspace__5 = v4.Workspace;
local l__SoundManager__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__8 = v4.RunService;
function v5.onStart(p2)
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local l__target__7 = p3.target;
		if not l__target__7 or not l__target__7.Character or not l__target__7.Character.PrimaryPart then
			return nil;
		end;
		local v8 = l__ReplicatedStorage__4.Assets.Misc.Piano:Clone();
		v8.Parent = l__Workspace__5;
		local v9 = CFrame.new(l__target__7.Character.PrimaryPart.Position + Vector3.new(0, 100, 0));
		v8:PivotTo(v9);
		local v10 = l__SoundManager__6:playSound(l__GameSound__7.SLIDE_WHISTLE_FALLING, {
			fadeInTime = 0.2
		});
		if v10 then
			l__SoundManager__6:tweenSoundVolume(v10, 3, l__DropPianoConstants__3.DROP_DURATION);
		end;
		p2.maid:GiveTask(function()
			if v10 then
				v10:Destroy();
			end;
		end);
		local u9 = 0;
		local l__DROP_DURATION__10 = l__DropPianoConstants__3.DROP_DURATION;
		p2.maid:GiveTask(l__RunService__8.Heartbeat:Connect(function(p4)
			u9 = u9 + p4;
			if not v8.Parent then
				p2.maid:DoCleaning();
				return nil;
			end;
			if not l__target__7 or not l__target__7.Character or not l__target__7.Character.PrimaryPart then
				return nil;
			end;
			local v11 = v9:Lerp(l__target__7.Character.PrimaryPart.CFrame, (math.clamp(u9 / l__DROP_DURATION__10, 0, 1)));
			v8:PivotTo(v11);
			if not (l__DROP_DURATION__10 <= u9) then
				return;
			end;
			p2:crashPiano(v8, v11.Position);
			return nil;
		end));
	end);
end;
local l__PhysicsService__11 = v4.PhysicsService;
local l__EffectUtil__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v5.crashPiano(p5, p6, p7)
	p5.maid:DoCleaning();
	local v12, v13, v14 = ipairs(p6:GetDescendants());
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		if v13:IsA("BasePart") then
			v13.Anchored = false;
			v13:ApplyImpulse(Vector3.new(2, 6, 2) * v13.Mass);
			v13.CanCollide = true;
			l__PhysicsService__11:SetPartCollisionGroup(v13, "Players");
		end;	
	end;
	task.delay(1, function()
		p6:Destroy();
	end);
	local v15 = l__ReplicatedStorage__4.Assets.Effects.LandmineExplosion:Clone();
	v15.Parent = l__Workspace__5;
	l__EffectUtil__12:playEffects({ v15 }, nil, {
		sizeMultiplier = 3
	});
	l__SoundManager__6:playSound(l__GameSound__7.PIANO_CRASH, {
		position = p7, 
		rollOffMaxDistance = 300
	});
	v15.CFrame = CFrame.new(p7);
	task.delay(0.7, function()
		v15:Destroy();
	end);
end;
l__Reflect__2.defineMetadata(v5, "identifier", "client/controllers/games/bedwars/lucky-blocks/drop-piano/drop-piano-controller@DropPianoController");
l__Reflect__2.defineMetadata(v5, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v5, "$:flamework@Controller", l__Controller__3, { {} });
return {
	default = v5
};
