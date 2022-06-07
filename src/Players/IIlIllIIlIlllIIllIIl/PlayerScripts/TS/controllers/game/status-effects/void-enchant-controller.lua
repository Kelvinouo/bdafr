-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "VoidEnchantController";
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
	p1.Name = "VoidEnchantController";
end;
local l__WatchCharacter__2 = v2.WatchCharacter;
local l__CollectionService__3 = v3.CollectionService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__2(function(p3, p4, p5)
		p4:GetAttributeChangedSignal("VoidEnchantStacks"):Connect(function()
			local v7 = p4:GetAttribute("VoidEnchantStacks");
			if v7 == nil then
				v7 = 0;
			end;
			p2:updateStacks(p4, v7);
		end);
		local v8 = p4:GetAttribute("VoidEnchantStacks");
		if v8 ~= nil then
			p2:updateStacks(p4, v8);
		end;
		p5:GiveTask(function()
			local v9 = l__CollectionService__3:GetTagged(p3.Name .. ":void_enchant_orb");
			local function v10(p6)
				p6:Destroy();
			end;
			for v11, v12 in ipairs(v9) do
				v10(v12, v11 - 1, v9);
			end;
		end);
	end);
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__Workspace__6 = v3.Workspace;
local l__HttpService__7 = v3.HttpService;
local l__RunService__8 = v3.RunService;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__12 = v3.Players;
local l__KnitClient__13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__EffectUtil__14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v5.updateStacks(p7, p8, p9)
	local v13 = l__CollectionService__3:GetTagged(p8.Name .. ":void_enchant_orb");
	local v14 = nil;
	if #v13 > 0 then
		v14 = v13[1];
	end;
	if p9 == 0 and v14 then
		v14:Destroy();
		return nil;
	end;
	if v14 == nil then
		local v15 = u4.new();
		v14 = l__ReplicatedStorage__5.Assets.Effects.VoidEnchantOrb:Clone();
		v14.Parent = l__Workspace__6;
		l__CollectionService__3:AddTag(v14, p8.Name .. ":void_enchant_orb");
		v14:SetAttribute("CurrentSize", 1);
		local u15 = 0;
		l__RunService__8:BindToRenderStep(l__HttpService__7:GenerateGUID(false), Enum.RenderPriority.Last.Value, function(p10)
			u15 = u15 + p10;
			local l__Head__16 = p8:FindFirstChild("Head");
			if not l__Head__16 then
				return nil;
			end;
			local v17 = v14;
			if v17 ~= nil then
				v17 = v17.PrimaryPart;
			end;
			if not v17 then
				return nil;
			end;
			v14:SetPrimaryPartCFrame(CFrame.new(l__Head__16.Position + Vector3.new(0, 5, 0)) * CFrame.Angles(math.pi * 2 * (u15 % 2), math.pi * 2 * (u15 % 3), math.pi * 2 * (u15 % 1.5)));
		end);
		v15:GiveTask(l__default__9.Client:Get("RemoteName"):Connect(function(p11)
			if p11.entityInstance == p8 and v14 then
				local v18 = v14.PrimaryPart;
				if v18 ~= nil then
					v18 = v18.Position;
				end;
				v14:Destroy();
				if v18 then
					local v19 = {};
					if p8 == l__Players__12.LocalPlayer.Character then
						local v20 = nil;
					else
						v20 = v18;
					end;
					v19.position = v20;
					l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_EXPLODE, v19);
					l__KnitClient__13.Controllers.FancyExplosionController:createExplosion({
						position = v18, 
						radius = 3, 
						randomSizeOffset = 0, 
						randomPositionOffset = 0, 
						inDuration = 0.1, 
						outDuration = 0.3, 
						model = l__ReplicatedStorage__5.Assets.Effects.EnchantVoidOrbExplosion
					});
				end;
			end;
		end));
		v14.AncestryChanged:Connect(function(p12, p13)
			if p13 == nil then
				v15:DoCleaning();
			end;
		end);
	end;
	l__EffectUtil__14:playEffects({ v14.Ball.StackBurst }, p8);
	if v14.PrimaryPart then
		local v21 = {};
		if p8 == l__Players__12.LocalPlayer.Character then
			local v22 = nil;
		else
			v22 = v14.PrimaryPart.Position;
		end;
		v21.position = v22;
		l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_HIT, v21);
	end;
end;
u1 = l__KnitClient__13.CreateController;
u1 = u1(v5.new());
return nil;
