-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PiggyBankController";
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
	p1.Name = "PiggyBankController";
end;
local l__BlockEngineClientEvents__2 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__RandomUtil__6 = v2.RandomUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionTagAdded__10 = v2.CollectionTagAdded;
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__12 = v2.DeviceUtil;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__14 = v3.Workspace;
local u15 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__default__16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local l__ColorUtil__17 = v2.ColorUtil;
local l__PiggyBankTitle__18 = v1.import(script, script.Parent, "piggy-bank-title").PiggyBankTitle;
local l__PiggyBankUtil__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "piggy-bank", "piggy-bank-util").PiggyBankUtil;
local l__SoundManager__20 = v2.SoundManager;
local l__InventoryUtil__21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__default__22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ReplicatedStorage__24 = v3.ReplicatedStorage;
local l__EffectUtil__25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__Players__26 = v3.Players;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__BlockEngineClientEvents__2.DamageBlock:connect(function(p3)
		task.spawn(function()
			if p3.blockType ~= l__ItemType__3.PINATA then
				return nil;
			end;
			local v7 = p3.blockInstance;
			if v7 ~= nil then
				v7 = v7:FindFirstChild("Rig");
				if v7 ~= nil then
					v7 = v7:FindFirstChild("AnimationController");
				end;
			end;
			if not v7 then
				return nil;
			end;
			local v8 = v7;
			if v8 ~= nil then
				v8 = v8:FindFirstChild("Animator");
			end;
			l__GameAnimationUtil__5.playAnimation(v8 or u4("Animator", {
				Parent = v7
			}), l__RandomUtil__6.fromList(l__AnimationType__7.PINATA_HIT_1, l__AnimationType__7.PINATA_HIT_2));
		end);
	end);
	l__KnitClient__8.Controllers.PreloadController:preloadForItemType(l__ItemType__3.PINATA, {
		sounds = { l__GameSound__9.PINATA_POP_1, l__GameSound__9.PINATA_POP_2, l__GameSound__9.PINATA_POP_3, l__GameSound__9.PINATA_POP_4, l__GameSound__9.PINATA_HIT_1, l__GameSound__9.PINATA_HIT_2, l__GameSound__9.PINATA_HIT_3, l__GameSound__9.PINATA_STAGE_INCREASE }
	});
	l__CollectionTagAdded__10("piggy-bank", function(p4)
		local v9 = u4("ProximityPrompt", {
			Parent = p4, 
			ActionText = "Add Candy", 
			ObjectText = "Holding " .. tostring((p4:GetAttribute("Coin"))) .. " Candy", 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 6, 
			KeyboardKeyCode = l__Theme__11.promptKeyboardKey, 
			ClickablePrompt = l__DeviceUtil__12.isMobileControls()
		});
		local u27 = u13.new();
		p4.AncestryChanged:Connect(function()
			if p4.Parent then
				return nil;
			end;
			u27:DoCleaning();
		end);
		local v10 = u4("Part", {
			Transparency = 1, 
			CanCollide = false, 
			CanQuery = false, 
			Anchored = true, 
			Size = Vector3.new(1, 1, 1), 
			Position = p4.Position + Vector3.new(0, 3.5, 0), 
			Parent = l__Workspace__14, 
			Name = "PiggyBankTitle"
		});
		u27:GiveTask(v10);
		local v11 = u13.new();
		u27:GiveTask(v11);
		local u28 = 0;
		local function u29()
			local v12 = p4;
			if v12 ~= nil then
				v12 = v12:FindFirstChild("Rig");
				if v12 ~= nil then
					v12 = v12:FindFirstChild("AnimationController");
				end;
			end;
			if not v12 then
				return nil;
			end;
			local v13 = v12;
			if v13 ~= nil then
				v13 = v13:FindFirstChild("Animator");
			end;
			return v13 or u4("Animator", {
				Parent = v12
			});
		end;
		local function u30()
			local v14 = p4:GetAttribute("Coin");
			v9.ObjectText = "Holding " .. tostring(v14) .. " Candy";
			if v14 ~= nil then
				v11:DoCleaning();
				local v15 = {};
				local v16 = {
					coins = v14
				};
				local v17 = l__default__16(p4);
				if v17 ~= nil then
					v17 = v17.color;
				end;
				local v18 = v17;
				if v18 == nil then
					v18 = l__ColorUtil__17.WHITE;
				end;
				v16.color = v18;
				v15[#v15 + 1] = u15.createElement(l__PiggyBankTitle__18, v16);
				local u31 = u15.mount(u15.createElement("BillboardGui", {
					AlwaysOnTop = true, 
					MaxDistance = 40, 
					Size = UDim2.fromScale(5, 2.5)
				}, v15), v10, "PiggyBankTitle");
				v11:GiveTask(function()
					u15.unmount(u31);
				end);
			end;
			local v19 = v14;
			if v19 == nil then
				v19 = 0;
			end;
			local v20 = l__PiggyBankUtil__19:getStageFromCoins(v19);
			if u28 ~= v20 then
				l__SoundManager__20:playSound(l__GameSound__9.PINATA_STAGE_INCREASE, {
					position = p4.Position
				});
			end;
			u28 = v20;
			local v21 = p4:FindFirstChild("Rig");
			if v21 ~= nil then
				v21 = v21:FindFirstChild("RootPart");
			end;
			local v22 = v21;
			if v22 ~= nil then
				v22 = v22:IsA("BasePart");
			end;
			if v22 then
				local v23 = v21:FindFirstChild("IdleSound");
				if not v23 and v20 > 0 then
					v23 = l__SoundManager__20:playSound(l__GameSound__9.PINATA_AMBIENT_LOOP, {
						parent = v21, 
						looped = true
					});
				end;
				if v23 then
					v23.Name = "IdleSound";
					v23.Volume = 0.2 + v20 * 0.15;
					v23.RollOffMaxDistance = v20 * 4 * 3;
					v23.RollOffMinDistance = 3;
				end;
			end;
			local v24 = p4;
			if v24 ~= nil then
				v24 = v24:FindFirstChild("Rig");
				if v24 ~= nil then
					v24 = v24:FindFirstChild("torso_mesh");
					if v24 ~= nil then
						v24 = v24:FindFirstChild("Glow");
					end;
				end;
			end;
			if v24 and v20 > 0 then
				for v25, v26 in ipairs(v24:GetChildren()) do
					if v26:IsA("ParticleEmitter") then
						v26.Enabled = true;
						v26.Rate = v20;
					end;
				end;
			end;
			local v27 = u29();
			if v27 then
				local v28 = ({ l__AnimationType__7.PINATA_IDLE_1, l__AnimationType__7.PINATA_IDLE_2, l__AnimationType__7.PINATA_IDLE_3 })[v20];
				local v29 = true;
				for v30, v31 in ipairs(v27:GetPlayingAnimationTracks()) do
					local v32, v33, v34 = ipairs({ l__AnimationType__7.PINATA_IDLE_1, l__AnimationType__7.PINATA_IDLE_2, l__AnimationType__7.PINATA_IDLE_3 });
					while true do
						local v35, v36 = v32(v33, v34);
						if not v35 then
							break;
						end;
						local v37 = v31.Animation;
						if v37 ~= nil then
							v37 = v37.AnimationId;
						end;
						if l__GameAnimationUtil__5.getAssetId(v36) == v37 then
							if v36 == v28 then
								v29 = false;
							else
								v31:Stop();
							end;
						end;					
					end;
				end;
				local v38 = v29 or v28;
				if v38 ~= 0 and v38 == v38 and v38 then
					l__GameAnimationUtil__5.playAnimation(v27, v28);
				end;
			end;
		end;
		p4:GetAttributeChangedSignal("Coin"):Connect(function()
			u30();
		end);
		u30();
		v9.Triggered:Connect(function(p5)
			if not l__InventoryUtil__21.hasEnough(p5, l__ItemType__3.CANDY, 1) then
				return nil;
			end;
			local v39 = u29();
			if v39 then
				l__GameAnimationUtil__5.playAnimation(v39, l__AnimationType__7.PINATA_FEED);
			end;
			l__SoundManager__20:playSound(l__GameSound__9.PINATA_DEPOSIT_CANDY);
			l__default__22.Client:Get("RemoteName"):CallServer(p4);
		end);
	end);
	l__default__22.Client:Get("RemoteName"):Connect(function(p6)
		l__ClientStore__23:dispatch({
			type = "KitPigsyIncrementResource", 
			progress = {
				coin = p6.coin
			}
		});
	end);
	l__default__22.Client:Get("RemoteName"):Connect(function(p7)
		local v40 = l__PiggyBankUtil__19:getStageFromCoins(p7.coins);
		local v41 = l__ReplicatedStorage__24.Assets.Effects.Pinata:FindFirstChild("PopStage" .. tostring((math.clamp(v40 - 1, 0, 2))));
		if v41 ~= nil then
			v41 = v41:Clone();
		end;
		local v42 = v41;
		if v42 ~= nil then
			v42 = v42:IsA("BasePart");
		end;
		if v42 then
			v41.Position = p7.position;
			v41.Parent = l__Workspace__14;
			l__EffectUtil__25:playEffects({ v41 }, nil, {
				destroyAfterSec = 4
			});
		end;
		l__SoundManager__20:playSound(({ l__GameSound__9.PINATA_POP_1, l__GameSound__9.PINATA_POP_2, l__GameSound__9.PINATA_POP_3, l__GameSound__9.PINATA_POP_4 })[v40 + 1], {
			position = p7.position
		});
		local v43 = p7.awardedPlayer;
		if v43 ~= nil then
			v43 = v43.Character;
		end;
		if p7.awardedPlayer == l__Players__26.LocalPlayer then
			local v44 = "PlayLocally";
		else
			v44 = "PlayGlobally";
		end;
		l__KnitClient__8.Controllers.ReceiveItemEffectController:playEffectForItems(l__PiggyBankUtil__19:getRewardsFromCoins(p7.coins), p7.position, function()
			local v45 = p7.awardedPlayer;
			if v45 ~= nil then
				v45 = v45.Character;
			end;
			if v45 ~= v43 then
				return nil;
			end;
			local v46 = v45;
			if v46 ~= nil then
				v46 = v46.PrimaryPart;
				if v46 ~= nil then
					v46 = v46.CFrame;
				end;
			end;
			return v46;
		end, v44);
	end);
end;
u1 = l__KnitClient__8.CreateController;
u1 = u1(v5.new());
return nil;
