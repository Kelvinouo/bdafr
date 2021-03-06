-- Script Hash: 492e771fd88dea8bd5c613267d7c1bb6d9e85157393c53d1be3c4a99e84d1518c075a5a2b60e6b617e57ed1ce1427206
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
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ChestController";
end;
local l__CollectionTagAdded__2 = v2.CollectionTagAdded;
local l__getItemMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__ItemType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__ReplicatedStorage__8 = v3.ReplicatedStorage;
local l__Players__9 = v3.Players;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionTagAdded__2("chest", function(p3)
		u4("ProximityPrompt", {
			Name = "Open", 
			KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
			HoldDuration = 0, 
			RequiresLineOfSight = false, 
			MaxActivationDistance = 7.5, 
			ActionText = "Open", 
			ObjectText = l__getItemMeta__3(p3.Name).displayName, 
			ClickablePrompt = l__DeviceUtil__6.isMobileControls(), 
			Parent = p3
		}).Triggered:Connect(function()
			local v7 = nil;
			if p3.Name == l__ItemType__7.PERSONAL_CHEST then
				print("replicated");
				v7 = l__ReplicatedStorage__8:WaitForChild("Inventories"):FindFirstChild(l__Players__9.LocalPlayer.Name .. "_personal");
			else
				print("find child");
				local l__ChestFolderValue__8 = p3:FindFirstChild("ChestFolderValue");
				if l__ChestFolderValue__8 then
					v7 = l__ChestFolderValue__8.Value;
				end;
			end;
			if v7 and l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__11.CHEST_INVENTORY, {}) then
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
local l__AnimationUtil__12 = v2.AnimationUtil;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v5.playChestOpenAnimation(p5, p6)
	local v9 = l__AnimationUtil__12.playAnimation(p6:WaitForChild("Model"):WaitForChild("AnimationController"):WaitForChild("Animator"), l__GameAnimationUtil__13.getAssetId(l__AnimationType__14.CHEST_OPEN));
	if v9 ~= nil then
		local v10 = v9:GetMarkerReachedSignal("open"):Connect(function()
			v9:AdjustSpeed(0);
		end);
	end;
end;
local l__default__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.openChest(p7, p8)
	task.spawn(function()
		l__default__15.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(p8);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
