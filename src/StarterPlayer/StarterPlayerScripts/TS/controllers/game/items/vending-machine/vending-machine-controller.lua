-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
local l__ExpireList__1 = v2.ExpireList;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "VendingMachineController";
	p1.animationCooldowns = l__ExpireList__1.new(2);
	p1.vendingMachineNamespace = l__default__2.Client:GetNamespace("VendingMachine");
end;
local l__WatchCollectionTag__3 = v2.WatchCollectionTag;
local l__getItemMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__VendingMachineConst__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-const").VendingMachineConst;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__VendingMachineState__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__GameAnimationUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Players__12 = v4.Players;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__Workspace__14 = v4.Workspace;
local l__RunService__15 = v4.RunService;
local l__SoundManager__16 = v2.SoundManager;
local l__GameSound__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__18 = v4.ReplicatedStorage;
local l__KnitClient__19 = v3.KnitClient;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__WatchCollectionTag__3("VendingMachine", function(p3)
		local u20 = u6("ProximityPrompt", {
			Parent = p3, 
			ActionText = tostring(l__VendingMachineConst__5.COST_AMOUNT) .. " " .. l__getItemMeta__4(l__VendingMachineConst__5.COST_ITEM).displayName, 
			ObjectText = "Use Vending Machine", 
			KeyboardKeyCode = l__Theme__7.promptKeyboardKey, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 8, 
			HoldDuration = 1, 
			ClickablePrompt = l__DeviceUtil__8.isMobileControls()
		});
		p3:GetAttributeChangedSignal("VendingMachineState"):Connect(function()
			if p3:GetAttribute("VendingMachineState") == l__VendingMachineState__9.IDLE then
				u20.Enabled = true;
				return;
			end;
			u20.Enabled = false;
		end);
		u20.PromptButtonHoldBegan:Connect(function(p4)
			local v8 = u10.new();
			local u21 = l__GameAnimationUtil__11.playAnimation(l__Players__12.LocalPlayer, l__AnimationType__13.OPEN_CRATE);
			v8:GiveTask(function()
				if u21 ~= nil then
					u21:Stop();
				end;
				if u21 ~= nil then
					u21:Destroy();
				end;
			end);
			u20.PromptButtonHoldEnded:Connect(function()
				v8:DoCleaning();
			end);
		end);
		u20.Triggered:Connect(function(p5)
			l__default__2.Client:GetNamespace("VendingMachine"):Get("OpenVendingMachine"):CallServer(p3);
		end);
	end);
	l__WatchCollectionTag__3("VendingMachine", function(p6)
		local l__LuckyBlock__9 = p6:WaitForChild("LuckyBlock");
		local v10 = u10.new();
		local u22 = l__Workspace__14:GetServerTimeNow();
		local l__Position__23 = l__LuckyBlock__9.Position;
		v10:GiveTask(l__RunService__15.Heartbeat:Connect(function(p7)
			u22 = u22 + p7;
			l__LuckyBlock__9.CFrame = CFrame.new(l__Position__23 + Vector3.new(0, math.sin(u22 / 2) * 1 + 0.3, 0)) * CFrame.Angles(math.sin(u22 / 3) * math.pi * 2, math.cos(u22 / 4) * math.pi * 2, math.sin(u22 / 3.5) * math.pi * 2 + math.pi / 3);
		end));
		l__LuckyBlock__9.AncestryChanged:Connect(function(p8, p9)
			if p9 == nil then
				v10:DoCleaning();
			end;
		end);
	end);
	p2.vendingMachineNamespace:OnEvent("VendingMachineSelfDestruct", function(p10)
		p10 = p10 + Vector3.new(0, 5, 0);
		task.spawn(function()
			l__SoundManager__16:playSound(l__GameSound__17.TNT_EXPLODE_1, {
				position = p10, 
				rollOffMaxDistance = 100
			});
			local v11 = l__ReplicatedStorage__18.Assets.Effects.RocketLauncherExplode:Clone();
			v11.Parent = l__Workspace__14;
			v11:SetPrimaryPartCFrame(CFrame.new(p10));
			l__KnitClient__19.Controllers.FancyExplosionController:createExplosion({
				position = p10, 
				radius = 15, 
				randomSizeOffset = 10, 
				randomPositionOffset = 1, 
				rotationSpeed = 15, 
				model = v11, 
				inDuration = 0.3, 
				outDuration = 0.3
			}):await();
			v11:Destroy();
		end);
		local v12 = 0;
		local v13 = false;
		while true do
			if v13 then
				v12 = v12 + 1;
			else
				v13 = true;
			end;
			if not (v12 < math.random() * 2 + 2) then
				break;
			end;
			task.spawn(function()
				local v14 = l__ReplicatedStorage__18.Assets.Effects.RocketLauncherDebris:Clone();
				v14.Parent = l__Workspace__14;
				v14.Position = p10;
				local v15 = math.random() * math.pi * 2;
				v14:ApplyImpulse(Vector3.new(math.cos(v15) * 40, 70, math.sin(v15) * 40) * v14.Mass);
				wait(1);
				v14:Destroy();
			end);		
		end;
	end);
end;
local l__CollectionService__24 = v4.CollectionService;
function v6.getClosestVendingMachine(p11, p12)
	local v16 = l__CollectionService__24:GetTagged("VendingMachine");
	table.sort(v16, function(p13, p14)
		return (p13.Position - p12).Magnitude < (p14.Position - p12).Magnitude;
	end);
	local v17 = nil;
	local v18, v19, v20 = ipairs(v16);
	while true do
		v18(v19, v20);
		if not v18 then
			break;
		end;
		v20 = v18;
		if true == true then
			v17 = v19;
			break;
		end;	
	end;
	return v17;
end;
local v21 = v3.KnitClient.CreateController(v6.new());
return nil;
