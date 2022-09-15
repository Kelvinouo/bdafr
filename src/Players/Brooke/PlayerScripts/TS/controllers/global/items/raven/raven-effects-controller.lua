-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FlamethrowerController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v3.Workspace;
function u1.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "RavenEffectsController";
	p1.ravenEffectsFolder = u2("Folder", {
		Name = "RavenEffects", 
		Parent = l__Workspace__3
	});
end;
local l__WatchCharacter__4 = v2.WatchCharacter;
local l__Players__5 = v3.Players;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__default__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__10 = v2.GameQueryUtil;
local l__CollectionTagAdded__11 = v2.CollectionTagAdded;
local l__AnimationUtil__12 = v2.AnimationUtil;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__RandomUtil__15 = v2.RandomUtil;
function u1.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__WatchCharacter__4(function(p3, p4, p5)
		if p3 == l__Players__5.LocalPlayer then
			return nil;
		end;
		local u16 = nil;
		local u17 = nil;
		local function v7(p6)
			if p6 ~= 0 and p6 == p6 and p6 and not (p6 < os.time()) then
				local l__Head__8 = p4:FindFirstChild("Head");
				if not l__Head__8 then
					return nil;
				else
					local v9 = u16;
					if v9 ~= nil then
						v9 = v9.Parent;
					end;
					if not v9 then
						u16 = l__ReplicatedStorage__6:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("PoisonParticle"):FindFirstChildWhichIsA("Attachment"):Clone();
						u16.Parent = l__Head__8;
					end;
					if u17 then
						u17:cancel();
					end;
					u17 = v1.Promise.delay(p6 - os.time()):andThen(function()
						if u16 ~= nil then
							u16:Destroy();
						end;
					end);
					p5:GiveTask(function()
						if u17 ~= nil then
							u17:cancel();
						end;
						if u16 ~= nil then
							u16:Destroy();
						end;
					end);
					return;
				end;
			end;
			local v10 = u16;
			if v10 ~= nil then
				v10 = v10.Parent;
			end;
			if v10 then
				u16:Destroy();
			end;
			return nil;
		end;
		v7(p3:GetAttribute("RavenPoisonEndTime"));
		p5:GiveTask(p3:GetAttributeChangedSignal("RavenPoisonEndTime"):Connect(function()
			v7(p3:GetAttribute("RavenPoisonEndTime"));
		end));
	end);
	l__default__7.Client:WaitFor("RemoteName"):andThen(function(p7)
		return p7:Connect(function(p8)
			local l__position__11 = p8.position;
			l__SoundManager__8:playSound(l__GameSound__9.TNT_EXPLODE_1, {
				position = l__position__11
			});
			local v12 = l__ReplicatedStorage__6:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("Explosion"):Clone();
			l__GameQueryUtil__10:setQueryIgnored(v12, true);
			v12.Position = l__position__11;
			v12.Parent = p2.ravenEffectsFolder;
			local v13, v14, v15 = ipairs(v12:GetDescendants());
			while true do
				v13(v14, v15);
				if not v13 then
					break;
				end;
				v15 = v13;
				if v14:IsA("ParticleEmitter") then
					v14:Emit(v14.Rate);
				end;			
			end;
			v1.Promise.delay(5):andThen(function()
				v12:Destroy();
			end);
		end);
	end);
	l__CollectionTagAdded__11("raven", function(p9)
		local l__Animator__16 = p9:WaitForChild("AnimationController"):WaitForChild("Animator");
		local v17 = {};
		if p9:GetAttribute("PlayerUserId") ~= l__Players__5.LocalPlayer.UserId then
			local v18 = p9:GetPrimaryPartCFrame().Position;
		else
			v18 = nil;
		end;
		v17.position = v18;
		l__SoundManager__8:playSound(l__GameSound__9.RAVEN_CAW, v17);
		local v19 = l__AnimationUtil__12.playAnimation(l__Animator__16, l__GameAnimationUtil__13.getAssetId(l__AnimationType__14.RAVEN_SPAWN));
		if v19 then
			v19.Stopped:Wait();
		end;
		if l__Animator__16.Parent and p9.Parent then
			local v20 = l__AnimationUtil__12.playAnimation(l__Animator__16, l__GameAnimationUtil__13.getAssetId(l__AnimationType__14.RAVEN_LOOP), {
				fadeInTime = 0.01
			});
			if v20 ~= nil then
				local v21 = v20:GetMarkerReachedSignal("flap"):Connect(function()
					local v22 = {};
					if p9:GetAttribute("PlayerUserId") ~= l__Players__5.LocalPlayer.UserId then
						local v23 = p9:GetPrimaryPartCFrame().Position;
					else
						v23 = nil;
					end;
					v22.position = v23;
					l__SoundManager__8:playSound(l__RandomUtil__15.fromList(l__GameSound__9.RAVEN_WING_FLAP_1, l__GameSound__9.RAVEN_WING_FLAP_2, l__GameSound__9.RAVEN_WING_FLAP_3), v22);
				end);
			end;
			p9:SetPrimaryPartCFrame(p9:GetPrimaryPartCFrame() * CFrame.new(Vector3.new(-0.33429431915283, 7.1738119125366, -2.5612287521362)));
			u2("BoolValue", {
				Name = "Flying", 
				Value = true, 
				Parent = p9
			});
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
