-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "VoidEnchantController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidEnchantController";
end;
local l__WatchCharacter__2 = v2.WatchCharacter;
local l__CollectionService__3 = v4.CollectionService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__2(function(p3, p4, p5)
		p4:GetAttributeChangedSignal("VoidEnchantStacks"):Connect(function()
			local v8 = p4:GetAttribute("VoidEnchantStacks");
			if v8 == nil then
				v8 = 0;
			end;
			p2:updateStacks(p4, v8);
		end);
		local v9 = p4:GetAttribute("VoidEnchantStacks");
		if v9 ~= nil then
			p2:updateStacks(p4, v9);
		end;
		p5:GiveTask(function()
			local v10 = l__CollectionService__3:GetTagged(p3.Name .. ":void_enchant_orb");
			local function v11(p6)
				p6:Destroy();
			end;
			for v12, v13 in ipairs(v10) do
				v11(v13, v12 - 1, v10);
			end;
		end);
	end);
end;
local l__Maid__4 = v3.Maid;
local l__ReplicatedStorage__5 = v4.ReplicatedStorage;
local l__Workspace__6 = v4.Workspace;
local l__HttpService__7 = v4.HttpService;
local l__RunService__8 = v4.RunService;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__12 = v4.Players;
local l__KnitClient__13 = v3.KnitClient;
local l__EffectUtil__14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v6.updateStacks(p7, p8, p9)
	local v14 = l__CollectionService__3:GetTagged(p8.Name .. ":void_enchant_orb");
	local v15 = nil;
	if #v14 > 0 then
		v15 = v14[1];
	end;
	if p9 == 0 and v15 then
		v15:Destroy();
		return nil;
	end;
	if v15 == nil then
		local v16 = l__Maid__4.new();
		v15 = l__ReplicatedStorage__5.Assets.Effects.VoidEnchantOrb:Clone();
		v15.Parent = l__Workspace__6;
		l__CollectionService__3:AddTag(v15, p8.Name .. ":void_enchant_orb");
		v15:SetAttribute("CurrentSize", 1);
		local u15 = 0;
		l__RunService__8:BindToRenderStep(l__HttpService__7:GenerateGUID(false), Enum.RenderPriority.Last.Value, function(p10)
			u15 = u15 + p10;
			local l__Head__17 = p8:FindFirstChild("Head");
			if not l__Head__17 then
				return nil;
			end;
			local v18 = v15;
			if v18 ~= nil then
				v18 = v18.PrimaryPart;
			end;
			if not v18 then
				return nil;
			end;
			v15:SetPrimaryPartCFrame(CFrame.new(l__Head__17.Position + Vector3.new(0, 5, 0)) * CFrame.Angles(math.pi * 2 * (u15 % 2), math.pi * 2 * (u15 % 3), math.pi * 2 * (u15 % 1.5)));
		end);
		v16:GiveTask(l__default__9.Client:Get("RemoteName"):Connect(function(p11)
			if p11.entityInstance == p8 and v15 then
				local v19 = v15.PrimaryPart;
				if v19 ~= nil then
					v19 = v19.Position;
				end;
				v15:Destroy();
				if v19 then
					local v20 = {};
					if p8 == l__Players__12.LocalPlayer.Character then
						local v21 = nil;
					else
						v21 = v19;
					end;
					v20.position = v21;
					l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_EXPLODE, v20);
					l__KnitClient__13.Controllers.FancyExplosionController:createExplosion({
						position = v19, 
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
		v15.AncestryChanged:Connect(function(p12, p13)
			if p13 == nil then
				v16:DoCleaning();
			end;
		end);
	end;
	l__EffectUtil__14:playEffects({ v15.Ball.StackBurst }, p8);
	if v15.PrimaryPart then
		local v22 = {};
		if p8 == l__Players__12.LocalPlayer.Character then
			local v23 = nil;
		else
			v23 = v15.PrimaryPart.Position;
		end;
		v22.position = v23;
		l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_HIT, v22);
	end;
end;
u1 = l__KnitClient__13.CreateController;
u1 = u1(v6.new());
return nil;
