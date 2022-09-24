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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "VoidEnchantController";
end;
local l__WatchCharacter__1 = v2.WatchCharacter;
local l__CollectionService__2 = v3.CollectionService;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__WatchCharacter__1(function(p3, p4, p5)
		p4:GetAttributeChangedSignal("VoidEnchantStacks"):Connect(function()
			local v7 = p4:GetAttribute("VoidEnchantStacks");
			if v7 == nil then
				v7 = 0;
			end;
			p2:updateStacks(p3, p4, v7);
		end);
		local v8 = p4:GetAttribute("VoidEnchantStacks");
		if v8 ~= nil then
			p2:updateStacks(p3, p4, v8);
		end;
		p5:GiveTask(function()
			local v9, v10, v11 = ipairs((l__CollectionService__2:GetTagged(p3.Name .. ":void_enchant_orb")));
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				v11 = v9;
				v10:Destroy();			
			end;
		end);
	end);
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__Workspace__5 = v3.Workspace;
local l__HttpService__6 = v3.HttpService;
local l__RunService__7 = v3.RunService;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__10 = v2.SoundManager;
local l__GameSound__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Players__12 = v3.Players;
local l__EffectUtil__13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v5.updateStacks(p6, p7, p8, p9)
	local v12 = l__CollectionService__2:GetTagged(p8.Name .. ":void_enchant_orb");
	local v13 = nil;
	if #v12 > 0 then
		v13 = v12[1];
	end;
	if p9 == 0 and v13 then
		v13:Destroy();
		return nil;
	end;
	if v13 == nil then
		local v14 = u3.new();
		v13 = l__ReplicatedStorage__4.Assets.Effects.VoidEnchantOrb:Clone();
		v13.Parent = l__Workspace__5;
		l__CollectionService__2:AddTag(v13, p8.Name .. ":void_enchant_orb");
		v13:SetAttribute("CurrentSize", 1);
		local u14 = 0;
		l__RunService__7:BindToRenderStep(l__HttpService__6:GenerateGUID(false), Enum.RenderPriority.Last.Value, function(p10)
			u14 = u14 + p10;
			local l__Head__15 = p8:FindFirstChild("Head");
			if not l__Head__15 then
				return nil;
			end;
			local v16 = v13;
			if v16 ~= nil then
				v16 = v16.PrimaryPart;
			end;
			if not v16 then
				return nil;
			end;
			v13:SetPrimaryPartCFrame(CFrame.new(l__Head__15.Position + Vector3.new(0, 5, 0)) * CFrame.Angles(math.pi * 2 * (u14 % 2), math.pi * 2 * (u14 % 3), math.pi * 2 * (u14 % 1.5)));
		end);
		if l__KnitClient__8.Controllers.GlitchedEnchantingRelicController:onRelicTeam(p7) and v13.PrimaryPart then
			v14:GiveTask((l__KnitClient__8.Controllers.GlitchEffectsController:playGlitchExplosion(v13.PrimaryPart.Position, {
				parent = v13, 
				effectConfig = {
					sizeMultiplier = 0.5, 
					particleMultiplier = 0.75
				}, 
				loopConfig = {
					loopDelay = 1, 
					looped = true
				}
			})));
		end;
		v14:GiveTask(l__default__9.Client:Get("RemoteName"):Connect(function(p11)
			if p11.entityInstance == p8 and v13 then
				local v17 = v13.PrimaryPart;
				if v17 ~= nil then
					v17 = v17.Position;
				end;
				v13:Destroy();
				if v17 then
					local v18 = {};
					if p8 == l__Players__12.LocalPlayer.Character then
						local v19 = nil;
					else
						v19 = v17;
					end;
					v18.position = v19;
					l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_EXPLODE, v18);
					l__KnitClient__8.Controllers.FancyExplosionController:createExplosion({
						position = v17, 
						radius = 3, 
						randomSizeOffset = 0, 
						randomPositionOffset = 0, 
						inDuration = 0.1, 
						outDuration = 0.3, 
						model = l__ReplicatedStorage__4.Assets.Effects.EnchantVoidOrbExplosion
					});
				end;
			end;
		end));
		v13.AncestryChanged:Connect(function(p12, p13)
			if p13 == nil then
				v14:DoCleaning();
			end;
		end);
	end;
	l__EffectUtil__13:playEffects({ v13.Ball.StackBurst }, p8);
	if v13.PrimaryPart then
		local v20 = {};
		if p8 == l__Players__12.LocalPlayer.Character then
			local v21 = nil;
		else
			v21 = v13.PrimaryPart.Position;
		end;
		v20.position = v21;
		l__SoundManager__10:playSound(l__GameSound__11.ENCHANT_VOID_HIT, v20);
	end;
end;
local v22 = l__KnitClient__8.CreateController(v5.new());
return nil;
