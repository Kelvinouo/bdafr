
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "VendingMachineController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
local l__ExpireList__2 = v2.ExpireList;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VendingMachineController";
	p1.animationCooldowns = l__ExpireList__2.new(2);
	p1.vendingMachineNamespace = l__default__3.Client:GetNamespace("VendingMachine");
end;
local l__WatchCollectionTag__4 = v2.WatchCollectionTag;
local l__getItemMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__VendingMachineConst__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-const").VendingMachineConst;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__9 = v2.DeviceUtil;
local l__VendingMachineState__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState;
local l__Maid__11 = v3.Maid;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__13 = v4.Players;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__WatchCharacter__15 = v2.WatchCharacter;
local l__AnimatorAdded__16 = v2.AnimatorAdded;
local l__EntityUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__KnitClient__18 = v3.KnitClient;
local l__BedwarsKitSkin__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ReplicatedStorage__20 = v4.ReplicatedStorage;
local l__WeldUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local l__Workspace__22 = v4.Workspace;
local l__GameQueryUtil__23 = v2.GameQueryUtil;
local l__KnitClient__24 = v3.KnitClient;
local l__EffectUtil__25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__26 = v2.SoundManager;
local l__GameSound__27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RunService__28 = v4.RunService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__4("VendingMachine", function(p3)
		local u29 = u7("ProximityPrompt", {
			Parent = p3, 
			ActionText = tostring(l__VendingMachineConst__6.COST_AMOUNT) .. " " .. l__getItemMeta__5(l__VendingMachineConst__6.COST_ITEM).displayName, 
			ObjectText = "Use Vending Machine", 
			KeyboardKeyCode = l__Theme__8.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 8, 
			HoldDuration = 1, 
			ClickablePrompt = l__DeviceUtil__9.isMobileControls()
		});
		p3:GetAttributeChangedSignal("VendingMachineState"):Connect(function()
			if p3:GetAttribute("VendingMachineState") == l__VendingMachineState__10.IDLE then
				u29.Enabled = true;
				return;
			end;
			u29.Enabled = false;
		end);
		u29.PromptButtonHoldBegan:Connect(function(p4)
			local v8 = l__Maid__11.new();
			local u30 = l__GameAnimationUtil__12.playAnimation(l__Players__13.LocalPlayer, l__AnimationType__14.OPEN_CRATE);
			v8:GiveTask(function()
				if u30 ~= nil then
					u30:Stop();
				end;
				if u30 ~= nil then
					u30:Destroy();
				end;
			end);
			u29.PromptButtonHoldEnded:Connect(function()
				v8:DoCleaning();
			end);
		end);
		u29.Triggered:Connect(function(p5)
			l__default__3.Client:GetNamespace("VendingMachine"):Get("OpenVendingMachine"):CallServer(p3);
		end);
	end);
	l__WatchCharacter__15(function(p6, p7)
		l__AnimatorAdded__16(p7:WaitForChild("Humanoid"), function(p8)
			p8.AnimationPlayed:Connect(function(p9)
				local v9 = p9.Animation;
				if v9 ~= nil then
					v9 = v9.AnimationId;
				end;
				if v9 == l__GameAnimationUtil__12.getAssetId(l__AnimationType__14.OPEN_CRATE) then
					if p2.animationCooldowns:has(p6.UserId) and p6.UserId ~= l__Players__13.LocalPlayer.UserId then
						return nil;
					end;
					p2.animationCooldowns:add(p6.UserId);
					local v10 = p7.PrimaryPart;
					if v10 ~= nil then
						v10 = v10.Position;
					end;
					if not v10 then
						return nil;
					end;
					local v11 = p2:getClosestVendingMachine(v10);
					if not v11 then
						return nil;
					end;
					local v12 = l__Maid__11.new();
					local v13 = l__EntityUtil__17:getEntity(p6);
					if v13 ~= nil then
						v13 = v13:getItemInHandClient();
					end;
					if v13 then
						for v14, v15 in ipairs(v13:GetDescendants()) do
							if v15:IsA("BasePart") then
								v15.Transparency = 1;
								local l__Transparency__31 = v15.Transparency;
								v12:GiveTask(function()
									v15.Transparency = l__Transparency__31;
								end);
							end;
						end;
					end;
					local l__Position__16 = p7.PrimaryPart.Position;
					if l__KnitClient__18.Controllers.KitController:getKitSkin(p7) == l__BedwarsKitSkin__19.MINER_SPACE then
						local v17 = l__ReplicatedStorage__20.Assets.Effects.MinerPickaxeSpace:Clone();
					else
						v17 = l__ReplicatedStorage__20.Assets.Effects.MinerPickaxe:Clone();
					end;
					v17.Parent = p7;
					l__WeldUtil__21.weldCharacterAccessories(p7);
					local v18 = l__ReplicatedStorage__20.Assets.Effects.MinerStoneHit:Clone();
					v18.CFrame = v11.CFrame;
					v18.Anchored = true;
					v18.Parent = l__Workspace__22;
					l__GameQueryUtil__23:setQueryIgnored(v18, true);
					v12:GiveTask(function()
						task.delay(3, function()
							v18:Destroy();
						end);
					end);
					local u32 = p7 == l__Players__13.LocalPlayer.Character;
					local function u33(p10)
						if u32 then
							local v19 = p7.PrimaryPart;
							if v19 ~= nil then
								v19 = v19.CFrame;
							end;
							if v19 then
								l__KnitClient__24.Controllers.ScreenShakeController:shake(v19.Position, v19 * Vector3.new(-0.25, -1, -1) - v19.Position, {
									magnitude = 0.07 * p10, 
									duration = 0.15, 
									cycles = 2
								});
							end;
						end;
					end;
					p9:GetMarkerReachedSignal("hammer_1"):Connect(function()
						l__EffectUtil__25:playEffects({ v18 }, nil);
						local v20 = {};
						if u32 then
							local v21 = nil;
						else
							local v22 = p7.PrimaryPart;
							if v22 ~= nil then
								v22 = v22.Position;
							end;
							v21 = v22;
						end;
						v20.position = v21;
						l__SoundManager__26:playSound(l__GameSound__27.MINER_STONE_HIT_1, v20);
						u33(1);
					end);
					p9:GetMarkerReachedSignal("hammer_2"):Connect(function()
						l__EffectUtil__25:playEffects({ v18 }, nil);
						local v23 = {};
						if u32 then
							local v24 = nil;
						else
							local v25 = p7.PrimaryPart;
							if v25 ~= nil then
								v25 = v25.Position;
							end;
							v24 = v25;
						end;
						v23.position = v24;
						l__SoundManager__26:playSound(l__GameSound__27.MINER_STONE_HIT_2, v23);
						u33(1.25);
					end);
					p9:GetMarkerReachedSignal("hammer_3"):Connect(function()
						l__EffectUtil__25:playEffects({ v18 }, nil);
						local v26 = {};
						if u32 then
							local v27 = nil;
						else
							local v28 = p7.PrimaryPart;
							if v28 ~= nil then
								v28 = v28.Position;
							end;
							v27 = v28;
						end;
						v26.position = v27;
						l__SoundManager__26:playSound(l__GameSound__27.MINER_STONE_HIT_3, v26);
						u33(1.25);
					end);
					p9:GetMarkerReachedSignal("hammer_4"):Connect(function()
						l__EffectUtil__25:playEffects({ v18 }, nil, {
							particleMultiplier = 3
						});
						local v29 = {};
						if u32 then
							local v30 = nil;
						else
							local v31 = p7.PrimaryPart;
							if v31 ~= nil then
								v31 = v31.Position;
							end;
							v30 = v31;
						end;
						v29.position = v30;
						l__SoundManager__26:playSound(l__GameSound__27.MINER_STONE_BREAK, v29);
						u33(2);
					end);
					p9.Stopped:Connect(function()
						v17:Destroy();
						v12:DoCleaning();
					end);
				end;
			end);
		end);
	end);
	l__WatchCollectionTag__4("VendingMachine", function(p11)
		local l__LuckyBlock__32 = p11:WaitForChild("LuckyBlock");
		local v33 = l__Maid__11.new();
		local u34 = l__Workspace__22:GetServerTimeNow();
		local l__Position__35 = l__LuckyBlock__32.Position;
		v33:GiveTask(l__RunService__28.Heartbeat:Connect(function(p12)
			u34 = u34 + p12;
			l__LuckyBlock__32.CFrame = CFrame.new(l__Position__35 + Vector3.new(0, math.sin(u34 / 2) * 1 + 0.3, 0)) * CFrame.Angles(math.sin(u34 / 3) * math.pi * 2, math.cos(u34 / 4) * math.pi * 2, math.sin(u34 / 3.5) * math.pi * 2 + math.pi / 3);
		end));
		l__LuckyBlock__32.AncestryChanged:Connect(function(p13, p14)
			if p14 == nil then
				v33:DoCleaning();
			end;
		end);
	end);
	p2.vendingMachineNamespace:OnEvent("VendingMachineSelfDestruct", function(p15)
		p15 = p15 + Vector3.new(0, 5, 0);
		task.spawn(function()
			l__SoundManager__26:playSound(l__GameSound__27.TNT_EXPLODE_1, {
				position = p15, 
				rollOffMaxDistance = 100
			});
			local v34 = l__ReplicatedStorage__20.Assets.Effects.RocketLauncherExplode:Clone();
			v34.Parent = l__Workspace__22;
			v34:SetPrimaryPartCFrame(CFrame.new(p15));
			l__KnitClient__24.Controllers.FancyExplosionController:createExplosion({
				position = p15, 
				radius = 15, 
				randomSizeOffset = 10, 
				randomPositionOffset = 1, 
				rotationSpeed = 15, 
				model = v34, 
				inDuration = 0.3, 
				outDuration = 0.3
			}):await();
			v34:Destroy();
		end);
		local v35 = 0;
		local v36 = false;
		while true do
			if v36 then
				v35 = v35 + 1;
			else
				v36 = true;
			end;
			if not (v35 < math.random() * 2 + 2) then
				break;
			end;
			task.spawn(function()
				local v37 = l__ReplicatedStorage__20.Assets.Effects.RocketLauncherDebris:Clone();
				v37.Parent = l__Workspace__22;
				v37.Position = p15;
				local v38 = math.random() * math.pi * 2;
				v37:ApplyImpulse(Vector3.new(math.cos(v38) * 40, 70, math.sin(v38) * 40) * v37.Mass);
				wait(1);
				v37:Destroy();
			end);		
		end;
	end);
end;
local l__CollectionService__36 = v4.CollectionService;
function v6.getClosestVendingMachine(p16, p17)
	local v39 = l__CollectionService__36:GetTagged("VendingMachine");
	table.sort(v39, function(p18, p19)
		return (p18.Position - p17).Magnitude < (p19.Position - p17).Magnitude;
	end);
	local function v40(p20)
		return true;
	end;
	local v41 = nil;
	for v42, v43 in ipairs(v39) do
		if v40(v43, v42 - 1, v39) == true then
			v41 = v43;
			break;
		end;
	end;
	return v41;
end;
u1 = l__KnitClient__18.CreateController;
u1 = u1(v6.new());
return nil;

