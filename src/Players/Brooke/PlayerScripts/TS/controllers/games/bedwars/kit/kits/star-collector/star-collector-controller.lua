-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "StarCollectorController";
	end, 
	__index = v3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	v3.constructor(p1);
	p1.Name = "StarCollectorController";
end;
function v4.KnitStart(p2)
	v3.KnitStart(p2);
end;
local l__CollectableEntityType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
function v4.validCollectableEntityTypes(p3)
	return { l__CollectableEntityType__1.STARS };
end;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
function v4.pickDisplayModel(p4, p5, p6)
	local v6 = p4:getRandomStar();
	return {
		repStorageModel = l__ReplicatedStorage__2:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild(v6), 
		collectionTag = p5, 
		proximityPrompt = {
			name = v6
		}
	};
end;
function v4.onWillRemoveEntity(p7, p8, p9, p10, p11)

end;
local l__SoundManager__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v4.onCreatedEntity(p12, p13, p14, p15)
	p15:SetPrimaryPartCFrame(CFrame.new(p15:GetPrimaryPartCFrame().Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.random(0, 3) / 2 * math.pi, 0));
	l__SoundManager__3:playSound(l__GameSound__4.STAR_IDLE, {
		looped = true, 
		parent = p15.PrimaryPart, 
		position = p15.PrimaryPart.Position
	});
	local v7 = p15:FindFirstChildWhichIsA("AnimationController");
	if v7 ~= nil then
		v7 = v7:WaitForChild("Animator");
	end;
	if v7 then
		l__GameAnimationUtil__5.playAnimation(v7, l__AnimationType__6.STAR_IDLE);
		task.spawn(function()
			while v1.Promise.delay(math.random(15, 25)):await() and p15.Parent do
				l__GameAnimationUtil__5.playAnimation(v7, l__AnimationType__6.STAR_RANDOM_SPIN);			
			end;
		end);
	end;
end;
local l__Players__7 = v2.Players;
local l__default__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.collectEntity(p16, p17, p18, p19)
	if p17 == l__Players__7.LocalPlayer then
		l__SoundManager__3:playSound(l__GameSound__4.STAR_PICKUP);
		l__default__8.Client:Get("RemoteName"):SendToServer({
			id = p18:GetAttribute("Id"), 
			collectableName = p19
		});
	end;
end;
function v4.getRandomStar(p20)
	local v8 = math.random(0, 1);
	if v8 == 0 then
		return "VitalityStar";
	end;
	if v8 == 1 then
		return "CritStar";
	end;
	return "None";
end;
local v9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
