-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util");
local v6 = setmetatable({}, {
	__tostring = function()
		return "MageController";
	end, 
	__index = l__KnitController__4
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "MageController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ReplicatedStorage__2 = v3.ReplicatedStorage;
local l__Workspace__3 = v3.Workspace;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CollectionService__6 = v3.CollectionService;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__BedwarsKit__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__MAGE_ELEMENT_CYCLE_INDEX__9 = v5.MAGE_ELEMENT_CYCLE_INDEX;
local l__BalanceFile__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local l__MageKitUtil__11 = v5.MageKitUtil;
local l__Players__12 = v3.Players;
local l__WatchCharacter__13 = v2.WatchCharacter;
local l__KnitClient__14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__WatchCollectionTag__15 = v2.WatchCollectionTag;
local u16 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u17 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__GameAnimationUtil__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__RunService__21 = v3.RunService;
function v6.KnitStart(p2)
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v8 = l__ReplicatedStorage__2.Assets.Misc.ElementTome:Clone();
		v8.Parent = l__Workspace__3;
		v8:SetAttribute("TomeSecret", p3.secret);
		v8:PivotTo(CFrame.new(p3.position));
		l__SoundManager__4:playSound(l__GameSound__5.AERY_BUTTERFLY_SPAWN, {
			position = nil
		});
		l__CollectionService__6:AddTag(v8, "ElementTome");
	end);
	l__ClientSyncEvents__7.KitEquip:connect(function(p4)
		local l__Character__9 = p4.player.Character;
		if not l__Character__9 then
			return nil;
		end;
		if p4.kit ~= l__BedwarsKit__8.MAGE then
			return nil;
		end;
		v1.Promise.defer(function()
			local v10 = p4.player:GetAttribute(l__MAGE_ELEMENT_CYCLE_INDEX__9);
			if v10 == nil then
				v10 = 0;
			end;
			local v11 = l__BalanceFile__10.MAGE_ELEMENT_CYCLE[v10 + 1];
			if l__MageKitUtil__11.hasUnlockedMageElement(l__Players__12.LocalPlayer, v11) then
				local v12 = v11;
			else
				v12 = "BASE";
			end;
			l__MageKitUtil__11.changeMageKitAppearance(p4.player, l__Character__9, v12);
		end);
	end);
	l__WatchCharacter__13(function(p5, p6)
		if l__KnitClient__14.Controllers.KitController:isUsingKit(p5, l__BedwarsKit__8.MAGE) then
			v1.Promise.defer(function()
				local v13 = p5:GetAttribute(l__MAGE_ELEMENT_CYCLE_INDEX__9);
				if v13 == nil then
					v13 = 0;
				end;
				local v14 = l__BalanceFile__10.MAGE_ELEMENT_CYCLE[v13 + 1];
				if l__MageKitUtil__11.hasUnlockedMageElement(l__Players__12.LocalPlayer, v14) then
					local v15 = v14;
				else
					v15 = "BASE";
				end;
				l__MageKitUtil__11.changeMageKitAppearance(p5, p6, v15);
			end);
			if p5 == l__Players__12.LocalPlayer then
				local v16, v17, v18 = ipairs(l__CollectionService__6:GetTagged("ElementTome"));
				while true do
					v16(v17, v18);
					if not v16 then
						break;
					end;
					v18 = v16;
					p2:enableTomeGuidingBeam(v17);				
				end;
			end;
		end;
	end);
	l__Players__12.LocalPlayer:GetAttributeChangedSignal(l__MAGE_ELEMENT_CYCLE_INDEX__9):Connect(function()
		local v19 = l__BalanceFile__10.MAGE_ELEMENT_CYCLE[l__Players__12.LocalPlayer:GetAttribute(l__MAGE_ELEMENT_CYCLE_INDEX__9) + 1];
		if not l__Players__12.LocalPlayer.Character then
			return nil;
		end;
		if l__MageKitUtil__11.hasUnlockedMageElement(l__Players__12.LocalPlayer, v19) then
			local v20 = v19;
		else
			v20 = "BASE";
		end;
		l__MageKitUtil__11.changeMageKitAppearance(l__Players__12.LocalPlayer, l__Players__12.LocalPlayer.Character, v20);
	end);
	l__WatchCollectionTag__15("ElementTome", function(p7)
		local v21 = u16.new();
		local v22 = u17("ProximityPrompt", {
			ActionText = "Learn", 
			ObjectText = "Tome of the Elements", 
			HoldDuration = 0.3, 
			KeyboardKeyCode = l__Theme__18.promptKeyboardKey, 
			Parent = p7:WaitForChild("Tome"), 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 10, 
			ClickablePrompt = true
		});
		p2:enableTomeGuidingBeam(p7);
		v22.Triggered:Connect(function()
			p2:destroyTomeGuidingBeam();
		end);
		v22.PromptButtonHoldEnded:Connect(function(p8)
			if p8 == l__Players__12.LocalPlayer then
				v22.Enabled = false;
				l__GameAnimationUtil__19.playAnimation(p8, l__AnimationType__20.PUNCH);
				l__KnitClient__14.Controllers.ViewmodelController:playAnimation(l__AnimationType__20.FP_USE_ITEM);
				local v23 = l__default__1.Client:Get("RemoteName"):CallServer({
					secret = p7:GetAttribute("TomeSecret")
				});
				if v23.success and v23.element then
					p2:playLearnLightBeamEffect(p8, p7);
					local l__learnSound__24 = l__MageKitUtil__11.MageElementVisualizations[v23.element].learnSound;
					if l__learnSound__24 ~= "" and l__learnSound__24 then
						l__SoundManager__4:playSound(l__learnSound__24);
					end;
					task.delay(l__BalanceFile__10.LEARN_TOME_DURATION, function()
						p2:fadeOutTome(p7);
						if p8.Parent and p8.Character and v23.element then
							l__MageKitUtil__11.changeMageKitAppearance(p8, p8.Character, v23.element);
						end;
					end);
					v22:Destroy();
				end;
				if v22 then
					v22.Enabled = true;
				end;
			end;
		end);
		local u22 = 0;
		local l__Position__23 = p7:GetPivot().Position;
		v21:GiveTask(l__RunService__21.Heartbeat:Connect(function(p9)
			if p7.Parent == nil then
				v21:DoCleaning();
				return nil;
			end;
			if p7.PrimaryPart == nil then
				v21:DoCleaning();
				return nil;
			end;
			u22 = u22 + p9;
			p7:PivotTo((CFrame.new(l__Position__23 + Vector3.new(0, math.sin(u22), 0))));
		end));
		v21:GiveTask(p7.AncestryChanged:Connect(function(p10, p11)
			if p11 == nil then
				v21:DoCleaning();
			end;
		end));
	end);
end;
local l__TweenService__24 = v3.TweenService;
function v6.playLearnLightBeamEffect(p12, p13, p14)
	task.spawn(function()
		if p13.Parent ~= nil then
			if p13.Character then
				local l__CenterAttachment__25 = p14:WaitForChild("Tome"):WaitForChild("CenterAttachment");
				local v26 = l__ReplicatedStorage__2.Assets.Effects.TomeBeams:Clone();
				local u25 = TweenInfo.new(l__BalanceFile__10.LEARN_TOME_DURATION, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
				task.spawn(function()
					l__TweenService__24:Create(p14:WaitForChild("Tome"):WaitForChild("TomeText"), u25, {
						Color = Color3.fromRGB(255, 150, 0)
					}):Play();
				end);
				local v27, v28, v29 = ipairs(v26:GetDescendants());
				while true do
					v27(v28, v29);
					if not v27 then
						break;
					end;
					v29 = v27;
					task.spawn(function()
						if not p13.Character then
							return nil;
						end;
						if v28:IsA("Beam") then
							v28.Attachment0 = l__CenterAttachment__25;
							local v30 = p13.Character:FindFirstChild("RightHand");
							if v30 ~= nil then
								v30 = v30:FindFirstChild("RightGripAttachment");
							end;
							v28.Attachment1 = v30;
							v28.Enabled = true;
							local v31 = l__TweenService__24:Create(v28, u25, {
								Brightness = 2
							});
							v31:Play();
							v31.Completed:Connect(function()
								local v32 = 0;
								local v33 = false;
								while true do
									if v33 then
										v32 = v32 + 1;
									else
										v33 = true;
									end;
									if not (v32 < 10) then
										break;
									end;
									v28.Transparency = NumberSequence.new(0.1);
									wait(0.05);								
								end;
							end);
							v28:Destroy();
						end;
					end);				
				end;
				return;
			end;
		else
			return;
		end;
		return nil;
	end);
end;
function v6.fadeOutTome(p15, p16)
	task.spawn(function()
		local v34 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);
		local v35, v36, v37 = ipairs(p16:GetDescendants());
		while true do
			v35(v36, v37);
			if not v35 then
				break;
			end;
			v37 = v35;
			task.spawn(function()
				if v36:IsA("BasePart") then
					l__TweenService__24:Create(v36, v34, {
						Transparency = 1
					}):Play();
				end;
			end);		
		end;
		wait(0.5);
		p16:Destroy();
	end);
end;
local l__PlayerUtil__26 = v2.PlayerUtil;
local l__ContentProvider__27 = v3.ContentProvider;
function v6.enableTomeGuidingBeam(p17, p18)
	task.spawn(function()
		local v38 = l__ReplicatedStorage__2.Assets.Effects.TomeGuidingBeam:Clone();
		local l__BodyFrontAttachment__39 = l__PlayerUtil__26.waitForCharacter(l__Players__12.LocalPlayer):WaitForChild("UpperTorso"):WaitForChild("BodyFrontAttachment");
		local l__CenterAttachment__40 = p18:WaitForChild("Tome"):WaitForChild("CenterAttachment");
		l__ContentProvider__27:PreloadAsync({ v38 });
		local v41, v42, v43 = ipairs(v38:GetChildren());
		while true do
			v41(v42, v43);
			if not v41 then
				break;
			end;
			v43 = v41;
			if v42:IsA("Beam") then
				v42.Attachment0 = l__BodyFrontAttachment__39;
				v42.Attachment1 = l__CenterAttachment__40;
				v42.Parent = l__CenterAttachment__40;
				l__CollectionService__6:AddTag(v42, "TomeGuidingBeam");
			end;		
		end;
	end);
end;
function v6.destroyTomeGuidingBeam(p19)
	local v44, v45, v46 = ipairs((l__CollectionService__6:GetTagged("TomeGuidingBeam")));
	while true do
		v44(v45, v46);
		if not v44 then
			break;
		end;
		v46 = v44;
		v45:Destroy();	
	end;
end;
local v47 = l__KnitClient__14.CreateController(v6.new());
return nil;
