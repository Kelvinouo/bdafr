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
			for v9, v10 in ipairs((l__CollectionService__3:GetTagged(p3.Name .. ":void_enchant_orb"))) do
				v10:Destroy();
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
function v5.updateStacks(p6, p7, p8)
	local v11 = l__CollectionService__3:GetTagged(p7.Name .. ":void_enchant_orb");
	local v12 = nil;
	if #v11 > 0 then
		v12 = v11[1];
	end;
	if p8 == 0 and v12 then
		v12:Destroy();
		return nil;
	end;
	if v12 == nil then
		local v13 = u4.new();
		v12 = l__ReplicatedStorage__5.Assets.Effects.VoidEnchantOrb:Clone();
		v12.Parent = l__Workspace__6;
		l__CollectionService__3:AddTag(v12, p7.Name .. ":void_enchant_orb");
		v12:SetAttribute("CurrentSize", 1);
		local u15 = 0;
		l__RunService__8:BindToRenderStep(l__HttpService__7:GenerateGUID(false), Enum.RenderPriority.Last.Value, function(p9)
			u15 = u15 + p9;
			local l__Head__14 = p7:FindFirstChild("Head");
			if not l__Head__14 then
				return nil;
			end;
			local v15 = v12;
			if v15 ~= nil then
				v15 = v15.PrimaryPart;
			end;
			if not v15 then
				return nil;
			end;
			v12:SetPrimaryPartCFrame(CFrame.new(l__Head__14.Position + Vector3.new(0, 5, 0)) * CFrame.Angles(math.pi * 2 * (u15 % 2), math.pi * 2 * (u15 % 3), math.pi * 2 * (u15 % 1.5)));
		end);
		v13:GiveTask(l__default__9.Client:Get("RemoteName"):Connect(function(p10)
			if p10.entityInstance == p7 and v12 then
				local v16 = v12.PrimaryPart;
				if v16 ~= nil then
					v16 = v16.Position;
				end;
				v12:Destroy();
				if v16 then
					local v17 = {};
					if p7 == l__Players__12.LocalPlayer.Character then
						local v18 = nil;
					else
						v18 = v16;
					end;
					v17.position = v18;
					l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_EXPLODE, v17);
					l__KnitClient__13.Controllers.FancyExplosionController:createExplosion({
						position = v16, 
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
		v12.AncestryChanged:Connect(function(p11, p12)
			if p12 == nil then
				v13:DoCleaning();
			end;
		end);
	end;
	l__EffectUtil__14:playEffects({ v12.Ball.StackBurst }, p7);
	if v12.PrimaryPart then
		local v19 = {};
		if p7 == l__Players__12.LocalPlayer.Character then
			local v20 = nil;
		else
			v20 = v12.PrimaryPart.Position;
		end;
		v19.position = v20;
		l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_HIT, v19);
	end;
end;
u1 = l__KnitClient__13.CreateController;
u1 = u1(v5.new());
return nil;
