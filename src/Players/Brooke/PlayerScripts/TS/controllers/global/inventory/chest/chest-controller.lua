-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ChestController";
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
	p1.Name = "ChestController";
end;
local l__CollectionTagAdded__1 = v2.CollectionTagAdded;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__ItemType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__ReplicatedStorage__7 = v3.ReplicatedStorage;
local l__Players__8 = v3.Players;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__CollectionTagAdded__1("chest", function(p3)
		u3("ProximityPrompt", {
			Name = "Open", 
			KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
			HoldDuration = 0, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 7.5, 
			ActionText = "Open", 
			ObjectText = l__getItemMeta__2(p3.Name).displayName, 
			ClickablePrompt = l__DeviceUtil__5.isMobileControls(), 
			Parent = p3
		}).Triggered:Connect(function()
			local v7 = nil;
			if p3.Name == l__ItemType__6.PERSONAL_CHEST then
				print("replicated");
				v7 = l__ReplicatedStorage__7:WaitForChild("Inventories"):FindFirstChild(l__Players__8.LocalPlayer.Name .. "_personal");
			else
				print("find child");
				local l__ChestFolderValue__8 = p3:FindFirstChild("ChestFolderValue");
				if l__ChestFolderValue__8 then
					v7 = l__ChestFolderValue__8.Value;
				end;
			end;
			if v7 and l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__10.CHEST_INVENTORY, {}) then
				p2:openChest(v7);
			end;
		end);
		p3:GetAttributeChangedSignal("ChestOpened"):Connect(function(p4)
			if p3:GetAttribute("ChestOpened") == true then
				p2:playChestOpenAnimation(p3);
			end;
		end);
		if p3:GetAttribute("ChestOpened") == true then
			p2:playChestOpenAnimation(p3);
		end;
	end);
end;
local l__AnimationUtil__11 = v2.AnimationUtil;
local l__GameAnimationUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.playChestOpenAnimation(p5, p6)
	local v9 = l__AnimationUtil__11.playAnimation(p6:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"), l__GameAnimationUtil__12.getAssetId(l__AnimationType__13.CHEST_OPEN));
	if v9 ~= nil then
		local v10 = v9:GetMarkerReachedSignal("open"):Connect(function()
			v9:AdjustSpeed(0);
		end);
	end;
end;
local l__default__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.openChest(p7, p8)
	task.spawn(function()
		l__default__14.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(p8);
	end);
end;
local v11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
