-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "KingPenguinController";
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
	p1.Name = "KingPenguinController";
end;
local l__WatchCollectionTag__2 = v2.WatchCollectionTag;
local l__MonsterType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnemyHealthbar__6 = v1.import(script, script.Parent, "enemy-healthbar").EnemyHealthbar;
local l__Players__7 = v3.Players;
local l__ReplicatedStorage__8 = v3.ReplicatedStorage;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__SoundManager__11 = v2.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Workspace__13 = v3.Workspace;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("Monster", function(p3)
		if p3:GetAttribute("MonsterType") == l__MonsterType__3.KING_PENGUIN and p3:IsA("Model") then
			local v7 = u4.new();
			local u14 = u5.mount(u5.createElement("BillboardGui", {
				Adornee = p3.PrimaryPart, 
				ResetOnSpawn = false, 
				ExtentsOffsetWorldSpace = Vector3.new(0, 18, 0), 
				Size = UDim2.new(0, 200, 0, 100), 
				MaxDistance = 200
			}, { u5.createElement(l__EnemyHealthbar__6, {
					health = 1000, 
					maxHealth = 1000
				}) }), l__Players__7.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
			v7:GiveTask(function()
				return u5.unmount(u14);
			end);
			v7:GiveTask(p3:GetAttributeChangedSignal("Health"):Connect(function()
				u5.update(u14, u5.createElement("BillboardGui", {
					Adornee = p3.PrimaryPart, 
					ExtentsOffsetWorldSpace = Vector3.new(0, 18, 0), 
					Size = UDim2.new(0, 200, 0, 100), 
					MaxDistance = 200
				}, { u5.createElement(l__EnemyHealthbar__6, {
						health = p3:GetAttribute("Health"), 
						maxHealth = p3:GetAttribute("MaxHealth")
					}) }));
			end));
			v7:GiveTask(p3:GetAttributeChangedSignal("IsSummoning"):Connect(function()
				if p3:GetAttribute("IsSummoning") == true then
					local v8 = l__ReplicatedStorage__8.Assets.Effects.KingPenguinCharge:Clone();
					v8.Anchored = false;
					v8.CanCollide = false;
					v8.CFrame = p3:GetPrimaryPartCFrame();
					l__GameQueryUtil__9:setQueryIgnored(v8, true);
					v8.Name = "EffectPart";
					v8.Parent = p3;
					u10("WeldConstraint", {
						Part0 = v8, 
						Part1 = p3.PrimaryPart, 
						Parent = v8
					});
					return;
				end;
				local l__EffectPart__9 = p3:FindFirstChild("EffectPart");
				if l__EffectPart__9 and l__EffectPart__9:IsA("BasePart") then
					l__EffectPart__9:Destroy();
					l__SoundManager__11:playSound(l__GameSound__12.KING_PENGUIN_SUMMON, {
						rollOffMaxDistance = 300, 
						position = p3:GetPrimaryPartCFrame().Position
					});
				end;
			end));
			v7:GiveTask(p3.AncestryChanged:Connect(function()
				if not p3:IsDescendantOf(l__Workspace__13) then
					v7:DoCleaning();
				end;
			end));
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
